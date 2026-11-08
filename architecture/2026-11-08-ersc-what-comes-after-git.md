---
title: "Git 다음에는 무엇이 올까 — ERSC Steve Klabnik, Git 프로토콜은 유지하되 저장소는 다시 설계한다(East River Source Control)"
source_title: "What comes after git"
source_url: "https://ersc.io/blog/what-comes-after-git"
source_name: "East River Source Control (ERSC) 블로그, Steve Klabnik"
referrer_url: "https://news.hada.io/topic?id=36752"
published_at: "2026-09-10"
summarized_at: "2026-11-08"
category: "architecture"
tags: ["git", "jujutsu", "ersc", "source-control", "version-control", "agentic-development", "steve-klabnik"]
---

# Git 다음에는 무엇이 올까

> 출처: [What comes after git](https://ersc.io/blog/what-comes-after-git) (ERSC 블로그, Steve Klabnik) · 정리일 2026-11-08

> **출처 한계.** ersc.io·daily.dev·news.hada.io 모두 이 세션에서 egress 차단되어 원문 전체를 직접 읽지는 못했고, WebSearch 스니펫과 Hacker News 스레드(id=49652985) 논의로 재구성했다. Slack 발췌에 나온 **"가상 스타트업 ACME Inc" 비유, 구체적인 저장소 크기·브랜치 수 증가 수치, Git/Jujutsu(`jj`) 중 원하는 클라이언트 선택 서술**은 WebSearch로 원문 전체를 확인하지 못해 교차검증하지 못했다 — Slack 발췌만을 근거로 남긴다. 다만 저자(Steve Klabnik)·회사(ERSC)·핵심 논지(Git 프로토콜 유지 + 저장 엔진 교체)는 복수의 독립 소스(ERSC 공식 사이트, Hacker News, 제3자 보도)로 교차확인했다.

## 한 줄 요약

**ERSC의 Steve Klabnik은 "2005년에 설계된 Git의 저장 모델이 지금의 모노레포 규모와 에이전트 주도 개발 워크로드를 못 버틴다"고 주장하며, Git(과 향후 Jujutsu) 프로토콜은 그대로 유지한 채 서버 쪽 저장 엔진만 완전히 새로 짜는 ERSC Storage를 소개한다 — 다만 이 글 자체는 HN에서 "구체성이 부족하다"는 비판을 받았다.**

## 핵심 포인트

- ERSC는 브루클린 소재 스타트업으로, **Git 저장소를 서버에 그대로 저장하지 않는** 새로운 수평 확장형 저장 엔진 "ERSC Storage"를 만들고 있다. 클라이언트 쪽에서는 **Git 프로토콜과 Jujutsu(`jj`) 프로토콜을 둘 다 말하는 Git 브리지**로 보여, 기존 Git 클라이언트는 아무 변경 없이 계속 쓸 수 있다.
- Jujutsu 창시자 **Martin von Zweigbergk**가 구글에서 15년 만에 퇴사해 ERSC CTO로 합류했고, Steve Klabnik도 합류해 이 글을 썼다 — **Rust/Jujutsu 생태계의 핵심 인물들이 모인 팀**이라는 점이 신뢰도의 근거.
- 핵심 주장: 에이전트가 병렬로 작업하면서 **저장소 크기, 활성 브랜치 수, 병합 빈도**가 과거 "사람 중심" 워크플로우 때보다 훨씬 커졌고, Git은 이를 염두에 두고 설계되지 않았다.
- Klabnik 본인이 Hacker News에서 "이 글은 의도적으로 하이레벨로 썼고, 우리가 뭘 해왔는지 조금이라도 공유하는 게 목적이었다"고 직접 답했다 — **스스로도 이 글이 세부사항을 다 담지 않았음을 인정**한 셈.
- 향후 계획: 현재는 Git 프로토콜로 하위호환을 지키되, 장기적으로 **Jujutsu 네이티브 프로토콜**을 업스트림과 함께 만들 계획("jj는 아직 공식 네이티브 프로토콜이 없지만, 업스트림과 함께 훌륭한 걸 만들고자 한다").

## 인상 깊은 문장

> "The goal here is more to share *anything* about what it is that we've been doing." — Steve Klabnik, Hacker News 댓글 (ersc.io/blog/what-comes-after-git 관련 스레드)

## 댓글

Hacker News 스레드(id=49652985)에서 **"ERSC가 결국 하려는 게 뭔지 구체성이 너무 부족하다(anemic on details)"**는 비판적 댓글이 있었고, 저자 본인이 "의도적으로 하이레벨로 썼다"고 인정하며 답했다. GN⁺ 쪽 댓글 수는 news.hada.io 차단으로 확인 불가. **이 글은 "제품 발표문"이 아니라 "방향성 선언 + 채용 신호"에 가깝다**는 점을 정직하게 남긴다.

## 내 생각 · 적용점

### 핵심 전이 1 — [[2026-11-08-gitlab-agent-source-control]], [[2026-11-08-github-rubicon-git-storage]]와의 계열 — "Git 프로토콜 유지 + 저장 엔진 전면 교체"가 업계 공통 패턴

같은 날 다이제스트의 GitLab, GitHub 사례와 비교하면 ERSC는 **가장 작고 가장 사상적(ideological)인 플레이어**다. GitLab·GitHub은 구체적 벤치마크 숫자(50배, 7,200 push/s)로 승부하는 반면, ERSC는 "우리는 Git이 미래가 아니라고 믿는다"는 신념과 인물(Klabnik, von Zweigbergk)로 신뢰를 산다. **같은 결론(Git 호환 계층 + 새 저장소)에 도달한 세 가지 다른 경로**(대기업 내부 재설계, 스타트업의 사상적 베팅, 오픈소스 커뮤니티 리더십 영입)를 나란히 보는 게 이 배치 전체의 핵심 가치다.

### 핵심 전이 2 — "방향성 선언" 글의 신뢰도는 숫자가 아니라 인물과 비판적 피드백 공개 여부로 판단해야 한다

Klabnik이 HN 비판을 피하지 않고 직접 "맞다, 하이레벨이었다"고 답한 것은 — 이 가든이 다른 노트들에서 반복적으로 강조하는 **"출처 한계를 숨기지 않는다"**는 원칙을 저자 스스로 실천한 드문 사례다. 벤치마크 숫자가 없는 발표문을 평가할 때는 "숫자가 없다"를 감점 요인으로만 보지 말고, **비판에 어떻게 반응했는지**를 함께 봐야 한다.

## 호스피탈리티 / CRS 적용 포인트

**적용은 멀다.** CRS는 Git 저장소를 운영하지 않으므로 이 글의 구체적 제안은 직접 쓸 데가 없다. 다만 "레거시 프로토콜은 호환성 때문에 당장 버릴 수 없지만, 그 프로토콜이 가정한 사용 패턴(소수의 인간이 가끔 쓴다) 자체가 바뀌었다면 뒷단 구조를 통째로 다시 설계해야 한다"는 메타 원칙은, **레거시 PMS/OTA 연동 프로토콜(XML 기반 등)을 유지하면서 내부 처리 엔진만 현대화하는 결정**을 내릴 때 참고할 만한 사고방식이다.

## 연관 자료
- [[2026-11-08-gitlab-agent-source-control]] — 같은 문제를 대기업 내부 재설계로 푼 사례, 구체적 벤치마크 수치 보유
- [[2026-11-08-github-rubicon-git-storage]] — GitHub의 Ref-CAS/Blob Storage 분리 아키텍처
- [[2026-10-14-anthropic-scion-source-control]] — Anthropic의 유사 시도
- [[2026-09-27-atlas-source-control-for-coding-agents]] — 코딩 에이전트 전용 소스관리의 또 다른 축

## 한 달 뒤 회고

*(2026-12-08 즈음 — ERSC Storage가 비공개 베타를 넘어 실제 사용 후기가 나왔는지, "구체성 부족" 비판에 대한 후속 글이 있었는지 확인.)*
