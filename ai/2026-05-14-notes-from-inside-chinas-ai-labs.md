---
title: "중국 AI 연구소 내부에서 얻은 교훈"
source_title: "Notes from inside China's AI labs"
source_url: "https://www.interconnects.ai/p/notes-from-inside-chinas-ai-labs"
source_name: "Nathan Lambert (Interconnects)"
referrer_url: "https://news.hada.io/topic?id=29487"
published_at: "2026-05-07"
summarized_at: "2026-05-14"
category: "ai"
tags: ["AI", "중국", "생태계", "연구문화", "오픈소스", "지정학"]
---

# 중국 AI 연구소 내부에서 얻은 교훈

> 출처: [Notes from inside China's AI labs](https://www.interconnects.ai/p/notes-from-inside-chinas-ai-labs) (Nathan Lambert / Interconnects) · 레퍼러: [GeekNews 29487](https://news.hada.io/topic?id=29487) · 정리일 2026-05-14

## 한 줄 요약
Nathan Lambert가 중국의 주요 AI 랩(Z.ai, Moonshot, Tsinghua, Alibaba, ByteDance, DeepSeek, Ant 등)을 직접 방문해 본 인상 — **개인 명성보다 모델 품질에 수렴된 실용주의 문화 + 자체 기술 스택 소유 본능**이 미국과는 *카테고리가 다른* AI 생태계를 만들고 있다.

## 핵심 포인트

### 0. 글의 자격 — 직접 방문 기록
- 저자 **Nathan Lambert** (Interconnects, AI2 출신)가 **2026년 5월 초** 중국 현장 방문 기록.
- 방문처: **Z.ai · Moonshot · Tsinghua · Meituan · Xiaomi · 01.ai · Alibaba · ByteDance · DeepSeek · Ant Group(Ling)**.
- 결론을 미리: *서구 프레임으로 매핑하면 범주 오류(category error)가 발생한다*.

### 1. 연구자 정신 — 자아보다 산출물
- 미국: "자기 업적을 *대변*하는 문화" — 일부 랩은 *불만 무마용*으로 상위 연구자에게 별도 보상을 한다는 루머까지 있을 정도.
- 중국: **개인 아이디어보다 모델 최적화 우선**. 철학적 논쟁에서 자유롭고 실용적.
- **학생 중심 팀 구성** → 신선한 접근, *플래시하지 않은 지루한 작업*에 대한 의지가 강함.
- 한 연구자의 말: *"내 역할은 최고의 모델을 만드는 것이다."*

### 2. 산업 수준 — *기술 소유* 본능
- **Meituan(배달)·Xiaomi(전자) 같은 비IT 기업이 자체 LLM 구축**.
- "외부 서비스 사면 되지 않냐"는 서구식 질문이 잘 통하지 않는다 — **자기 스택 통제**가 본능에 가깝다.
- **데이터 산업 미발달** → 미국의 $10M+ 데이터 환경 대신 *자체 구축* 선호.
- **공통 병목 = Nvidia 칩 수급**. 모든 랩이 가장 큰 제약으로 지목.

### 3. 정부 지원의 *실제 모양*
- 존재하나 **범위가 불명확**:
 - 지방 정부 차원의 *허가·인허가 간소화*는 관찰됨.
 - **칩 밀반입의 구체적 증거는 부재**.
 - 정부가 **기술적 결정에 영향을 준다는 증거도 부재**.
- 즉 서구의 *국가 지원 = 통제* 모델은 적용되지 않는다.

### 4. 개발자 도구 시장의 역설
- **Claude는 중국에서 공식 금지**됐음에도 *대부분 개발자가 집착해서 사용*.
- 자국 도구(Kimi, GLM)보다 Claude 선호도가 높다.
- 시사점: **엔터프라이즈 AI 수요는 SaaS보다 클라우드 시장을 따른다** — 즉 칩·인프라가 더 강한 락인.

### 5. 결정적 인용 — *엔지니어 vs 변호사*
한 중국 연구자가 Dan Wang을 인용하며:
> *"China is run by engineers; the US is run by lawyers."*

저자가 경제적 불확실성·도덕적 문제를 거론하면 *"category error"*라는 반응이 많았다. 우선순위 자체가 다르다는 것.

### 6. 생태계 vs 냉전 — 협력 분위기
- 미국 랩 간 분위기: **냉각한 경쟁**.
- 중국 랩 간 분위기: **"생태계"** — 상호 참고와 협력의 결.
- 이 차이가 *모델 발산*과 *모델 수렴*의 차이로 이어질 가능성.

### 7. 결론 — 신중한 낙관
- 저자는 미국 오픈소스 리더십을 원하면서도, **전 지구적 생태계 번영이 더 안전하고 접근 가능한 AI**를 만든다고 본다.
- 미국발 행정명령 루머에는 *"신뢰감을 주지 못한다"*고 평가.
- 핵심 질문: **두 생태계가 *의미 있게 다른 종류*의 모델을 만들 것인가?**

## 인상 깊은 문장

> "China is run by engineers; the US is run by lawyers." *(중국 연구자가 Dan Wang을 인용)*

> "Their job is to build the best model. Nothing else competes for that frame."

> "When I asked about economic uncertainty or moral concerns, most treated it as a category error."

> "Chinese talent and tech are hard to model with Western determinism."

> "If you map the Chinese AI industry through American frameworks, you'll get the wrong answer."

## 내 생각 · 적용점

### 가든의 *서구 시각 편향* 보정
지금까지 가든의 AI 글은 거의 전부 *서구 발신자*다 — Anthropic, OpenAI, Simon Willison, Addy Osmani, Ethan Ding, Mira Murati, Garry Tan. 본 글은 **방문기 형식으로 동측 생태계의 *내부 시점*을 일부 가져온 첫 글**. 가든 분류축에 *발신자 권역*을 추가할 만한 이유.

### "엔지니어 vs 변호사" 자가 진단 — 한국 IT는 어디?
Dan Wang 인용은 한국 IT 업계에 대한 거울처럼 작동한다. 자가 진단 질문:

- 호스피탈리티 IT 의사결정은 *엔지니어 책임*에 가까운가, *법무·컴플라이언스 책임*에 가까운가?
- CRS의 OTA 인테그레이션 협의는 누가 *최종 권한*을 가지는가?
- *기술 부채*를 안고 가는 결정은 *엔지니어가 데이터로* 하는가, *경영진이 정성으로* 하는가?
- MangoLove 자문 후보: **"당신 조직은 엔지니어가 운영하는가, 변호사가 운영하는가?"** 4분면 자가 진단표.

### *자체 기술 스택 소유* 본능 — CRS·BugSip에 어떻게?
중국 비IT 기업의 *자체 LLM 구축* 본능은 가든의 [로컬 AI 표준](2026-05-11-local-ai-needs-to-be-the-norm.md), [Rapid-MLX](2026-05-12-rapid-mlx-apple-silicon-local-ai.md)와 **같은 원리의 산업 차원 발현**.

- CRS: 호스피탈리티 도메인 특화 SLM(소형 모델)을 **외부 API 의존 없이** 운영할 수 있는가? PII 보호와 자연 결합.
- BugSip: *코드 리딩 학습*은 본질적으로 *자기 스택 학습 환경*. 외부 LLM에 모든 걸 위임하지 않고 **로컬 분석 컴포넌트를 보유**하는 게 자연스러운 결.

### *학생 중심 팀 + 지루한 작업 의지*의 의미
이건 가든의 [복잡성 래칫](2026-05-14-ai-coding-complexity-ratchet-garry-tan.md)과 *직접* 짝이 된다 — Garry Tan은 AI가 *지루한 엣지 케이스 테스트*를 해준다고 했고, 중국 랩은 *사람*이 지루한 작업을 받아들이는 문화라고 한다. **두 접근의 곱(인간 의지 × AI 자동화)이 일어나면 어떻게 되는가**가 다음 5년 관전 포인트.

### 가든 *Agent-Default Posture*의 동측 보강
가든 [확률적 창업자](../career/2026-05-05-rise-of-the-probabilistic-founder.md)에서 정리한 *70/30 실험-로드맵·Agent-Default Posture*는 *서구 스타트업 모델*이다. 중국 랩의 **모델-품질-단일초점**은 같은 자세의 다른 표현형 — *Model-Default Posture*. 가든 입장 스펙트럼에 이 축을 추가할 가치가 있다.

### 호스피탈리티 IT 직접 시사점 — Claude 사용 역설
중국 개발자가 *공식 금지된 Claude*를 가장 많이 쓴다는 사실은 **개발자 선호는 정책으로 막을 수 없다**는 명제의 강한 증거. 한국에서도 *사내 보안 정책으로 외부 LLM 금지* 시도가 흔한데, 본 글이 시사하는 건:

- 막는 정책은 *지하화*만 만든다.
- 차라리 **승인된 사용 패턴 + 데이터 가드레일**을 설계하는 게 합리적.
- CRS·Connectivity 관련 사내 가이드 갱신 후보.

## 연관 자료

- [로컬 AI가 표준이 되어야 한다](2026-05-11-local-ai-needs-to-be-the-norm.md) — *자체 기술 스택 통제* 본능의 인프라 차원 짝.
- [Rapid-MLX — Apple Silicon 로컬 AI](2026-05-12-rapid-mlx-apple-silicon-local-ai.md) — Apple 차원의 *자체 스택* 표현. 중국 산업 차원과 비교.
- [Interaction Models — Thinking Machines](2026-05-13-interaction-models-thinking-machines.md) — *미국 측* 연구 문화의 한 단면 (스타 연구자 + 자율성).
- [AI 코딩 시대의 복잡성 래칫](2026-05-14-ai-coding-complexity-ratchet-garry-tan.md) — *지루한 작업의 자동화*와 본 글의 *지루한 작업 의지*가 만나면? 다음 5년 관전 포인트.
- [Anthropic, Claude에게 '왜'를 가르치다](2026-05-14-teaching-claude-why-alignment-training.md) — 미국 측 *정렬 우선* 문화의 표현. 중국 측 *모델 품질 우선*과의 우선순위 차이 비교.
- [확률적 창업자의 부상](../career/2026-05-05-rise-of-the-probabilistic-founder.md) — *서구식 Agent-Default Posture*. 본 글은 *동측 Model-Default Posture* 짝.
- 외부 추천: Dan Wang의 *Engineering vs Lawyer* 명제 — 본 글의 인용 원전.

## 한 달 뒤 회고
<!-- 2026-06-14 즈음:
- MangoLove "엔지니어 vs 변호사" 자가 진단 항목 정식 추가 여부
- CRS 사내 LLM 사용 가이드를 *금지 → 가드레일* 방향으로 한 줄이라도 갱신했는지
- BugSip 로컬 분석 컴포넌트 보유 정책을 명시했는지 -->
