---
title: "Claude Code 개발자 보리스 체니: \"나는 자주 틀린다\" — 계획을 세운 당사자는 자기 계획이 흐려지고 있다는 걸 스스로 알아차리기 어렵다"
source_title: "확인 불가 (Boris Cherny 다수 인터뷰 중 특정 실패)"
source_url: "https://news.hada.io/topic?id=34034"
source_name: "GeekNews (Boris Cherny 인터뷰 발췌, 정확한 원 인터뷰 특정 실패)"
referrer_url: "https://news.hada.io/topic?id=34034"
published_at: "확인 불가"
summarized_at: "2026-09-21"
category: "ai"
tags: ["claude-code", "boris-cherny", "anthropic", "iteration", "feedback-loop", "product-development"]
---

# Claude Code 개발자 보리스 체니: "나는 자주 틀린다"

> 출처: [GeekNews 토픽](https://news.hada.io/topic?id=34034) · Boris Cherny(Claude Code 개발 리드) 인터뷰 발췌 · 정리일 2026-09-21
>
> **출처 한계**: `news.hada.io`가 egress 차단으로 원문 접근 불가. Slack GN⁺ 발췌(4개 불릿, 마지막이 "피드백을 가능한 한 실시간으로 주고받아 개인…"에서 잘림)만으로는 정확히 어느 인터뷰를 가리키는지 확정하지 못했다. WebSearch로 확인한 바로는 Boris Cherny가 "나는 자주 틀린다"는 취지의 발언을 한 인터뷰가 최소 3건(Platformer, Fortune, Y Combinator Light Cone) 존재해, 이 GeekNews 토픽이 그중 어느 것을 다루는지 특정하지 못했다. 아래 내용은 Slack 발췌를 중심으로 재구성했다.

## 한 줄 요약

**Claude Code 개발을 이끄는 Boris Cherny는 "나는 자주 틀린다"고 인정하며, 방향이 자꾸 바뀌는 것처럼 보여도 그게 복잡한 문제를 푸는 데 필요한 반복일 수 있다고 말한다 — 흔한 실패는 무엇을 풀려는지 불명확한 채로 계획만 커지는 것이고, 계획을 세운 당사자는 그 흐려짐을 스스로 알아차리기 어렵기 때문에 실시간 피드백이 중요하다.**

## 핵심 포인트

- **새 정보가 들어오면 목표도 바뀌어야 정상** — 새로운 정보가 들어오면 문제 정의와 접근법, 목표도 바꿔야 한다. ***방향이 자꾸 바뀌는 것처럼 보여도, 복잡한 문제를 해결하는 데 필요한 반복일 수 있다.***
- **파악 → 명확화 → 빠른 실행의 반복** — 정보를 파악하고 부족한 내용을 채운 뒤, ***문제와 단순한 해결 방법, 목표를 명확히 정하고 빠르게 실행하는 과정을 반복***한다.
- **흔한 실패 — 불명확한 목표 + 복잡한 해결책** — 흔한 실패는 ***무엇을 풀려는지 불명확하거나 해결 방법이 복잡한 것***이며, 이 상태에서는 ***계획만 커지고 성공 기준은 흐려진다.***
- **자기 인식의 한계 → 실시간 피드백 필요** — 계획을 세운 당사자는 이런 문제를 알아차리기 어려우므로, ***피드백을 가능한 한 실시간으로 주고받아*** 문제를 조기에 발견해야 한다는 취지로 이어지는 것으로 추정된다(발췌가 "개인…"에서 끊김).

## 인상 깊은 문장

> "I am just often wrong."
> (WebSearch로 확인한 Fortune 인터뷰에서의 Boris Cherny 발언 — 이 GeekNews 토픽이 인용한 발언과 동일한 취지로 보이나, 정확히 같은 인터뷰인지는 확정 못함)

## 댓글

**확인 불가.** hada 댓글 수는 대조하지 못했다. **읽을 때 감안**: Boris Cherny 본인이 Claude Code 리드로서 제품 개발 과정을 회고하는 발언이라, "자주 틀린다"는 겸손한 프레이밍이 실제로는 Claude Code의 빠른 방향 전환(pivot)을 정당화하는 서사로 기능할 수 있다.

## 내 생각 · 적용점

### 핵심 전이 — 가든의 Boris Cherny/Claude Code 계열 노트에 "실패 인식론"이라는 새 축 추가

가든에는 이미 Boris Cherny·Claude Code 관련 노트가 여럿 있다 — [[2026-08-03-boris-cherny-unhobbling-claude-code]], [[2026-06-08-boris-cherny-claude-code-interview]], [[2026-06-08-claude-code-creator-end-of-swe]]. 이번 글은 제품 자체보다 **"계획이 틀렸다는 걸 어떻게 아는가"**라는 메타 질문을 다룬다는 점이 다르다. 특히 "계획을 세운 당사자는 자기 계획이 흐려지고 있다는 걸 스스로 알아차리기 어렵다"는 지적은, 같은 배치의 [[2026-09-21-tibo-codex-development-story]](하네스는 모델이 좋아질수록 스스로 줄어드는 방향으로 설계)와 흥미로운 대조를 이룬다 — 두 코딩 에이전트 리드(Anthropic의 Cherny, OpenAI의 Sottiaux) 모두 "계획/하네스는 고정된 게 아니라 계속 재평가돼야 한다"는 같은 원칙을 각자의 언어로 말하고 있다.

## 호스피탈리티 / CRS 적용 포인트

CRS 개발 프로젝트에서 "계획이 틀렸는지 스스로 알아차리기 어렵다"는 지적은 실용적이다 — 큰 마이그레이션이나 신규 기능 개발 계획을 세운 팀 리드 본인이 그 계획의 흐려짐을 가장 늦게 알아차릴 사람일 수 있다는 뜻이므로, 외부(다른 팀, PM, 실사용자)의 실시간 피드백 채널을 의도적으로 설계해둘 필요가 있다는 원칙으로 CRS 프로젝트 운영에 적용할 만하다.

## 연관 자료

- [[2026-09-21-tibo-codex-development-story]] — 같은 배치의 다른 코딩 에이전트 리드 인터뷰, "고정된 계획/하네스를 계속 재평가하라"는 같은 원칙
- [[2026-08-03-boris-cherny-unhobbling-claude-code]] — Boris Cherny의 다른 인터뷰, Claude Code 제품 방향론

## 한 달 뒤 회고

*(2026-10-21 즈음 — 이 GeekNews 토픽이 어느 원 인터뷰를 인용했는지 특정할 수 있는지, "피드백을 실시간으로…"로 끊긴 문장의 정확한 결론을 확인.)*
