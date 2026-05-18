---
title: "AI는 당신의 프로세스를 빠르게 만들지 못한다 — 가든 *5층 추상화*에 *상류 명세*를 6번째 층(또는 직교 차원)으로 추가하는 글"
source_title: "I don't think AI will make your processes go faster"
source_url: "https://www.frederickvanbrabant.com/blog/2026-05-15-i-dont-think-ai-will-make-your-processes-go-faster/"
source_name: "Frederik Van Brabant 개인 블로그"
referrer_url: "https://news.hada.io/topic?id=29610"
published_at: "2026-05-15"
summarized_at: "2026-05-18"
category: "ai"
tags: ["theory-of-constraints", "ai-productivity", "requirements", "bottleneck", "upstream-vs-downstream", "specification", "frederik-van-brabant"]
---

# AI는 당신의 프로세스를 빠르게 만들지 못한다 — 가든 *5층 추상화*에 *상류 명세*를 6번째 층(또는 직교 차원)으로 추가하는 글

> 출처: [I don't think AI will make your processes go faster — Frederik Van Brabant](https://www.frederickvanbrabant.com/blog/2026-05-15-i-dont-think-ai-will-make-your-processes-go-faster/) · GeekNews 경유 [news.hada.io/topic?id=29610](https://news.hada.io/topic?id=29610) · 정리일 2026-05-18

## 🔖 한 줄 요약
*소프트웨어 개발의 진짜 병목은 *코딩*이 아니라 *모호한 요구사항을 명확하게 정의하는 과정**이며, AI는 *하류(코드 생성)*만 자동화하므로 *전체 시스템 속도*는 변하지 않는다 — 오히려 *비병목 가속*이 *재작업 재고를 누적*시킬 위험. **Theory of Constraints(제약 이론)의 AI 시대 적용**. 처방: *병목 자체*가 아니라 *병목의 입력 품질·예측 가능성*을 높여라.

## 🧩 핵심 포인트

- ***진정한 병목은 코딩이 아님***. 수십 년 경력 개발자들의 공통 증언 — 소프트웨어 개발이 지연되는 이유는 *타이핑 속도*가 아니라 *모호한 요구사항 명확화*. 코드 생성은 전체 사이클의 *작은 조각*.
- **AI도 *상류 문제*에 같은 압력**. AI 코드 생성이 정확한 결과를 내려면 *전문가의 깊은 개입과 상세한 명세*가 필수. *AI에게 던질 수 있는 *완전한 명세*가 있다면 그 명세를 작성한 사람이 이미 *문제의 70%*를 해결한 셈*. AI가 *상류 비용*을 *없애는 게 아니라 *옮긴다***.
- **누락된 *핸드홀딩 비용***. AI 성공 사례들이 *공통적으로 간과*하는 것 — *AI를 제대로 작동시키기 위한 사전 작업*(맥락 정리·예시 준비·검증 절차·반복 피드백). 이 비용이 *광고에서 사라지고 ROI 계산에서 빠진다*.
- **처방 — *병목의 *입력 품질과 예측 가능성*을 높여라***. 글의 핵심 한 줄. 병목 *자체*를 가속화하려는 시도(AI 코드 생성)는 *틀린 곳에 투자*. *병목이 받을 입력*(요구사항·맥락·예시)을 *깨끗하게 만드는 투자*가 ROI의 진짜 자리.
- **댓글의 *반박과 현실 관찰***. 반박 — AI는 *프로토타입·문서화·배포* 등 *개발 외 영역*까지 가속화 가능. 현실 — 많은 조직에서 *AI 도입 후에도 출시 속도가 변하지 않거나 더 느려졌다*는 보고. **두 입장 모두 일리 있고 *분기점*은 *조직의 *상류 명세 품질***.

## 📜 인상 깊은 문장

> 진짜 병목은 *타이핑 속도*가 아니라 *모호한 요구사항을 명확하게 정의하는 과정*이다.

> 병목 *자체*가 아니라 *병목이 받을 입력의 품질과 예측 가능성*을 높여라.

## 💭 내 생각 · 적용점

**가든의 *5층 추상화*에 *6번째 층*(또는 *직교 차원*)을 추가한다.**
지금까지 가든이 정리한 5층:
- *Model → Harness → Platform → Organization → Governance*

이 글이 던지는 것은 **모든 층보다 *위에 있는*** — 혹은 *모든 층의 *입력으로 작용하는*** — *상류 명세(Specification / Requirements)* 라는 6번째 단위. 두 가지 모델 모두 가능:

**모델 A — *수직 6층***:
*Specification → Model → Harness → Platform → Organization → Governance*
*상류 명세*가 *모델 위*에 *언제나* 있고, *모든 하류 자동화*는 *상류 명세 품질에 곱해진다*.

**모델 B — *5층 × 상류/하류 직교***:
- *상류*(Spec) ↔ *하류*(Output) 가 *각 층마다* 분리됨
- *Model 상류* = 학습 데이터·튜닝 명세 / *Model 하류* = 생성 토큰
- *Harness 상류* = 시스템 프롬프트·스킬 정의 / *Harness 하류* = 에이전트 행동
- *Platform 상류* = 내부 고객 요구사항·SLO / *Platform 하류* = API/CLI 호출
- *Organization 상류* = 미션·전략 / *Organization 하류* = 제품·운영
- *Governance 상류* = 가치·미션 명문화 / *Governance 하류* = 의사결정·자본 배분

**모델 B가 더 정확** — *상류/하류는 *층의 위/아래*가 아니라 *각 층의 *내부 구조**. AI가 자동화하는 것은 *모든 층의 하류 측면*이고, *AI가 자동화 못 하는 것은 *모든 층의 상류 측면**. 가든이 정리해 온 자산이 *상류 자산*에 압도적으로 치우쳐 있었음이 이제 보인다 — [Anthropic Why 정렬]·[Naur 이론 형성]·[Ries Director's Oath]·[Luca Valli 5대 기둥 *큐레이션*]·[Eugene Yan *컨텍스트 인프라*]·[무신사 *시스템 프롬프트로 행동 공간 좁히기*]는 *모두 상류 자산*. **가든이 *상류 자산*을 누적해 온 것이 *복리 자산화*의 정확한 메커니즘**.

**Theory of Constraints의 AI 시대 변형 — 정확한 명제**:
1. *시스템 속도 = 병목 속도*
2. *비병목 가속은 시스템 속도를 못 바꾼다*
3. *비병목 가속은 *재고 누적*을 만든다*
4. **AI는 *비병목(코드 생성)*을 가속화한다**
5. **따라서 *AI는 재고(애매한 요구사항으로 만든 코드)를 누적*시킨다**
6. *그 재고는 *재작업 비용*으로 *나중에* 청구된다*

이게 [Hashimoto AI 광기](2026-05-16-hashimoto-ai-mass-psychosis.md)의 *아키텍처 부식*·[Garry Tan Ratchet](2026-05-14-ai-coding-complexity-ratchet-garry-tan.md)의 *복잡성 누적*·[Reddit Claude→Codex의 *40% 완료 보고*](2026-05-17-claude-to-codex-migration-reddit.md)의 *모든 메커니즘의 공통 근저*. **3개 글이 *Theory of Constraints의 다른 표현*이었다**는 게 이번 글로 보이는 종합.

**[Tuhin Nair 시니어 전수 실패](../career/2026-05-14-why-senior-developers-fail-to-communicate-expertise.md)와의 *같은 영역 다른 각도***.
Tuhin Nair는 *시니어가 비즈니스 언어로 번역 실패*. 이 글은 *번역의 *대상이 되는 명세 자체*가 *애매하다*. 두 글이 *같은 *상류 문제*의 다른 각도* — Nair는 *번역 기술*, 이 글은 *번역 *원천 텍스트*의 품질*. 두 글의 종합 처방: ***상류 명세를 *비즈니스 언어로 *번역 가능한 형태*로 정제하는 단계***가 *AI 시대 가장 큰 ROI 단위*.

**[Eugene Yan *복리* 5원칙](2026-05-18-eugene-yan-compounding-with-ai.md)의 *상류 측 해석***.
Eugene Yan의 5원칙 중 *컨텍스트 인프라*(MCP·CLAUDE.md 온보딩 문서처럼)는 *상류 명세 인프라*. *취향 설정화*도 *상류 명세*. 5원칙 중 3~5번(검증·위임·피드백)이 *하류 측면*이라면 1~2번(컨텍스트·취향)은 *상류 측면*. **AI 협업의 복리는 *상류 자산이 얼마나 깊이 박혀 있는가*에서 결정**된다는 가설이 *이 글에 의해 강하게 확정*. *Eugene Yan 글의 첫 두 원칙이 1순위*임이 이번 글로 분명해진다.

**[Luca Valli 플랫폼 엔지니어링](../engineering/2026-05-18-platform-engineering-end-to-end-luca-valli.md)의 *5대 기둥 중 큐레이션·소프트웨어 추상화*는 정확히 *상류 명세 작업***.
*큐레이션* = *조직이 무엇을 지원할지에 대한 *상류 결정**. *API/CLI 기반 추상화* = *플랫폼 사용 방식의 *상류 명세**. 두 기둥이 *플랫폼 가치의 *복리 자리***. *나머지 3개 기둥*(메타데이터·중간값 개발자·운영 기초)은 *하류 자리*. **플랫폼 ROI는 상류 2개 기둥에서 결정**된다는 가설이 *이 글의 명제와 정확히 일치*.

**[a16z System of Intelligence](../career/2026-05-18-system-of-record-to-system-of-intelligence-a16z.md)와의 *결정적 종합***.
a16z는 *가치 자리가 *데이터 저장소(SoR) → AI 추론 계층(SoI)*로 *위로* 이동*한다고 했다. 이 글의 명제는 *AI 시대 진짜 가치 자리는 *위*가 아니라 *상류**라는 것. **두 가설이 *다른 차원의 같은 명제*** — SoI는 *데이터/추론* 관점에서, 이 글은 *프로세스/병목* 관점에서. *상류 명세 = SoI의 *진짜 비즈니스 가치 단위***. 즉 *AI 추론 계층의 차별점은 *추론 자체*가 아니라 *어떤 상류 명세 데이터로 학습시키고 어떤 상류 명세로 요청하는가**에 있다는 정밀한 결론.

**가든 자체에 대한 자가 적용 — *7번째 자가 진단***.
지난 6번 자가 진단:
1. [Hashimoto] "정리 건수 ≠ 이해 깊이"
2. [Amazon Goodhart] "한 달 뒤 회고가 실제로 작동하는가"
3. [Reddit Claude→Codex] "비판적 글에 대한 편향"
4. [Ascetic] "원칙 정련 vs 과잉 도구화"
5. [Luca Valli] "5대 기둥 중 가장 약한 영역 = 기초로 운영"
6. [Eugene Yan] "복리 시험 — 글이 다른 글에 어떻게 작용하는가"

**7번째 = *상류 자산 시험***:
> *가든 자산 중 *상류 자산(이론·원칙·메타프레임·자가 진단)*과 *하류 자산(특정 도구·구현 사례·시점적 보고)*의 비율은?*

솔직한 답: *가든은 *상류 자산이 매우 강함*. [Naur]·[Anthropic Why]·[Ries Director's Oath]·[Tuhin Nair 시니어 전수]·[Jay Gup 경험=세금]·[Ascetic askesis]·[Eugene Yan 5원칙]·[a16z SoI]·[이 글의 TOC] — *9개 이상의 상류 자산*이 *복리 핵심*. *하류 자산*(특정 사례)도 있지만 *항상 상류 메타와 연결*. 이게 가든이 *7주 만에 5층 추상화·10칸 매트릭스·25칸 체크리스트*를 도출한 정확한 메커니즘.

**MangoLove·CRS·BugSip 적용 후보 — *상류 측 처방 라인***.
- **MangoLove 자문 도구에 *상류 명세 진단을 1순위*로**. 클라이언트가 *AI 도입*을 묻기 전에 *상류 명세 품질을 점검*. *명세가 애매한 채로 AI를 도입하면 비병목 가속으로 재고 누적*만 일어난다는 *진단 명제*. [Tuhin Nair *작고 빠른 시도* 처방]과 [이 글의 *상류 입력 품질* 처방]을 *짝*으로 운용.
- **CRS의 *요구사항 명세 자동화 PoC***. *호텔 예약 변경 요청·정책 변경* 같은 빈번한 요구사항을 *구조화된 명세 템플릿*으로 작성하는 도구. AI 코드 생성보다 *AI 명세 정제*가 ROI가 더 큰 자리.
- **BugSip 기획에 *상류 명세 정제 라인***. *코드 리딩 = *상류 명세 추출 훈련**. *왜 이 코드가 이렇게 만들어졌는가*를 *코드에서 거꾸로* 추출하는 능력이 *상류 명세 작성 능력*. **BugSip = *상류 명세 능력 훈련 도구*** 라는 *재정의*가 가능 — 가치 제안이 *코드 리딩*에서 *상류 사고 훈련*으로 한 단계 위로.
- ***Anthropic 6/15 정책 답변 v4***: v3까지는 *카테고리별로 답이 다름*까지 갔다. v4는 *상류/하류 분리* — **(v4) *대화형 = 상류 명세 정제용*, *비대화형 자동화 = 하류 코드 생성용*. *상류 사용은 옮길 필요 없음(Claude 인터랙티브가 강함), 하류 사용은 공급자 다중화 + 로컬 모델 보조*. 상류/하류의 분리가 *Anthropic이 6/15에 *실제로 박은 신호***로 해석된다**.

## 🔗 연관 자료
- [Tuhin Nair — 시니어 전수 실패](../career/2026-05-14-why-senior-developers-fail-to-communicate-expertise.md) — *같은 *상류 문제*의 다른 각도* (번역 기술 vs 명세 품질)
- [Hashimoto — AI 집단 광기](2026-05-16-hashimoto-ai-mass-psychosis.md) — *재고 누적(아키텍처 부식)*의 광기 차원 표현
- [Garry Tan — 복잡성 래칫](2026-05-14-ai-coding-complexity-ratchet-garry-tan.md) — *재고 누적*의 *시간 차원* 표현
- [Reddit — Claude→Codex 전환](2026-05-17-claude-to-codex-migration-reddit.md) — *40% 완료 보고*의 정확한 근저(애매한 명세)
- [Eugene Yan — 복리 5원칙](2026-05-18-eugene-yan-compounding-with-ai.md) — *원칙 1~2번 = 상류 측면*이 *1순위*임이 이번 글로 확정
- [Luca Valli — 플랫폼 엔지니어링](../engineering/2026-05-18-platform-engineering-end-to-end-luca-valli.md) — *5대 기둥 중 큐레이션·소프트웨어 추상화 = 상류 자산*
- [a16z — System of Intelligence](../career/2026-05-18-system-of-record-to-system-of-intelligence-a16z.md) — *위로 이동* + *상류로 이동*의 정밀한 종합
- [Anthropic — Teaching Claude Why](2026-05-14-teaching-claude-why-alignment-training.md) — *Why = 상류 명세*
- [Naur — Programming as Theory Building](../engineering/2026-05-14-naur-programming-as-theory-building.md) — *이론 = 상류 명세의 머릿속 형태*
- [Eric Ries — Incorruptible](../career/2026-05-14-eric-ries-incorruptible-mission-protection.md) — *정관에 미션 구체화 = 거버넌스 차원 상류 명세*

## 📝 한 달 뒤 회고
<!-- 6월 중순:
- *5층 × 상류/하류 = 10칸 매트릭스*가 *5층 × 내부/외부 = 10칸*과 함께 *총 5층 × 2 × 2 = 20칸* 진단 도구로 확장되었는가?
- MangoLove 자문 1순위 진단을 *상류 명세 품질*로 박았는가?
- CRS 요구사항 명세 자동화 PoC를 *실제로* 시도했는가? AI 코드 생성보다 ROI가 더 큰가?
- BugSip 가치 제안을 *코드 리딩 → 상류 사고 훈련*으로 재정의하는 시도가 있었는가?
- *Anthropic 6/15 정책 답변 v4* (상류/하류 분리)가 사용자 또는 자문 클라이언트와의 *실제 대화*에 *인용*되었는가?
- 7번째 자가 진단 *상류 자산 시험*의 한 달 결과 — 가든이 *상류 자산을 계속 우세하게* 유지했는가, *하류 자산(시점적 사례)*로 *기울었는가*?
-->
