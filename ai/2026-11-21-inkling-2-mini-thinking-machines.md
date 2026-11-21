---
title: "Inkling 2 Mini (Thinking Machines Lab) — 264억 파라미터를 중간 레이어만 3번 반복해 48회 통과 효과를 내는 looped transformer가, 노트북 로컬에서 100B 미만 오픈웨이트 중 선두를 찍었다"
source_title: "Inkling 2 Mini"
source_url: "https://huggingface.co"
source_name: "Thinking Machines Lab (Hugging Face·Tinker 배포)"
referrer_url: "https://news.hada.io/topic?id=37545"
published_at: "2026-11-20"
summarized_at: "2026-11-21"
category: "ai"
tags: ["thinking-machines-lab", "looped-transformer", "local-model", "open-weight", "efficiency"]
---

# Inkling 2 Mini (Thinking Machines Lab) — 264억 파라미터를 중간 레이어만 3번 반복해 48회 통과 효과를 내는 looped transformer가, 노트북 로컬에서 100B 미만 오픈웨이트 중 선두를 찍었다

> 출처: Inkling 2 Mini (Thinking Machines Lab, Hugging Face·Tinker 경유) · 정리일 2026-11-21

## 한 줄 요약

**Thinking Machines Lab이 2026-11-20 공개한 Inkling 2 Mini는 264억 파라미터·약 20GB 메모리로 노트북에서 로컬 실행이 가능한 looped transformer로, 24개 레이어 중 중간 12개 레이어를 토큰당 3회 반복 실행해 48회 레이어 통과 효과를 내면서도 저장 용량은 24층 분량만 쓰는 구조로 100B 미만 오픈웨이트 모델 중 두 벤치마크(DeepSWE v1.1 48.2%, Vals Index v2.2 46.5%)에서 선두를 기록했다.**

## 핵심 포인트

- **실재·수치 모두 다수 독립 소스(artificialanalysis.ai, letsdatascience, dev.to, testingcatalog, X)로 교차검증됨** — Slack 발췌와 거의 일치.
- **구조**: 24개 레이어 중 중간 12개 레이어를 토큰당 **3회 반복** 실행해 48회 레이어 통과 효과를 내지만, 저장 용량은 실제 24층 분량만 사용 — 추론을 텍스트로 모두 출력하지 않고 내부 연산을 늘리는 방식. 활성 파라미터 수는 소스 간 3.1B~5.4B로 약간 불일치.
- **라이선스 Apache 2.0**, Hugging Face·Tinker로 배포. 로컬 실행은 Apple Silicon 32GB 이상 권장.
- **벤치마크**: 100B 미만 오픈웨이트 모델 중 DeepSWE v1.1 48.2%·Vals Index v2.2 46.5%로 선두. 다만 **모델카드 자체가 "대부분 평가에서 Inkling 2 Small(594B)보다 성능이 낮다"고 명시** — 작은 체급 안에서의 선두일 뿐 전반적 성능 1위는 아니다.
- 다중 턴 대화·복잡한 제약이 있는 지시 수행은 상대적 약점으로 보도됨.
- Thinking Machines Lab의 첫 큰 발표였던 [[2026-05-13-interaction-models-thinking-machines]](Interaction Models, 200ms 마이크로턴 모델)와 달리, 이번은 **로컬 실행 가능한 효율형 모델** 방향으로 라인업을 확장한 것.

## 인상 깊은 문장

(모델카드·공식 발표문 원문을 직접 확보하지 못해 영문 그대로 인용은 확보하지 못했다.)

## 댓글

GeekNews(news.hada.io)가 이 세션에서 전면 차단되어 원문 페이지 댓글 수·HN/Lobsters 큐레이션 여부는 확인하지 못했다. 다만 모델 실재·핵심 수치는 다수 독립 소스로 교차검증되어 신뢰도는 높다.

## 내 생각 · 적용점

### 핵심 전이 1 — 어제 다룬 "로컬 AI의 장벽은 사용성"이라는 진단의 구체적 반증 혹은 보강 사례

바로 전날 정리한 [[2026-11-20-pete-warden-why-ai-goes-local]]은 "로컬 AI의 장벽이 모델 품질에서 사용성으로 옮겨갔다"고 진단했다. Inkling 2 Mini는 **품질 문제를 looped transformer라는 구조적 트릭으로 다시 공략**한 사례다 — 저장 용량은 그대로 두고 반복 연산으로 "48층 효과"를 내는 건 사용성(메모리 용량)과 품질(실질 연산 깊이)을 동시에 잡으려는 시도로 읽힌다. 즉, "사용성이 장벽"이라는 진단과 "품질을 구조적으로 더 끌어올리는 연구"는 공존하는 두 축이다.

### 핵심 전이 2 — "같은 베이스를 다른 전략으로" 압축하는 흐름의 연장

[[2026-11-14-edge0-145b-local-model]]에서 이미 "같은 베이스 모델을 다른 오프로딩 전략으로" 압축하는 흐름을 짚었는데, Inkling 2 Mini는 오프로딩이 아니라 **반복 실행(looping)**으로 저장-연산 트레이드오프를 조정하는 또 다른 접근이다. 로컬 추론 효율화는 양자화·오프로딩·looping 등 여러 축에서 동시에 진행되고 있다.

## 호스피탈리티 / CRS 적용 포인트

**멀다, 제한적 참고만.** 노트북 수준 로컬 추론은 당장 CRS 운영에 직접 쓸 데가 크지 않지만, 온프레미스/엣지 환경(현장 키오스크, 오프라인 체크인 단말)에서 저비용 추론이 필요할 경우 "저장 용량은 작게, 반복 연산으로 품질을 보완"하는 이런 효율화 기법은 장기적으로 참고 후보가 될 수 있다.

## 연관 자료

- [[2026-11-20-pete-warden-why-ai-goes-local]] — *"로컬 AI 장벽은 사용성"이라는 전날 진단과의 비교*
- [[2026-11-14-edge0-145b-local-model]] — *같은 베이스를 다른 전략으로 압축하는 로컬 모델 흐름*
- [[2026-05-13-interaction-models-thinking-machines]] — *Thinking Machines Lab의 첫 발표(모델 차원 전략), 이번 로컬 효율형 모델과의 라인업 비교*

## 한 달 뒤 회고

*(2026-12-21 즈음 — Inkling 2 Mini의 다중 턴 대화 약점이 개선됐는지, looped transformer 구조가 다른 벤더에서도 채택됐는지 기록.)*
