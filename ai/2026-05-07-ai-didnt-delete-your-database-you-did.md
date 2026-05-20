---
title: "AI가 당신의 DB를 삭제한 게 아니라, 당신이 삭제한 것이다"
source_title: "AI didn't delete your database, you did"
source_url: "https://idiallo.com/blog/ai-didnt-delete-your-database-you-did"
source_name: "Ibrahim Diallo's Blog"
referrer_url: "https://news.hada.io/topic?id=29213"
published_at: "2026-05"
summarized_at: "2026-05-07"
category: "ai"
tags: ["AI사고", "시스템설계", "권한분리", "책임경계", "자동화", "CI/CD"]
---

# AI가 당신의 DB를 삭제한 게 아니라, 당신이 삭제한 것이다

> 출처: [Ibrahim Diallo — AI didn't delete your database, you did](https://idiallo.com/blog/ai-didnt-delete-your-database-you-did) · 레퍼러: [GeekNews 29213](https://news.hada.io/topic?id=29213) · 정리일 2026-05-07

## 한 줄 요약
AI 에이전트가 프로덕션 DB를 삭제한 사건의 진짜 원인은 **"전체 DB를 *공개 API로* 삭제할 수 있는 시스템"** — AI가 아니어도 언젠가 누군가 그 버튼을 누른다.

## 핵심 주장

### 1. 진짜 질문 — 왜 그런 API가 *존재*하는가?
> "Why does a public-facing API that can delete all your production databases even exist?"

> "It's like putting a self-destruct button on your car's dashboard."

이 한 문장이 글의 핵심: **사고는 AI 때문이 아니라 *시스템 설계가 이미 사고를 허용한 상태*였기 때문**.

### 2. 2010년 SVN 사례 (역사 반복)
저자는 자신이 *수동 배포* 중 trunk를 삭제했던 경험 공유.
- 그때도 *사람의 실수*였음
- 결과: **CI/CD 파이프라인 자동화** 도입 → 같은 실수 재발 방지
- *교훈*: 사람이든 AI든 *실수의 결과를 시스템 설계가 결정한다*

### 3. AI ≠ 진짜 자동화
> "AI is more like me copying and pasting branches, it's bound to make mistakes."

- *진짜 자동화*: 같은 작업을 *같은 방식*으로 반복 보장
- **AI는 토큰 생성 시스템** — 결정성 X, 매번 약간 다르게 행동
- 그래서 *AI 도입은 사람의 수동 작업을 줄여주는 것이 아니라*, *복붙하는 사람을 한 명 더 추가하는 것*에 가깝다

### 4. 권한 분리의 부재
- 단일 토큰으로 *광범위한 권한* (조회·생성·**삭제** 모두)
- *"이 토큰을 자동화에 줘도 되나?"* 가 아니라 *"이 토큰이 *애초에* 만들어졌어야 하나?"* 가 옳은 질문

### 5. 책임의 경계
> "Don't let your CEO or CTO write the code."

> "Build a process where competent developers use it as a tool to augment their work, not a way to avoid accountability."

- AI를 *책임 회피 수단*으로 쓰면 가장 위험
- *유능한 개발자가 도구로* 사용하는 프로세스가 답

### 댓글 논점
- **권한 분리**: 프로덕션과 개발 환경의 접근 권한 *완전 분리*
- **샌드박스 필요성**: 크로스플랫폼 샌드박싱 기술
- **책임 분배 논쟁**: *도구 사용자 책임* vs *설명 불가능 AI 시스템 자체에 대한 기업 책임*

## 인상 깊은 문장

> "Why does a public-facing API that can delete all your production databases even exist?"

> "It's like putting a self-destruct button on your car's dashboard."

> "AI is more like me copying and pasting branches, it's bound to make mistakes."

> "Don't let your CEO or CTO write the code."

> "Build a process where competent developers use it as a tool to augment their work, not a way to avoid accountability."

## 내 생각 · 적용점

### 가든 내 *9초 사고 시리즈* 두 번째
지난 [9초 사고 글](2026-04-27-ai-agent-deleted-production-database.md)이 *5겹 시스템 실패 분석*이었다면, 이 글은 같은 사건의 **책임 귀속 강조**. 두 글이 짝:
- **9초 사고**: *어떻게* 일어났는가 (메커니즘)
- **이 글**: *왜* 일어났는가 (책임)

핵심 차이가 만든 메시지: *"5겹의 가드레일 부재"보다 *"애초에 그 버튼을 만든 결정"*이 더 근원적*. 디아지오는 *시스템 위생을 책임의 언어로* 전환한다.

### *Agent-Default Posture*의 강한 형태
[확률적 창업자](../career/2026-05-05-rise-of-the-probabilistic-founder.md)가 *"도구 탓 X, 명세·리뷰·오케 부족 탓"*이었다면, 이 글은 *"도구 탓 X, **시스템 설계** 탓"*. 같은 정신을 *인프라 층위*에 적용.

### Diallo의 SVN 사례 = *사람과 AI는 같은 실수를 한다*
- 2010년: 사람이 *수동으로* 실수 → CI/CD로 해결
- 2026년: AI가 *9초만에* 실수 → ??? (이제 답을 만들어야 한다)

**"AI가 새 위험"이 아니라 "AI가 *기존 위험의 빈도와 속도*를 올렸다"** 는 더 정확한 진단. 9초로 단축된 결정 시간은 *시스템 설계가 더 보수적이어야* 함을 의미.

### 호스피탈리티/CRS 적용
이번 주 작업한 [CRS-739 race condition](../) 케이스와 같은 결: **destructive operation의 가드는 *AI가 오든 사람이 오든* 필요**. 점검 후보:

| 영역 | 점검 질문 |
|---|---|
| **CRS·crs-be** | *"전체 예약 삭제"* / *"전체 호텔 비활성화"* 같은 destructive 엔드포인트가 *공개 API*에 노출돼 있는가? |
| **Connectivity** | OTA 동기화에서 *전체 인벤토리 wipe*가 가능한 경로가 있는가? |
| **PickMe** | 사용자 데이터 일괄 처리 엔드포인트의 *권한 범위*는? |
| **운영 토큰** | 단일 토큰으로 *조회+삭제*가 모두 가능한 곳이 있는가? |

**가장 좋은 가드**: *destructive 엔드포인트 자체를 만들지 않는다* (있더라도 별도 *관리 채널*에서만, 다중 승인 + dry-run + delay 필수).

### Diallo의 이전 글 *"Don't let your CEO or CTO write the code"*
한국 IT 환경에서 정확히 자주 일어나는 함정. *기술 책임자가 직접 운영 명령*을 실행하는 케이스 → 책임 위계가 *기술 검토 없이* 작동.
- 이번 주 정리한 [Best Employee → Worst Manager](../career/2026-05-07-best-employee-becomes-worst-manager.md)와 직접 연결 — 잘못 승진된 매니저가 *익숙한 코딩으로 도망*하는 패턴이 *프로덕션*에서 일어나면 정확히 이 시나리오.

### 짧지만 강한 글
이 글의 미덕은 **5분 분량**. 비슷한 메시지의 [9초 사고 글](2026-04-27-ai-agent-deleted-production-database.md)이 *상세한 5겹 분석*이라면, Diallo는 *한 문장*으로 같은 진단을 한다:

> *"왜 그런 API가 존재하는가?"*

좋은 비판 글의 형태 — 메커니즘 분석 없이 *프레임 자체*를 흔든다.

### 반론·균형점
- "API 자체를 없애라"는 *완벽주의*. 실제로는 *관리 도구·마이그레이션·재해 복구* 등 destructive op이 *어딘가에는* 있어야 함.
- 핵심은 *없애기*가 아니라 *제대로 가드된 채널로만 노출*. *공개 API*에서 *별도 관리 콘솔*로 옮기는 것만으로도 위험은 100배 감소.
- *"AI는 자동화가 아니다"*는 강한 표현. 실제로는 *결정적 부분(테스트·파이프라인)*과 *확률적 부분(에이전트 결정)*을 *분리해서* 자동화로 활용 가능. [하네스 엔지니어링](2026-04-28-agent-harness-engineering.md)의 정확한 처방.

## 즉시 시도할 액션 3가지
1. **CRS·Connectivity·PickMe 백엔드의 destructive 엔드포인트 전수 감사** — *공개 API*에 노출돼 있으면 *관리 채널*로 이동
2. **운영 토큰 권한 매트릭스** — 단일 토큰으로 destructive op 가능한 곳 식별 후 분리
3. **재해 복구 시나리오에서 *AI든 사람이든 같은 가드* 적용 검토** — Diallo의 SVN 사례처럼 *CI/CD 자동화*가 답이었듯, *AI 시대의 같은 답*은 무엇인가?

## 연관 자료
- [`ai/2026-04-27-ai-agent-deleted-production-database.md`](2026-04-27-ai-agent-deleted-production-database.md) — **같은 사건 5겹 분석**. 메커니즘 ↔ 이 글 책임 귀속
- [`career/2026-05-05-rise-of-the-probabilistic-founder.md`](../career/2026-05-05-rise-of-the-probabilistic-founder.md) — *Agent-Default Posture*의 *인프라 층위* 적용
- [`ai/2026-04-28-agent-harness-engineering.md`](2026-04-28-agent-harness-engineering.md) — *위험을 좁은 경계 뒤에* 두는 하네스 처방
- [`engineering/2026-05-04-mercury-couple-million-lines-of-haskell.md`](../engineering/2026-05-04-mercury-couple-million-lines-of-haskell.md) — *경계의 출력은 보수적* + Records of Functions
- [`ai/2026-05-05-agentic-coding-is-a-trap.md`](2026-05-05-agentic-coding-is-a-trap.md) — 같은 비판적 흐름

## 한 달 뒤 회고
- [ ] CRS·Connectivity·PickMe destructive 엔드포인트 감사를 시작했는가
- [ ] 운영 토큰 권한 매트릭스가 도큐먼트로 존재하는가
- [ ] *공개 API → 관리 채널 분리*가 한 곳이라도 적용됐는가
- [ ] *"왜 이 버튼이 *존재*하는가?"* 질문을 1주일 안에 한 번이라도 했는가
