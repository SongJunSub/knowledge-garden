---
title: "API 가격대별 최고의 LLM 알아보기 (terrydjony) — 지능-가격 프론티어를 '내 예산에 맞는 줄'로 바꿔주는 정적 페이지 하나"
source_title: "Best value LLM"
source_url: "https://bestmodelforyourbudget.terrydjony.com/"
source_name: "terrydjony (GitHub: terryds/bestvaluemodel), GeekNews(id=34242) 경유"
referrer_url: "https://news.hada.io/topic?id=34242"
published_at: "2026-09 (정확한 게시일 미확인, 정리일에 근접한 것으로 추정)"
summarized_at: "2026-09-25"
category: "ai"
tags: ["llm-pricing", "artificial-analysis", "value-frontier", "cost-per-task", "model-selection", "aaii"]
---

# API 가격대별 최고의 LLM 알아보기

> 출처: [Best value LLM](https://bestmodelforyourbudget.terrydjony.com/) (terrydjony, Artificial Analysis 데이터 기반) · GeekNews(id=34242) 경유 · 정리일 2026-09-25
>
> **출처 한계**: `news.hada.io`·`bestmodelforyourbudget.terrydjony.com` 모두 이 세션에서 egress 차단돼 원문을 직접 열람하지 못했다. WebSearch로 제작자의 GitHub 저장소(`terryds/bestvaluemodel`) 설명을 확인해 도구의 정확한 동작 방식(Artificial Analysis Intelligence Index 대 블렌디드 API 가격을 플로팅하고 "가치 프론티어"를 표시, GitHub Actions cron으로 일 단위 자동 갱신, Cloudflare 배포)을 교차확인했다 — 이 설명은 Slack 발췌 5개 불릿과 세부까지 정확히 일치한다.

## 한 줄 요약

**개발자 terrydjony가 만든 이 정적 페이지는 Artificial Analysis Intelligence Index(AAII)와 블렌디드 API 가격(입력:출력 = 3:1 혼합, 100만 토큰당)을 산점도로 그려 "가치 프론티어(value frontier)" — 같은 가격에 더 똑똑한 모델이 없는 지점들 — 를 강조한다. 예산을 입력하면 그 예산에서 가장 높은 점수를 받는 모델과 차선책을 바로 찾을 수 있고, 데이터는 Artificial Analysis의 무료 API를 GitHub Actions cron이 매일 긁어와 자동 갱신한다.**

## 핵심 포인트

- **가치 프론티어 = 룩업 테이블처럼 쓰는 산점도** — 모든 모델을 AAII 점수(종합 지능) 대 API 가격으로 플로팅하고, ***"같은 가격에 더 똑똑한 모델이 없는" 모델들만 프론티어 선으로 연결***한다. 예산에 해당하는 가격대를 찾으면 그 줄에서 가장 높은 점수를 받은 모델이 추천, 다음으로 좋은 대안이 차선책이다.
- **평가 능력을 종합/코딩/수학 중 선택 가능** — Artificial Analysis 데이터를 그대로 쓰기 때문에, 종합 지능뿐 아니라 ***코딩·수학처럼 특정 능력 기준으로 비교 축을 바꿀 수 있다***(Slack 발췌).
- **가격 정의 — 입력:출력 3:1 블렌디드, 100만 토큰당** — 표시되는 "가격"은 ***입력과 출력 토큰을 3:1로 섞은 100만 토큰당 비용***으로 정의돼, 단순 입력 단가나 출력 단가만으로는 비교할 수 없는 실사용 비용에 더 가깝게 맞춘다.
- **속도·응답 지연까지 함께 확인** — Artificial Analysis 데이터에 포함된 ***중앙값·백분위수 출력 속도(tokens/sec), 첫 토큰까지 걸리는 시간(TTFT), 첫 응답 토큰까지 걸리는 시간, 종단 간 응답 시간***도 함께 볼 수 있다.
- **매일 자동 갱신, 변경 있을 때만 재배포** — ***GitHub Actions cron이 Artificial Analysis 무료 데이터 API를 매일 가져오고***, 실제로 값이 바뀐 경우에만 Cloudflare로 재배포한다 — 수작업 갱신 없이 최신 모델·가격 변동이 반영되는 구조다.
- **한 사람이 만든 정적 페이지, 소스 공개** — GitHub 저장소(`terryds/bestvaluemodel`)에 소스가 공개된 개인 프로젝트로, Artificial Analysis 자체 제품이 아니라 그 데이터를 재가공한 서드파티 도구라는 점을 밝혀둘 필요가 있다.

## 인상 깊은 문장

> "The frontier works as a lookup table where you find the row your budget falls in, and the pick is the highest-scoring model you can get at that price, with a runner-up being the next best that also fits." (제작자 GitHub 저장소 설명, WebSearch 교차확인)

## 댓글

**댓글 수 확인 불가.** hada 댓글 수를 확인하지 못했다(원문 egress 차단). GeekNews GN⁺가 도구·리소스 소개 성격으로 올린 글로 추정되며, HN/Lobsters 큐레이션 여부는 확인하지 못했다. **정직성 노트**: 이 도구는 Artificial Analysis라는 단일 제3자 벤치마크 기관의 데이터에 전적으로 의존한다 — AAII 자체의 한계([[2026-09-07-artificial-analysis-aaii-v4-2]]에서 다룬 벤치마크 체계 자체의 대표성 문제)가 이 도구의 추천에도 그대로 상속된다. "가장 저렴하면서 가장 똑똑한 모델"이 실제 업무에서도 최선이라는 보장은 없다 — 토큰당 최저가가 과제당 최저가와 다르다는 건 이 가든이 이미 여러 번 짚은 함정이다.

## 내 생각 · 적용점

### 핵심 전이 1 — 이 가든에 쌓인 개별 모델 비용 분석 노트들이 실은 이 도구가 자동으로 하려는 일을 손으로 하고 있었다

[[2026-09-23-xiaomi-mimo-v2-6-pro-cost-analysis]]와 [[2026-09-23-claude-opus-5-5-reasoning-effort-cost]]는 각각 한 모델씩 AAII 점수와 과제당 비용을 따로 정리했다. 이 도구는 그 작업을 ***모든 모델에 대해 한 번에, 매일 자동으로*** 해주는 셈이다 — 개별 모델 노트가 "이 모델이 프론티어에 있는가"를 사후에 서술했다면, 이 도구는 그 프론티어 자체를 실시간으로 유지한다. CRS 팀이 모델을 고를 때마다 이 가든의 개별 노트를 뒤지는 대신, 이런 프론티어 도구를 예산 입력 한 번으로 참고하는 편이 더 효율적일 수 있다는 실무적 시사점이 있다.

### 핵심 전이 2 — "토큰당 최저가 ≠ 과제당 최저가"라는 함정을 도구 자체가 인정한다

WebSearch로 확인한 제작자 설명은 ***"가장 저렴한 게 과제당 가장 저렴한 것은 아니다 — 세 번 시도해야 하거나, 프롬프트가 길어지거나, 사람이 정리해야 하는 저가 모델은 한 번에 정확히 해내는 중간급 모델보다 비쌀 수 있다"***고 스스로 단서를 단다. 이는 [[2026-09-23-claude-opus-5-5-reasoning-effort-cost]]가 짚은 "effort 설정이 실제 추론량을 보장하지 않는다"는 경고와 같은 결이다 — **벤치마크 표의 숫자와 실제 워크로드에서의 비용은 다른 질문**이라는 원칙이 도구 제작자 스스로의 입으로도 반복된다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용 가능하다.** CRS의 여러 AI 기능(문의 분류, 요약, 응답 초안)은 저마다 요구되는 지능 수준이 다르므로, 이런 가격대별 프론티어 도구를 활용해 **각 기능이 실제로 필요한 지능 수준에 맞는 최저가 모델을 정기적으로 재검토**하는 루틴을 만들 수 있다 — 모델·가격이 매주 바뀌는 시장에서 "작년에 고른 모델이 여전히 최선인가"를 매번 수작업으로 확인하는 대신, 이런 자동 갱신 도구를 정기 점검 체크리스트에 넣는 것이 실무적이다. 다만 도구 자체가 경고하듯 벤치마크 점수만으로 모델을 바꾸지 말고, 실제 CRS 업무 샘플로 최종 검증하는 절차는 별도로 유지해야 한다.

## 연관 자료
- [[2026-09-23-xiaomi-mimo-v2-6-pro-cost-analysis]] — 개별 모델(MiMo-V2.6-Pro)의 AAII·비용 분석, 이 도구가 자동화하려는 작업의 수작업 버전
- [[2026-09-23-claude-opus-5-5-reasoning-effort-cost]] — 개별 모델(Opus 5.5)의 추론 설정별 비용 분석, "토큰당 vs 과제당 비용"이라는 같은 함정을 다룬 짝
- [[2026-09-07-artificial-analysis-aaii-v4-2]] — 이 도구가 의존하는 AAII 벤치마크 체계 자체에 대한 이전 글

## 한 달 뒤 회고
*(2026-10-25 즈음 — 이 도구를 CRS AI 기능 선정에 실제로 참고해봤는지, 프론티어 상단 모델이 한 달 사이 얼마나 바뀌었는지 확인해 "매일 자동 갱신"의 실질적 가치를 체감했는지 기록.)*
