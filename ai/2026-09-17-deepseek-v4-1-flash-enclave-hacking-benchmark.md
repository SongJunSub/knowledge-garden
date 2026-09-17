---
title: "DeepSeek V4.1 Flash, Enclave 해킹 레이스 1위 (Enclave) — 취약 타겟 11개 전부 뚫고 패치본 4개는 모두 지켰다, 비용은 단 $4.65"
source_title: "DeepSeek V4.1 Flash is Now Our Best Hacking Model"
source_url: "https://enclave.ai/blog/deepseek-v41-flash-is-now-our-best-hacking-model"
source_name: "Enclave AI 공식 블로그(enclave.ai)"
referrer_url: "https://news.hada.io/topic?id=33809"
published_at: "2026-09-16"
summarized_at: "2026-09-17"
category: "ai"
tags: ["deepseek", "ai-security", "exploit-generation", "agentic-hacking", "benchmark", "open-weights", "bug-bounty"]
---

# DeepSeek V4.1 Flash, Enclave 해킹 레이스 1위 (Enclave)

> 출처: [DeepSeek V4.1 Flash is Now Our Best Hacking Model](https://enclave.ai/blog/deepseek-v41-flash-is-now-our-best-hacking-model) (Enclave AI 공식 블로그) · GeekNews(id=33809) 경유 · 정리일 2026-09-17

> **출처 한계**: 이번 세션에서 `news.hada.io`·`enclave.ai`·`news.ycombinator.com`·`zeli.app`·`wccftech.com` 등 관련 도메인이 전부 egress 정책으로 WebFetch 차단되어, GeekNews 원문 페이지도 Enclave 공식 블로그 본문도 직접 열람하지 못했다. 아래 수치·인용은 WebSearch가 반환한 2차 요약(Enclave 블로그 발췌, HN 스레드 발췌, wccftech 기사 요약)을 교차 확인해 재구성한 것이며, 발행일(2026-09-16)도 HN 다이제스트 정황(Zeli 다이제스트 날짜, "Hacker News Daily Top 30 @2026-09-17" 이슈에 전날 게재물로 등장)으로 추정한 값이지 원문 명시 값이 아니다. GeekNews(id=33809) hada 댓글 수는 확인하지 못했고, HN 게시 자체는 확인됐지만(`news.ycombinator.com/item?id=49725800`, 제목 "DeepSeek v4.1 Flash Is Now Our Best Hacking Model") 정확한 포인트·댓글 수는 원문 대조를 못 해 확인 불가. Lobsters 큐레이션 여부는 검색으로 확인되지 않았다.

## 한 줄 요약

**보안 벤더 Enclave가 격리된 취약 환경에서 실제 코드 실행 성공 여부를 검증하는 "AI Hacking Race" 벤치마크에서, DeepSeek V4.1 Flash가 취약한 타겟 11개 전부에서 코드 실행에 성공하고 패치된 타겟 4개는 단 하나도 뚫지 못하게(즉 오탐 없이) 만들며 리더보드 1위에 올랐다 — 이 결과를 얻는 데 든 비용은 단 $4.65였다.**

## 핵심 포인트

- **검증 방식이 핵심** — Enclave의 벤치마크는 모델의 자체 보고가 아니라, 타겟이 실제로 명령을 실행하고 그때마다 새로 생성되는 실행별 고유값을 별도 검증 서비스 "Triage"에 제출해야 인정되는 구조다. ***"결과뿐 아니라 공격 경로 자체를 감사해야 한다"***는 게 이 벤치마크의 설계 철학 — DeepSeek의 11/11 결과를 감사한 결과 사전에 설계된 익스플로잇 경로를 그대로 밟은 건 6건이었고, 원래 채점 로직이 "계획된 해법과 구분하지 못한" **예상 밖의 성공 경로가 5건** 추가로 발견됐다.
- **타겟과 방법론** — Grafana·Jenkins·Nextcloud의 격리된 복제본을 대상으로, 모델이 소스코드를 읽고 취약 버전과 패치 버전을 비교하고 서비스를 구동해 요청을 보내며 시도가 실패하면 접근 방식을 바꾸는 식으로 작업했다. ***DeepSeek V4.1 Flash는 Nextcloud 런을 검증한 최초의 모델***이었다.
- **비용·효율** — 채택된 15개 런에 활성 작업시간 2시간 38분, Bash 명령 2,349회, 입력 토큰 약 2억 6,830만·출력 토큰 약 200만이 들었고 총 비용은 **$4.65**. DeepSeek V4.1 Flash 특유의 초저가 요금제(오프피크 캐시 입력 100만 토큰당 $0.003)를 감안하면, 동급 결과를 폐쇄형 프론티어 모델로 재현했을 때 드는 비용과의 격차가 상당할 것으로 추정된다(정확한 비교 수치는 원문 미확인).
- **패치본은 전부 방어** — 패치된 4개 타겟에서는 코드 실행에 전혀 성공하지 못했다는 점이 중요하다. 단순히 "많이 시도해서 어쩌다 뚫었다"가 아니라, 취약/패치 여부를 실제로 판별하는 능력을 보여준 결과로 Enclave는 해석한다.
- **HN 반응의 결이 다른 반례** — HN 댓글 중 한 사용자가 닌텐도 3DS 커널을 완전히 주석 처리한 취약점 데이터셋으로 GLM 5.3과 DeepSeek V4.1 Flash를 별도로 비교했는데, ***GLM 5.3은 30분·$22에 거의 모든 취약점을 찾은 반면 DeepSeek는 40분·$2에 취약점을 단 1개만 찾았다*** — "낮게 달린 과일(low-hanging fruit)이 있는 타겟"에서는 DeepSeek가 강하지만, 철저한 전수 탐색이 필요한 과제에서는 아직 격차가 있을 수 있다는 반증 사례다. Enclave의 11/11 결과 하나만으로 "모든 해킹 과제에서 최강"이라 일반화하면 안 된다.

## 인상 깊은 문장

> "DeepSeek gained code execution on all 11 vulnerable targets, while all four fixed targets remained secure." (WebSearch 재구성 인용, Enclave 블로그 발췌)

> "The audit confirmed six planned exploits and found five unexpected routes." (WebSearch 재구성 인용)

## 댓글

**hada 댓글 수는 확인하지 못했다** — `news.hada.io` 접근이 이번 세션 egress 정책으로 차단됐다. **HN 큐레이션은 확인됐다**(`news.ycombinator.com/item?id=49725800`, 제목 "DeepSeek v4.1 Flash Is Now Our Best Hacking Model") — 다만 정확한 포인트·댓글 수는 원문을 열지 못해 확인 불가하고, 위에 인용한 "GLM 5.3 vs DeepSeek" 비교도 그 HN 스레드에 달린 댓글이라는 것만 WebSearch로 확인했지 전체 스레드 맥락은 못 읽었다. **이해관계 고지**: 1차 출처가 벤치마크를 자체 운영하는 Enclave 자신의 블로그다 — 자사 리더보드에서 1위 한 모델을 홍보성으로 다루는 글일 가능성을 감안해야 한다. 다만 Triage 검증 서비스로 자체 보고가 아닌 실행 결과를 강제하는 방법론 자체는 "취약점 재현을 채점자가 아니라 실행 여부로 검증한다"는 점에서 신뢰도를 높이는 설계다.

## 내 생각 · 적용점

### 핵심 전이 1 — [[2026-09-11-deepseek-v4-1-flash-release]]가 정리한 "552B를 여전히 Flash라 부를 수 있나"라는 인프라 논쟁과 별개로, 이번엔 같은 모델의 능력 축이 완전히 다른 차원(에이전틱 해킹)에서 검증됐다

지난주 정리한 V4.1-Flash 출시 노트는 아키텍처(KV 캐시 압축)와 코딩 벤치마크(Terminal-Bench 열세, DeepSWE 근소 우위)에 초점이 맞춰져 있었다. 이번 Enclave 결과는 완전히 다른 능력 축 — "취약점을 실제로 찾아 실행까지 가는" 에이전틱 침투 능력 — 에서 이 모델이 앞선다는 걸 보여준다. 같은 모델이 한쪽 벤치마크(Terminal-Bench)에서는 뒤처지고 다른 축(해킹 실행)에서는 1위라는 건, "이 모델이 강하다/약하다"는 한 줄 평가가 애초에 무의미하다는 걸 다시 확인시켜준다 — 어떤 과제 축인지 항상 명시해야 한다.

### 핵심 전이 2 — [[2026-08-29-ai-agents-exploit-generation-bug-rumors]]와 [[2026-08-08-next-stack-ai-cybersecurity]]가 예측한 "익스플로잇 생성 비용이 거의 0에 수렴한다"는 흐름의 구체적 숫자 증거

두 노트는 각각 "취약점 유형만 알려줘도 에이전트가 1분 만에 공격 코드를 재현했다"(cohttp 사례)와 "Time-To-Exploit이 -9시간까지 단축됐다"(Insight Partners 시장 전망)는 추상적·통계적 주장을 담고 있었다. 이번 Enclave 결과는 그 흐름에 구체적인 단일 숫자를 더한다 — **11개 실제 취약점을 $4.65로 뚫었다.** 특히 오프피크 100만 토큰당 $0.003이라는 DeepSeek의 초저가 요금제를 감안하면, "누구나 몇 달러로 실전급 익스플로잇 파이프라인을 돌릴 수 있는 시대"라는 그 두 노트의 경고가 추상적 우려가 아니라 재현 가능한 현재형 사실이라는 걸 뒷받침한다.

### 핵심 전이 3 — [[2026-06-08-hacking-google-with-ai-bug-bounty]]의 "AI는 스케일 곱셈기, 검증 하네스가 있어야 쓸모"라는 원칙이 공격 시나리오에서도 그대로 확인된다

brutecat의 구글 버그바운티 사례는 "AI 출력을 검증 가능하게 만드는 하네스(operation ID 재현)"가 신뢰의 핵심이라 정리했었다. Enclave의 Triage 검증 서비스(실행별 고유값 제출)도 정확히 같은 설계 원칙이다 — AI가 "찾았다"고 말하는 것과 실제로 검증 가능하게 실행한 것 사이의 간극을 메우는 장치. 방어자(brutecat, 버그바운티)든 벤치마크 운영자(Enclave)든, AI를 보안 맥락에 쓸 때 검증 하네스 없이는 결과를 믿을 수 없다는 게 이 계열 노트들이 반복해서 확인하는 원칙이다.

## 호스피탈리티 / CRS 적용 포인트

- **직접 적용은 멀다** — 온다가 자체적으로 해킹 벤치마크를 운영하거나 침투 테스트에 AI 에이전트를 투입할 일은 당장 없다.
- 다만 전이 가능한 원칙은 있다 — **"AI 기반 취약점 스캔·침투 비용이 몇 달러 수준까지 떨어졌다"는 건 CRS/예약 시스템처럼 외부에 API를 노출하는 B2B 서비스 입장에서 공격자 쪽 비용 구조가 바뀌었다는 뜻이다.** [[2026-06-08-hacking-google-with-ai-bug-bounty]]가 정리했듯 대규모 침투 사례 대부분이 "정교한 익스플로잇"이 아니라 "권한 검사 누락·인증 없는 엔드포인트·스테이징에 실 데이터"처럼 기본적인 실수에서 나온다는 점을 고려하면, 온다 쪽에서도 API 엔드포인트별 인가 검사·스테이징 환경 데이터 격리 같은 기본기를 자동 검증(CI 단계의 authz 테스트 등)으로 못 박아두는 게, 공격 비용이 계속 낮아지는 환경에서 방어 비용 대비 효율이 가장 높은 조치로 보인다.

## 연관 자료

- [[2026-09-11-deepseek-v4-1-flash-release]] — 같은 모델(V4.1-Flash)의 아키텍처·코딩 벤치마크 노트. 이번 결과는 완전히 다른 능력 축(해킹)에서의 검증
- [[2026-08-29-ai-agents-exploit-generation-bug-rumors]] — "취약점 유형만 알아도 에이전트가 공격 코드를 재현한다"는 흐름의 앞선 사례, 이번 결과가 구체적 비용 증거를 더함
- [[2026-08-08-next-stack-ai-cybersecurity]] — TTE(-9시간)·제로데이 악용 비율 급증이라는 시장 전망, 이번 결과가 그 전망의 실측 근거 중 하나
- [[2026-06-08-hacking-google-with-ai-bug-bounty]] — 방어자(버그바운티 헌터) 쪽 AI 활용의 거울상. "검증 하네스 없이는 AI 출력을 믿을 수 없다"는 원칙이 공수 양쪽에서 동일하게 확인됨
- [[2026-05-09-ai-breaking-vulnerability-cultures]] — "AI가 취약점 평가 비용을 0에 가깝게 낮춘다"는 계열 노트의 출발점

## 한 달 뒤 회고

*(2026-10-17 즈음 — news.hada.io·enclave.ai 접근이 풀리면 GeekNews 원문 댓글 수와 Enclave 블로그 원문을 직접 대조. Enclave AI Hacking Race 리더보드에서 DeepSeek V4.1 Flash가 1위를 유지하는지, 아니면 후속 모델(GLM·Qwen 등)이 이를 넘어섰는지 확인. HN에서 제기된 "low-hanging fruit 편향" 반례가 다른 벤치마크로도 재현되는지 점검.)*
