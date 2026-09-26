---
title: "Factorio, 만질 수 있게 되다 (Wube Software × Prusa Research) — 게임 그리드의 정밀함을 3D프린터 공차의 물리 세계로 번역한 2년짜리 사이드 프로젝트"
source_title: "Friday Facts #447 - Factorio that you can touch"
source_url: "https://factorio.com/blog/post/fff-447"
source_name: "Factorio Blog (Wube Software)"
referrer_url: "https://news.hada.io/topic?id=34278"
published_at: "2026-09-25"
summarized_at: "2026-09-26"
category: "engineering"
tags: ["factorio", "3d-printing", "prusa", "hardware", "hobbyist-culture", "design-tolerance", "game-dev"]
---

# Factorio, 만질 수 있게 되다 (Wube Software × Prusa Research)

> 출처: [Friday Facts #447 - Factorio that you can touch](https://factorio.com/blog/post/fff-447) (Factorio Blog) · GeekNews 경유(https://news.hada.io/topic?id=34278) · 정리일 2026-09-26

## 한 줄 요약

**Factorio 팀이 3D프린터 제조사 Prusa Research와 협업해, 게임 속 컨베이어 벨트 등 부품을 실제로 조립 가능한 3D프린팅 모델 247개 STL 파일로 만들어 Printables에 공개했다 — 게임 밸런싱에 쓰던 것과 같은 엄격함(허용오차·스케일·그리드 정합성)을 물리적 프린팅에도 그대로 요구한 사례.**

## 핵심 포인트

- 2024년 여름, Space Age DLC 플레이테스트 이벤트에서 Prusa Research와 협업한 것이 계기가 되어 팀원들이 여가 시간에 이어간 사이드 프로젝트가 2년 만에 결실을 맺었다.
- 벨트(트랜스포트 벨트)를 시작점으로 삼아 ***게임 내 엔티티를 그대로 따라가는 그리드 시스템***을 먼저 설계한 뒤 다른 엔티티들로 확장했다.
- 총 247개의 STL 파일을 제공하며, ***일부는 푸시핏(끼워맞춤) 조립용으로 빡빡한 공차를, 일부는 접착 조립을 위한 여유 공차***를 두는 등 서로 다른 허용오차·스케일 변형을 나눠 제공한다.
- Prusa의 Printables 플랫폼을 통해 배포되며, 이는 팬 커뮤니티가 이미 자발적으로 만들어 온 Factorio 3D프린팅 모델 문화(Factorio 포럼에 오래전부터 존재)와 공식적으로 만나는 지점이다.
- 게임 안에서는 완벽한 그리드/자동화 로직으로 존재하던 것을, 3D프린터의 물리적 공차·중력·재료 특성이라는 완전히 다른 제약 조건으로 "번역"해야 했다는 점에서 소프트웨어 설계와 물리 제작 사이의 간극을 다루는 엔지니어링 문제다.

## 인상 깊은 문장

> "Factorio that you can touch" — Friday Facts #447 제목 자체가 이 프로젝트의 정서를 압축한다. (원문 발췌 인용을 구하지 못해 제목과 요약으로 대체함)

## 댓글

**출처 한계**: factorio.com은 이 환경에서 WebFetch가 egress 차단되어 원문 전체를 직접 읽지 못했고, WebSearch 스니펫으로만 내용을 재구성했다. news.hada.io 원문 댓글 수도 직접 확인 불가. Hacker News에 "Factorio that you can touch"라는 제목으로 스레드가 있으며(item id=49845133로 추정), 검색 집계 기준 322포인트·107댓글 수준의 큰 화제였던 것으로 보이지만 HN 페이지 직접 열람이 막혀 이 수치를 1차 검증하지는 못했다. Factorio 공식 포럼(forums.factorio.com/136300)에도 별도 스레드가 있다. 게임사 공식 발표 + 팬덤 대상 콘텐츠라는 성격상 비판적 논조보다는 감상·환영 위주일 가능성이 높다는 점도 감안해야 한다(n=1 유형의 편향).

## 내 생각 · 적용점

### 핵심 전이 1 — making의 정서적 보람, 반대 방향에서

[[2026-07-24-on-making-things-beej]]는 "만드는 데서 오는 보람은 결과의 규모가 아니라 누가 만들었는가에 달려 있다"고 말한다. 이번 사례는 정반대 방향에서 같은 정서를 건드린다: 원래 화면 속 디지털 존재였던 것을 "내 손으로 직접 조립"하게 만들어 소유감·성취감을 물리적으로 확장시킨 것이다. Beej의 논지가 "직접 코드를 짜야 내 것"이라면, 이건 "직접 조립해야 내 게임 세계"라는 확장판에 가깝다.

### 핵심 전이 2 — 스케일과 장인정신의 화해 가능성

[[2026-08-06-hobbyist-communities-against-llm]]의 Lobsters 댓글 논점 중 하나가 실제로 "3D프린팅 비유(품질저하 우려)"였다 — 취미 커뮤니티가 대량생산/자동화에 대해 갖는 양가감정이다. 이번 Factorio×Prusa 협업은 그 우려에 대한 긍정적 반례가 될 수도 있다: 공식 3D프린팅 배포가 팬 커뮤니티의 자발적 제작 문화를 대체하지 않고 오히려 확장하는 모델이 될 수 있을지는 지켜볼 지점이다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 멀다 — 온다는 게임 굿즈나 하드웨어 제조업이 아니다. 다만 "디지털 설계(게임 로직)를 물리적 제약(3D프린터 공차)에 맞춰 재설계하면서도 원래의 정밀도 기준을 타협하지 않았다"는 태도는, CRS가 온라인 재고·요금 로직을 오프라인 호텔 운영의 물리적 제약(체크인 시간, 객실의 실제 상태, 현장 예외)에 맞춰 번역할 때도 원래의 정합성 기준을 낮추지 않아야 한다는 원칙으로 느슨하게 전이할 수 있다.

## 연관 자료

- [[2026-07-24-on-making-things-beej]] — making에서 오는 정서적 보람이라는 축.
- [[2026-08-06-hobbyist-communities-against-llm]] — 취미 커뮤니티와 장인정신·스케일 사이의 긴장, 3D프린팅 비유가 실제로 등장했던 노트.

## 한 달 뒤 회고

*(2026-10-26 즈음 — Printables에서 이 모델들의 실제 다운로드/제작 후기가 쌓였는지, Factorio 커뮤니티가 이를 "공식 굿즈"로 반기는지 확인.)*
