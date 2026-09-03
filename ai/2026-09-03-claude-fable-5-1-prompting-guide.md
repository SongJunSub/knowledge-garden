---
title: "Claude Fable 5.1 프롬프팅 가이드 — effort가 이제 지능·지연·비용을 조절하는 첫 번째 다이얼이라, 기존 5.0 설정을 그대로 옮기면 안 된다"
source_title: "Prompting Claude Fable 5.1"
source_url: "https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/prompting-claude-fable-5-1"
source_name: "platform.claude.com"
referrer_url: "https://news.hada.io/topic?id=33175"
published_at: "2026-09-01"
summarized_at: "2026-09-03"
category: "ai"
tags: ["claude-fable", "prompt-engineering", "effort", "model-migration", "claude-usage"]
---

# Claude Fable 5.1 프롬프팅 가이드 — effort가 이제 지능·지연·비용을 조절하는 첫 번째 다이얼이라, 기존 5.0 설정을 그대로 옮기면 안 된다

> 출처: [Prompting Claude Fable 5.1](https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/prompting-claude-fable-5-1) (Claude Platform Docs, Anthropic 공식) · GeekNews(id=33175) 경유 · 정리일 2026-09-03

## 한 줄 요약

**기존 Claude Fable 5 프롬프트는 Fable 5.1에서도 대부분 작동은 하지만, effort·진행 업데이트·도구 호출·대화 이력·출력 형식이 모두 달라졌으므로 "설정을 그대로 교체"하지 말고 다시 평가하라는 것이 핵심 조언. 기본값 `high`에서 시작해 `low`·`medium`·`xhigh`·`max`를 작업별로 직접 비교해야 하고, `medium`이면 더 낮은 비용으로 Fable 5와 비슷한 결과를 낼 수 있다.**

## 핵심 포인트

- **effort가 1차 제어 변수** — Fable 5.1에서 지능·지연·비용의 트레이드오프를 조절하는 가장 중요한 다이얼이 `effort`다. 기본값은 `high`.
- **작업별로 직접 평가하라** — `low`, `medium`, `xhigh`, `max`를 자신의 평가(eval) 기준으로 작업별 비교해야 한다. 긴 에이전트·코딩 작업처럼 능력이 민감한 경우 `xhigh`·`max`로 올리고, 일상적이거나 지연에 민감한 작업은 평가에서 품질이 유지되는 선에서 `medium`·`low`로 낮춘다.
- **`medium`은 Fable 5 대체재** — 평가에서 품질이 유지된다면, `medium`이 더 낮은 비용으로 Fable 5와 대략 비슷한 결과를 낸다.
- **대화 중 effort 변경 가능** — 메시지별 `output_config`로 대화 도중에도 effort를 바꿀 수 있고, 이때 프롬프트 캐시가 보존된다.
- **긴 에이전트 작업에는 명시적 설계 필요** — 진행 상황을 명시적으로 요청하고, 서로 의존하지 않는 도구 호출을 한 턴에 묶어 대기 시간·토큰 사용을 줄이는 하네스 설계가 요구된다.

## 인상 깊은 문장

> "Effort is the primary control for trading off intelligence, latency, and cost on Claude Fable 5.1."

> "Start at the default effort level, high, then test the other levels (low, medium, xhigh, and max) against your own evals."

## 댓글

news.hada.io와 platform.claude.com(문서 자체)은 WebFetch가 시도되지 않았고 대신 WebSearch로 공식 문서 스니펫을 직접 확보했다 — 검색 결과가 Anthropic 공식 Platform Docs를 그대로 인용하고 있어 신뢰도는 높은 편이나, 문서 페이지 전문을 직접 열람하지는 못했다. GeekNews 댓글 수·HN/Lobsters 큐레이션 여부는 news.hada.io 접속 차단으로 확인 불가.

## 내 생각 · 적용점

### 핵심 전이 1 — "설정을 그대로 옮기지 말라"는 원칙은 [[2026-09-02-aws-claude-code-token-economy-part2]]의 캐시 파괴 경고와 정확히 같은 함정

AWS 노트가 "모델 전환·업그레이드 한 번이 대규모 세션 전체를 정가로 재프리필시킨다"고 경고했는데, 이 가이드는 그 위에 한 겹을 더 얹는다 — **모델을 바꾸면 캐시만 깨지는 게 아니라 effort 기본값의 의미 자체가 달라진다.** 즉 모델 업그레이드는 (1) 캐시 무효화 비용 + (2) 재평가 없이 옛 effort 설정을 쓰면 품질/비용이 예상과 달라지는 위험, 두 겹의 비용을 동시에 진다.

### 핵심 전이 2 — effort A/B 테스트 논쟁과 만나는 지점

[[2026-08-23-claude-code-reasoning-effort-ab-test]]가 "서버가 몰래 effort를 낮춘다"는 의혹을 다뤘는데, 이 공식 가이드는 정반대로 "effort는 사용자가 명시적으로 골라야 하는 1차 변수"라고 못박는다. 두 노트를 나란히 두면, effort가 투명하게 통제 가능한 다이얼이어야 한다는 사용자 기대와, 서버 쪽 실험 의혹 사이의 긴장이 뚜렷해진다.

### 핵심 전이 3 — "긴 에이전트 작업엔 명시적 진행 요청과 독립 도구 호출 배치"는 이 가든 자체의 다이제스트 파이프라인에도 그대로 해당

이 세션(19건의 기사를 조사·작성·커밋하는 배치 작업)이 정확히 그 "긴 에이전트 작업" 사례다 — 서로 의존하지 않는 WebSearch 호출을 한 턴에 묶어 실행한 것이 이 가이드가 권하는 패턴과 일치한다.

## 호스피탈리티 / CRS 적용 포인트

**이 글은 클로드 사용 최적화에 직접 적용된다.** 온다에서 Fable 5.1(또는 이후 모델)로 전환할 계획이 있다면, (1) 기존 5.0 프롬프트·effort 설정을 그대로 복사하지 말고 실제 업무 작업(CS 응답 초안, 코드 리뷰, 데이터 분석 등)으로 `low`~`max`를 직접 비교하는 미니 평가셋을 만들 것, (2) `medium`이 비용 절감 후보인지 먼저 확인할 것, (3) 장시간 배치 작업에는 진행 상황 명시 요청과 독립 도구 호출 배치를 하네스 설계에 반영할 것 — 세 가지가 바로 실행 가능한 체크리스트다.

## 연관 자료
- [[2026-09-02-aws-claude-code-token-economy-part2]] — *모델 전환이 캐시를 깨뜨린다는 경고, 이 노트의 "effort 재평가 필요"와 겹치는 위험*
- [[2026-08-23-claude-code-reasoning-effort-ab-test]] — *effort 투명성에 대한 정반대 우려(서버가 몰래 낮춘다는 의혹)*
- [[2026-08-16-maximizing-claude-code-sessions]] — *세션 가치 극대화라는 같은 목적의 이전 노트*
- [[2026-09-03-claude-code-week34-changelog]] — *같은 주 Claude Code 자체의 변경사항*

## 한 달 뒤 회고
*(2026-10-03 즈음 — 온다 업무에서 Fable 5.1 effort 레벨별 미니 평가셋을 실제로 만들어봤는지, `medium`으로 비용을 낮춰도 품질이 유지되는 작업을 찾았는지 기록.)*
