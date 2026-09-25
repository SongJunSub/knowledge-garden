---
title: "Claude.ai를 2주 만에 3배 빠르게 만든 방법 (Anthropic 공식 엔지니어링 블로그) — Claude가 병목을 찾고 벤치마크를 짜고 배포까지 확인했다, 사람은 목표와 승인만"
source_title: "How we made claude.ai 3x faster in two weeks"
source_url: "https://claude.dev/blog/how-we-made-claude-ai-faster/"
source_name: "claude.dev (Anthropic 엔지니어링 블로그, Help Net Security·iPhone in Canada 등 복수 매체 교차보도)"
referrer_url: "https://news.hada.io/topic?id=34206"
published_at: "2026-09-24"
summarized_at: "2026-09-25"
category: "ai"
tags: ["anthropic", "claude-ai", "performance-engineering", "claude-tag", "benchmarking", "self-improvement", "developer-experience"]
---

# Claude.ai를 2주 만에 3배 빠르게 만든 방법 (Anthropic 공식 엔지니어링 블로그) — Claude가 병목을 찾고 벤치마크를 짜고 배포까지 확인했다, 사람은 목표와 승인만

> 출처: [How we made claude.ai 3x faster in two weeks](https://claude.dev/blog/how-we-made-claude-ai-faster/) (Anthropic 엔지니어링 블로그) · 정리일 2026-09-25

## 한 줄 요약

**Anthropic 엔지니어들이 8월 2주간 claude.ai 웹·데스크톱 앱의 사용자 활동 95%를 차지하는 핵심 흐름(실행·대화 시작·기존 대화 로딩·메시지 전송)을 대상으로 3,000개 넘는 변경을 병합해 약 3배 빠르게 만들었다. 75백분위 기준 "열어서 입력 가능"해지는 시간이 3.1초→0.55초로, Claude Code 세션 시작은 0.8초→0.3초로, Claude Cowork 클라우드 세션의 메시지 전송은 928ms→48ms(약 19배)로 줄었다. 핵심은 사람이 아니라 Claude(Opus 5.5급 내부 연구 모델)가 병목 탐색부터 벤치마크 작성, 코드 수정, 배포 후 확인까지 맡고, 하나의 Slack 채널에서 150개 넘는 작업 스레드를 병렬로 돌렸다는 점 — 사람은 목표 설정과 판단·승인만 담당했다.**

## 핵심 포인트

- **실제 체감 지표만 최적화 대상으로 삼았다** — CPU 명령어 수, React 커밋, JS 함수 호출, 스타일 재계산, DOM 변경 같은 저수준 벤치마크를 만들었지만, ***이 벤치마크들이 실제 사용자 체감 지연 시간과 실제로 연결되는지 검증한 뒤에야*** 최적화 대상으로 채택했다. 랩 환경에서의 개선이 실사용 개선으로 이어지지 않는 흔한 함정을 이렇게 피했다.
- **3,000개 이상의 변경, 롤백 0건** — 두 주 동안 병합된 변경이 3,000건을 넘었는데도 고객 대면 장애나 롤백이 하나도 없었다고 밝혔다. ***이는 회사의 공식 발표이므로 검증되지 않은 자기 보고 수치***라는 점을 감안해야 한다.
- **Claude Tag가 실행 인프라였다** — 팀 전체가 하나의 Slack 채널에서 150개 넘는 작업 스레드를 병렬로 운영했는데, 이는 [[2026-06-08-claude-tag-slack]]에서 정리했던 "Slack 팀원으로서의 Claude"가 실제 대규모 성능 엔지니어링 프로젝트에 투입된 구체 사례다. Claude가 병목을 찾아 벤치마크를 작성하고, PR을 열고, 배포를 지켜보는 동안 ***사람은 목표를 정하고 판단하고 각 변경을 승인***했다.
- **각 지표의 개선 폭이 균일하지 않다** — 열어서 입력 가능한 시간(75백분위) 3.1초→0.55초(약 5.6배), Claude Code 세션 시작 0.8초→0.3초(약 2.7배), Claude Cowork 메시지 전송 928ms→48ms(약 19배)로 흐름마다 개선 폭이 크게 다르다. "3배"라는 헤드라인 수치는 이 중 대표값 하나를 묶어 부른 것으로 보이며, 원문에 명시된 "약 3분의 1로 줄어든 CPU 사용량(긴 응답 표시 시)"과 함께 지표별로 뜯어봐야 실제 그림이 보인다.

## 인상 깊은 문장

> "Anthropic engineers made claude.ai and the Claude desktop app roughly three times faster during a two-week sprint in August, with Claude finding the bottlenecks and writing the fixes." — Help Net Security

> "At the 75th percentile, a fresh Claude.ai load reaching a typeable page fell from 3.1 seconds to 0.55 seconds... Sending a message in a Claude Cowork cloud session became 19× faster, falling from 928 milliseconds to 48 milliseconds." — iPhone in Canada

## 댓글

GeekNews 원문(hada, id=34206)은 이 세션의 egress 프록시에서 차단됐다. Anthropic 공식 블로그(claude.dev) 원문도 이번 세션에서 직접 WebFetch가 되지 않아, Help Net Security·iPhone in Canada·analyticsindiamag·ciol·daily.dev·explainx.ai 등 다수의 2차 보도를 WebSearch로 교차 확인해 수치를 재구성했다(각 매체가 인용한 세부 수치는 서로 일치했다). ***이 글은 Anthropic 자사 블로그가 원 출처이므로 "3,000개 변경에 롤백 0건", "150개 병렬 스레드" 같은 성과 수치는 검증되지 않은 자기 보고***라는 점을 분명히 해둔다 — 실제 Claude.ai 응답 속도가 사용자 체감에서도 3배로 느껴지는지는 이 발표만으로는 확인할 수 없다. hada 댓글 수·큐레이션 클러스터도 이번 조사로는 확인하지 못했다.

## 내 생각 · 적용점

### 핵심 전이 1 — Claude Tag가 "제품 발표"에서 "실전 프로젝트 인프라"로

[[2026-06-08-claude-tag-slack]]을 정리할 때 남겼던 의문 중 하나가 "제품팀 코드의 65%가 Claude Tag로 작성된다"는 벤더 자기보고 수치를 실제 프로젝트에서 확인할 수 있을지였다. 이번 글은 바로 그 실물이다 — ***150개 넘는 작업 스레드를 하나의 Slack 채널에서 병렬로 운영***하는 구체적 사용 방식이 나왔다. "지속적·비동기 팀원"이라는 추상적 패러다임이, 실제로는 "사람이 승인 버튼만 누르고 수백 개 스레드가 동시에 돌아가는" 운영 형태로 구현된다는 걸 처음으로 구체적 숫자와 함께 확인했다.

### 핵심 전이 2 — 자기 자신을 개선하는 AI 루프의 또 다른 실사례

[[2026-08-06-discovery-loop-jeff-dean-startup]]이 정리한 회사의 미션은 ***"실험을 제안·실행·평가·학습하는 전체 루프를 수천 개 병렬로 자동화해, 적은 인원이 지금의 대규모 팀보다 빠르고 높은 품질로 연구·엔지니어링을 하겠다"***는 것이었고, 그 회사의 첫 타깃도 "자기 자신의 ML 기술스택"이었다. Anthropic의 이번 사례는 그 패턴이 별도 스타트업을 차리지 않고도 기존 대기업 내부에서 이미 작동한다는 증거다 — ***Claude가 Claude.ai 자신을 빠르게 만드는 자기지시적 개선 루프***가 실험이 아니라 이미 2주짜리 실전 프로젝트로 완료됐다.

### 핵심 전이 3 — "실제 사용자 지표만 최적화하라"는 원칙은 병목 엔지니어링의 보편 문법이다

[[2026-09-23-linear-ai-coding-ci-bottleneck]]이 Linear의 CI 병목 해소 사례에서 짚은 것도 같은 원칙이었다 — 테스트가 거의 4배로 늘어난 상황에서 tsgo 전환·샤딩 확대로 "실제 PR 대기 시간"을 줄이는 데 집중했다. 이번 Anthropic 사례가 다른 점은 ***"저수준 벤치마크(CPU 명령어 수·DOM 변경)가 실제 사용자 지연과 상관관계가 있는지부터 검증한 뒤에 그 벤치마크를 최적화 대상으로 삼았다"***는 한 단계 더 엄격한 절차다. 측정하기 쉬운 지표를 만드는 것과, 그 지표가 진짜 체감 속도와 연결되는지 확인하는 것은 다른 작업이라는 걸 명시적으로 짚었다는 점이 이 사례의 진짜 교훈이다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용 가능성이 큰 글이다.** 온다 CRS의 검색→요금계산→예약확정 흐름도 claude.ai의 "실행→대화시작→로딩→전송" 흐름과 구조적으로 같다 — ***사용자 활동의 대부분을 차지하는 소수의 핵심 경로***가 있고, 그 경로의 체감 지연이 곧 제품 인상을 결정한다. 여기서 가져올 원칙 두 가지: ① 저수준 성능 지표(쿼리 수, N+1, 캐시 히트율)를 개선 대상으로 삼기 전에 그 지표가 실제 예약 완료 시간·체감 지연과 상관관계가 있는지부터 검증할 것 ② 성능 개선 목표를 평균이 아니라 75백분위 같은 꼬리 지표로 설정할 것 — 평균은 좋아 보여도 상위 25% 사용자(성수기 다건 예약 등 무거운 케이스)의 체감은 그대로일 수 있다.

## 연관 자료
- [[2026-06-08-claude-tag-slack]] — 이번 프로젝트의 실행 인프라였던 Slack 기반 Claude Tag의 원 발표
- [[2026-08-06-discovery-loop-jeff-dean-startup]] — "자기 자신을 개선하는 AI 연구 루프"라는 같은 미션의 별도 회사 사례
- [[2026-09-23-linear-ai-coding-ci-bottleneck]] — "실제 사용자 지표만 최적화하라"는 같은 원칙의 CI 버전

## 한 달 뒤 회고
*(2026-10-25 즈음 — Anthropic이 이후에도 같은 방식(Claude Tag 대규모 병렬 스레드)으로 성능 스프린트를 반복했는지, "3,000개 변경·롤백 0건" 수치에 대한 제3자 검증이나 반박이 나왔는지, 내가 실제 Claude Code·claude.ai 사용에서 체감 속도 개선을 느꼈는지 기록. CRS 예약 흐름 성능 개선에 "75백분위 꼬리 지표" 원칙을 실제로 적용해봤는지도 점검.)*
