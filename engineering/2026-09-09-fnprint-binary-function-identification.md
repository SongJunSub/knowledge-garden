---
title: "fnprint (1rhino2) — 바이트가 아니라 실행 동작으로 함수를 매칭해, 컴파일러·최적화가 달라도 스트립된 바이너리 속 함수를 되찾는 도구"
source_title: "fnprint: match functions in binaries by what they do, not what their bytes look like"
source_url: "https://github.com/1rhino2/fnprint"
source_name: "GitHub (1rhino2/fnprint)"
referrer_url: "https://news.hada.io/topic?id=33385"
published_at: "미상 (GitHub 저장소, 별도 릴리스 날짜 확인 못함)"
summarized_at: "2026-09-09"
category: "engineering"
tags: ["reverse-engineering", "binary-analysis", "microexecution", "symbol-recovery", "firmware-diffing", "rust"]
---

# fnprint (1rhino2) — 바이트가 아니라 실행 동작으로 함수를 식별한다

> 출처: [fnprint](https://github.com/1rhino2/fnprint) (GitHub, 1rhino2) · GeekNews(id=33385) 경유 · 정리일 2026-09-09

> **출처 한계**: `news.hada.io`는 이번 세션 egress 차단으로 열람 불가. GitHub 저장소 README는 직접 WebFetch에 성공해 작동 원리·정확도 수치·한계는 1차 소스로 확인했다. 다만 hada 댓글 수·HN/Lobsters 등 외부 커뮤니티 큐레이션 여부, 저자(GitHub 계정 1rhino2)의 정체·소속은 확인하지 못했다.

## 한 줄 요약

**fnprint는 스트립된(이름이 제거된) 바이너리 속 함수를, 바이트 시그니처나 제어흐름 그래프가 아니라 마이크로실행(microexecution)으로 관찰한 실제 동작을 minhash 지문으로 비교해 식별하는 리버스 엔지니어링 도구다.** zlib 같은 이름이 알려진 함수와 대조해 "이 함수는 `compress2`와 동작이 비슷하다"는 답을 낼 수 있고, 컴파일러·최적화 옵션이 달라도(O0→O3 사이 91~97% 정확도) 비교적 안정적으로 살아남는다는 게 핵심 강점이다.

## 핵심 포인트

- **작동 원리 3단계** — ① 각 함수를 작은 에뮬레이터(Unicorn)에서 임의의 입력값으로 실행해 ② 메모리 읽기/쓰기·함수 호출·분기 같은 부작용을 기록하고 ③ 그 동작 스트림을 minhash 서명으로 압축, 매칭되는 슬롯 비율로 유사도를 계산한다.
- **기존 접근과의 차이** — 바이트 시그니처(FLIRT, FunctionID)는 재컴파일만 해도 깨지고, 제어흐름 그래프 매칭(BinDiff, Diaphora)도 `-O0` vs `-O3` 사이에서 흔들리는 반면, ***동작 기반 지문은 그보다 훨씬 안정적***이라는 게 이 도구의 핵심 주장.
- **정확도 수치(1차 확인)** — zlib 1.3.1(84개 함수) 기준 gcc O0→O1 매칭 정확도 97.1%, O0→O2 93.1%, O0→O3 91.3%(모두 Rank-1 기준). 다만 ***양쪽 모두 고도로 최적화된 경우엔 50~60%대로 급락***한다는 한계도 저장소가 스스로 명시한다.
- **활용 사례 3가지** — ① **기호 복원**: 스트립된 zlib에서 `compress2` 등 함수명을 되찾는 예시. ② **펌웨어 버전 비교**: 두 `.so` 파일을 비교해 실제로 동작이 바뀐 함수(예: `deflate_stored`)만 골라내는 것 — 보안 패치 전후 차이 조사에 바로 쓰인다. ③ **취약점 트리아지**: 취약 버전·패치 버전 두 코퍼스로 미지의 빌드를 위험도 순으로 랭킹.
- **한계** — 소형 함수(thunk, 1줄 접근자)는 신호가 부족하고, 체크섬류처럼 순수 계산만 하는 함수는 서로 구분이 어려우며, 조건 진입 이후의 깊은 로직 변경은 임의 입력으로 도달하지 못해 놓친다. VM 기반 난독화에는 사실상 무력하고, 현재 x86-64 ELF만 지원(ARM64·MIPS는 로드맵).
- **계보** — Godefroid(2014)의 마이크로실행, Egele 외(USENIX Security 2014)의 Blanket Execution 기법을 실용적으로 구현한 유지보수 도구라고 스스로 위치를 밝힌다.

## 인상 깊은 문장

> "match functions in binaries by what they do, not what their bytes look like." (저장소 설명 원문 — 이 도구의 설계 철학을 한 줄로 압축한다.)

## 댓글

hada 댓글 수·논조는 이 세션에서 확인하지 못했다(`news.hada.io` 차단). GitHub 저장소 자체는 star 44개, 커밋 55개로 활발히 유지보수되는 것으로 확인되지만, HN·Lobsters 등 외부 커뮤니티 큐레이션 여부는 WebSearch로 찾지 못했다 — 별도로 크게 화제가 된 정황은 보이지 않지만, "확인 안 됨"과 "화제가 없었음"은 구분해서 남겨둔다.

## 내 생각 · 적용점

1. [[2026-09-05-imhex-file-format-reverse-engineering]]가 정리한 원칙은 ***"정체불명의 바이트는 그걸 만든 코드를 먼저 읽어야 풀린다"***였다. fnprint는 그 반대 방향의 문제를 푼다 — 코드(소스)는 없고 바이너리만 있을 때, ***이미 이름을 아는 다른 코드와 동작을 대조해 정체를 추론***하는 것. 두 도구를 나란히 두면 리버스 엔지니어링의 두 축이 보인다 — 대상이 뭘 하는지 모를 때는 그걸 만든 코드를 찾아 읽고(ImHex류 접근), 이름만 모를 때는 동작을 이미 아는 것과 대조한다(fnprint류 접근). 전자는 "무엇을 하는가"를, 후자는 "무엇과 같은가"를 묻는다.
2. [[2026-09-05-stave-aws-attack-path-security]]의 "유령 참조(ghost reference)" 탐지와 fnprint의 취약점 트리아지 활용 사례는 둘 다 ***"겉보기엔 그대로인데 실제 의미·위험이 달라졌는지"***를 정적 분석만으로 잡아내려는 시도라는 공통점이 있다. Stave는 인프라 설정 그래프 층위에서, fnprint는 바이너리 함수 층위에서 같은 질문("이게 정말 내가 알던 그것과 같은 동작을 하는가")을 던진다.
3. fnprint가 스스로 밝힌 한계(양쪽 고도 최적화 시 정확도 50~60%대로 급락, 깊은 로직 변경 미탐지)는, 이 가든이 반복해서 강조해온 ***"벤더·저자가 스스로 인정한 실패 모드를 진지하게 받아들여라"***는 원칙([[2026-09-08-microsoft-tgrep-trigram-indexed-grep]]에서 tgrep README가 파일워처의 오탐지 가능성을 스스로 인정한 것과 같은 결)에 부합하는, 작지만 정직한 문서화 사례다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 멀다.** CRS/PMS는 서드파티 스트립 바이너리를 리버스 엔지니어링할 일이 거의 없고, x86-64 ELF 전용이라는 제약도 실무 적용 범위를 더 좁힌다. 억지로 전이할 원칙을 굳이 꼽자면, 활용 사례 3(취약점 트리아지)의 발상 — ***"업데이트 전후로 실제 동작이 바뀐 부분만 골라낸다"*** — 정도다. 벤더가 배포하는 SDK·바이너리 업데이트를 블랙박스로만 받아들이지 않고 "이번 업데이트로 실제 동작이 바뀐 게 어디인지" 점검하려는 태도는 참고할 만하지만, 순수 보안 리서치 도구를 CRS 비즈니스와 억지로 엮지는 않는 편이 정직하다.

## 연관 자료

- [[2026-09-05-imhex-file-format-reverse-engineering]] — "코드를 먼저 읽어라"는 반대 방향의 리버스 엔지니어링 원칙과 대비
- [[2026-09-05-stave-aws-attack-path-security]] — "겉보기엔 정상인데 의미가 달라졌는가"를 다른 레이어(인프라 vs 바이너리)에서 묻는 도구

## 한 달 뒤 회고

*(2026-10-09 즈음 — ARM64·MIPS 지원 로드맵 진행 여부, star 수 증가나 실사용 보고가 있었는지 GitHub에서 재확인.)*
