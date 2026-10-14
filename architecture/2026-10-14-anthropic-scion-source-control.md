---
title: "Anthropic, 에이전트 시대 소스 컨트롤을 위해 Git을 버리고 Scion을 만들다 — 도구의 숨은 동시성 가정이 '사용자 수'가 아니라 '에이전트 수'에 의해 깨진 사례"
source_title: "Scion — Anthropic replaced git for its monorepo in five months"
source_url: "https://ai-tldr.dev/releases/anthropic-scion-source-control/"
source_name: "ai-tldr.dev (Anthropic Engineering Blog 'Creating in-house source control' 요약 보도, developersdigest.tech·alphasignal.ai·windowsforum.com·biggo.com 등 복수 매체 교차확인)"
referrer_url: "https://news.hada.io/topic?id=35309"
published_at: "2026-10-13"
summarized_at: "2026-10-14"
category: "architecture"
tags: ["version-control", "git", "agents", "monorepo", "ci-cd", "anthropic", "scaling", "infrastructure"]
---

# Anthropic, 에이전트 시대 소스 컨트롤을 위해 Git을 버리고 Scion을 만들다

> 출처: [Scion — Anthropic replaced git for its monorepo in five months](https://ai-tldr.dev/releases/anthropic-scion-source-control/) (ai-tldr.dev, Anthropic Engineering Blog 요약 보도) · 정리일 2026-10-14

> **출처 한계**: `news.hada.io`와 `anthropic.com`(엔지니어링 블로그 원문) 모두 이 세션에서 egress 차단으로 직접 열람하지 못했다. 위 내용은 WebSearch가 반환한 ai-tldr.dev·developersdigest.tech·alphasignal.ai·windowsforum.com·finance.biggo.com·explainx.ai 등 **6개 이상의 독립 매체 보도가 서로 일치**하는 걸 교차확인해 재구성했다. 다만 Anthropic 원문의 정확한 문장(byline·직접 인용)은 대조하지 못했고, 아래 "인상 깊은 문장"은 보도들이 공통으로 인용하는 수치·주장을 패러프레이즈한 것이지 원문 축자 인용이 아니다. hada 댓글 수·HN/Lobsters 큐레이션 여부도 이번 조사에서 확인하지 못했다.

## 한 줄 요약

**AI 코딩 에이전트가 늘면서 Anthropic의 일일 병합량이 2026년 5월 약 2,500건에서 9월 30,000건 이상으로 12배 뛰고 CI가 하루 약 2,500만 회 체크아웃을 수행하게 되자, 7인 팀이 5개월 만에 자체 버전관리 시스템 Scion과 코드리뷰 도구 Antique를 만들어 모노레포를 Git에서 이전했다 — "항상 온라인인 에이전트"를 전제로 커밋·병합·이력 조회를 서버가 처리하고 클라이언트는 필요한 데이터만 가져오는 서버 중심 구조로, 기존 Git 미러 인프라 대비 CPU·메모리 요구량을 약 200분의 1로 줄였다고 보도된다.**

## 핵심 포인트

- **문제 정의 — 사용자가 아니라 에이전트가 병목을 만들었다**: 일일 병합 건수가 2026년 5월 약 2,500건 → 9월 30,000건 이상(보도에 따르면 한 날은 30,401건)으로 12배 증가. CI는 하루 약 2,500만 회 체크아웃을 수행.
- **저장소 규모**: 메인 브랜치 히스토리가 거의 100GB, 압축된 워킹 카피만 25GB 이상 — Git의 "전체 히스토리를 로컬에 복제한다"는 설계가 에이전트 규모에서 그대로 비용이 됐다.
- **해법 — 서버 중심 VCS**: 7인 팀이 5개월 만에 ***Scion***(VCS)과 ***Antique***(코드리뷰 도구)를 자체 개발. 커밋·병합·블레임·diff를 RPC로 서버에서 처리하고, 클라이언트는 sparse·virtualized 체크아웃으로 필요한 부분만 내려받는다. "항상 온라인인 에이전트와의 작업"을 전제로 설계된 구조.
- **성과(보도 기준)**: 기존 Git 미러 인프라 대비 CPU·메모리 요구량 약 **200분의 1**, CI 체크아웃이 분 단위에서 초 단위로 단축, CPU 사용량 약 25% 절감.
- **범위를 스스로 한정**: Anthropic은 Scion을 "범용 Git 대체재"로 내세우지 않으며 오픈소스화 계획도 없다고 보도된다 — 다만 이 설계 아이디어를 GitHub·GitLab·오픈소스 커뮤니티에 전하고 싶다는 입장이라고 복수 매체가 전한다.
- **Slack 발췌와의 대조**: "하루 병합량 2,500건→3만 건 이상, CI 하루 2,500만 회 체크아웃, CPU·메모리 200분의 1 축소"라는 수치가 교차확인한 보도들과 정확히 일치한다.

## 인상 깊은 문장

> (원문 축자 인용 아님 — 복수 매체가 공통으로 전하는 취지의 재구성) "git의 포셀린은 사람 한 명이 하루 몇 번 커밋하던 시절에 맞춰 설계됐다. 에이전트가 하루 수만 번 병합을 요구하는 세계에서는 그 가정 자체가 병목이 된다."

## 댓글

**확인 불가.** `news.hada.io`가 egress 차단되어 hada 댓글 수를 확인하지 못했다. HN·Lobsters에 이 주제로 별도 스레드가 있는지도 이번 WebSearch로는 특정하지 못했다(관련 과거 HN 스레드 — "$17M을 모아 Git의 다음 세대를 만든다"류 — 는 발견했지만 Scion과 직접 연결되는 스레드는 아니다). 보도 자체도 2026-10-13 당일 발행된 1차 소스가 많아 외부 검증·반박이 축적될 시간이 아직 부족했을 가능성이 크다.

## 내 생각 · 적용점

### 핵심 전이 1 — "숨은 동시성 가정"이 깨지는 패턴은 Git에만 있는 게 아니다

이 사례의 진짜 일반 원리는 "Git이 느리다"가 아니라, **Git의 설계가 암묵적으로 전제한 것(한 사람이 하루 몇 번 커밋, 오프라인 작업이 정상, 클론은 가끔 한다)이 "에이전트가 항상 온라인으로 쉬지 않고 일한다"는 새 전제와 충돌했다**는 것이다. [[2026-08-04-github-has-alternatives-no-replacement]]가 지적한 "GitHub의 진짜 자산은 호스팅이 아니라 공유된 사회적 인프라"라는 진단과 겹쳐보면, Anthropic의 선택은 그 반대쪽 극단이다 — 사회적 인프라(발견·관습)를 포기하는 대신, 에이전트 규모에 맞는 기술적 인프라를 처음부터 다시 설계했다. 사회적 해자가 없는 **내부 모노레포이기 때문에 가능했던 선택**이라는 점도 같이 짚어야 한다.

### 핵심 전이 2 — "지능형 저장소 동기화" 위시리스트가 5개월 만에 실현된 셈이다

[[2026-05-04-if-i-could-make-my-own-github]]에서 정리한 9가지 wishlist 중 8번 "지능형 저장소 동기화 — 필요시에만 과거 히스토리 온디맨드 fetch, 거대 모노레포의 초기 clone 부담 해결"이 바로 Scion의 sparse·virtualized 체크아웃과 정확히 같은 발상이다. 그 노트에서는 이걸 "누군가 만들어줬으면" 하는 바람으로 적었는데, Anthropic은 외부 forge를 기다리지 않고 **자기 문제 규모(에이전트 수)가 임계점을 넘기자 직접 만들었다**. 이는 "좋은 아이디어라도 그걸 절실하게 필요로 하는 조직이 나타나야 실제로 만들어진다"는 일반 교훈이기도 하다.

### 핵심 전이 3 — 정직한 한계: 반사실(Git을 유지했으면 어땠을지)이 없다

보도된 성과 수치(200분의 1, CPU 25% 절감)는 전부 Anthropic 자체 발표·측정이고, "Git 기반 인프라를 그대로 쓰면서 다르게 최적화했을 때"와의 비교군이 없다. 이는 engineering 노트들에서 반복 확인한 원칙 — ***"재현 전까지는 마케팅"*** — 과 같은 경계에 선다. 7인 팀·5개월이라는 투자 규모 자체도 "일 병합량 3만 건"이라는 Anthropic 특유의 극단적 스케일에서만 정당화되는 투자일 수 있다는 점은 분명히 해야 한다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 멀다 — 온다의 CRS 규모는 Anthropic의 "하루 3만 건 병합·2,500만 회 체크아웃"과는 자릿수가 다른 문제이고, 자체 VCS를 만드는 선택은 우리 규모에서 정당화되지 않는다. 다만 전이 가능한 원칙은 남는다: **"사용자 수 기준으로 설계된 인프라가 자동화·에이전트 작업 수의 폭증으로 깨질 수 있다"**는 패턴은 CRS에도 그대로 적용된다 — 예컨대 파트너 호텔 수 기준으로 설계된 예약·재고 동기화 배치가, 향후 AI 에이전트가 가격·재고를 더 빈번히 조회·갱신하게 되면 "동시 접속자 수"가 아니라 "자동화 호출 수"가 먼저 병목이 될 수 있다는 가정을 미리 점검해볼 가치는 있다.

## 연관 자료

- [[2026-08-04-github-has-alternatives-no-replacement]] — *GitHub의 해자는 기술이 아니라 사회적 인프라라는 반대편 진단, Scion은 그 해자를 포기하고 기술에 베팅한 사례*
- [[2026-05-04-if-i-could-make-my-own-github]] — *"지능형 저장소 동기화" 위시리스트가 Scion의 sparse·virtualized 체크아웃으로 먼저 실현된 사례*

## 한 달 뒤 회고
*(2026-11-14 즈음 — Anthropic 엔지니어링 블로그 원문을 직접 열람할 수 있게 되면 수치·인용을 1차 대조로 교체했는지, Scion의 설계 아이디어가 실제로 GitHub·GitLab 등에 영향을 줬다는 후속 보도가 나왔는지, 이 글에 대한 HN/업계 반응이 이번 조사에서 놓친 비판을 담고 있었는지 확인.)*
