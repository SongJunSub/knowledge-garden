---
title: "Perplexity, 대량생산된 구매 가이드를 소프트웨어 추천의 근거로 제시 — 380개 분야 조사 결과 인용의 59.8%가 Tranco 10만 위 밖 출처, 세 사이트가 21만 5천 개 '최고의 소프트웨어' 페이지를 찍어냈다"
source_title: "Three sites made 215,128 \"best software\" pages for AI. Perplexity cites them"
source_url: "https://trellner.com/reports/manufactured-sources-behind-ai-recommendations/"
source_name: "Trellner Research"
referrer_url: "https://news.hada.io/topic?id=33169"
published_at: "2026-09-02"
summarized_at: "2026-09-03"
category: "ai"
tags: ["geo", "ai-search", "llm-citations", "content-farms", "perplexity"]
---

# Perplexity, 대량생산된 구매 가이드를 소프트웨어 추천의 근거로 제시 — 380개 분야 조사 결과 인용의 59.8%가 Tranco 10만 위 밖 출처, 세 사이트가 21만 5천 개 '최고의 소프트웨어' 페이지를 찍어냈다

> 출처: [Three sites made 215,128 "best software" pages for AI. Perplexity cites them](https://trellner.com/reports/manufactured-sources-behind-ai-recommendations/) (Trellner Research) · GeekNews(id=33169) 경유 · 정리일 2026-09-03

## 한 줄 요약

**Trellner Research가 Perplexity의 웹 그라운딩 모델에 380개 소프트웨어 구매 카테고리를 질의한 결과, 7,534건의 인용 중 59.8%가 Tranco 글로벌 트래픽 순위 10만 위 밖 도메인에서 나왔다. 그중 홈페이지 HTML 제목을 스스로 "Facts & Grounding Page"라고 붙인 사이트를 포함한 3개 사이트(2023년 12월 이후 신설, 사실상 공동 운영 정황)가 21만 5,128개의 기계 생성 "최고의 소프트웨어" 페이지를 만들어 인용 근거로 자리 잡았다.**

## 핵심 포인트

- **조사 규모** — Perplexity의 두 웹 그라운딩 모델에 380개 소프트웨어 구매 카테고리를 질의, 7,534건의 인용을 분석.
- **핵심 수치** — 인용의 59.8%가 Tranco 10만 위 밖 도메인. 41개 분야에서 181회 인용된, 21만 개 이상의 대량 구매 가이드를 게시한 사이트 다수가 스스로를 "Facts & Grounding Page"로 표시.
- **의도적 설계 정황** — 이 페이지들은 사람이 읽도록 만들어진 게 아니라 모델이 읽도록(grounding 되도록) 설계됐다는 게 리포트의 핵심 지적. 세 도메인 모두 2023년 12월 이전에는 존재하지 않았다.
- **제품 리뷰 매체가 아닌 곳도 상위 출처** — 대화형 데모 SaaS인 Guideflow.com의 마케팅 블로그도 96개 분야에서 194회 인용돼 G2·Reddit에 이어 세 번째로 큰 출처가 됐고, Gartner까지 앞섰다.

## 인상 깊은 문장

> "Two of the sites doing the grounding have given their homepage the HTML title 'Facts & Grounding Page' — grounding being the retrieval step these models perform."

## 댓글

**출처 한계 부분적.** news.hada.io는 세션 내 접속 차단. WebSearch로 Trellner Research 리포트 원문 스니펫과 이를 인용한 2차 매체(explainx.ai)를 교차확인했으며, 핵심 수치(59.8%, 215,128개, 380개 분야)는 여러 출처에서 일치해 신뢰도가 높다고 판단했다. 다만 Trellner Research 자체가 2026년 설립된 독립 리서치 기관이라는 점, 리포트가 소프트웨어 구매 가이드라는 좁은 영역만 다룬다는 표본의 한계는 남는다.

## 내 생각 · 적용점

### 핵심 전이 1 — "가짜 표준"이 실제로 통한다는 증거의 반복

[[2026-08-30-cats-txt-llms-txt-geo-fake-standard]]가 "가짜 고양이 표준 cats.txt로 크롤됨·색인됨·인용됨·추천됨이라는 GEO의 '증거'가 가짜에도 똑같이 통했다"고 보였는데, 이 글은 그 실전판이다 — **AI가 인용하는 "근거"라는 개념 자체가 조작 가능한 신호**라는 걸 두 각도(합성 표준 vs 대량생산 콘텐츠 팜)에서 확인한 셈이다.

### 핵심 전이 2 — [[2026-07-16-how-chatgpt-picks-sources]]의 발견과 교차 검증

ChatGPT가 "가져오기와 인용을 분리하고 애초에 검색할 가치가 있을 때만 검색한다"는 분석이 있었는데, Perplexity 사례는 그 반대쪽 실패 사례다 — 검색은 하되 **검색 결과의 권위를 판별하는 필터가 콘텐츠 팜에 뚫린다.** "검색 여부를 잘 판단하는 것"과 "검색된 소스의 신뢰도를 판별하는 것"은 별개의 문제라는 게 두 노트를 나란히 놓으면 드러난다.

### 핵심 전이 3 — GEO 콘텐츠 팜은 아마존세 논의의 검색 버전

[[2026-08-19-the-amazon-tax]]가 "검색 결과를 왜곡하는 구조가 합법적 절도"라고 했는데, AI 답변 인용도 같은 왜곡에 노출된다는 걸 보여준다 — **검색 결과 순위 조작에서 AI 인용 조작으로 전장이 옮겨가고 있다.**

## 호스피탈리티 / CRS 적용 포인트

**직접 적용점 두 가지.** (1) 온다가 잠재 고객사에게 "AI가 추천하는 CRS/채널매니저"로 노출되길 원한다면, 이런 콘텐츠 팜과 경쟁하는 게 아니라 정직하고 진짜 권위 있는 출처(공식 문서, 실제 고객 사례, 업계 리포트)에 인용될 콘텐츠를 만드는 데 집중해야 한다는 반면교사. (2) 반대로 온다가 벤더·파트너를 평가할 때 "AI가 추천했다"는 근거를 그대로 믿지 말고, 인용 출처의 실제 트래픽·권위를 직접 확인하는 습관이 필요하다는 경고.

## 연관 자료
- [[2026-08-30-cats-txt-llms-txt-geo-fake-standard]] — *가짜 GEO 표준의 "증거"가 진짜와 구별 안 됐다는 같은 결론*
- [[2026-07-16-how-chatgpt-picks-sources]] — *검색 여부 판단은 정교한데 소스 신뢰도 판별은 별개 문제라는 대조*
- [[2026-08-19-the-amazon-tax]] — *검색 결과 왜곡이라는 같은 문제의 아마존 커머스 버전*

## 한 달 뒤 회고
*(2026-10-03 즈음 — 온다 관련 검색·AI 인용에서 유사한 콘텐츠 팜 패턴을 관찰했는지, 정직한 콘텐츠 전략으로 대응할 필요가 있었는지 기록.)*
