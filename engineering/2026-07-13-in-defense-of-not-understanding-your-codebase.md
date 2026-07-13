---
title: "코드베이스를 완전히 이해하지 못해도 괜찮은 이유 (Sean Goedecke) — Naur '이론 구축'에 대한 반론, 완전한 이해의 불가능성은 원래부터 있었고 국소적 추론이 그것을 감당한다"
source_title: "In defense of not understanding your codebase"
source_url: "https://www.seangoedecke.com/in-defense-of-not-understanding-your-codebase/"
source_name: "seangoedecke.com"
referrer_url: "https://news.hada.io/topic?id=31377"
published_at: "2026-07-11"
summarized_at: "2026-07-13"
category: "engineering"
tags: ["theory-building", "local-reasoning", "partial-understanding", "legacy-codebase", "naur", "good-enough", "org-values"]
---

# 코드베이스를 완전히 이해하지 못해도 괜찮은 이유 (Sean Goedecke) — Naur '이론 구축'에 대한 반론, 완전한 이해의 불가능성은 원래부터 있었고 국소적 추론이 그것을 감당한다

> 출처: [In defense of not understanding your codebase](https://www.seangoedecke.com/in-defense-of-not-understanding-your-codebase/) (Sean Goedecke) · 정리일 2026-07-13

## 한 줄 요약

**대규모 코드베이스에 대한 "부분적 이해"는 용인 가능할 뿐 아니라 대기업 소프트웨어 엔지니어링에서 필수적이다. Peter Naur의 "프로그래밍은 이론 구축이다"(완전한 이해가 본질이고, 원 개발자가 떠나면 시스템을 수정하기보다 폐기해야 한다)는 명제는 비교적 작은 시스템에는 맞지만 수백만 줄짜리 현대 시스템으로 과잉 일반화됐다. 유능한 엔지니어는 불완전한(틀린) 멘탈 모델을 가지고 교육된 추측으로 일하며, LLM은 새 문제를 만든 게 아니라 "깊은 이론 구축 vs 빠른 부분적 이해"의 트레이드오프를 강화할 뿐이다.**

## 핵심 포인트

- **규모가 문화를 가른다** — 소규모 팀(Redis, The Witness)은 완전한 이해를 우선하지만, 대규모 팀(Google, GitHub)은 부분적 이해를 수용한다. "현대 소프트웨어의 정의적 특징은 누구도 머릿속에 담을 수 없을 만큼 크다는 것."
- **Naur 명제의 시대적 한계** — 1985년의 ~20만 줄 시스템 논의를 수백만 줄로 과잉 일반화했다. **"충분히 큰 코드베이스에서는 모두가 틀린 이론을 가지고 일한다."**
- **전면 재작성은 불가능** — 대규모 시스템은 재현 불가능한 수천 개의 예외와 quirk를 담고 있어, 덩어리(chunk)를 잘라내 반복 교체하는 방식으로만 성공한다.
- **방치된 코드베이스 부활법** — 전면 재작성이 아니라 **"하나의 완전한 플로우를 이해한 뒤 조심스럽게 확장"**. 원 문제 정의가 사라진 경우가 많고, **가장 가까운 것이 보통 테스트 스위트**다.
- **완전한 이해는 절대선이 아니다** — 속도·규정 준수·법적 요구·의존성 관리 등 다른 가치들과 저울질되는 여러 가치 중 하나. **"직장에서 당신은 그들의 엔지니어링 가치를 채택하도록 돈을 받는다."**
- **LLM은 트레이드오프를 강화할 뿐** — 깊은 이론 구축을 방해하지만 빠른 부분적 이해를 가능케 한다. 완전한 이해의 불가능성은 LLM 이전부터 있었다.

## 인상 깊은 문장

> "In sufficiently large codebases, everyone operates with an incorrect theory of the program."

> "You simply can't rebuild large software systems from scratch. Sufficiently large systems contain thousands of weird cases and quirks that cannot be reimplemented."

> "At work you are paid to do a job. In other words, they pay you money to adopt their set of engineering values."

## 댓글 — GN⁺의 Lobste.rs 큐레이션 5개 클러스터 + 원 스레드(14개) 누락분 전수 확인

**GeekNews 자체 댓글 1개(= GN⁺의 Lobste.rs 큐레이션, 5개 최상위 클러스터). 원 스레드(총 14댓글)를 열어 GN⁺가 누락한 5개 댓글까지 확인했다.**

- **"제목이 낚시성" (typesanitizer)** — 이론에는 폭(어느 범위까지 능숙히 변경 가능한가)과 깊이(특정 부분을 얼마나 복잡하게 다루는가)가 있고, 모듈별 재작성 + 전환 기간은 "좁지만 깊은 이론"을 짓는 것. **"현실에서는 주어진 문제 자체가 주어져 있지 않다"** — Naur는 문제 정의가 남아있다고 가정하지만 대규모 코드엔 없고, 가장 가까운 게 테스트 스위트.
- **"매주 다른 코드베이스" (jmillikin)** — 1985년과 다른 점은 30만 줄 전문가가 돼도 다음 주엔 전혀 다른 30만 줄에서 일한다는 것. 관용구·컴파일러 같은 자동화·"어떻게 구성돼야 하는가"의 직감에 의존. **"결국 전부 코드일 뿐, 읽으면 된다."**
- **"국소적 추론(local reasoning)이 핵심" (mcherm)** — 주변을 다 이해하지 않고 한 부분만 이해하는 국소적 추론은 컴퓨터 과학이 처음부터 추구한 것. **구조적 프로그래밍·전역 변수 회피·함수형의 부수효과 제거·OOP의 데이터+코드 결합이 모두 국소적 추론을 가능케 한다.**
- **완벽주의의 함정 (alurm, 대댓글)** — "항상 더 이해해야 한다"는 목표는 아무것도 못 하는 상태(**immobility**)까지 오용될 수 있다. 충분한 이해가 아니라 완벽한 이해를 요구받으면 결국 포기·절망하고, 그때 '이해'는 문지기(gatekeeping)처럼 작동한다.
- **경영진 불신 (andyc + mh 대댓글)** — "부분적 이해가 유일한 상태여도 조직은 늘 더 깊은 이해를 추구해야 한다." "경영진은 좋은 관행을 불신하고 더 빨리 가겠다며 검증 없이 선제 포기를 요구하곤 한다."
- **GN⁺ 누락분(태그 논쟁 메타)** — Lobste.rs가 LLM 콘텐츠를 폭넓게 `vibecoding`으로 분류하는 것에 대한 부조리 논쟁(mitsuhiko·simonw·bitshift "그 태그는 사실상 트리거 워닝"), "SW공학 vs CS" 지적(0x2ba22e11), "제목은 의도된 선택이고 놀란 척은 위선적"(abnercoimbre). 본문 논지와는 거리가 있어 메타 토론으로 확인만.

## 내 생각 · 적용점

### 핵심 전이 1 — 가든 안에서 벌어지는 정면 대립: Naur vs Goedecke

이 글은 가든에 이미 있는 [[2026-05-14-naur-programming-as-theory-building]]에 대한 **명시적 반론**이고, 며칠 전 정리한 [[2026-07-12-write-code-like-a-human-will-maintain-it]]("코드는 읽는 것으로 부족하고 고통스럽게 겪어야 내면화된다")과 **긴장 관계**에 있다. 둘 다 옳고, 대립을 접는 축은 **규모**다 — 소규모/장수 코어(Redis, 내 사이드 프로젝트)에서는 완전한 이론 구축이 자산이지만, 수백만 줄 대규모 시스템에서는 "모두가 틀린 이론으로 일한다"가 현실이다. 이건 이번 주 반복된 [[2026-07-10-mitchell-hashimoto-interview-ghostty-zig]]·Weekly #366의 "Bun을 아무도 전체를 이해하지 못한 채 재작성" 논점과 정확히 만난다. **가든의 가치는 이 대립을 지우지 않고 나란히 두는 것.**

### 핵심 전이 2 — 국소적 추론(local reasoning)이 좋은 추상화의 진짜 목적

mcherm의 지적이 이 글의 가장 오래 남을 통찰이다. **구조적 프로그래밍·함수형·OOP를 관통하는 진짜 목적은 "전체를 몰라도 부분을 안전하게 다룰 수 있게 하는 것"**이다. 즉 좋은 추상화의 가치는 우아함이 아니라 **부분적 이해로도 안전하게 작업 가능하게 만드는 것**이다. 이건 언어 불문 전이되고, [[2026-06-29-towards-understandable-software]]·[[2026-06-08-prefer-duplication-over-wrong-abstraction]]의 "이해 가능성" 논의와 같은 축이다 — 코드를 이해 가능하게 만드는 것은 결국 국소적 추론의 경계를 명확히 긋는 일.

### 핵심 전이 3 — "충분한 이해 vs 완벽한 이해", 그리고 완벽주의의 마비

alurm의 "완벽한 이해를 요구받으면 immobility에 빠진다"는 대규모 시스템에서 생산성의 핵심 구분이다. 이건 [[2026-06-30-yagni-hidden-costs]]·[[2026-07-12-good-tools-are-invisible]]("학습 곡선은 비용")의 "과잉의 함정"과 같은 계열이고, 어제 정리한 [[2026-07-13-own-the-outer-loop]]의 "판단이 가치를 만드는 지점"과도 이어진다 — 어디까지 이해하면 충분한가를 판별하는 것 자체가 시니어의 판단력이다. 마침 [[2026-06-30-last-people-who-know-how-it-works]]가 걱정한 "작동을 아는 사람의 소멸"에 대한 균형추이기도 하다.

### 핵심 전이 4 — 방치·레거시 코드베이스 부활법이 CRS에 직접 적용된다

"전면 재작성 대신 하나의 완전한 플로우를 이해 → 조심스럽게 확장, 덩어리를 잘라 반복 교체, 테스트 스위트를 사실상의 문제 정의로 삼기." 이건 조선호텔 CRS처럼 **오래되고 예외 케이스가 누적된 예약·요금(Rate) 도메인**에 그대로 옮겨진다. Opera PMS 연동·Daily Rate·Advanced Dynamic 같은 복잡 영역을 전면 재작성하려는 유혹은 이 글의 논거대로 대개 실패한다 — **테스트 스위트를 문제 정의로 삼아 모듈 단위로 잘라 교체**하는 편이 실무적으로 타당하다.

## 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 별도 안내)

## 연관 자료
- [[2026-05-14-naur-programming-as-theory-building]] — *이 글이 정면으로 반박하는 대상*
- [[2026-07-12-write-code-like-a-human-will-maintain-it]] — *"고통스럽게 겪어야 내면화"와 긴장 관계, 규모가 축*
- [[2026-06-29-towards-understandable-software]] — *국소적 추론 = 이해 가능성의 다른 이름*
- [[2026-06-30-last-people-who-know-how-it-works]] — *"작동을 아는 사람의 소멸" 걱정에 대한 균형추*
- [[2026-07-10-mitchell-hashimoto-interview-ghostty-zig]] — *"아무도 전체를 이해 못 한 채 재작성"과 만남*

## 한 달 뒤 회고
*(2026-08-13 즈음 — CRS의 복잡 모듈(Rate·PMS 연동)에서 "완전한 이해"를 기다리다 마비된 적은 없는지, 하나의 완전한 플로우부터 이해해 확장하는 방식을 실제로 써봤는지, 테스트 스위트를 문제 정의로 삼아 모듈을 잘라 교체한 사례가 있는지 기록.)*
