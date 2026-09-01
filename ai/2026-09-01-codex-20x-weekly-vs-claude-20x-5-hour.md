---
title: "Codex의 20X는 주간 사용량도 실제 20배, Claude는 5시간 한도만 20배 (Tibo) — 같은 '20X' 라벨이 가리키는 측정 축이 서로 다르다는 지적"
source_title: "Tibo on X: clarification on Codex Pro 20X vs Claude 20X"
source_url: "https://x.com/thsottiaux/status/2094254532020818191"
source_name: "X (@thsottiaux, Tibo — OpenAI Codex/ChatGPT 담당)"
referrer_url: "https://news.hada.io/topic?id=33106"
published_at: "2026-08-31 전후 (추정 — 트윗 정확한 게시일 확인 불가)"
summarized_at: "2026-09-01"
category: "ai"
tags: ["claude-code", "codex", "usage-limit", "pricing", "openai", "anthropic", "subscription"]
---

# Codex의 20X는 주간 사용량도 실제 20배, Claude는 5시간 한도만 20배 (Tibo)

> 출처: [Tibo (@thsottiaux) 트윗](https://x.com/thsottiaux/status/2094254532020818191) (X · GeekNews 경유) · 정리일 2026-09-01
> **자기 위치 밝힘**: 이 노트를 쓰는 나 자신이 Claude이고, 이 글은 Claude 요금제 구조에 대한 경쟁사 관계자의 비교 발언을 다룬다. 제품 우열 판단은 하지 않고 구조와 주장만 정리한다.
> **출처 한계**: `news.hada.io`와 `x.com` 모두 이번 세션 network egress 정책으로 접근이 차단돼 원문 트윗·hada 댓글을 직접 열지 못했다. 아래 내용은 WebSearch로 확보한 트윗 인용("For clarity, while both are called 20X, in Codex they apply specifically to weekly usage limits...")과 이를 재인용한 X 게시물(Chubby, kimmonismus 계정), 그리고 Slack 발췌 5줄을 종합한 것이다. 원 트윗의 전체 스레드·후속 답글은 확인하지 못했다.

## 한 줄 요약

**OpenAI의 Codex/ChatGPT 담당 Tibo가, Codex와 Claude 양쪽 다 요금제에 "20X"라는 라벨을 쓰지만 그 20배가 측정하는 축이 서로 다르다고 설명했다 — Codex Pro 20X는 Plus 대비 주간 사용량 한도가 정확히 20배이고 5시간 단위 제한 자체가 없는 반면, Claude는 $200 요금제가 Pro 대비 20배라고 표시하지만 그 20배는 5시간 한도에만 적용되고 주간 한도는 $100 요금제의 약 2배 수준에 그친다는 지적이다.**

## 핵심 포인트

- Tibo는 두 서비스가 쓰는 ***"20X"의 기준이 서로 다르다***고 설명한다 — 같은 숫자 라벨이 다른 걸 측정한다는 지적.
- **Codex 쪽**: Codex Pro 20X는 Plus보다 실제 토큰을 항상 20배 제공한다는 뜻이 아니라, ***주간 사용량 한도가 거의 정확히 20배***라는 의미다. Codex의 Pro $100과 Pro $200 요금제에는 현재 ***5시간 단위 사용량 제한이 없으며***, 주간 한도를 중심으로 사용량이 관리된다.
- **Claude 쪽**: Claude는 $100 요금제를 Pro의 5배, $200 요금제를 20배로 표시하지만, ***이 20배는 5시간 한도에만 적용***되고 ***주간 한도는 $100 요금제의 약 2배***에 그친다. 즉 5시간 단위로 보면 20배지만, 일주일 단위로 누적해서 보면 그 절반 이하 수준의 배수만 보장된다는 뜻으로 읽힌다.
- (다른 X 계정의 재인용) "$200 Max 플랜은 5시간 창 안에서 20배의 Pro 사용량을 제공하지만, 주간 한도는 $100 플랜의 약 2배에 불과하다"는 요약이 별도로 확인된다 — Tibo의 원 주장과 같은 방향.
- Slack 발췌 마지막 문장("따라서 $100에서 $2…")이 말줄임표로 잘려 있어, 이 지적이 이어지는 구체적 결론(예: 실사용자 관점에서 어느 쪽이 유리한지에 대한 Tibo의 직접적 논평)은 **확인 불가.**

## 인상 깊은 문장

> "For clarity, while both are called 20X, in Codex they apply specifically to weekly usage limits. And we also don't have 5h limits for both Pro plans. The Pro 20X is quite precisely 20X the usage of the Plus subscription, so it does exactly what it says on the tin." — Tibo (@thsottiaux), WebSearch로 확인된 인용

## 댓글

**확인 불가.** hada.io 접근이 이번 세션 내내 차단돼 GeekNews 댓글 수·큐레이션 여부를 전혀 확인하지 못했다. Slack 반응으로는 "sadblob" 이모지 4개가 달려 있었다는 것만 확인되는데, 이게 Claude 요금제 구조에 대한 실망을 뜻하는지 Codex 쪽 비교 자체에 대한 반응인지는 감으로 짐작할 뿐 확정할 수 없다. **읽을 때 감안**: 이 발언은 경쟁사(OpenAI Codex) 담당자가 자사 요금제를 유리하게, 상대 요금제 구조의 허점을 짚는 방식으로 설명한 것이라 — 사실관계(숫자) 자체는 검증 가능하지만, 어떤 지표를 부각하고 어떤 지표를 배경에 두는지에는 화자의 이해관계가 반영돼 있을 수 있다.

## 내 생각 · 적용점

이 지적은 [[2026-08-19-claude-code-weekly-limit-extension]]에서 이미 다뤘던 "한도라는 장치의 성격"과 정확히 맞닿아 있다. 그 노트에서 짚었던 것 — Claude의 주간 한도 50% 상향 연장 공지가 "수요 급증으로 용량이 빠듯할 수 있다"고 밝히면서도 동시에 한도를 올린다는, 언뜻 모순돼 보이는 신호를 냈다는 점 — 을 이 트윗과 나란히 놓으면 더 선명해진다. **"5시간 한도"와 "주간 한도"는 서로 다른 자원 축이고, 마케팅상의 배수(20X)는 그중 하나(더 유리해 보이는 축)만 골라 표시할 유인이 있다.** Tibo의 지적이 정확하다면, Claude의 "20배" 라벨은 소비자가 실제로 체감하는 총 사용량(주간 기준)보다 순간 최대치(5시간 기준)를 부각한 셈이다.

[[2026-08-19-claude-code-weekly-limit-extension]]에서 세웠던 규칙 — ***"각 단가·한도에 만료일을 적는다"*** — 에 이번 사례로 하나를 더 보탤 수 있다: **"각 한도 배수(20X 같은 라벨)에 그게 측정하는 시간 단위를 반드시 함께 적는다."** 배수만 보고 요금제를 비교하면 안 되고, 그 배수가 5시간 창인지 주간 총량인지를 먼저 확인해야 실제 비교가 가능하다. 이건 [[2026-05-18-ai-subscription-pricing-truth]]가 짚었던 "표시가와 실제 API 환산 비용의 괴리"와 같은 계열의 경고다 — 표시되는 숫자(구독가, 배수)와 실제 소비 가능한 자원 사이에는 항상 "무엇을 기준으로 잰 숫자인가"라는 해석의 여지가 남는다.

## 호스피탈리티 / CRS 적용 포인트

CRS가 AI 코딩 도구(Claude Code, Codex 등)를 팀 단위로 구독할 때 이 사례가 주는 실무 교훈은 명확하다: **"20배", "5배" 같은 배수 마케팅 문구를 계약·예산 근거로 쓰지 않는다.** 그 배수가 5시간 순간 최대치인지 주간 누적 총량인지에 따라 실제 팀 생산성에 미치는 영향이 완전히 다르다 — 짧고 집중적인 스프린트 작업이 많은 팀이면 5시간 한도가 중요하고, 하루 종일 꾸준히 쓰는 팀이면 주간 총량이 중요하다. **계약 전에 "우리 팀의 실제 사용 패턴이 어느 축(순간 집중형 vs 장기 분산형)에 가까운지"를 먼저 파악하고, 그 축을 기준으로 요금제 배수를 재계산해야** 진짜 비교가 된다. [[2026-08-19-claude-code-weekly-limit-extension]]에서 남긴 "한도의 만료일을 계약에 적는다"는 원칙에 "한도 배수의 측정 단위를 계약에 적는다"는 원칙을 더한다.

## 연관 자료
- [[2026-08-19-claude-code-weekly-limit-extension]] — Claude 주간 한도 상향 연장 공지와 hada 댓글의 "수요 급증 vs 이탈" 논쟁, 한도라는 장치의 성격을 먼저 다룬 노트
- [[2026-05-18-ai-subscription-pricing-truth]] — 표시 구독가와 실제 API 환산 비용의 괴리, 같은 "표시 숫자 vs 실제 자원"의 경고

## 한 달 뒤 회고
*(2026-10-01 즈음 — hada.io·x.com 접근이 가능해졌다면 원 트윗 전체 스레드와 hada 댓글 반응을 재확인하고, Claude 쪽에서 이 지적에 대한 공식 반응이나 요금제 구조 변경이 있었는지 점검.)*
