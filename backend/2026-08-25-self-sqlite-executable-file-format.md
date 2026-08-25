---
title: "SELF — SQLite 데이터베이스를 실행 파일로 쓰는 포맷 (Farid Zakaria) — ELF가 손으로 구현해온 문자열 테이블·해시·재배치 표는 SQLite가 이미 40년째 잘 풀어온 문제였다"
source_title: "Your executable is a SQLite database"
source_url: "https://fzakaria.com/2026/08/23/your-executable-is-a-sqlite-database"
source_name: "fzakaria.com (Farid Zakaria) · GitHub github.com/fzakaria/selfdb"
referrer_url: "https://news.hada.io/topic?id=32849"
published_at: "2026-08-23"
summarized_at: "2026-08-25"
category: "backend"
tags: ["sqlite", "elf", "binfmt-misc", "executable-format", "systems-programming", "file-format", "linux-kernel", "prototype", "geeknews"]
---

# SELF — SQLite 데이터베이스를 실행 파일로 쓰는 포맷 (Farid Zakaria)

> 출처: [Your executable is a SQLite database](https://fzakaria.com/2026/08/23/your-executable-is-a-sqlite-database) (fzakaria.com · Farid Zakaria) · 정리일 2026-08-25
> **출처 한계**: 원문 블로그(`fzakaria.com`)와 GeekNews 원문(`news.hada.io`) 모두 이번 세션 egress 정책상 접근 불가. 대신 프로젝트 GitHub 저장소(`github.com/fzakaria/selfdb`)는 열려 README와 **`DESIGN.md` 전문**을 직접 대조했다 — 아래 스키마·`binfmt_misc` 등록 방식·M0~M4 마일스톤·벤치마크 수치는 `DESIGN.md` 원문 기반이다. 다만 저자 개인의 서술 톤·동기 설명 자체는 WebSearch 스니펫으로만 재구성한 것이라 **영어 원문 그대로의 인용은 아니다.** Hacker News·Tildes에도 이 글을 다룬 스레드가 존재하는 것은 URL로 확인했지만, 두 사이트 모두 egress 차단이라 **점수·댓글 내용은 확인 불가.**

## 한 줄 요약

**SELF(Structured Executable & Linkable Format)는 실행 파일을 ELF 대신 SQLite 데이터베이스로 만들고 `chmod +x`로 그대로 실행하는 프로토타입이다. ELF가 문자열 테이블·심볼 해시·섹션 헤더·재배치 표를 각각 손으로 구현한 바이너리 구조로 다뤘던 것을, SELF는 `TEXT` 컬럼·`CREATE INDEX`·`BLOB` 세그먼트·외래 키로 표현해 조회·수정을 표준 SQL로 처리한다. SQLite 헤더 68바이트 오프셋의 4바이트 `application_id`에 `SELF`를 심으면 Linux `binfmt_misc`가 이를 감지해 커스텀 인터프리터 `self-exec`를 호출하고, 이 인터프리터가 `segments` 테이블을 읽어 메모리에 매핑·재배치한 뒤 진입점으로 점프한다. 다만 이건 어디까지나 프로토타입이다 — 커널 차원 텍스트 페이지 공유(M4)는 아직 손도 안 댔고, 커스텀 동적 링커(`self-ld`)는 IFUNC·정적 TLS를 아직 못 다루며, 벤치마크상 `memfd` 실행 경로는 네이티브 ELF 대비 약 5배 느리다(0.42ms → 2.1ms).**

## 핵심 포인트

- **동기 — ELF를 "손으로 짠 데이터베이스"로 재해석.** `DESIGN.md`는 ELF의 각 구조를 SQLite 기본형에 대응시킨다: `.strtab`/`.dynstr` → `TEXT` 컬럼(SQLite 자체 문자열 인터닝 활용), `.hash`/`.gnu.hash` → `CREATE INDEX`(B-트리), `sh_offset`/`sh_size` → SQLite B-트리 페이지의 고정폭 레코드, `objcopy --strip-debug` → `DELETE FROM dwarf; VACUUM;`. "모든 ELF 소비자가 파서를 다시 구현하고, 모든 생산자가 직렬화기를 다시 구현한다"는 문제의식이 출발점이다(재구성 — 원문 영어 표현 대조는 못함).
- **스키마(포맷 v0)** — `self_meta`(포맷 버전·타입·머신·entry·soname), `segments`(PT_LOAD/PT_TLS/PT_GNU_STACK 대응, vaddr·memsz·filesz·r/w/x 권한·align·content BLOB), `needed`(DT_NEEDED 라이브러리), `dynamic_entries`, `symbols`(이름·버전·값·타입·바인딩·`defined` 플래그, 이름 인덱스가 `.gnu.hash` 대체), `relocations`(offset·type·symbol FK·addend), 그리고 제거 가능한 `sections`/`notes`/`docs`와 `exports`/`imports`/`ldd` 뷰.
- **`binfmt_misc` 등록** — 오프셋 68에서 매직 `SELF` 인식, `openBinary`(fd 전달, 컨테이너 호환)·`fixBinary`(TOCTOU 방지) 플래그. 설계상 `argv[0]` 보존 플래그(`P`)도 두려 했으나 GNU hello 같은 엄격한 프로그램이 거부해 뺐다는 실무적 디테일이 있다.
- **세 가지 실행 모드** — M1 `memfd`: 테이블에서 ELF를 그대로 재직렬화해 `memfd_create()`에 쓰고 `fexecve()`로 넘겨 glibc `ld.so`에 맡김("DB에 숨은 blob이 아니라 행에서 재직렬화"). M2 `native`: `segments` 행마다 익명 메모리에 `mmap` 후 `sqlite3_blob_read()`로 증분 로드, `mprotect`로 W^X 순서 지키며 권한 부여, 진입점으로 직접 점프. M3 `SQL 네이티브 동적 링킹`: `LD_AUDIT` 감사자가 `la_objsearch`를 가로채 soname 해석을 `SELECT path FROM objects WHERE soname = ?` SQL 쿼리로 대체(M3a), 또는 정적 PIE·libc 불필요 앱 한정으로 `self-ld`가 `relocations JOIN symbols` 조인으로 직접 바인딩(M3b).
- **구현 상태(§13)** — M0(포맷+변환)·M1(memfd)·M2(네이티브)·M3a(LD_AUDIT)·M3b(self-ld) **완료**, M4(커널/mmap 텍스트 페이지 공유)는 **미시작**(스트레치 목표). M2의 한계로 프로세스 간 텍스트 페이지 공유가 안 돼 성능 격차가 남고, M3b는 IFUNC 재배치·정적 TLS 레이아웃·libc↔rtld 핸드셰이크를 아직 못 다룬다.
- **벤치마크(저자 호스트 기준)** — `memfd` 실행 비용 약 5배(0.42ms → 2.1ms). 스트립된 coreutils의 SELF 파일 크기(1.79MB)는 동등 ELF(1.77MB)와 비슷하지만, 공유 텍스트 페이지가 없어 다중 프로세스 시 메모리 이점은 없다.

## 인상 깊은 문장

> "SELF is a program that is a SQLite database instead of an ELF file, and the machinery to actually run it on Linux/NixOS."
> (GitHub 저장소 소개 문구 — WebFetch로 직접 확인. 프로젝트 정체성을 한 문장으로 압축한 부분이라, 재구성이 아니라 원문 그대로다.)

> "SELECT soname FROM ldd" 로 라이브러리 의존성을 조회하고, "DELETE FROM sections; VACUUM;" 으로 섹션을 제거한다.
> (검색 스니펫에서 확인한 실제 조작 예시 — ELF 조작이 파일 포맷 파서가 아니라 SQL 문장이 된다는 걸 가장 직관적으로 보여주는 대목.)

## 댓글

- **GeekNews**: `news.hada.io` 접근 차단으로 **댓글 수·논조 확인 불가.**
- **Hacker News**: "Executable Is a SQLite Database" 항목(`item?id=49415271`)이 존재하는 것은 WebSearch로 확인했다. `news.ycombinator.com` 자체가 이번 세션 egress 차단이라 **포인트·댓글 수·상위 댓글 논조는 확인 불가.** WebSearch 스니펫에 "APE(Actually Portable Executable)와 결합하면 플랫폼 간 동일 파일로 실행+저장이 가능하지 않겠냐"는 코멘트 제안이 있었다는 정도만 짐작되나, 정확한 워딩·득표는 확인 못 했다.
- **Tildes**: `~comp` 카테고리에 스레드(`tildes.net/~comp/1vqt/...`)가 존재하는 건 URL로 확인했지만, `tildes.net` 자체가 차단돼 **내용 확인 불가.**
- **Simon Willison**: 그의 링크블로그(`simonwillison.net`)에 동일 제목("Your executable is a SQLite database")의 항목이 올라온 건 WebSearch로 확인됐다 — 그가 링크블로그에 올린다는 사실 자체가 어느 정도 품질 필터 신호이긴 하나, `simonwillison.net`도 차단돼 **그의 실제 코멘트 내용은 확인 불가.**
- **GitHub**: **276 stars · 5 forks · 5 watchers · 3 open issues**(2026-08-25 확인 시점 스냅샷).
- **읽을 때 감안**: ①HN·Tildes·Simon Willison 링크블로그 세 곳에서 동시다발적으로 화제가 된 정황은 있지만, egress 차단으로 **실제 비판·반박 논조는 이 노트에 거의 반영하지 못했다** — 기술 서술은 `DESIGN.md` 원문 대조로 정확도가 높은 반면, 외부 검증 계층은 얇다. ②저자 스스로 `DESIGN.md` §13·§8에서 M4 미시작, IFUNC/TLS 미지원, 성능 5배 격차를 **직접 인정**하고 있어 이 부분은 자기 보고이면서도 정직한 편이다.

## 내 생각 · 적용점

### 핵심 전이 1: [[2026-05-08-sqlite-loc-recommended-storage-format]]의 "SQLite=애플리케이션 파일 포맷" 명제를 실행 아티팩트까지 밀어붙인 사례다

그 노트의 핵심은 미국 의회도서관이 SQLite를 *데이터베이스*가 아니라 XML·JSON·CSV와 동급의 **애플리케이션 파일 포맷**으로 인정했다는 것, 그리고 그 가치의 정수는 "파일이지만 쿼리 가능하다"였다. SELF는 정확히 같은 명제를 한 걸음 더 끌고 간다 — "파일이지만 쿼리 가능하다"에서 "**실행 파일이지만 쿼리 가능하다**"로. `SELECT soname FROM ldd`로 의존성을 조회하고 `DELETE FROM sections; VACUUM;`으로 스트립하는 건, 그 노트가 아카이브·보존 맥락에서 말했던 "복원 없이 직접 SQL 실행 가능"이라는 가치를 실행 코드 자체에도 적용한 것이다. 다만 그 노트가 SQLite를 **수십 년 뒤에도 읽힐 안정성**의 근거로 든 반면, SELF는 그 안정성을 빌려 정반대로 **매우 실험적이고 불안정한 새 실행 경로**를 만든다는 점이 재미있는 비대칭이다.

### 핵심 전이 2: [[2026-08-10-sqlite-reliability-lessons-hipp]]과의 긴장 — 포맷의 신뢰성이 실행 경로의 신뢰성으로 이어지지 않는다

그 노트가 다룬 SQLite 엔진은 기계어 수준 모든 분기를 양방향 검증하는 **100% MCDC 테스트**, 실제 배포 객체 코드 검사, 의도적 오류 주입을 거치는 극도로 신뢰받는 소프트웨어다. SELF는 이 신뢰의 **파일 포맷 절반**(헤더 매직, B-트리 저장 구조)만 빌려온다 — 정작 실행을 담당하는 코드(`segments` mmap, W^X 순서 전환, `self-ld` 커스텀 재배치 로직)는 SQLite 엔진의 테스트 인프라를 전혀 거치지 않는 완전히 새로운 코드다. `DESIGN.md`가 스스로 M4를 "미시작"으로, `self-ld`의 IFUNC·TLS 처리를 명시적 한계로 인정하는 게 이 비대칭을 정직하게 보여준다. **"SQLite가 신뢰할 수 있다"는 명성이 곧바로 "이 포맷 위에 지은 실행 경로가 신뢰할 수 있다"로 번역되지 않는다** — 포맷의 견고함과 그 포맷을 다루는 새 코드의 견고함은 별개다.

### 핵심 전이 3: [[2026-08-13-tailscale-sqlite-wal-reset-bug]]가 세운 "비표준 사용은 위험하다"는 명제의 더 극단적인 사례다

그 노트의 결론은 "검증된 지루한 기술도 비표준 방식으로 운영하면 위험하다"였다 — 16년 묵은 SQLite WAL 버그가 트랜잭션 로그 리플레이라는 비표준 사용 경로에서만 드러났다. SELF는 그보다 훨씬 더 비표준적이다: SQLite의 **쿼리 엔진 자체를 우회**해 페이지를 직접 `mmap`하고 실행 가능 메모리로 전환한다. `DESIGN.md` §8.3이 스스로 인정하는 한계 — 오버플로 페이지가 페이지 경계에 정렬되지 않아 `MAP_SHARED` 텍스트 매핑이 구조적으로 불가능하다는 것 — 는 "SQLite 파일 포맷"과 "SQLite 엔진이 실제로 보장하는 것" 사이의 간극을 정확히 드러낸다. 포맷은 재사용했지만 엔진의 신뢰성 보장은 상속되지 않는다는 걸, Tailscale 사례보다 더 노골적으로 보여주는 실증이다.

## 호스피탈리티 / CRS 적용 포인트

이 글은 실험적 시스템 프로그래밍 프로토타입 성격이 강해, **CRS 실무와의 직접 연결은 솔직히 멀다.** Linux 바이너리 실행 형식이라는 매우 로우레벨 계층을 다루고, 저자 스스로도 M4(커널/mmap 공유)를 스트레치 목표로 남겨둔 프로토타입이라 온다 백엔드 서비스 운영에 그대로 옮길 만한 실무 조언은 없다.

억지로 끌어오지 않고 원칙 수준에서만 하나 남기면: **"구조화되고 조회 가능한 데이터를 실행/배포 아티팩트와 한 몸으로 묶는다"**는 아이디어 자체는 [[2026-05-08-sqlite-loc-recommended-storage-format]]에서 이미 짚었던 "설정·데이터를 SQLite 단일 파일로 봉인해 배포"하는 패턴과 같은 축이다. SELF의 "실행 파일=DB"라는 극단 대신, 훨씬 보수적인 버전만 추출하면 — 예컨대 CRS 배치 작업(정산 스냅샷, 채널 매핑 규칙)의 실행 스크립트와 그 스크립트가 참조하는 데이터를 한 SQLite 파일에 함께 봉인해 배포하면 "이 버전의 코드가 정확히 이 버전의 데이터로 실행됐다"는 재현성 보장을 얻을 수 있다. 다만 이건 SELF 자체의 결론이라기보다 SELF가 밀어붙인 아이디어에서 CRS가 쓸 수 있을 만큼만 되돌린 원칙이라는 걸 밝힌다 — **직접 적용은 멀다.**

## 연관 자료

- [[2026-05-08-sqlite-loc-recommended-storage-format]] — "SQLite=애플리케이션 파일 포맷" 명제의 원조, SELF는 이를 실행 아티팩트로 확장한 사례
- [[2026-08-10-sqlite-reliability-lessons-hipp]] — SQLite 엔진 자체의 신뢰성 보장이 SELF의 새 실행 경로로 상속되지 않는다는 긴장
- [[2026-08-13-tailscale-sqlite-wal-reset-bug]] — "비표준 사용은 위험하다"는 명제의 더 극단적 실증: 쿼리 엔진을 우회해 페이지를 직접 실행 메모리로 매핑

## 한 달 뒤 회고

*(2026-09-25 즈음: ①원문 블로그·GeekNews·HN·Tildes 접근이 풀리면 실제 반응 논조를 대조 확인했는지 ②GitHub star 수·M4(커널 텍스트 페이지 공유) 진행 상황이 어떻게 바뀌었는지 ③이 레포·CRS 쪽에 "실행 스크립트+참조 데이터 단일 SQLite 파일 배포" 같은 보수적 파생 아이디어를 실제로 시도해봤는지 기록.)*
