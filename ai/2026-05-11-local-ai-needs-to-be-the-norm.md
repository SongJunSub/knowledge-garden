---
title: "로컬 AI가 표준이 되어야 한다"
source_title: "Local AI Needs to be the Norm"
source_url: "https://unix.foo/posts/local-ai-needs-to-be-norm/"
source_name: "unix.foo"
referrer_url: "https://news.hada.io/topic?id=29369"
published_at: "2026-05"
summarized_at: "2026-05-11"
category: "ai"
tags: ["로컬AI", "온디바이스", "FoundationModels", "프라이버시", "Apple", "Neural-Engine"]
---

# 로컬 AI가 표준이 되어야 한다

> 출처: [unix.foo — Local AI Needs to be the Norm](https://unix.foo/posts/local-ai-needs-to-be-norm/) · 레퍼러: [GeekNews 29369](https://news.hada.io/topic?id=29369) · 정리일 2026-05-11

## 한 줄 요약
*OpenAI·Anthropic API 의존*을 줄이고 **기기 내 Neural Engine** 활용하자는 주장. Apple **FoundationModels**로 *요약·분류·추출·재작성* 같은 데이터 변환을 서버 없이 처리 — *프라이버시·비용·신뢰성*이 동시 개선.

## 핵심 주장

### 1. 클라우드 의존이 *제품 본질을 바꾼다*
> "그 순간 당신은 제3자 AI 제공업체에 사용자 콘텐츠를 전송함으로써 *제품의 본질을 바꿨습니다*."

- 단순 기능 → *분산 시스템*으로 변신
- 서버 중단·네트워크·요금 제한·데이터 보유 문제 모두 자동 상속

### 2. 로컬 모델의 강점
- **프라이버시**: 데이터가 *기기를 떠나지 않음* → 2,000자 개인정보보호정책 불필요
- **네트워크 비의존**: 비행기·지하·해외에서도 작동
- **응답 속도**: 왕복 지연 없음
- **신뢰 구축**: *어디로 데이터가 가는가* 질문이 사라짐

### 3. 적합한 작업
**사용자 *자기 데이터*를 변환하는 작업**에 최적:
- 요약
- 분류
- 추출
- 정규화·재작성

### 4. Apple FoundationModels 프레임워크
- `SystemLanguageModel` — 로컬 모델 접근
- 세션 기반 응답 생성
- **`@Generable` 구조체** — 타입 안전한 *구조화 출력*
- iOS·macOS 전체에서 일관 API

### 5. 약점도 인정
- 클라우드 GPT-5.5·Opus 4.7만큼 *지능적이지 않다*
- 그러나 *데이터 변환 작업*에는 *충분한 수준*

> "로컬 모델은 사용자 소유 데이터를 변환할 때 최고입니다."

> "우리는 기능으로 의도했던 것을 분산 시스템으로 배포하기를 멈춰야 합니다."

> "유용한 소프트웨어가 목표입니다."

## 내 생각 · 적용점

### 가든 *AI 채택 방향*의 새 결
지금까지 가든 AI 시리즈가 *클라우드 AI를 어떻게 잘 다룰까* (하네스·Long-running·mattpocock 등) 또는 *클라우드 AI 비판* (Trap·Ding·No One's Happy 등)에 집중했는데, 이 글은 **세 번째 방향 — *클라우드 AI를 줄이자***. 가든의 비판 시리즈가 *대안 제시*까지 가는 자연스러운 발전.

### *제품 본질 변경*은 [Diallo의 정신](2026-05-07-ai-didnt-delete-your-database-you-did.md)과 통한다
- Diallo: *"왜 그런 API가 *존재*하는가?"* (위험 표면 의문)
- 이 글: *"왜 그 데이터가 *외부로* 나가야 하는가?"* (전송 자체 의문)
- 둘 다 *시스템 설계의 근본 선택*을 다시 묻는 형태

### 호스피탈리티 적용 — *로컬 AI가 핏인 영역*

호스피탈리티 데이터는 *민감 정보* 많음 (개인정보·결제·여행 패턴). 로컬 AI 적합 영역:

| 영역 | 활용 |
|------|------|
| **PickMe 모바일** | 사용자 검색 히스토리 *기기 내 분석* → 추천. 외부 전송 X |
| **CRS Admin 자동완성** | 로컬에서 폼 자동완성·요약 — 직원 PC에서 처리 |
| **여권 OCR + 정규화** | 카메라 → 로컬 모델 → 호텔 등록. 여권 이미지가 외부로 안 나감 |
| **고객 리뷰 분류** | 호텔 단위 PC에서 *온디바이스 감정 분석* |
| **OTA 메시지 자동 분류** | 직원 PC에서 로컬 모델로 1차 분류, 사람 검토 후 응답 |

→ **호스피탈리티 데이터의 *PII 보호 의무*와 로컬 AI가 자연스럽게 맞물림**.

### [Lean Analytics 성공 태스크당 비용](../engineering/2026-05-08-lean-analytics-reconsidered.md)의 *해답 후보*
- 클라우드 API = *변동 비용* → *VIP가 최대 부채* 위험
- 로컬 모델 = *고정 비용*(기기 하드웨어)
- → **반복 작업·간단 변환은 로컬로 옮기면 *변동 비용 위험 차단***

### [9초 사고 / DB 삭제는 당신이](2026-05-07-ai-didnt-delete-your-database-you-did.md)와의 결합
- 로컬 AI는 *기기 외부 권한 없음* → DB 삭제 같은 *destructive 외부 호출 불가*
- 어제 정리한 [내장 보안 토큰](../backend/2026-05-11-builtin-security-tokens.md)과 정확히 같은 패턴 — *민감 결정은 기기 안에서, 외부 권한 분리*
- 두 글이 ***"로컬 우선" 보안 모델*** 한 짝

### *Camry 라인 = 로컬 AI 최적*
[Ding Camry vs Ferrari](2026-05-07-claude-code-not-making-your-product-better.md):
- *Camry 라인* (반복적·표준 작업) = 로컬 AI로 충분
- *Ferrari 라인* (창의·차별화) = 클라우드 최고 모델
- → **이 글은 Camry 라인의 *비용·프라이버시 최적화* 처방**

### 한국 IT 환경 적용
- 한국 *개인정보 보호법*은 *국외 이전 동의* 요구 → 로컬 AI는 이 부담 *자동 우회*
- 다만 *서버급 로컬 모델 운영*은 인프라 부담 — 모바일·PC 클라이언트가 핏

### 가든 *위험 인덱스*에 추가
- *클라우드 의존 = 제품 본질 변경*은 [Glaser 조직 학습](../engineering/2026-05-07-when-everyone-has-ai-but-company-learns-nothing.md)에서 *벤더 종속*과 같은 결의 다른 표현
- 위험 인덱스에 *벤더 종속·외부 데이터 이전·변동 비용* 묶음 추가 후보

### MangoLove 적용 후보
- *MangoLove `/strict` 단계*에서 *외부 API 호출이 필요한가?* 자문 추가
- *데이터 변환만으로 충분*하면 → *로컬 도구·스크립트*가 답
- 매번 Claude 호출 = *비용 + 외부 이전* 누적

### 반론·균형점
- *로컬 모델 = 클라우드보다 약함* 명백한 트레이드오프
- Apple 생태계 의존 (FoundationModels) — *다른 OS·기기*에서 동등 인프라 부재
- *복잡한 reasoning·코드 생성*은 여전히 클라우드 필수
- 핵심: ***작업 분리** — 변환·요약은 로컬, 추론·생성은 클라우드*

## 즉시 시도할 액션 3가지
1. **PickMe·CRS Admin의 *로컬 AI 후보 작업 5개* 식별** — 사용자 자기 데이터 변환·정규화 영역
2. **MangoLove `/strict`에 *외부 API 필요한가?* 자문 추가** — 변동 비용·외부 이전 인지 게이트
3. **호스피탈리티 PII 처리 영역 *로컬 AI 적용 우선순위* 매트릭스** — 여권 OCR·리뷰 분류·자동완성 후보

## 연관 자료
- [`ai/2026-05-07-ai-didnt-delete-your-database-you-did.md`](2026-05-07-ai-didnt-delete-your-database-you-did.md) — 위험 표면 의문 / 이 글 = 전송 표면 의문 (같은 정신)
- [`backend/2026-05-11-builtin-security-tokens.md`](../backend/2026-05-11-builtin-security-tokens.md) — *로컬 우선* 보안 모델의 짝
- [`engineering/2026-05-08-lean-analytics-reconsidered.md`](../engineering/2026-05-08-lean-analytics-reconsidered.md) — *성공 태스크당 비용*의 로컬 해답
- [`ai/2026-05-07-claude-code-not-making-your-product-better.md`](2026-05-07-claude-code-not-making-your-product-better.md) — Camry 라인 = 로컬 AI 최적
- [`engineering/2026-05-07-when-everyone-has-ai-but-company-learns-nothing.md`](../engineering/2026-05-07-when-everyone-has-ai-but-company-learns-nothing.md) — 벤더 종속 위험과 결합
- 도구: Apple FoundationModels, Ollama (로컬 LLM 일반)

## 한 달 뒤 회고
- [ ] PickMe·CRS Admin 로컬 AI 후보 작업 5개 메모를 작성했는가
- [ ] MangoLove에 *외부 API 필요한가?* 자문이 추가됐는가
- [ ] 한 번이라도 *로컬 작업으로 충분*했는데 *클라우드로 보낸* 사례를 식별했는가
- [ ] 호스피탈리티 PII 영역 로컬 AI 우선순위 매트릭스가 작성됐는가
