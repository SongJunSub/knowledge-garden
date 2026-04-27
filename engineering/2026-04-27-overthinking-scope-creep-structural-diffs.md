---
title: "과도한 고민, 범위 확장, 구조적 diff로 프로젝트를 망치는 법"
source_title: "How I sabotage projects by overthinking, scope creep, and structural diffs"
source_url: "https://kevinlynagh.com/newsletter/2026_04_overthinking/"
source_name: "Kevin Lynagh's Newsletter"
referrer_url: "https://news.hada.io/topic?id=28865"
published_at: "2026-04"
summarized_at: "2026-04-27"
category: "engineering"
tags: ["YAGNI", "범위확장", "프로젝트관리", "실행", "생산성", "회고"]
---

# 과도한 고민, 범위 확장, 구조적 diff로 프로젝트를 망치는 법

> 출처: [Kevin Lynagh — How I sabotage projects](https://kevinlynagh.com/newsletter/2026_04_overthinking/) · 레퍼러: [GeekNews 28865](https://news.hada.io/topic?id=28865) · 정리일 2026-04-27

## 🔖 한 줄 요약
프로젝트가 망하는 건 실력 부족이 아니라 **명확한 성공 기준의 부재** 때문이다 — 과도한 리서치·범위 확장·완벽한 도구 찾기에 빠지는 순간 원래 목적은 사라진다.

## 🧩 핵심 포인트

### 두 종류의 프로젝트
저자(Kevin Lynagh, Clojure/Rust 개발자)는 자신의 프로젝트가 두 극단으로 나뉜다고 진단한다.
- **빠른 실행 → 만족스러운 결과**
- **과도한 리서치/고민 → 아무것도 완성 못함**

차이를 가르는 단 하나의 변수는 **"내가 성공 기준을 얼마나 내면화했는가"**.

---

### 일화 1. 우드워킹 (성공)
- 친구 Marcin과 주방 선반 만들기
- 커피 마시며 디자인 → IKEA 행거 3D 프린트 반복 → 손으로 모서리 다듬기
- **명확한 성공 기준**: "친구와 우드워킹을 즐긴다" → 과잉 설계가 끼어들 틈 없음

### 일화 2. LLM 코드 리뷰용 구조적 diff (실패)
- 원래 목표: Emacs에서 더 나은 diff 워크플로우 (4시간 예상)
- 실제: difftastic / semanticdiff 등 4시간 리서치 → "의미론적 트리 diff는 박사급 복잡도"라는 의심 → MCP 서버 혼란 → **원래 문제 미해결, 동기 상실**

### 일화 3. 장기 관심 프로젝트들 (정체)
- 하드웨어 프로토타이핑 인터페이스 / Clojure×Rust 융합 언어 / CAD용 프로그래밍 언어
- 수백 시간의 배경 리서치 후에도 **원래 동기를 충족시키는 결과물 0**.

> "I'd much rather have _done_ a lot than have only _considered_ a lot."

---

### Scope Creep의 보존 법칙
Emacs용 파일 검색 도구(Finda 후속) 사례:
1. Nucleo 라이브러리 발견 (자신의 10년 전 Finda보다 좋음)
2. **스마트 케이스 / 유니코드 정규화** 기능에 끌림
3. **앵커 기능**(`^foo` = 경로 세그먼트 시작 매칭) 구현에 몇 시간 투자
4. 결국 **쿼리에 `/` 하나 추가하면 끝나는 문제**라는 걸 깨닫고 **추가 코드 전부 폐기**

> 프로그래밍 속도가 빨라질수록 **불필요한 기능·토끼굴·우회로도 같이 증가**한다.

> "I'm not sure how many times I'll re-learn YAGNI in my career."

---

### 구조적 Diff: 기존 도구 비교
| 도구 | 특징 | Kevin의 평가 |
|------|------|------|
| **difftastic** | 가장 유명한 구조적 diff | `struct PendingClick`과 `PendingClickRequest`가 매칭되지 않고 삭제/추가로 표시됨 |
| **semanticdiff** | VSCode/웹 | 가장 정교하지만 **재사용 가능한 라이브러리 없음** |
| **diffsitter** | Treesitter 기반, MCP | 문서화 부족 |
| **gumtree** | 2014 학술 연구 | Java 기반 — Emacs 워크플로우와 안 맞음 |
| **mergiraf** | Gumtree 알고리즘 + 세심한 아키텍처 | "생각 깊은 인간이 작성한 흔적" — 호평 |
| **weave** | Rust, HN 최적화 | 과도하게 완성됨, 버그 |
| **diffast** | 2008 AST 편집 거리 | Python/Java/Verilog 등 |
| **autochrome** | Clojure 특화, DP | 시각 설명 우수 |

### 결론적 실행 계획 (의도적으로 좁힌 범위)
1. **Rust 대상 treesitter 기반 엔티티 추출** + 탐욕 매칭 + CLI 렌더링
2. (필요할 때) Magit 스타일 Emacs UI, 점수 기반 전역 매칭 도입
3. 공개 여부 미정 — **GitHub 스타나 HN 카르마가 목표가 아니다**

> "Sometimes I just want a shelf."

## 📜 인상 깊은 문장

> "I prefer the first outcome, and I think the pivotal factor is how well I've internalized my own success criteria."

> "I've spent hundreds of hours on background research and little prototypes, but haven't yet synthesized anything that addresses the original motivating issue."

> "I'd much rather have _done_ a lot than have only _considered_ a lot."

> "I'm not sure how many times I'll re-learn YAGNI ('you ain't gonna need it') in my career."

> "Sometimes I just want a shelf."

## 💭 내 생각 · 적용점

- **"성공 기준의 내면화"가 모든 차이를 만든다**는 진단이 가장 핵심. 사이드 프로젝트가 늪에 빠지는 패턴을 정확히 묘사한다. 시작할 때 **"무엇이 되면 끝인가"**를 한 문장으로 적어두지 않으면 100% 범위 확장으로 미끄러진다. **MangoLove의 Spec 템플릿에서 "수용 기준"을 고집하는 것도 같은 동기**.
- **Scope Creep 보존 법칙**은 LLM 시대에 더 위험하다. AI로 코드를 빨리 짤수록 "이왕 시작한 김에 이것도"가 폭발한다. 어제 정리한 [기술/인지/의도 부채](2026-04-24-technical-cognitive-intent-debt.md)와 정확히 같은 결론 — **속도가 올라갈수록 의도 기록과 범위 통제가 중요**.
- **"좋은 라이브러리"가 함정을 만든다**는 관찰이 특히 와닿는다. 라이브러리의 기능 매트릭스가 새 요구사항을 만들어낸다. 도구를 채택할 때 **"이 도구의 기능 중 내가 *지금* 쓸 것은 무엇인가"**를 먼저 못 박아야 한다.
- **개인 프로젝트(BugSip 등) 적용**: 새 기능을 시작할 때 한 줄로 "끝나는 조건"을 commit message나 WBS에 미리 박아두기. 이게 무너지기 시작하면 즉시 멈추고 원래 목적을 다시 읽는다.
- **"Sometimes I just want a shelf"** — 도구·인프라·플랫폼을 만들고 싶은 욕구가 있을 때 자주 떠올릴 만한 문장. 대부분의 경우 **선반이면 충분하다**.
- **반론 메모**: 저자는 의도적으로 행동 편향(action bias)을 옹호하지만, **아키텍처 단계의 사전 검토**까지 모두 "overthinking"으로 보면 위험하다. 이 글은 *사이드 프로젝트와 같이 책임 범위가 작은 작업*에 잘 맞고, 결정 비용이 큰 시스템 설계에선 "충분한 사전 분석"의 비중이 더 높아져야 한다.

## 🔗 연관 자료
- [`engineering/2026-04-23-laws-of-software-engineering.md`](2026-04-23-laws-of-software-engineering.md) — **YAGNI / Premature Optimization / Gall's Law**가 정확히 이 글의 토대
- [`engineering/2026-04-24-technical-cognitive-intent-debt.md`](2026-04-24-technical-cognitive-intent-debt.md) — 의도 부채 = 성공 기준의 외부화 실패
- [`career/2026-04-23-things-ive-learned-as-a-senior-engineer.md`](../career/2026-04-23-things-ive-learned-as-a-senior-engineer.md) — "최고의 코드는 코드가 없는 것"

## 📝 한 달 뒤 회고
<!-- BugSip / 사이드 프로젝트에서 "성공 기준 한 줄"을 실제로 적용해본 결과를 나중에 덧붙인다. -->
