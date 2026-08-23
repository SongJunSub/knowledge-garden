---
title: "Anthropic, Claude Code의 추론 노력 수준 축소를 A/B 테스트하는 것으로 보임 (X @argofowl 제보, 원문 미확인) — 'high를 골라도 서버가 low로 처리한다'는 주장이 사실이라면, 이건 6월 Fable 가드레일 사과 사건과 판박이다. 조용한 저하를 changelog 없이 실험으로 굴리는 패턴이 반복된다는 뜻"
source_title: "Anthropic appears to be A/B testing reduced effort levels in Claude Code"
source_url: "https://x.com/argofowl/status/2091145834968850821"
source_name: "X(@argofowl) · Hacker News 큐레이션"
referrer_url: "https://news.hada.io/topic?id=32778"
published_at: "2026-08-22"
summarized_at: "2026-08-23"
category: "ai"
tags: ["anthropic", "claude-code", "reasoning-effort", "ab-test", "transparency", "trust", "silent-downgrade"]
---

# Anthropic, Claude Code의 추론 노력 수준 축소를 A/B 테스트하는 것으로 보임

> 출처: [X @argofowl 스레드](https://x.com/argofowl/status/2091145834968850821) (원문, X 접근 차단으로 검색 스니펫 경유) · 정리일 2026-08-23

## 한 줄 요약

**X 사용자 @argofowl이 "Claude Code 2.1.237부터 `effort: high`를 요청해도 서버가 100점 척도의 10점(기존 low가 쓰던 정확한 수치)으로 처리한다"고 제보했고, 후속 포스트에서 "앱이 아니라 서버 측 문제 — Anthropic이 Claude Code 2.1.236 이상 클라이언트의 Fable 5 세션만 골라 effort 축소 실험에 등록시키고 있고(구버전·Opus 5는 제외), 아마 A/B 테스트라 모두가 겪지는 않는다"고 정정했다. changelog에 이 변경이 언급되지 않았다는 게 논란의 핵심이다. 단, 이 노트가 확인할 수 있었던 1차 출처는 검색 스니펫뿐이고 최초 제보자는 사실상 개인 1인이라 — 정직하게 n=1 수준의 미검증 주장으로 다룬다.**

## 핵심 포인트

- **핵심 주장** — Claude Code 2.1.237부터 `effort: "high"`를 요청해도 실제로는 100점 척도에서 **10점**으로 처리되는데, 이는 기존에 `"low"`가 매핑되던 정확한 수치라는 것.
- **서버사이드 실험이라는 정정** — 앱(클라이언트) 버그가 아니라 **Anthropic 서버 측 실험**이며, **Claude Code 2.1.236 이상 클라이언트로 시작된 Fable 5 세션만** 이 실험 코호트에 등록되는 것으로 보인다는 추정. **구버전 클라이언트와 Opus 5는 영향받지 않는다.**
- **A/B 테스트 성격** — 전원이 아니라 일부 세션에서만 발생해 ***"so not everyone will see it"*** — 체감 여부가 사용자마다 갈리는 이유.
- **미공지** — 이 effort 스케일 변경은 **공식 changelog에 언급되지 않았다**는 것이 제보자 주장의 핵심 불만.
- **정황상 인접한 별개 사안** — 같은 2.1.236 릴리스 시점, Fable 5 세션에서만 발생한 GitHub 이슈 #88364(2026-08-20)가 별도로 존재한다. 이건 클라이언트가 자동 삽입하는 배칭 유도 문구가 `reasoning_extraction` 안전장치를 오작동시켜 거절률이 기준선 1,000건당 0.55건에서 특정 시간대 최대 30.6%까지 치솟았다는 정량적 리포트다(대조군 포함, 통계적으로 상세히 문서화됨). **"effort 축소"와 동일 사안이라는 확증은 없지만, 같은 릴리스·같은 모델 대상으로 동시에 이상 동작이 보고됐다는 정황은 있다.**
- **"10일간 토큰 비용 $400" 불만** — 이 세션에서 정확히 일치하는 사례를 검색으로 찾지 못했다 — **확인 불가로 남긴다.**

## 인상 깊은 문장

> "if fable felt dumber this week, it's not you ❗❗❗ since 2.1.237 the model reads "high" effort as 10 out of 100, the exact number "low" used to be and the changelog doesn't say a word"
> (이번 주 fable이 멍청해진 느낌이었다면, 착각이 아니다. 2.1.237부터 모델은 'high' 노력을 100점 만점에 10점으로 처리하는데, 이는 예전에 'low'가 쓰던 바로 그 수치다. 그리고 changelog에는 한마디도 없다.)

> "update: it's server-side, not the app. anthropic enrols fable 5 sessions on claude code 2.1.236+ into an experiment that shrinks the effort scale, older versions and opus 5 are left alone. probably an a/b test, so not everyone will see it"
> (업데이트: 앱 문제가 아니라 서버 측 문제다. Anthropic은 Claude Code 2.1.236 이상에서 실행된 Fable 5 세션을 effort 척도를 축소하는 실험에 등록시키고 있으며, 구버전과 Opus 5는 건드리지 않는다. 아마도 A/B 테스트라서 모든 사람이 겪는 건 아닐 것이다.)

## 댓글

**GeekNews 원문 페이지는 이번 세션의 네트워크 egress 정책상 접근 불가**(`news.hada.io` 차단) — hada 댓글 수·논조는 확인하지 못했다. HN에 "Anthropic appears to be A/B testing reduced effort levels in Claude Code"(`item?id=49401549`) 스레드가 큐레이션돼 있음을 검색으로 확인했으나, HN 도메인 자체도 차단돼 **포인트 수·댓글 내용은 확인 불가**. **X 원문도 직접 열람하지 못해 검색엔진 스니펫으로만 인용을 재구성했다** — 원문 전체 스레드·답글, 작성자 실명/소속은 확인 못했다. 무엇보다 **이 이슈의 최초 발견 자체가 개인 X 사용자 1인의 제보이고, "effort 10/100 매핑"이라는 구체 수치를 독립적으로 재현·검증한 제3자 보고는 확인하지 못했다** — GitHub에 같은 시기 Fable 5 이상 동작을 보고하는 중복 이슈가 다수(#88254, #88139, #88182, #88215, #88269, #88319, #88336) 있어 "뭔가 이상하다"는 공감대는 폭넓지만, 그것이 이 제보의 특정 수치를 뒷받침하는 것은 아니다. **n=1에 가까운 미검증 주장으로 다뤄야 한다.**

## 내 생각 · 적용점

### 핵심 전이 — 6월 Fable 가드레일 사과 사건과 같은 패턴이 반복 의심된다

[[2026-06-08-anthropic-apologizes-fable-guardrails]]에서 정리했듯, Anthropic은 이미 한 차례 ***"증류 시도로 판단한 요청에 대해 사용자 통지 없이 응답을 변경·저하시키던 방식"***을 공식 사과하고, ***"앞으로 제한 발동 시 명시적으로 전환 모델을 표시하겠다"***고 약속한 전례가 있다. 이번 제보가 사실이라면, **명시적 통지 없이 서버 측에서 조용히 성능을 낮추는 패턴이 "가드레일"에서 "reasoning effort"라는 다른 축으로 재발**한 셈이다 — A/B 테스트 자체는 정상적인 제품 개발 관행이지만, **사용자가 명시적으로 선택한 파라미터(`effort: high`)의 의미를 사전 고지 없이 재정의**하는 건 6월 사건이 사과했던 바로 그 문제(통제권·투명성)와 같은 결이다. [[2026-07-06-anthropic-losing-developer-goodwill]]가 지적한 ***"명시적 공지 없이 시행됐다가 소비자 반발로 롤백"***된 에이전트 SDK 이중 청구 사건과 겹쳐 보면, **"조용히 바꾸고, 들키면 대응한다"는 패턴이 가격·가드레일·이제는 추론 노력까지 세 번째 축에서 반복 의심되고 있다**는 게 이번 노트가 남길 수 있는 가장 정직한 결론이다. 다만 이번 건은 **6월 사건처럼 Anthropic이 공식 인정·사과한 게 아니라 여전히 개인 제보 단계**라는 차이는 분명히 해둔다.

## 호스피탈리티 / CRS 적용 포인트

**간접 적용** — 온다가 Claude Code/Claude API에 의존하는 워크플로를 운영한다면, 이 제보(미검증이더라도)는 **"모델 파라미터의 실제 동작이 문서와 다를 수 있다"는 가능성을 상시 점검 대상에 넣어야 한다**는 원칙을 재확인시킨다. 특히 요금·재고 로직처럼 일관된 추론 품질이 중요한 워크로드는, **버전·모델 조합별로 출력 품질을 주기적으로 샘플 검증**해 벤더 쪽 조용한 실험이 있어도 조기에 감지할 수 있는 자체 회귀 테스트를 갖추는 게, 이런 벤더발 불확실성에 대한 유일한 방어선이다.

## 연관 자료

- [[2026-06-08-anthropic-apologizes-fable-guardrails]] — 통지 없는 조용한 저하를 공식 사과한 선행 사건, 이번 제보가 사실이라면 같은 패턴의 재발
- [[2026-07-06-anthropic-losing-developer-goodwill]] — 공지 없이 시행됐다가 반발로 롤백된 이중 청구 사건, "조용히 바꾼다"는 신뢰 문제의 세 번째 사례

## 한 달 뒤 회고
*(2026-09-23 즈음 — ①Anthropic이 이번 건에 공식 대응·인정했는지 ②제보 수치("high=10/100")가 제3자에 의해 독립적으로 재현·검증됐는지 ③이번엔 확인 못한 hada·HN 반응을 나중에라도 확인할 수 있었는지 기록.)*
