---
title: "Astra for Law (OpenAI) — 2억 3천만 URL 판례 검색 위에 GPT-6 Astra를 얹었지만, 정답률은 54%에 그쳐 '검증 없이 인용하면 안 된다'는 경고가 그대로 남는다"
source_title: "Introducing Astra for Law"
source_url: "https://openai.com/index/astra-for-law/"
source_name: "openai.com (OpenAI 공식 블로그)"
referrer_url: "https://news.hada.io/topic?id=33863"
published_at: "2026-09-17"
summarized_at: "2026-09-18"
category: "ai"
tags: ["openai", "gpt-6-astra", "legal-ai", "vertical-ai", "benchmark", "free-law-project", "model-release"]
---

# Astra for Law (OpenAI)

> 출처: [Introducing Astra for Law](https://openai.com/index/astra-for-law/) (OpenAI 공식) · GeekNews 경유 [id=33863](https://news.hada.io/topic?id=33863) · 정리일 2026-09-18
>
> **출처 한계**: `news.hada.io`·`openai.com`·`news.ycombinator.com`·`siliconangle.com`·`unite.ai` 등 이번 세션에서 시도한 도메인이 전부 egress 정책으로 직접 열람하지 못했다. 대신 SiliconANGLE·TheNextWeb·LawSites(lawnext.com)·digitaltoday.co.kr·Benzinga 등 복수 매체가 거의 동일한 수치(230M+ URL, 정답률 54.0% vs 38.7%)를 일관되게 보도하고 있어 핵심 수치의 신뢰도는 준수하나, OpenAI 원문의 정확한 문구·전체 한계 서술은 대조하지 못했다. hada 댓글 수는 확인 불가하지만, HN에는 같은 글이 올라와 **397점·429댓글**(2026-09-18 "Hacker News Daily Top 30" 기준 2위)을 기록했다.

## 한 줄 요약

**OpenAI가 최신 모델 GPT-6 Astra에 법률 전용 검색 인덱스(미국 판례·법률·규정 등 2억 3천만 개 이상 URL)와 로펌 업무용 워크플로 도구를 결합한 'Astra for Law'를 공개했다. Free Law Project(CourtListener)와의 협력으로 공개된 미국 선례 판례의 99.9% 이상을 커버하지만, 자체 벤치마크(Vals AI Legal Research Bench, 질문 200개)에서 최고 추론 강도 기준 정답률은 54.0%에 그쳤다 — 웹 검색만 쓰는 기본 Astra의 38.7%보다는 크게 나아졌지만, 여전히 절반 가까이는 틀린다는 뜻이다.**

## 핵심 포인트

- **검색 범위와 데이터 파트너십** — 미국 판례·법률·규정·법원 규칙·행정 결정 등 ***2억 3천만 개 이상의 URL***을 매일 갱신하며 검색한다. Free Law Project(비영리, CourtListener 운영)와의 협력으로 ***공개된 미국 선례 판례의 99.9% 이상***을 확보했다고 밝혔다.
- **벤치마크 — 절반을 겨우 넘긴 정답률** — 미국 법률 조사 질문 200개(Vals AI Legal Research Bench)에서 최고 추론 강도 기준 ***정답률 54.0%***를 기록, 웹 검색만 쓰는 기본 GPT-6 Astra(38.7%)보다 ***상대적으로 약 40% 높다***. 뒤집어 보면 최고 성능 설정으로도 ***거의 절반은 여전히 틀린다*** — 로펌이 검증 없이 인용하면 위험하다는 경고가 벤치마크 숫자에 그대로 남아 있다.
- **출시 방식 — 직접 판매가 아니라 인프라 레이어** — 선별된 로펌에 ChatGPT·Codex를 통한 Trusted Access로 먼저 제공하고, API(`gpt-6-astra-law`)는 추후 공개 예정(가격 미정). 흥미로운 점은 OpenAI가 ***법률 AI 시장의 경쟁자가 아니라 그 밑을 받치는 레이어***로 스스로를 포지셔닝한다는 것 — 이미 $15.6B 기업가치의 Harvey와 Legora가 API 고객으로 Astra for Law 위에 자사 제품을 쌓겠다고 서명했고, Thomson Reuters·Harvey·Legora·iManage 등 26개 벤더의 플러그인도 함께 출시됐다.
- **법조계 초기 반응은 엇갈린다** — Harvey의 응용연구 책임자는 "복잡한 법률 작업에서 GPT-5.6 대비 상당한 품질 개선"이라 평가했지만, 다른 실무자는 ***"에이전틱 AI가 주니어 훈련 과정 자체를 없애는 단계로 가고 있다"***고 우려했고, 별도 논평은 "모든 업무에 최신 프런티어 모델이 필요하다고 자동으로 가정하지 말라"며 프런티어 모델 경쟁의 "상호 과시(one-upmanship)"를 경계했다.
- **경쟁 구도** — Anthropic이 3월 먼저 내놓은 Claude for Legal에 이어, 프런티어 랩들의 법률 버티컬 경쟁이 한층 심화됐다는 게 여러 매체의 공통된 읽기다.

## 인상 깊은 문장

> "Astra for Law passed the correctness check on 54.0% of questions, compared with 38.7% for GPT-6 Astra with web search alone."
> (LawSites·SiliconANGLE 등 복수 매체가 일관되게 인용한 벤치마크 수치, OpenAI 원문 직접 대조는 못 함)

> "We're now moving to the level of agentic AI that removes junior training. We knew it was going to happen."
> (WebSearch로 확보한 법조계 실무자 반응 인용, 매체의 재인용이라 발언자 전체 맥락은 확인 못 함)

## 댓글

**hada 댓글 수는 확인 불가**(`news.hada.io` 세션 전체 차단). 같은 글이 Hacker News에도 올라와 **397점·429댓글**을 기록했음을 "Hacker News Daily Top 30 @2026-09-18" GitHub 미러로 확인했다 — 이날 상위 30개 중 2위로, 오늘 배정된 5개 글 중 가장 뜨거운 반응이다. Lobsters 큐레이션 여부는 확인하지 못했다. **정직하게 짚을 이해관계·한계**: ① 소스가 OpenAI 자사 공식 발표문이라 벤치마크 설계(질문 200개, "최고 추론 강도" 기준)와 비교 기준선(기본 Astra 38.7%) 모두 자체 제시한 값이라는 점, ② "정답률 54%"라는 숫자 자체가 절반에 가까운 오답률을 뜻하는데도 발표는 "38.7%보다 40% 높다"는 상대적 개선폭을 전면에 내세운다는 점, ③ Harvey·Legora가 API 고객으로 서명한 동시에 "경쟁이 아니라 인프라"라는 프레이밍을 OpenAI가 함께 제시한다는 점 — 이 구도가 실제로 경쟁을 완화하는지 OpenAI가 법률 AI 시장 전체를 잠식하는 초기 단계인지는 이번 조사로 판단하기 이르다.

## 내 생각 · 적용점

### 핵심 전이 1 — [[2026-09-12-astra-for-coding-why-again]]이 이미 경고한 "Astra 신뢰 문제"가 법률 영역에서도 반복된다

Armin Ronacher는 GPT-6 Astra로 35시간 무인 코딩 실험을 돌린 뒤 "쓸 만한 것은 아무것도 나오지 않았다"고 결론지었다 — 압축된 raw 스크립트로 파일을 조작하는 습관이 유닛 테스트에까지 스며든 게 원인이었다. Astra for Law의 54% 정답률도 같은 결의 경고다: ***모델의 원초적 능력이 인상적인 숫자(2억 3천만 URL, 99.9% 판례 커버리지)로 포장되지만, 실제 업무에 쓰기엔 "아직은 신뢰하지 못한다"는 판단이 두 도메인 모두에서 반복***된다. 코딩에서는 압축된 스크립트가, 법률에서는 46%의 오답이 그 신뢰 격차의 구체적 얼굴이다.

### 핵심 전이 2 — [[2026-07-20-ai-wrapper-dead-verticalization]]이 예측한 구도를 프런티어 랩 스스로 실행하는 역설

NFX 노트는 "얇은 AI 래퍼는 프런티어 랩이 기능을 직접 삼키면서 죽었다"고 진단했다. Astra for Law는 그 다음 단계를 보여준다 — ***프런티어 랩(OpenAI)이 아예 스타트업의 자리(법률 검색 인덱스+워크플로 도구)까지 직접 차지***하면서도, 동시에 "우리는 경쟁자가 아니라 인프라"라는 언어로 Harvey·Legora 같은 기존 버티컬 스타트업을 API 고객으로 묶어둔다. NFX가 말한 "해자는 워크플로·데이터·도메인 소유"라는 처방이 맞다면, Harvey·Legora의 진짜 승부는 이제 "모델 접근성"이 아니라 "로펌 워크플로 전체를 더 깊이 소유했는가"로 좁혀진다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 멀다** — 온다가 법률 검색 인덱스를 운영할 일은 없다. 다만 전이 가능한 원칙 둘: ① **프런티어 랩이 "인프라 레이어"를 자처하며 버티컬로 내려오는 흐름은 CRS/호스피탈리티에도 반복될 수 있다** — 예약·요금 데이터에 특화된 검색/추천 인덱스를 프런티어 모델 업체가 직접 제공하기 시작하면, 온다의 방어선은 결국 NFX 노트가 말한 "워크플로·축적 데이터·파트너 관계"여야 한다는 결론이 여기서도 재확인된다. ② **"정답률 54%"를 "38.7%보다 40% 높다"고 포장하는 벤치마크 프레이밍 습관을 경계할 것** — 벤더 자체 벤치마크를 내부 도입 판단에 쓸 때는 상대적 개선폭이 아니라 절대 정답률(그리고 오답의 비용)을 먼저 본다는 원칙을 세워둘 만하다.

## 연관 자료

- [[2026-09-04-openai-gpt-6-astra-release]] — Astra for Law가 얹혀 있는 기반 모델 GPT-6 Astra의 출시 노트, AA 지능지수와 특화 벤치마크의 불일치가 이미 지적됨
- [[2026-09-12-astra-for-coding-why-again]] — 같은 모델 계열(Astra)이 코딩 영역에서 겪은 신뢰 실패, 법률 영역의 54% 정답률과 같은 경고
- [[2026-07-20-ai-wrapper-dead-verticalization]] — "얇은 래퍼는 프런티어 랩이 삼킨다"는 명제가 프런티어 랩 스스로 버티컬을 삼키는 역설로 진화한 사례

## 한 달 뒤 회고

*(2026-10-18 즈음 — Astra for Law API 가격이 공개됐는지, Trusted Access 로펌들의 실사용 후기가 나왔는지, 54% 정답률에 대한 법조계의 검증 요구·오인용 사고가 실제로 보고됐는지, Harvey·Legora가 "인프라 vs 경쟁" 구도에서 실제로 어떤 포지션을 취했는지 원문 확보 후 점검.)*
