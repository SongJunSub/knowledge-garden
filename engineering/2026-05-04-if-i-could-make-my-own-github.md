---
title: "나만의 GitHub를 만든다면 — Forge에 대한 9가지 wishlist"
source_title: "If I Could Make My Own GitHub"
source_url: "https://matduggan.com/if-i-could-make-my-own-github/"
source_name: "Mat Duggan's Blog"
referrer_url: "https://news.hada.io/topic?id=29152"
published_at: "2026-04-30"
summarized_at: "2026-05-04"
category: "engineering"
tags: ["DevTools", "Forge", "GitHub", "PR", "stacked-PR", "JJ", "DX"]
---

# 나만의 GitHub를 만든다면 — Forge에 대한 9가지 wishlist

> 출처: [Mat Duggan — If I Could Make My Own GitHub](https://matduggan.com/if-i-could-make-my-own-github/) · 레퍼러: [GeekNews 29152](https://news.hada.io/topic?id=29152) · 정리일 2026-05-04

## 한 줄 요약
GitHub·GitLab·Gitea 모두 *같은 GitHub 설계*를 모방한다. 저자가 원하는 forge는 **git이 아닌 forge가 진짜 워크플로**라는 사실을 인정하고, *push 전 검증·비-이분법 PR 승인·stacked PR 일급 지원·로컬 완전성*을 처음부터 설계한 것이다.

## 핵심 진단

**Forge ≠ Git.** 실무에서 git은 *원격 저장소와 push/pull*만 담당하고, 진짜 작업은 PR·Actions·Issues 같은 *forge 기능*에서 일어난다.
- **Pull Request** = 동료 리뷰 원칙 *강제 방식*
- **GitHub Actions** = 테스트 실행 도구
- **Issues** = 작업 추적

그런데 현 forge들은 *git 기반 도구*인 척하면서 *워크플로 도구*로서의 설계는 부족하다.

## 9가지 wishlist

### 1. **Push 전 원격 pre-commit hook**
- "커밋 *후* 피드백이 아니라 *push 전* 피드백이 필요하다"
- 로컬 hook은 *우회 가능* / 원격 검증은 *모든 사람에게 강제*

### 2. **비-이분법 PR 승인**
- 단순 승인/미승인 → **Gerrit 스타일 -2 ~ +2** 같은 단계 시스템
- "약한 승인(나중에 처리하자)" 같은 중간 상태가 필요

### 3. **유연한 PR 규칙 (LLM 활용)**
- "네 눈이 *모든* 변경을 검토해야 한다는 규칙은 과도"
- LLM이 *저위험 유지보수 커밋*으로 판정하면 자동 승인

### 4. **Stacked PR 일급 지원**
- 외부 도구(Graphite 등) 없이 *forge 기본*으로
- 큰 변경을 작은 PR 체인으로 자연스럽게 분해

### 5. **기능 범위 최소화**
- 이슈 추적은 필수, **칸반 보드·위키는 불필요한 부담**
- "도구는 기능이 쉬울 때 추가되고 채택률과 무관하게 영구 유지된다"

### 6. **작은 호스팅 단위**
- "12대의 라즈베리파이도 조직이 될 수 있을 정도로 유연"
- GitHub Enterprise의 무거운 운영 모델 대신 *경량·연합형*

### 7. **로컬 저장소의 완전성**
- 코드뿐 아니라 **PR·이슈·승인 데이터**도 로컬에서 접근 가능
- 오프라인에서도 메타데이터 검색·이력 추적 가능

### 8. **지능형 저장소 동기화**
- 필요시에만 *과거 히스토리 온디맨드 fetch*
- 거대 모노레포의 초기 clone 부담 해결

### 9. **서명된 Actions**
- 오프라인 실행 가능
- 저장소 *안에* 포함 가능
- 공급망 위험을 검증된 도구로 막기

### 추천 조합
> **VCS = JJ (Jujutsu)** + 새 forge + **서명된 Actions**

JJ 추천 이유는 글에 명시되지 않지만 *stacked PR과 자연스러운 결합*이 핵심으로 보임.

## 인상 깊은 문장

> "Git은 커널 개발에 완벽한 도구. 이메일로 패치를 보내는 워크플로 기반."

> "도구는 기능이 쉬울 때 추가되고, 채택률과 무관하게 영구 유지된다."

> "2026년까지 forge를 사용하려면 기본값을 극복할 *놀라운 이유*가 필요하다."

> "12대의 라즈베리파이도 조직이 될 수 있을 정도로 유연해야 한다."

## 내 생각 · 적용점

- **"forge ≠ git" 분리가 진짜 통찰**. 우리 팀도 평소엔 *"GitHub를 쓴다"*고 하지만 실제 의존하는 건 *PR 리뷰 정책·Actions·Linear 연동·서브모듈 권한*이다. *git과 forge의 의존 강도*가 정반대라는 걸 의식하면 *대안 평가*가 더 정확해진다.

- **비-이분법 PR 승인은 우리 워크플로에도 절실**. 현재 *Approve/Request changes*만 가능해서, "큰 틀은 좋은데 사이드 트랙으로 처리하자"가 *미승인*으로만 표현된다. Gerrit 스타일 단계 승인이 있으면 [MangoLove 트랙별 리뷰](../ai/2026-04-29-mattpocock-skills-vs-mangolove.md)와 자연스럽게 결합 — Critical/Major/Minor를 PR 승인 차원에 매핑.

- **Stacked PR 일급 지원**: CRS 같은 큰 레포에서 한 기능 변경이 *10개 파일·여러 모듈*에 걸칠 때, 거대 PR 하나가 아니라 *체인으로 나누고 싶다*는 욕구가 자주 있다. 외부 도구 없이 자연스럽게 가능한 forge가 있다면 *리뷰 부담이 다시 분산된다*.

- **YC RFS와의 결합**: [#11 SaaS Challengers](2026-04-29-yc-rfs-summer-2026-hospitality-it.md)의 가장 명백한 후보 중 하나가 *Forge*. *Microsoft 인수 후 GitHub의 정체*는 이미 시작됐다고 [Ghostty의 GitHub 이탈](../weekly/2026-W18-geeknews-356.md)에서도 나왔던 신호.

- **AI 통합 forge가 다음 표준**: *"LLM이 저위험으로 판정한 PR은 자동 승인"* 이 9개 중 가장 *지금 당장* 가치 있는 항목. [하네스 엔지니어링](../ai/2026-04-28-agent-harness-engineering.md) 흐름의 자연스러운 다음 단계 — *forge 자체가 에이전트 친화적 인프라*가 되어야 함.

- **우리 회사 GitHub 의존도 한 번 평가할 가치**: 우리가 GitHub 위에 빌드한 것 중 *대안이 어려운 것*은? *Actions, PR, Issues, 권한 모델, 외부 서비스 연동(Linear/Slack/Cloudflare)* — 어느 것이 진짜 lock-in인지 확인. 가장 강한 lock-in이 *대안 비용*의 핵심 변수.

- **반론·균형점**: 9가지 모두 좋아 보이지만 *현실의 forge는 더 단순한 게 이김*. GitHub은 *기본값이 충분히 좋아서* 이긴 것이지, *모든 기능이 우월해서*가 아니다. 새 forge가 만들어지더라도 결국 *기본값이 좋고 docs/Actions/SDK 생태계가 단단한 쪽*이 살아남을 것.

## 연관 자료
- [`engineering/2026-04-29-yc-rfs-summer-2026-hospitality-it.md`](2026-04-29-yc-rfs-summer-2026-hospitality-it.md) — #11 SaaS Challengers의 forge 후보 사례
- [`weekly/2026-W18-geeknews-356.md`](../weekly/2026-W18-geeknews-356.md) — Ghostty의 GitHub 이탈 (같은 흐름의 신호)
- [`ai/2026-04-28-agent-harness-engineering.md`](../ai/2026-04-28-agent-harness-engineering.md) — AI 통합 forge가 다음 단계
- [`ai/2026-04-29-mattpocock-skills-vs-mangolove.md`](../ai/2026-04-29-mattpocock-skills-vs-mangolove.md) — 비-이분법 PR 승인 + 트랙별 리뷰 결합 후보
- 도구: [Jujutsu (JJ)](https://github.com/jj-vcs/jj), [Tangled](https://tangled.org), [Radicle](https://radicle.xyz)

## 한 달 뒤 회고
- [ ] 회사 GitHub 의존도 평가 (lock-in 강도별 분류) 작성했는가
- [ ] JJ를 한 개인 프로젝트(BugSip 등)에서 시범 사용해봤는가
- [ ] LLM 자동 승인 PR 정책 가능성 검토했는가
