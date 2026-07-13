---
title: "외부 루프를 소유하라 (Addy Osmani) — 에이전트가 내부 루프를 가져가면 인간에게 남는 것은 품질·판정·설명 책임(Quality/Verdict/Answerability)"
source_title: "Own the Outer Loop — Why loop engineering needs a human at the boundary"
source_url: "https://addyo.substack.com/p/own-the-outer-loop"
source_name: "addyo.substack.com (Addy Osmani)"
referrer_url: "https://news.hada.io/topic?id=31372"
published_at: "2026-07-09"
summarized_at: "2026-07-13"
category: "engineering"
tags: ["outer-loop", "agentic-engineering", "accountability", "back-pressure", "cognitive-debt", "taste", "verification-gap", "brownfield"]
---

# 외부 루프를 소유하라 (Addy Osmani) — 에이전트가 내부 루프를 가져가면 인간에게 남는 것은 품질·판정·설명 책임(Quality/Verdict/Answerability)

> 출처: [Own the Outer Loop](https://addyo.substack.com/p/own-the-outer-loop) (Addy Osmani, Google Chrome 엔지니어링 리드) · 정리일 2026-07-13

## 한 줄 요약

**에이전트가 "조사 → 구현 → 검증 → 반복"이라는 내부 루프(inner loop)를 시간 단위로 자율 수행하는 시대에, 엔지니어의 일은 모든 내부 결정을 통제하는 것이 아니라 작업이 프로덕션에 진입하는 경계 — 외부 루프(outer loop) — 를 소유하는 것으로 이동한다. 자율성은 최대화 대상이 아니라 "중단·조절·검증이 가능하고 인간의 판단 지점이 보존되는 수준"으로 설계돼야 하며, 그 경계를 지키는 세 축이 Quality(배포 전 증거), Verdict(프로덕션 진입 판정), Answerability(왜 그렇게 판단했는지 설명할 수 있는 능력)이다.**

## 핵심 포인트

- **모델은 엔진일 뿐, 하네스가 자동차다.** 파일·도구·메모리·샌드박스·권한·관측성·복구가 결합돼야 작업이 안전해진다. 완료 판정은 모델의 자기 평가가 아니라 **독립적 검증**이 내린다.
- **Quality / Verdict / Answerability** — 품질은 증거를 만들고, 판정은 인간이 내리며(출시·차단·방향 전환·범위 축소·가드레일 추가·거부), 설명 책임은 그 판정을 나중에 재구성 가능하게 만든다.
- **신뢰-검증 격차** — Sonar 2026 기준 커밋 코드의 **42%가 AI 생성/보조**인데, 검증 프로세스는 그에 맞게 재설계되지 않았다. GitLab 2026 연구도 병목이 검토·검증이며 **거버넌스가 대부분 사후에 적용**된다고 지적.
- **AI 위임의 세 가지 숨은 비용** — ① **인지적 항복**: AI가 틀렸을 때조차 약 3/4이 그대로 수용했고 오히려 더 확신했다(Wharton) ② **인지 부채**: AI로 코딩한 엔지니어의 이해도가 17%p 낮음(50% vs 67%, Anthropic) ③ **오케스트레이션 비용**: 에이전트는 병렬화되지만 **인간의 인지 대역폭은 병렬화되지 않는다**.
- **역압(back-pressure)으로 품질을 만든다** — 타입 검사·테스트·훅·샌드박스·감사 로그·모니터 같은 **기존 신호를 자율성 조절 장치로 재배치**한다. 새 도구를 사는 문제가 아니다.
- **인간이 남아야 할 네 개의 루프** — 제약(constraints) / 표본 검토(sampling) / 감사(audit) / 소유권(ownership).
- **Alpha·Decay·Taste** — 누구나 만들 수 있는 시대의 알파는 **"무엇을 만들지 고르는 능력"**. Taste는 재능이 아니라 이름 붙이기 → 비평·사례 연습 → 근거 명시화로 훈련 가능한 능력.
- **행위 주도권의 사다리** — 문제 표시 → 조사 → 실행 → 진단 → 해결책 제안 → 수정 권고 → 해결. 가장 높은 단은 **분별력**: "찾았지만 고칠 가치가 없다"고 말할 수 있는 능력.
- **브라운필드가 진짜 최전선** — 그린필드는 통제 가능하지만, 브라운필드는 코드 밖 지식(프로덕션 실제 동작·고객 기대·마이그레이션·암묵 가정·데이터 특이성·런북·누적된 상처)을 명시적 제약과 테스트로 형식화해야 에이전트가 안전하게 일한다.

## 인상 깊은 문장

> "Someone must be able to explain exactly what changed, why it was safe, and what will happen if they're wrong."

> "When the AI was wrong, nearly three-quarters of people accepted it anyway, and felt more confident than they would have without the AI."

> "Only people can choose. Only people inherit consequence. Agents cannot inherit consequences."

> "The half-life of an edge is one release, but the half-life of a signature is a career."

## 댓글

**댓글 0개.** GN⁺ 큐레이션 포스트이나 HN/Lobste.rs 토론 인용 블록이 없고, 게시 직후라 토픽 페이지에 붙은 의견 클러스터도 없음(본문 패스·댓글 전용 패스 2회 확인). 확장할 외부 의견 클러스터 없음.

## 내 생각 · 적용점

### 핵심 전이 1 — "자율성은 최대화 대상이 아니라 설계 변수"라는 재정의

이 글의 가장 중요한 문장은 이것이다. 좋은 AI 도입의 지표는 "얼마나 많이 맡겼는가"가 아니라 **"중단·조절·검증이 가능하고 인간의 판정 지점이 보존되는가"**다. 그렇다면 조직의 AI 정책은 "AI 사용 허용/금지"가 아니라 **어느 경계에 인간의 Verdict를 배치할 것인가**로 쓰여야 한다. [[2026-07-03-agent-autonomy-levels]]의 자율성 레벨 분류와 [[2026-07-03-short-leash-ai-coding-method]]의 "짧은 목줄"이 이 글에서 하나의 프레임으로 통합된다. [[2026-07-03-art-of-loop-engineering]]이 루프의 *안쪽*을 다뤘다면, 이 글은 **루프의 *경계*** 를 다룬다.

### 핵심 전이 2 — 역압(back-pressure): 이미 가진 신호를 자율성 조절 장치로 재해석

거버넌스를 사후 코드 리뷰로만 하면 이미 늦다. **타입 검사·테스트·훅·샌드박스·감사 로그·모니터는 원래 품질 신호였지만, 에이전트 시대에는 "에이전트를 멈출 수 있는 장치"로 재배치**된다. 이건 새 도구 구매 문제가 아니라 기존 자산의 재해석 문제라서, CRS처럼 이미 CI·테스트·감사 로그가 있는 곳에서 즉시 실행 가능하다. 어제 정리한 [[2026-07-12-write-code-like-a-human-will-maintain-it]]의 "정적 분석기를 파이프라인에"와 정확히 같은 처방이고, 이 글은 거기에 **"왜"**(자율성 조절)를 붙여준다.

### 핵심 전이 3 — 인지 부채와 인지적 항복은 감상이 아니라 측정된 리스크

Wharton(틀린 AI 답도 3/4이 수용, 오히려 더 확신)과 Anthropic(이해도 17%p 하락)의 수치는 "AI 쓰면 실력이 준다"는 막연한 우려를 **숫자로 바꿔놓는다**. [[2026-06-08-is-ai-eroding-our-skills-nature]]·[[2026-07-10-llm-burnout]]의 논점에 실증을 더한다. 개인 차원의 처방은 명확하다 — **"설명할 수 없으면 승인하지 않는다"**를 개인 규칙으로 만드는 것. 그리고 "에이전트는 N배로 늘려도 내 주의력은 병렬화되지 않는다"는 지적(암달의 법칙의 인간 버전)은, 에이전트를 몇 개 돌리는가보다 **내 주의력을 어디에 쓰는가**가 실질 처리량을 정한다는 뜻이다.

### 핵심 전이 4 — 브라운필드 = 형식화되지 않은 지식의 저장소

에이전트가 레거시에서 실패하는 이유는 코드가 어려워서가 아니라 **코드 밖 암묵지**(왜 이 예외가 있는지, 이 고객은 무엇을 기대하는지, 이 데이터는 왜 이상한지) 때문이다. 즉 AI 시대의 문서화·테스트·런북은 "사람을 위한 배려"가 아니라 **에이전트가 일할 수 있게 만드는 제약 인프라**다. 레거시가 많은 조직일수록 레버리지가 크다 — CRS 같은 장수 예약·요금 도메인에 정확히 해당한다.

## 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 별도 안내)

## 연관 자료
- [[2026-07-03-agent-autonomy-levels]] — *자율성 레벨 분류, 이 글의 "설계 변수로서의 자율성"과 통합됨*
- [[2026-07-03-art-of-loop-engineering]] — *루프의 안쪽(내부 루프) vs 이 글의 경계(외부 루프)*
- [[2026-07-12-write-code-like-a-human-will-maintain-it]] — *"지름길이 내일의 기본값"과 역압 처방이 같은 축*
- [[2026-06-08-is-ai-eroding-our-skills-nature]] — *인지 부채의 실증 수치가 여기 붙는다*

## 한 달 뒤 회고
*(2026-08-13 즈음 — CRS에 "설명할 수 없으면 승인하지 않는다"를 리뷰 규칙으로 넣었는지, 기존 CI/테스트/감사 로그를 "에이전트 정지 장치"로 재배치했는지, 브라운필드 암묵지를 명시적 제약으로 형식화한 사례가 있는지 기록.)*
