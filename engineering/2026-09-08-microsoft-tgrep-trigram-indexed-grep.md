---
title: "microsoft/tgrep (Microsoft): 인덱스가 산 것은 '저장소 크기'가 아니라 '파일 하나 여는 비용'이다. 헤드라인 51.9배는 18칸 중 가장 좋은 한 칸이고, 리눅스 열의 중앙값은 2.71배, 10만 파일 미만 리눅스 3개 저장소는 0.93~1.61배로 사실상 무승부다"
source_title: "microsoft/tgrep: Trigram-indexed grep with a client/server architecture for fast regex search in large codebases locally"
source_url: "https://github.com/microsoft/tgrep"
source_name: "Microsoft (GitHub)"
published_at: "2026-09-07"
summarized_at: "2026-09-08"
category: "engineering"
tags: ["code-search", "trigram-index", "ripgrep", "rust", "benchmark-honesty", "agent-tooling", "developer-tools", "copilot-cli"]
---

# microsoft/tgrep: 트라이그램 인덱스 grep

> 출처: [microsoft/tgrep](https://github.com/microsoft/tgrep) (Microsoft, MIT, Rust) / 사용자 직링크(GeekNews 아님) / 정리일 2026-09-08
> **원문 확보 방식**: 저장소 페이지, `raw.githubusercontent.com`의 [README.md](https://raw.githubusercontent.com/microsoft/tgrep/main/README.md)와 [BENCHMARKS.md](https://raw.githubusercontent.com/microsoft/tgrep/main/BENCHMARKS.md)를 각각 직접 확보했다. 아래 벤치마크 18칸은 전부 BENCHMARKS.md 원문 수치다. 릴리스 연도는 GitHub 릴리스 목록이 연도를 생략해 [FreshPorts 포트 페이지](https://www.freshports.org/textproc/tgrep/)(v1.0.4, 2026-09-08 커밋, 포트 등록 2026-06-28)로 교차 확인했다.
> **출처 한계 (4가지)**
> 1. **벤더 자체 벤치마크다.** 측정 코드, 쿼리 목록, 비교 대상 선정 전부 tgrep 저장소 안에 있다. 제3자 재현 결과는 찾지 못했다.
> 2. **하드웨어가 공유 러너다.** BENCHMARKS.md가 직접 밝힌다: 측정은 GitHub 호스팅 러너(`windows-latest`, `macos-latest`, `ubuntu-latest`)에서 돌았고, *"Shared-runner results are not controlled-machine measurements. Compare tgrep with ripgrep within a row, not absolute milliseconds between workflow runs"*. **행 안에서만 비교하라고 저장소가 스스로 못 박았다.** 그런데 요약될 때 남는 건 그 표가 아니라 "최대 52배"라는 한 줄이다.
> 3. **실제 쿼리 목록이 공개돼 있지 않다.** 저장소마다 30~122개의 쿼리를 돌렸다고만 나오고 어떤 패턴인지는 없다. 트라이그램 인덱스는 패턴 구성에 따라 이득이 극단적으로 갈리는 자료구조라, 쿼리 선정이 곧 결과다.
> 4. **커뮤니티 검증이 거의 없다.** HN 스레드([49562928](https://news.ycombinator.com/item?id=49562928))는 **2점 2코멘트**가 전부고, 그 두 코멘트가 둘 다 "선행연구를 안 밝혔다"는 지적이다(각각 `sc0ty/grip`, 30년 된 Harvest 시스템). GeekNews 토픽은 확인되지 않는다. 즉 이 도구는 아직 **비판적으로 읽힌 적이 없다.** 트렌딩 스타 약 1.2k는 검증이 아니라 노출의 지표다.

## 한 줄 요약

**tgrep은 파일을 매번 전수 스캔하는 대신 트라이그램 인덱스를 미리 만들어 "매칭 가능성이 있는 파일"만 열고, 그 인덱스를 상주 서버가 mmap으로 들고 있다가 TCP로 응답한다. 저장소가 내건 문장은 *"Start a server once, search instantly forever."* 이고 헤드라인 수치는 gecko-dev(388K 파일) macOS에서 ripgrep 대비 51.9배다. 그런데 같은 문서의 18칸짜리 표를 열별로 읽으면 이야기가 달라진다: 윈도우 열은 최소가 7.08배인데 리눅스 열은 최대가 9.38배이고 중앙값이 2.71배, 심지어 kubernetes 리눅스는 0.93배로 ripgrep이 이긴다. 같은 인덱스, 같은 저장소인데 OS만 바꾸면 승수가 4~8배 움직인다. 그래서 이 표가 실제로 측정한 변수는 "저장소가 큰가"가 아니라 ***"파일 하나를 여는 데 얼마가 드는가"*** 다. 인덱스는 저장소 크기를 이기는 게 아니라 파일시스템 syscall 비용을 이긴다. 이 도구를 도입할지 판단하는 질문은 "우리 레포가 큰가"가 아니라 "우리가 파일 여는 게 비싼 환경에 있는가, 그리고 같은 레포를 하루에 몇 번 뒤지는가"다. 후자를 두 자릿수 늘린 게 에이전트이고, 이 도구가 GitHub Copilot CLI에 통합돼 있다는 사실이 존재 이유 전부다.**

## 핵심 포인트

### 벤치마크 18칸 전문 (BENCHMARKS.md 원문 수치)

`speedup = ripgrep 총시간 / tgrep 총시간`, 저장소별 전체 쿼리 합계 기준.

| 저장소 | 파일 수 | 쿼리 수 | 인덱스 크기 | Windows | macOS | Linux |
|---|---:|---:|---:|---:|---:|---:|
| chromium/chromium | 504,351 | 30 | 2,584 MB | 17.6x | 15.8x | **3.81x** |
| mozilla/gecko-dev | 387,841 | 122 | 1,952 MB | 38.6x | **51.9x** | 7.36x |
| torvalds/linux | 95,831 | 102 | 1,000 MB | 34.8x | 21.0x | 9.38x |
| rust-lang/rust | 62,326 | 102 | 199 MB | 7.69x | 2.69x | 1.61x |
| kubernetes/kubernetes | 31,300 | 97 | 215 MB | 7.08x | 2.81x | **0.93x** |
| golang/go | 15,833 | 103 | 113 MB | 7.53x | 3.12x | 1.29x |

열별 중앙값: **Windows 12.6x / macOS 9.5x / Linux 2.71x.**
10만 파일 미만 3개 저장소(rust, kubernetes, go)만 보면: **Windows 약 7.4x / macOS 약 3x / Linux 0.93~1.61x.**

- ***헤드라인 51.9배는 18칸 중 정확히 한 칸이다.*** 그 칸은 가장 큰 저장소 중 하나(388K 파일)를 가장 느린 러너(macOS)에서 돌린 결과다. 같은 저장소를 리눅스에서 돌리면 7.36배로, 7배 줄어든다.
- ***저장소가 클수록 이득이 크다는 명제도 표가 지지하지 않는다.*** 리눅스 열에서 가장 큰 chromium(504K)은 3.81배인데, 그보다 작은 torvalds/linux(96K)가 9.38배다. README가 직접 이유를 밝힌다: *"The margin depends on repo size and on how many matches a query returns"*, 수만 건이 매칭되는 검색은 인덱스가 후보를 줄여 아낀 시간보다 결과를 **전달하는 데** 더 쓴다. 즉 승수를 결정하는 건 파일 수가 아니라 **쿼리의 매칭 밀도**이고, 그건 저장소마다 쿼리 목록마다 다르다.
- ***tgrep은 자기가 지는 칸을 표에 그대로 실었다.*** kubernetes/Linux 0.93x, 그리고 "18칸 중 17칸에서 이겼다"는 표현을 README가 직접 쓴다. 이건 정직한 공개다. **문제는 표가 아니라 그 표를 요약하는 한 줄이고, 그 한 줄을 만드는 건 저장소가 아니라 이 도구를 소개하는 모든 2차 글이다.**

### 방법론에서 읽어야 할 두 줄

- *"The large-repo benchmarks measure **search time only** ... Every query is run through a **fresh `tgrep` client process**, so each measurement includes process startup and the TCP round trip"*: 인덱스 구축 시간은 타이밍에서 빠졌지만, 클라이언트 프로세스 기동과 TCP 왕복은 **매 쿼리마다 포함**했다. 이건 tgrep에게 불리한 방향이라 공정하다.
- *"ripgrep is capped at 120s per query; a query that hits the cap still contributes the full 120s to ripgrep's total."*: ripgrep은 120초에서 잘렸고 잘린 쿼리도 120초로만 계산됐다. **이 캡은 ripgrep의 실제 비용을 과소평가하므로 보고된 배수는 하한이다.** 다만 gecko-dev macOS의 ripgrep 평균이 쿼리당 33.4초(4,075,017ms / 122)라는 건, 평균이 소수의 병리적 쿼리에 지배된다는 뜻이기도 하다. 두 방향 모두 사실이다.

### 구조

```
tgrep <pattern> ---TCP(JSON-RPC 2.0)---> tgrep serve (멀티클라이언트)
   (클라이언트)                                |
                                         HybridIndex
                                         /          \
                                  IndexReader     LiveIndex
                                  (mmap 디스크)   (인메모리 오버레이)
```

- **IndexReader**: 정렬된 트라이그램 룩업 테이블에 대한 제로카피 이진탐색, mmap.
- **LiveIndex**: 최근 수정 파일용 인메모리 오버레이. **HybridIndex**가 둘을 합치되 오버레이가 우선.
- **백그라운드 인덱서**: rayon으로 500개 파일 배치 병렬 처리. 인덱스가 없으면 즉시 부분 데이터로 응답을 시작하고 뒤에서 계속 짓는다.
- **주기적 플러시**: 5만 파일마다 또는 5분마다 디스크로. **파일 워처**가 변경을 반영하고 **시간당 1회 파일시스템과 대조**한다.
- **메모리 상한**: 기본 external merge sort 전략으로 리눅스 커널(94,634 파일) 인덱싱 시 피크 **160.1 MiB / 22.6초**. 인메모리 전략을 쓰면 2.20~3.76 GiB. 기본값이 메모리 바운드인 건 잘 설계했다.
- **쿼리 플래너**: 정규식을 리터럴 조각으로 분해해 트라이그램 해시로 바꾸고, 포스팅 리스트를 AND/OR로 교집합, 합집합해 후보 파일을 뽑는다. ***쓸 만한 트라이그램이 안 나오는 패턴(아주 짧은 패턴, `.*`, 대소문자 무시)은 인덱스를 우회해 후보 파일을 브루트포스 스캔한다.*** `--stats`로 쿼리 플랜을 볼 수 있다.

### 운영상 걸리는 것들 (README의 Limitations에서)

- `tgrep index`와 `tgrep serve`의 **플래그가 일치해야** 결과가 맞는다.
- 64 MiB 초과 파일은 기본 제외(`--no-max-filesize`).
- 비-git 디렉터리에서는 `--no-require-git`을 주지 않으면 `.gitignore`가 무시된다.
- ***"File watcher reconciliation can miss changes on network or virtualized filesystems."*** 이 한 줄이 이 도구의 유일한 진짜 위험이다. 아래 CRS 절에서 다룬다.

## 인상 깊은 문장

> "Start a server once, search instantly forever." (README 태그라인)

> "Shared-runner results are not controlled-machine measurements. Compare tgrep with ripgrep **within a row**, not absolute milliseconds between workflow runs: CPU, storage and page-cache variance move both tools." (BENCHMARKS.md)

두 문장이 같은 저장소 안에 있다. 앞 문장은 마케팅이고 뒷 문장은 계측이다. **뒷 문장을 읽은 사람만이 앞 문장을 제대로 살 수 있다.**

## 댓글

**커뮤니티 검증이 사실상 없다.** HN 스레드는 2점 2코멘트가 전부이고, 둘 다 기술 평가가 아니라 선행연구 지적이다. RicoElectrico: *"Weird that the prior art of https://github.com/sc0ty/grip was not mentioned."* bediger4000: *"The 30-year-old 'harvest' system does some of the same things."* GeekNews 토픽은 확인되지 않았고, WebSearch로 잡히는 2차 소개글(태국어 블로그, 마스토돈, X)은 전부 README를 그대로 옮긴 것이라 교차검증 가치가 없다. **README 23개 섹션(tgrep, Why?, Architecture, Performance, Usage, CLI Flags, ... , Contributing, License)에 acknowledgements나 prior art 절이 없다는 건 직접 확인했다.** 트라이그램 인덱스로 정규식 검색을 가속하는 기법 자체는 2012년 Russ Cox의 Google Code Search 글과 Google zoekt가 확립한 것이다. 기술적 결함은 아니지만, MIT로 공개하면서 계보를 안 적으면 "마이크로소프트가 새로 만들었다"는 인상이 남는다. 그리고 그 인상은 비교 대상을 잘못 고르게 만든다: **잘 만든 재구현이라면 비교 상대는 grep이 아니라 zoekt다.**

한편 같은 검색으로 `snapgrep`, `xgrep`, `PythonicNinja/trigrep`, Moderne `Trigrep`이 전부 잡힌다. **몇 달 사이에 "에이전트를 위한 트라이그램 인덱스 코드 검색"이라는 카테고리가 통째로 생겨나는 중이고, tgrep은 그중 가장 큰 이름이 붙은 항목이지 유일한 항목이 아니다.**

## 내 생각, 적용점

### 핵심 전이 1: 헤드라인 배수와 실제 개선의 간극, 다만 이번엔 치팅이 아니다

[[2026-08-23-no-reason-for-slow-software-dan-luu]]에서 정규식 엔진 최적화의 "Rust보다 40% 빠르다"가 벤치마크 러너 바꿔치기였고 실제 개선은 약 7%였다. 구조는 닮았다: **화려한 배수 하나가 앞에 나오고, 대표적인 조건에서의 실제 개선은 그보다 훨씬 작다.** 그러나 결정적 차이가 있고 이걸 뭉개면 부당한 비난이 된다. tgrep은 ***지는 칸(0.93x)을 자기 표에 실었고, 행 사이 비교를 하지 말라고 자기 문서에 썼고, 승수가 줄어드는 이유(매칭 건수)까지 자기가 설명했다.*** Dan Luu 사례가 "측정이 조작됐다"라면 이건 "측정은 정직한데 요약이 한 칸만 남긴다"다. 그래서 교훈의 방향도 다르다: 저자를 의심하는 게 아니라, **표를 요약한 한 줄이 아니라 표를 직접 열어보는 습관**이 필요하다. 이 노트가 BENCHMARKS.md를 따로 확보한 이유가 그거고, README 요약본만 봤다면 리눅스 열 중앙값 2.71배는 영영 안 보였다.

### 핵심 전이 2: 벤더 표에서 읽어야 하는 건 최고 수치가 아니라 "우리 행"이다

[[2026-07-13-harness-token-overhead-instrument-your-own-boundary]]의 결론은 벤더 선택이 아니라 "지난 화요일에 우리가 모델에 정확히 무엇을 보냈는가"에 답할 수 있게 만들라는 운영 원칙이었다. 여기 그대로 적용된다. tgrep의 18칸 표에서 **나에게 유효한 칸은 (내 OS) x (내 저장소 규모) 하나뿐**이고, 나머지 17칸은 남의 이야기다. 실무 규칙으로 옮기면:

1. `git ls-files | wc -l` 로 파일 수를 먼저 센다. **10만 파일이 분기점**이다.
2. 내 OS 열을 본다. 리눅스면 기대치를 1~3배로, macOS면 3~10배로, 윈도우면 7배 이상으로 잡는다.
3. 그리고 **그 기대치조차 GitHub 공유 러너 기준**이다. 로컬 NVMe가 달린 M 시리즈 맥북은 macOS 러너보다 훨씬 빠르므로, 실제 승수는 macOS 열보다 리눅스 열에 가까울 가능성이 높다. macOS 열의 ripgrep 평균 33.4초/쿼리는 개발자 노트북에서 나올 수 있는 숫자가 아니다.
4. 그래서 결론: **표로 결정하지 말고 `tgrep index`를 실제 레포에 한 번 돌려보고 결정한다.** 인덱싱은 10만 파일 기준 20여 초다. 판단 비용이 이렇게 싼데 남의 표를 읽고 있을 이유가 없다.

### 핵심 전이 3: 복잡도는 필요성이 입증된 뒤에만, 코드 검색판

[[2026-08-27-rag-is-simpler-than-you-think]]의 처방("BM25로 시작하고, 데이터가 필요성을 입증할 때만 벡터DB로 올라가라")을 코드 검색에 그대로 옮기면 계단은 이렇다: **ripgrep(상태 0) → 느리다는 게 실측될 때만 → 트라이그램 인덱스(상주 서버 + 파일 워처 + 디스크 인덱스)**. tgrep이 요구하는 대가는 명시적이다. chromium이면 디스크 **2,584 MB**, 상주 프로세스 하나, 파일 워처 하나, `index`와 `serve`의 플래그를 맞춰야 한다는 규칙 하나. **3만 파일 저장소에서 리눅스 기준 0.93배를 얻으려고 이 운영 부담을 지는 건 명백한 손해**이고, 이건 취향이 아니라 그들이 낸 표가 말하는 것이다.

### 핵심 전이 4: 진짜 수요자는 사람이 아니라 에이전트다

인덱스의 구축 비용을 상각하는 변수는 **같은 저장소를 다시 뒤지는 횟수**다. 사람은 하루에 grep을 수십 번 한다. 에이전트는 **한 작업에** 수십에서 수백 번 한다. 이 도구가 GitHub Copilot CLI에 통합돼 있다는 사실이 설계 의도 전부를 설명한다: 클라이언트/서버로 쪼갠 것도, 매 쿼리에 프로세스 기동과 TCP 왕복을 포함해 측정한 것도, 편집기와 툴 통합을 상정한 결과다.

여기서 [[2026-09-03-zg-zvec-grep-local-search-infra]]와 나란히 놓아야 한다. **같은 주에 두 도구가 같은 병목을 서로 직교하는 축으로 공격했다.**

| | tgrep | zg (zvec-grep) |
|---|---|---|
| 푸는 문제 | 찾을 걸 **아는데** 느리다 | 찾을 걸 **모른다** |
| 수단 | 트라이그램 인덱스로 지연시간 절감 | 벡터, BM25로 의도 검색 |
| 지표 | ripgrep 대비 배수 | 도구 호출, 입력 토큰 절감 |
| 최종 정확성 | 후보 파일 실제 스캔 | ripgrep으로 검증 |

**둘 다 마지막에 정확한 텍스트 매칭으로 검증한다는 점이 같다.** 인덱스는 후보를 줄이는 데만 쓰이고 진실은 여전히 파일 안에 있다. [[2026-09-02-memoryfields-agent-memory-file-format]]의 "색인은 시스템이 아니라 삭제 가능한 캐시"와 정확히 같은 원칙이고, tgrep도 인덱스가 깨지면 지우고 다시 지으면 된다. **에이전트 시대의 검색 인프라가 수렴하는 지점이 여기다: 인덱스는 재현율을 위한 파생물, 정확성은 원본에서.**

### 핵심 전이 5: 이 도구가 인터페이스를 하나도 바꾸지 않은 것이 최선의 선택인 이유

바로 전날 정리된 [[2026-09-07-grep-beats-lsp-coding-agents]]의 결론이 이 도구의 설계를 정확히 정당화한다. 그 실험에서 에이전트는 코드 구조를 이해하는 LSP 탐색 도구를 줘도 대부분 grep을 썼고, LSP를 먼저 쓰도록 강제하면 성공률이 오히려 떨어졌다. 차이를 만든 건 검색 정확도가 아니라 **"결과를 바로 다음 행동에 쓸 수 있는 형태로 주는가"** 였다.

tgrep이 한 선택이 정확히 그 교훈의 반대편 실수를 피한 것이다. **인터페이스는 손대지 않고 비용만 바꿨다.** ripgrep 호환 플래그(`-i`, `-F`, `-w`, `-o`, `-n`, `-c`, `-l`, `-A/-B/-C`, `--json`, `--vimgrep`)를 그대로 받고, 출력도 같고, 지원하지 않는 `-z/--search-zip`은 조용히 무시하는 대신 종료코드 2로 죽는다. LSP는 "더 나은 형태의 답"을 주려다 졌고, tgrep은 "같은 답을 더 빨리" 준다. **에이전트 도구를 만들 때 이게 더 안전한 베팅이다: 모델이 이미 아는 인터페이스는 그대로 두고 그 아래에서만 이긴다.**

단, 여기에 정확히 하나의 균열이 있고 그게 아래 CRS 절의 위험과 같은 것이다. grep이 에이전트에게 주는 가장 값진 성질은 속도가 아니라 ***"없다"는 답을 믿을 수 있다는 것***이다. 낡은 인덱스는 그 성질만 골라서 깬다. 출력 형식이 같아서 호출자는 깨진 걸 알아챌 방법이 없다.

### 핵심 전이 6: 개인 도구의 성능 개선이 조직 인프라 문제로 승격되는 지점

[[2026-08-27-cursor-continuity-git-at-scale]]이 "Git 저장소를 진실의 원천에서 재생성 가능한 따뜻한 캐시로 강등"해 대규모 호스팅을 풀었다면, tgrep은 훨씬 작은 규모에서 같은 형태의 답을 낸다. 인덱스는 파생물이고 언제든 다시 지을 수 있다. **다른 점은 누가 그 캐시의 신선도를 책임지느냐다.** Cursor는 WAL이라는 결정적 로그가 책임지고, tgrep은 파일 워처와 시간당 1회 대조가 책임진다. 후자가 훨씬 약하고, 그 약함이 다음 절의 위험으로 직결된다.

## 호스피탈리티 / CRS 적용 포인트

**1. 도입 판단은 표가 아니라 `git ls-files | wc -l` 한 줄에서 시작한다.** 온다의 개별 서비스 저장소는 거의 확실히 10만 파일 미만이고, 그러면 우리 행은 rust(62K), kubernetes(31K), go(16K) 구간이다. 그 구간의 승수는 **리눅스 0.93~1.61배, macOS 2.69~3.12배**다. 개발자 머신이 macOS이므로(그리고 러너보다 빠른 로컬 NVMe이므로) 현실적 기대치는 **2~3배 미만**이고, 인덱스는 113~215 MB로 감당 가능하다. "52배"를 기대하고 들어가면 반드시 실망한다.

**2. 진짜 위험은 성능이 아니라 조용한 거짓 음성(false negative)이다.** README가 인정한다: 파일 워처의 대조가 **네트워크 파일시스템이나 가상화된 파일시스템에서 변경을 놓칠 수 있다.** 인덱스가 낡으면 검색 결과가 틀리는데, ***틀리는 방향이 "없다고 답하는 것"이다.*** grep에는 이 실패 모드가 아예 없다. grep이 "없다"고 하면 없는 것이다. tgrep이 "없다"고 하면 없거나, 인덱스가 낡았거나 둘 중 하나이고 **호출자는 그 둘을 구분할 수 없다.**

이게 CRS 코드베이스에서 왜 중요한가: 정산, 채널 연동, 요금 코드에서 **"이 상수/문자열/필드는 아무 데서도 안 쓴다"** 는 판단은 삭제와 리팩토링의 전제다. 그 판단이 낡은 인덱스에서 나오면 삭제 사고가 된다. 그래서 실무 규칙:

- **"찾았다"는 tgrep을 믿고, "없다"는 ripgrep으로 확인한다.** 인덱스는 재현율을 높이는 도구지 부재 증명 도구가 아니다.
- 삭제, 대량 치환처럼 되돌리기 어려운 작업의 근거로 인덱스 검색 결과 단독을 쓰지 않는다. (`methodology/strict.md`의 dry-run 게이트에서 "누락된 필드를 추측으로 채우지 않는다"와 같은 계열이다: 여기서 추측에 해당하는 게 "인덱스가 최신일 것이다"라는 가정이다.)
- 컨테이너 볼륨 마운트, 원격 개발 환경처럼 가상화된 파일시스템 위에서 개발한다면 워처가 놓칠 확률이 올라간다. 그 환경에서는 도입하지 않는 게 낫다.

**3. 적용 후보는 사람의 CLI가 아니라 에이전트 하네스다.** 다만 즉시 교체할 지점이 없다. Claude Code는 자체 Grep 도구(ripgrep 기반)를 쓰므로 tgrep이 자동으로 들어가지 않고, MCP 도구로 별도로 붙이거나 Copilot CLI를 쓸 때만 적용된다. **그리고 붙이더라도 위 2번의 거짓 음성 문제가 그대로 따라온다.** 에이전트는 사람보다 훨씬 자주 "없으니 새로 만들자"로 넘어가므로, 낡은 인덱스가 만드는 손해도 사람보다 크다. 붙일 거면 에이전트 지시서에 "부재는 ripgrep으로 재확인"을 명시해야 한다.

**4. 지금 당장의 결론: 도입 보류, 관찰 대상.** 우리 규모에서 기대 이득이 2~3배인데 상주 서버, 워처, 인덱스 신선도라는 새 실패 모드를 셋 얻는다. 반대로 **관찰할 가치는 높다**: 이 카테고리(tgrep, zg, snapgrep, xgrep, Moderne Trigrep)가 몇 달 사이 한꺼번에 생겼다는 건 에이전트 코딩의 병목이 모델에서 검색으로 옮겨가고 있다는 신호이고, 그 병목은 우리 코드베이스가 커질수록 우리에게도 온다.

## 연관 자료
- [[2026-09-03-zg-zvec-grep-local-search-infra]] - *같은 주, 같은 병목을 직교하는 축(의미 검색)으로 푼 형제 도구. 둘 다 마지막 검증은 정확한 텍스트 매칭에 맡긴다*
- [[2026-08-23-no-reason-for-slow-software-dan-luu]] - *헤드라인 배수와 실제 개선의 간극. 단 저기는 측정 조작, 여기는 정직한 측정의 부정직한 요약*
- [[2026-07-13-harness-token-overhead-instrument-your-own-boundary]] - *벤더 수치가 아니라 내 경계에서 계측하라는 같은 원칙*
- [[2026-08-27-rag-is-simpler-than-you-think]] - *복잡도는 필요성이 입증될 때만. 인덱스는 ripgrep이 느리다는 게 실측된 뒤에*
- [[2026-09-02-memoryfields-agent-memory-file-format]] - *"색인은 삭제 가능한 캐시"라는 동일한 아키텍처 원칙*
- [[2026-09-07-grep-beats-lsp-coding-agents]] - *에이전트가 grep을 고르는 이유는 정확도가 아니라 결과를 바로 쓸 수 있는 형태였다는 실험. tgrep이 인터페이스를 안 건드린 게 왜 옳은 선택인지, 그리고 거짓 음성이 왜 유일한 균열인지*
- [[2026-08-27-cursor-continuity-git-at-scale]] - *캐시를 재생성 가능한 파생물로 강등하는 같은 형태의 답, 다만 신선도를 책임지는 장치의 강도가 다르다*

## 한 달 뒤 회고
*(2026-10-08 즈음 점검)*
- 온다 저장소 하나에 실제로 `tgrep index`를 돌려 파일 수와 실측 승수를 기록했는가. 표의 예측(2~3배)이 맞았는가.
- 제3자 재현 벤치마크나 zoekt와의 비교가 나왔는가. HN 2점 2코멘트에서 실제 기술 토론으로 넘어갔는가.
- 파일 워처의 거짓 음성이 실제로 관찰됐다는 이슈가 저장소에 올라왔는가.
- 이 카테고리(트라이그램 인덱스 코드 검색)가 한 달 뒤에도 늘고 있는가, 아니면 tgrep 하나로 수렴했는가.
