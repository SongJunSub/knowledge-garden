---
title: "모두가 제정신을 잃었다 (Jan Schaumann) — 취약점을 더 찾는 데 쓰는 인력을, 패치 자동화와 자산 목록 정비에 썼다면 더 나은 투자였을 것"
source_title: "Everybody's Lost Their Minds"
source_url: "https://www.netmeister.org/blog/everybodys-lost-their-minds.html"
source_name: "netmeister.org (Jan Schaumann)"
referrer_url: "https://news.hada.io/topic?id=33862"
published_at: "2026-09-17"
summarized_at: "2026-09-18"
category: "engineering"
tags: ["ai-hype-critique", "security-engineering", "vulnerability-patching", "burnout", "asset-inventory", "organizational-ai-adoption"]
---

# 모두가 제정신을 잃었다 (Jan Schaumann)

> 출처: [Everybody's Lost Their Minds](https://www.netmeister.org/blog/everybodys-lost-their-minds.html) (Jan Schaumann · netmeister.org) · GeekNews 경유 [id=33862](https://news.hada.io/topic?id=33862) · 정리일 2026-09-18
>
> **출처 한계**: `news.hada.io`·`netmeister.org`·`news.ycombinator.com`·`daily.dev`·`rybar.me`·`web.archive.org` 등 이번 세션에서 시도한 모든 경로가 egress 정책으로 차단돼 원문 전체를 직접 읽지 못했다. 아래 두 인용문은 WebSearch가 반환한 검색엔진 인덱스 스니펫에서 원문 그대로 확인된 것이라 신뢰도가 높지만, 그 외 논지 전개·순서·전체 맥락은 Slack 발췌와 WebSearch 스니펫을 종합 재구성한 것이다. 저자 소개(Akamai Chief Information Security Architect)는 저자 본인 이력 페이지에서 확인했다.

## 한 줄 요약

**보안 엔지니어 Jan Schaumann이 "AI 대응이 하루 업무의 75% 이상을 차지하면서 일의 즐거움까지 잃었다"는 개인 경험에서 출발해, 조직들의 AI 도입 열풍을 정면 비판한다. 핵심 논지는 "보안의 병목은 예나 지금이나 취약점을 찾는 게 아니라 실제 시스템에 패치를 적용하는 일"인데, 조직들은 AI로 취약점을 더 찾아내는 화려한 프로젝트에 막대한 인력을 쏟아붓고 있고, 같은 인력을 자산 목록 정비·자동 업데이트·공격 표면 파악 같은 기본 위생에 썼다면 훨씬 나은 투자였을 것이라는 주장이다.**

## 핵심 포인트

- **개인적 소진 — 업무의 75%가 "AI 대응"** — 자신의 업무 시간 대부분이 실제 보안 작업이 아니라 AI 관련 소동(정책 수립, 벤더 대응, 조직 내 AI 열풍 관리)에 잠식되면서, ***일 자체의 즐거움까지 잃었다***고 토로한다.
- **핵심 명제 — 병목은 발견이 아니라 패치** — ***"보안에서 취약점을 찾는 것은 한 번도 병목이었던 적이 없다. 취약점 보고를 검증하고 심각도를 판단하는 것도 병목이 아니다 (...) 병목은 예나 지금이나 그놈의 패키지를 업데이트하는 일이다. 패칭은 여전히 어렵다."*** — 원문 그대로 확인된 문장이다.
- **AI 취약점 발굴 열풍에 대한 비판** — 조직들이 AI로 ***"수천 건의 취약점을 더 찾아내는 데"*** 화려한 "프런티어 모델" 프로젝트를 벌이지만, 그렇게 늘어난 발견은 이미 밀려 있는 패치 대기열에 더 얹힐 뿐이라고 지적한다. 같은 인력을 자산 목록 정비·자동 업데이트·공격 표면 파악에 투입했다면 더 나은 투자였을 것이라는 게 저자의 대안이다.
- **에이전트가 개인을 바쁘게 만드는 것과 조직 문제 해결은 다르다** — 에이전트로 개인 한 명이 더 많은 일을 처리하게 되는 것이, 부서 간 협업 부재라는 더 근본적인 조직 문제를 풀어주지는 않는다는 점을 짚는다.
- **AI 생성 코드 리뷰·"human in the loop"에 대한 회의** — AI 개입이 커질수록 사람이 코드베이스를 실제로 이해하는 정도는 오히려 줄어들기 때문에, 검토 절차에 사람을 끼워 넣는 것만으로 위험이 유의미하게 줄어드는지에 대해 회의적이다.
- **AI 멸망론에 대한 태도** — "AI가 인류를 멸망시킬 것"이라는 주장까지 다루지만(정확한 논조는 원문 미확보로 확인 불가), 전반적 어조는 거창한 실존적 위협론보다 "당장의 조직 운영이 잘못된 방향에 자원을 쏟고 있다"는 실무적 비판에 무게가 실려 있는 것으로 읽힌다.
- **탈진의 언어** — ***"AI 브레인 웜이 퍼지고 있고 나는 해법이 없다, 그냥 이 롤러코스터에서 내리고 싶을 뿐이다."*** — 원문 그대로 확인된 문장으로, 이 글 전체의 정서적 톤을 압축한다.

## 인상 깊은 문장

> "Finding vulnerabilities has never been the bottleneck in information security. The bottleneck isn't even verifying a vulnerability report and validating its severity... The bottleneck isn't determining the fix, creating the patch, or publishing a new release. The bottleneck is still, as ever before, getting the goddamn packages updated. Patching is still hard."

> "The AI brain worms have been spreading and I don't have a solution, I just want to get off this ride."

## 댓글

**hada 댓글 수는 확인 불가**(`news.hada.io` 세션 전체 차단). 같은 글이 Hacker News에도 올라와 **302점·254댓글**을 기록했음을 "Hacker News Daily Top 30 @2026-09-18"(GitHub `meixger/hackernews-daily` 이슈 미러) 기준 9위로 확인했다 — 오늘 배정된 5개 글 중 가장 낮은 순위지만 254개 댓글은 상당한 논의량이다. Lobsters 큐레이션 여부는 확인하지 못했다. **정직하게 밝힐 이해관계**: 저자는 Akamai의 Chief Information Security Architect로, 대기업 보안 조직 내부자 시점의 비판이다 — 자신이 직접 겪은 "AI 대응 75%"라는 n=1 경험을 조직 전체의 문제로 일반화하는 대목은 저자 개인의 번아웃 서사가 섞여 있을 수 있다는 점을 감안해서 읽을 필요가 있다. 또한 "AI로 취약점 찾기 열풍"에 대한 비판은 이 글이 나온 시점과 비슷하게 AI 해킹 벤치마크가 활발히 홍보되던 흐름([[2026-09-17-deepseek-v4-1-flash-enclave-hacking-benchmark]] 참고)과 맞물려 있어, 특정 벤더·프로젝트를 직접 겨냥했을 가능성이 있지만 이번 조사로는 특정하지 못했다.

## 내 생각 · 적용점

### 핵심 전이 1 — [[2026-05-09-ai-breaking-vulnerability-cultures]]가 이미 짚은 "패칭이 진짜 병목"이라는 명제의 4개월 뒤 재확인

Jeff Kaufman의 노트는 "AI가 공개 커밋에서 보안 패치를 자동 탐지하는 비용을 0에 가깝게 낮추면서 조율된 공개·조용한 패치 두 문화가 동시에 무너지고, 패치 윈도우가 시간 단위로 짧아져야 한다"고 진단했었다. 이 글은 같은 병목(패칭)을 다른 각도에서 짚는다 — Kaufman이 "발견 속도가 빨라졌으니 패치도 빨라져야 한다"는 기술적 처방이었다면, Schaumann은 "그런데 조직은 패치 자동화가 아니라 '더 많은 발견'에 계속 투자한다"는 ***조직의 자원 배분 실패***를 비판한다. 두 노트를 겹쳐 읽으면 "AI가 발견을 쉽게 만들수록 패치라는 병목은 더 도드라지는데, 정작 조직의 돈과 인력은 병목이 아니라 발견 쪽으로 계속 쏠린다"는 완결된 그림이 나온다.

### 핵심 전이 2 — [[2026-09-17-deepseek-v4-1-flash-enclave-hacking-benchmark]]가 정확히 이 글이 경고하는 그 열풍의 실물이다

이 글이 비판하는 "AI로 수천 건의 취약점을 더 찾아내는 데 막대한 인력을 투입"하는 흐름은 추상적 우려가 아니다 — 바로 하루 전 정리한 Enclave의 AI 해킹 레이스 노트가 정확히 그 실물이다: DeepSeek V4.1 Flash가 취약 타겟 11개 전부를 단 $4.65에 뚫었다는 성과가 화려하게 보도됐다. 이 글의 관점에서 보면, 그 $4.65는 "발견 비용"을 극적으로 낮췄을 뿐 "발견된 취약점을 실제로 패치하는 능력"은 조금도 늘리지 않았다 — 오히려 발견이 싸질수록 패치 대기열만 더 빠르게 길어질 위험이 있다는 게 이 글이 그 성과 발표에 던지는 반론이다. 억지로 엮은 연결이 아니라, 같은 배치에서 정리한 두 글이 정확히 같은 현상의 양쪽 얼굴을 보여준다.

### 핵심 전이 3 — "에이전트가 개인을 바쁘게 만드는 것"과 조직 문제는 다르다는 지적은 가든의 반복 주제다

이 글의 "에이전트로 개인 한 명이 더 바빠지는 것만으로는 부서 간 협업 문제가 풀리지 않는다"는 지적은, 이 가든이 여러 차례 확인한 "병목은 코드가 아니라 조직"이라는 계열 명제와 같은 결이다. AI 도입이 개인 단위 생산성 지표는 개선하면서도 조직 차원의 실제 문제(패치 적체, 부서 간 조율)는 그대로 두는 패턴이 보안 영역에서 다시 확인된 셈이다.

## 호스피탈리티 / CRS 적용 포인트

- **"발견 vs 적용"의 구도는 CRS 보안 운영에도 그대로 적용된다.** AI로 취약점 스캔·코드 리뷰를 더 많이 돌리는 것보다, 실제 패치·업데이트가 얼마나 빨리 배포되는지, 자산 목록(어떤 서비스가 어떤 버전을 쓰는지)이 최신 상태인지를 먼저 점검하는 게 이 글의 처방과 일치한다. [[2026-05-09-ai-breaking-vulnerability-cultures]]에서 이미 짚었던 "공격 표면 축소가 패치 속도보다 우선"이라는 결론과 같은 방향이다.
- **"AI 대응이 업무의 75%를 차지"하는 현상을 자체 점검할 근거로 삼을 만하다.** 온다 팀 내부에서도 AI 도구 도입·정책 수립·벤더 평가에 쓰는 시간이 실제 엔지니어링 시간을 잠식하고 있지는 않은지, 분기별로 가볍게 체크해볼 가치가 있다.
- **AI 해킹 벤치마크의 화려한 숫자(예: $4.65에 11개 타겟 전부 뚫기)를 도입 판단 근거로 쓸 때는, "그래서 우리 조직의 패치 배포 속도는 그만큼 빨라지는가"를 항상 같이 물어야 한다**는 원칙이 이 글에서 가장 직접적으로 전이되는 대목이다.

## 연관 자료

- [[2026-05-09-ai-breaking-vulnerability-cultures]] — "패칭이 진짜 병목"이라는 같은 명제를 4개월 앞서 다른 각도(공개 문화 붕괴)에서 다룬 노트, 이 글의 조직 비판을 기술적으로 뒷받침
- [[2026-09-17-deepseek-v4-1-flash-enclave-hacking-benchmark]] — 이 글이 경고하는 "AI로 취약점 더 찾기" 열풍의 바로 전날 사례, 거울상 관계

## 한 달 뒤 회고

*(2026-10-18 즈음 — 원문을 직접 확보해 인용문 외 논지 전개(특히 "AI가 인류를 멸망시킨다"는 주장에 대한 저자의 정확한 태도)를 대조했는지, HN 254개 댓글의 실제 논조(공감 다수인지 반론 다수인지)를 확인했는지, 온다 내부의 "AI 대응 시간 비중"을 실제로 점검했는지 기록.)*
