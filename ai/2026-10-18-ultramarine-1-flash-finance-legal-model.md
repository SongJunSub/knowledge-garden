---
title: "Ultramarine 1 Flash (Paper Instruments) — 답변이 아니라 엑셀 통합문서·PPT·워드 완성본을 내놓는 금융·법률·컨설팅 특화 모델, 다만 '오픈소스'라는 표기와 공개된 가중치는 따로 논다"
source_title: "Ultramarine 1 Flash release (notes.nicolasdeville.com 요약, 공식 발표 원문 미확인)"
source_url: "확인 불가 (Paper Instruments 공식 발표 원문 이번 세션에서 직접 열람 못함)"
source_name: "Paper Instruments (벤더 자체 발표 추정) + WebSearch 2차 교차확인(notes.nicolasdeville.com 외)"
referrer_url: "https://news.hada.io/topic?id=35519"
published_at: "2026-10-14"
summarized_at: "2026-10-18"
category: "ai"
tags: ["paper-instruments", "glm", "knowledge-work", "finance", "legal", "office-automation", "agent-benchmark", "open-weights"]
---

# Ultramarine 1 Flash

> 출처: Paper Instruments 공식 발표 추정(원문 미확인) · GeekNews 토픽 [id=35519](https://news.hada.io/topic?id=35519) · 정리일 2026-10-18
>
> **출처 한계**: `news.hada.io`는 egress 차단으로 못 열었다. WebSearch로 notes.nicolasdeville.com과 복수 언어판 orcarouter.ai 블로그를 교차확인했고, Slack 발췌의 핵심 수치(59.3점·$0.13)와 방향은 일치했다. 다만 ①Slack은 비교 대상을 "Claude Fable 5와 GPT-5.6 Sol의 최대 추론 설정"이라고 적었는데, WebSearch로는 **Claude Fable 5(57.8점·$8.19)와의 비교만 확인됐고 GPT-5.6 Sol 비교는 찾지 못했다.** ②"기반 모델(GLM-5.3 Flash)보다 평균 4.1점 개선, 출력 토큰 6.5% 감소"라는 Slack의 구체 수치도 독립적으로 재확인하지 못했다. ③모든 벤치마크 수치는 Paper Instruments 자체 평가(PI Knowledge Work)이거나 그 평가를 인용한 2차 매체이고, 제3자 독립 검증은 확인되지 않았다.

## 한 줄 요약

**Z.ai의 GLM-5.3 Flash에 대규모 강화학습을 더해 금융·법률·컨설팅·운영 업무에 특화시킨 모델로, 단순 답변이 아니라 엑셀 통합문서·PPT 발표자료·워드 문서 같은 고객 전달용 완성본을 만드는 데 초점을 맞췄다고 주장한다 — 자체 평가(PI Knowledge Work)에서 작업당 0.13달러로 59.3점을 기록해 훨씬 비싼 Claude Fable 5(57.8점·8.19달러)를 앞섰다고 하지만, 6개 지식업무 벤치마크 중 2개에서는 밀린다는 사실과 "오픈소스"라는 표기에도 공개된 가중치가 보이지 않는다는 점은 Slack 발췌에 없던, WebSearch로만 드러난 균열이다.**

## 핵심 포인트

- **목표를 답변이 아니라 결과물로** — 질의응답이 아니라 ***"엑셀 모델 하나, 발표자료 하나, 메모 하나를 끝내도록"*** 학습시켰다는 게 핵심 설계 철학. 고객에게 바로 전달할 수 있는 완성된 Excel 통합문서·PowerPoint·Word 문서와 업무 시스템 내 작업 실행에 초점을 맞췄다.
- **기반 모델 + RL** — Z.ai의 GLM-5.3 Flash를 기반으로, ***정답이 하나로 정해지지 않는 과제***(열린 업무 평가가 어려운 지식노동의 전형적 특징)에 대규모 강화학습을 적용해 특화시켰다.
- **PI Knowledge Work 벤치마크 — 가격 대비 성능 역전 주장** — 자체 평가에서 **작업당 0.13달러로 59.3점**을 기록, Claude Fable 5(57.8점·8.19달러)를 근소하게 앞섰다고 주장. 가격 차이(약 63배)가 점수 차이(1.5점)보다 훨씬 크다는 게 이 모델의 핵심 세일즈 포인트로 보인다.
- **6개 벤치마크 중 4승 2패 (WebSearch로만 확인, Slack엔 없음)** — JobBench에서는 Ultramarine 62.9점으로 Gemini 3.8 Flash(60.6)·Claude Fable 5(57.4)·DeepSeek V4.1 Flash(60.4)를 모두 앞섰다고 보도되지만, ***AutomationBench에서는 DeepSeek V4.1 Flash(51.3)에 밀리고(50.2), DiligenceBench에서는 3위***라는 내용도 함께 보도된다. Slack 발췌는 "기반 모델보다 평균 4.1점 개선, 출력 토큰 6.5% 감소"라는 총괄 수치만 전달해 이 패배 사례 둘을 가리는 효과를 낸다.
- **"오픈소스"라는 표기와 가중치 공개 여부가 어긋난다** — 회사 사이트는 "오픈소스 모델"이라고 표기하지만, 리뷰어들이 실제 공개된 가중치를 찾지 못했다는 보도가 있다(한쪽은 "가중치 공개 예정"이라고 적었다는 보도도 있다). 접근은 **유료 API**(100만 토큰당 입력 $0.15·출력 $0.50, OpenAI·Anthropic 호환 포맷)로만 가능하다는 설명과 "오픈소스" 표기가 서로 다른 그림을 그린다.
- **에이전트 하네스·오피스 제품군도 함께 출시** — Paper Instruments는 이 모델과 함께 에이전트 하네스 ***Feather***와 ***Paper Office***도 내놓았다고 보도된다(세부 기능은 확인 못함).

## 인상 깊은 문장

> "Trained to finish an Excel model, a deck or a memo." (WebSearch로 확인된 영문 태그라인)
> 답변 생성이 아니라 "끝내는 것"을 학습 목표로 삼았다는 포지셔닝이 이 모델의 정체성을 가장 압축적으로 보여준다.

## 댓글

GeekNews 댓글 수는 hada 차단으로 확인 불가. HN·Lobsters 크로스포스트 여부도 이번 WebSearch 범위에서 확인하지 못했다. **정직하게 밝혀야 할 한계**: ①모든 벤치마크 수치가 벤더 자체 평가(PI Knowledge Work)이거나 그걸 인용한 2차 매체이며, 독립 평가 기관(artificialanalysis.ai 등)의 검증은 찾지 못했다. ②"오픈소스"라는 자체 표기와 "가중치를 찾지 못했다"는 리뷰어 보도가 충돌하는데, 이 불일치를 Paper Instruments가 해명했는지는 확인하지 못했다. ③비교 대상 모델명(GPT-5.6 Sol 포함 여부) 자체가 Slack 발췌와 WebSearch 사이에서 엇갈려, 이 노트는 WebSearch로 확인되는 범위(Claude Fable 5 비교)만 확정적으로 쓰고 나머지는 Slack 발췌 표시로 남긴다.

## 내 생각 · 적용점

**핵심 전이 1: [[2026-10-02-ai-rollups-5-trillion-opportunity]]가 말한 "에이전트로 EBITDA 마진을 끌어올린다"는 전략의 모델 단위 버전이다.** 그 노트는 기존 중소기업을 인수해 AI 에이전트로 자동화하는 사업 전략(마진 5~10% → 30~40%)을 다뤘는데, Ultramarine은 그 자동화를 가능하게 하는 "저렴하지만 충분히 쓸만한" 모델 쪽 공급을 맡는다. "작업당 0.13달러"라는 가격 자체가 그 롤업 전략이 성립하는 핵심 전제조건(AI 비용이 인건비보다 훨씬 싸야 한다)을 뒷받침하는 데이터 포인트로 읽힌다.

**핵심 전이 2: [[2026-09-02-chatgpt-codex-bundled-libreoffice-runtime]]과 "AI가 오피스 문서를 직접 만든다"는 같은 방향이지만 접근이 반대다.** 그 노트에서는 ChatGPT/Codex가 사용자가 요청하지도 않은 LibreOffice 런타임(430MB)을 몰래 심어뒀다는 "투명성 문제"가 핵심이었다. Ultramarine은 반대로 "엑셀·PPT·워드 완성본"을 **명시적 제품 목표**로 내세운다는 점에서, 같은 기능(AI의 오피스 문서 생성)이 "숨겨진 부작용"이었던 사례와 "핵심 가치 제안"인 사례를 나란히 놓고 볼 수 있다.

**핵심 전이 3: "6개 중 4승 2패"를 "평균 4.1점 개선"으로 뭉뚱그리는 보도 방식을 경계.** 총괄 평균 수치는 패배한 벤치마크(AutomationBench·DiligenceBench)를 가릴 수 있다는 걸 이번에 직접 확인했다. [[2026-10-18-deepseek-v4-1-flash-1017]]에서도 같은 경계(벤더 자체 발표의 선택적 강조)를 다뤘는데, 이번엔 흥미롭게도 **DeepSeek V4.1 Flash가 Ultramarine을 이긴 벤치마크(AutomationBench)가 등장**해 두 노트가 같은 날 서로 교차한다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용 가능성이 있는 쪽이다. 호텔 CRS/B2B 운영에서도 ***"답변이 아니라 완성된 업무 결과물(예약 확인서, 요금 비교표, 주간 매출 리포트, 거래처 제안서)을 내놓는 모델"***이라는 포지셔닝은 그대로 참고할 만하다 — 다만 ***"오픈소스 표기와 실제 가중치 공개가 어긋난다"***는 이번에 드러난 균열처럼, 벤더가 내세우는 라이선스·개방성 문구를 실제 접근 조건(유료 API 전용)과 대조해서 확인하는 습관이 선행되어야 한다. 가격 대비 성능 주장(0.13달러 vs 8.19달러)도 PI 자체 평가라는 점을 감안해, 실제 도입 전에는 온다 자체 업무(요금 테이블 생성, 계약서 초안 등)로 직접 파일럿 평가가 필요하다.

## 연관 자료

- [[2026-10-02-ai-rollups-5-trillion-opportunity]] — "AI 에이전트로 마진을 끌어올린다"는 사업 전략의 모델 공급 측 버전
- [[2026-09-02-chatgpt-codex-bundled-libreoffice-runtime]] — "AI가 오피스 문서를 만든다"는 같은 기능이 숨겨진 부작용이었던 대조 사례
- [[2026-10-18-deepseek-v4-1-flash-1017]] — 같은 날 정리한 다른 모델, AutomationBench에서 Ultramarine을 이긴 비교 대상으로 교차 등장

## 한 달 뒤 회고

2026-11-18 즈음, PI Knowledge Work 벤치마크에 대한 독립 검증(제3자 평가)이 나왔는지, "오픈소스" 표기와 가중치 공개 여부의 불일치가 해명됐는지, GPT-5.6 Sol과의 직접 비교 수치를 원문에서 확인할 수 있는지 점검.
