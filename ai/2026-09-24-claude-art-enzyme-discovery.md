---
title: "Claude, CRISPR와 닮은 반복 서열을 가진 새 효소 시스템 ART 발견 (Anthropic) — 950개 에이전트가 21시간 걸려 내놓은 것은 발견이 아니라 아직 아무도 기능을 모르는 가설이다"
source_title: "Claude discovers a novel enzyme system"
source_url: "https://www.anthropic.com/news/claude-discovers-novel-enzyme-system"
source_name: "Anthropic 공식 블로그, GeekNews(id=34195) 경유"
referrer_url: "https://news.hada.io/topic?id=34195"
published_at: "2026-09-23"
summarized_at: "2026-09-24"
category: "ai"
tags: ["anthropic", "claude", "ai-for-science", "enzyme-discovery", "crispr", "preprint", "reproducibility", "bacteriophage"]
---

# Claude, CRISPR 유사 반복 서열을 가진 새로운 효소 시스템 발견

> 출처: [Claude discovers a novel enzyme system](https://www.anthropic.com/news/claude-discovers-novel-enzyme-system) (Anthropic 공식 블로그, GeekNews 경유) · 정리일 2026-09-24
>
> **출처 한계**: `news.hada.io` egress 차단으로 GeekNews 원문은 못 봤으나, `anthropic.com` 공식 블로그는 WebFetch로 직접 열람에 성공했다. 다만 이 글이 **당사자 발표문**(Anthropic이 자사 신규 생명과학 연구소 개소와 함께 내놓은 성과물)이라는 점, 그리고 결과가 **동료 심사를 거치지 않은 preprint** 단계라는 점은 원문이 스스로 밝힌다. 아래 "재현성 문제"·"전문가 반응"은 원문에 직접 없고 WebSearch로 찾은 2차 보도(thenextweb, redreamality.com 등)의 스니펫 기반이라 별도로 표시했다 — 1차 확인은 하지 못했다.

## 한 줄 요약

**Anthropic이 대규모 DNA 데이터베이스에서 약 950개의 Claude 에이전트를 21시간 동안 돌려, 역전사효소·보조 단백질·CRISPR와 닮은 반복 DNA 배열로 이뤄진 새 효소 시스템 ART(array-associated reverse transcriptase)를 찾아냈다고 발표했다 — 다만 이 결과는 동료 심사 전 preprint이고, ART가 실제로 무슨 기능을 하는지는 Anthropic 자신도 아직 모른다.**

## 핵심 포인트

- **대규모 병렬 에이전트 탐색으로 후보를 좁힌 구조** — ***약 950개의 Claude 에이전트가 21시간 동안 2억 1,000만 토큰을 사용***해 20만 개 이상의 역전사효소(RT)를 조사했고, 3,500개의 후보 시스템을 만든 뒤 ***가장 유망한 20개로 좁혀*** 심층 분석했다.
- **ART는 세 부분으로 구성** — 역전사효소(RT), 그 옆의 보조 유전자, 그리고 ***CRISPR와 닮은 일정 간격의 DNA 반복 배열***로 이뤄진다. RT 자체는 기존에도 (특히 jumbo phage에서) 보고됐지만, 이 세 요소가 함께 시스템을 이룬다는 점을 처음 특정한 것이 Claude라는 게 Anthropic의 주장이다.
- **박테리아를 감염시키는 바이러스(박테리오파지)에서 주로 발견** — 초기 실험에서 이 반복 배열이 ***서로 다른 짧은 RNA를 만드는 것***을 확인했다고 밝혔지만, RNA 배열이 정확히 어떤 생물학적 역할을 하는지는 아직 규명되지 않았다.
- **동료 심사 전 preprint, 기능 미상** — Anthropic은 이 결과를 ***완전한 규명 전에 의도적으로 조기 공개***했다고 밝힌다. 즉 "발견"이라는 표현이 붙었지만 실제로는 "흥미로운 패턴을 찾았고, 그게 뭔지는 아직 모른다"는 단계다.

## 인상 깊은 문장

> "We don't yet understand what this system does, but only a handful of known systems..."
> (Anthropic 공식 X(트위터) 계정, ART 발표 스레드 — WebSearch로 확인한 원문 인용)

## 댓글

**확인 불가.** hada 댓글 수는 원문 접근 차단으로 확인하지 못했다. 다만 이 발표 자체가 **Anthropic의 신규 생명과학 연구소·연구 그룹 개소와 동시에 나온 첫 성과물**이라는 점은 짚어야 한다 — 즉 "우리가 AI로 진짜 과학적 발견을 해냈다"는 서사가 회사 차원의 신사업 발표와 정확히 같은 타이밍에 나온 자사 홍보 콘텐츠이기도 하다. WebSearch로 찾은 2차 보도(redreamality.com)에는 **"같은 실험 캠페인을 10번 다시 돌렸더니 10번 다 이 반복 배열을 놓쳤다"**는 재현성 문제 제기가 있었는데, 이건 Anthropic 원문에서 직접 확인하지 못했고 출처의 신뢰도도 검증하지 못했으므로 **사실로 단정하지 않는다**. 마찬가지로 "CRISPR 개발자 Feng Zhang이 'genuinely intriguing'이라 평가했고, 다른 미생물학자는 회의적이었다"는 것도 2차 보도 스니펫이며 원 인터뷰를 직접 확인하지 못했다. **n=1 발표(당사자 자체 preprint) + 미확인 2차 비판이라는 두 겹의 불확실성**을 감안하고 읽어야 한다.

## 내 생각 · 적용점

### 핵심 전이 — 병렬 실험 루프를 회사 전략으로 삼은 곳이 실제로 그 전략을 실행해 보여준 사례

[[2026-08-06-discovery-loop-jeff-dean-startup]]에서 정리했던 Discovery Loop의 미션 — ***"실험의 제안→실행→평가→학습으로 이어지는 전체 루프를 프런티어 AI와 대규모 컴퓨팅으로 자동화해 수천 개 실험을 병렬 수행한다"*** — 이 이번 Anthropic 사례에서 실제 형태로 나타난다: 950개 에이전트가 20만 개 후보를 3,500개로, 다시 20개로 좁히는 깔때기 구조가 정확히 그 "제안→평가→축소" 루프다. 다만 Discovery Loop 노트에서 짚었던 것과 같은 아쉬움이 여기도 있다 — **"결과를 조기에, preprint 단계에서 공개한다"는 판단 자체가 얼마나 신중했는지**에 대한 자기 검토는 이 발표에 없다. [[2026-09-18-anthropic-measuring-pace-ai-development]]에서 봤던 같은 회사의 패턴과도 겹친다 — 그 노트에서 Anthropic은 "Claude가 R&D의 26%를 주도해도 완전 자율 업무는 하나도 없다"며 스스로 신중한 톤을 취했는데, 이번 발표는 반대로 "새로운 효소 시스템을 발견했다"는 더 확신에 찬 언어를 쓴다 — **같은 회사가 발표 성격(내부 감독 보고서 vs 대외 성과 발표)에 따라 신중함의 온도를 다르게 조절한다**는 점이 흥미롭다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 매우 멀다 — 생명과학 발견과 B2B 호스피탈리티 CRS는 도메인이 완전히 다르다. 다만 전이 가능한 원칙 하나는 남긴다 — ***"대량 후보를 병렬 에이전트로 훑어 소수로 좁히고, 최종 판단은 사람이 한다"는 깔때기 구조***(20만 개 → 3,500개 → 20개)는 CRS의 이상 거래·중복 예약·사기 의심 건 탐지 파이프라인에도 원칙적으로 참고할 수 있는 패턴이다. 반면 **"미검증 결과를 preprint 단계에서 확신에 찬 언어로 공개하는" 관행은 반면교사**로 읽는다 — 내부 보고서나 실험 결과를 공유할 때는 "아직 기능/원인을 모른다"는 불확실성을 결론보다 먼저, 명확하게 앞세워야 한다.

## 연관 자료

- [[2026-08-06-discovery-loop-jeff-dean-startup]] — 병렬 실험 루프 자동화를 회사 전략으로 삼은 사례, 이번 Anthropic 발표가 그 전략의 실제 실행판
- [[2026-09-18-anthropic-measuring-pace-ai-development]] — 같은 회사의 다른 발표(내부 감독 지표)와 신중함의 온도 차이

## 한 달 뒤 회고

*(2026-10-24 즈음 — ART의 preprint가 동료 심사를 통과했는지, 기능이 규명됐는지, 재현성 문제 제기(10회 재실행 실패설)가 다른 독립 연구자에 의해 확인·반박됐는지 점검.)*
