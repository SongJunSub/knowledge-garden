---
title: "외부인의 시각으로 본 Scion과 Mononoke(GeekNews) — 빠른 실행력과 선행 작업 credit 부족은 별개 문제다"
source_title: "외부인의 시각으로 본 Scion과 Mononoke"
source_url: "https://news.hada.io/topic?id=36444"
source_name: "GeekNews"
referrer_url: "https://news.hada.io/topic?id=36444"
published_at: "2026-11-03"
summarized_at: "2026-11-03"
category: "engineering"
tags: ["anthropic", "scion", "mononoke", "version-control", "monorepo", "attribution"]
---

# 외부인의 시각으로 본 Scion과 Mononoke(GeekNews)

> 출처: [외부인의 시각으로 본 Scion과 Mononoke](https://news.hada.io/topic?id=36444) (GeekNews) · 정리일 2026-11-03
>
> **출처 한계**: news.hada.io 접근 차단으로 원문·hada 댓글을 직접 열람하지 못했다. WebSearch로 같은 소식을 다룬 여러 매체(zeli.app, braindetox.kr, explainx.ai 등)를 교차확인했으나, 이들 대부분이 2차 애그리게이터·일부는 기계생성 요약 성격의 매체라 품질이 낮다. "Anthropic이 이후 공식 포스트에 Mononoke를 명시적으로 credit했다"는 설도 있었지만 Anthropic 1차 포스트 자체는 이 세션에서 열람하지 못해 대조하지 못했다.

## 한 줄 요약

**Anthropic이 공개한 중앙집중형 버전 관리 시스템 Scion은 7명이 5개월 만에 모노레포 전환과 코드 리뷰·검색·접근 제어 도구까지 구축한 실행력이 인상적이지만, 설계의 상당 부분이 Meta의 기존 시스템 Mononoke(및 Bonsai 데이터 모델)와 겹치는데도 선행 작업 언급이 불충분하다는 비판을 받고 있다.**

## 핵심 포인트

- **설계 중복 비판의 핵심** — Scion과 Mononoke 모두 ***최소 변경셋(changeset) + 파생 데이터(derived data)*** 패턴을 쓴다. 커밋의 부모로부터 blame·경로 히스토리 같은 추가 인덱스를 미리 계산해두는 구조가 겹친다는 지적이다. WebSearch로 확인한 복수 매체에서 Mononoke 개발에 참여했던 인물(이용자명 "Rain"/"sunshowers")이 이 비판을 제기했다고 보도한다.
- **7명, 5개월의 실행력** — 모노레포 이전과 코드 리뷰·검색·접근 제어 도구까지 작은 팀이 짧은 기간에 구축한 점은 비판자들도 인정하는 대목이다. 다만 기존 Git 기반 도구·작업흐름에서 어떻게 전환했는지에 관한 실무 정보는 부족하다고 한다.
- **Claude "superfan"** — 컴포넌트별 상태를 집요하게 감시하는 운영 방식이 흥미로운 지점으로 언급되지만, 실제로 발견했다는 "미묘하고 새로운 문제"의 구체적 사례는 공개되지 않았다고 한다.
- **Credit 논쟁은 진행 중** — WebSearch 결과 "Anthropic이 이후 명시적으로 Mononoke·Bonsai를 credit했다"는 보도가 있으나 1차 확인은 못했다. 반대로 비판자는 "Sapling에는 '어려운 교훈'만 credit하고 Mononoke는 전혀 언급하지 않았다"고 주장한다 — 양측 서술이 엇갈려 아직 정리되지 않은 논쟁으로 보인다.

## 인상 깊은 문장

*(Slack 발췌가 TechArticles/GeekNews 봇의 요약체 불릿이라 원문 저자의 직접 인용문은 남아 있지 않다.)*

## 댓글

hada 댓글 수·HN/Lobsters 큐레이션 여부는 접근 차단으로 확인하지 못했다. **이해관계 명시**: 이 비판의 주요 제기자로 보이는 인물이 Mononoke 개발에 직접 참여했던 당사자라는 점에서, "경쟁 시스템의 원저자가 자기 작업의 선행성을 주장한다"는 구조적 편향 가능성이 있다. 비판의 사실관계(설계 중복 정도)와 당사자의 동기(credit 분쟁)를 분리해서 읽을 필요가 있다.

## 내 생각 · 적용점

**핵심 전이 — Git을 완전히 대체하는 극단과, Git을 보완하는 절충 사이의 스펙트럼.** [[2026-11-02-jujutsu-jj-workshop-for-git-users]]가 다룬 jj는 Git 저장소와 호환되면서 인덱스·stash 같은 개념만 다르게 다루는 "절충형" 대안이었다. Scion은 그 반대쪽 끝 — 조직 전체가 Git 자체를 버리고 처음부터 중앙집중형 시스템을 새로 짠 극단적 사례다. 또한 [[2026-10-02-git-3-0-sha256-default-mistake]]가 보여준 "기반 기술 변경이 실수로 이어질 수 있다"는 신중함과 대비해, Scion은 "빠른 재구축"을 택했다는 점도 흥미롭다. 그리고 이 비판 자체가 보여주는 교훈 — 선행 작업을 충분히 credit하지 않으면 실행력과 무관하게 커뮤니티 신뢰를 잃는다는 것 — 은 기술 블로그·오픈소스 발표 전반에 적용되는 원칙이다.

## 호스피탈리티 / CRS 적용 포인트

**적용 멀다.** 온다의 모노레포·VCS 규모가 Anthropic 수준의 자체 VCS 재발명을 필요로 할 단계는 아니다. 다만 "선행 작업을 충분히 credit하지 않고 기술 블로그를 내면 신뢰를 잃는다"는 교훈은, 내부·외부 기술 블로그 작성 시 참고 가치가 있다.

## 연관 자료

- [[2026-11-02-jujutsu-jj-workshop-for-git-users]] — Git을 보완하는 절충형 대안 VCS, Scion(완전 대체)과 대조되는 설계 철학
- [[2026-10-02-git-3-0-sha256-default-mistake]] — 기반 버전관리 기술을 바꿀 때의 신중함, Scion의 "빠른 재구축"과 대조

## 한 달 뒤 회고

*(2026-12-03 즈음 — Anthropic의 1차 공식 포스트에 접근 가능해지면 Mononoke credit 여부를 직접 대조해 이 노트의 "출처 한계"를 보강.)*
