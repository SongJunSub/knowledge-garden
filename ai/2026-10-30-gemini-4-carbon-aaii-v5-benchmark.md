---
title: "Gemini 4 Carbon, AAII v5 1위, 코딩 에이전트 2위 (GeekNews) - 어제까지 실체를 의심했던 모델이, 오늘은 다수 매체가 독립적으로 확인했다"
source_title: "Gemini 4 Carbon, AAII v5 1위, 코딩 에이전트 2위"
source_url: "https://news.hada.io/topic?id=36229"
source_name: "GeekNews"
referrer_url: "https://ondainc.slack.com/archives/C0AJL0096H4"
published_at: "2026-10-28"
summarized_at: "2026-10-30"
category: "ai"
tags: ["google", "gemini", "benchmark", "aaii", "model-release", "cybersecurity", "retraction-correction"]
---

# Gemini 4 Carbon, AAII v5 1위, 코딩 에이전트 2위 (GeekNews)

> 출처: [GeekNews](https://news.hada.io/topic?id=36229) · Slack `#개발-뉴스-dev-news`(GeekNews 자동봇) 경유 · 정리일 2026-10-30

> **출처 한계 (그리고 정정)**: `news.hada.io`가 이 세션에서 egress 전면 차단되어 원문은 못 열었다. 다만 어제([[2026-10-29-gemini-4-carbon]]) 작성한 노트에서는 WebSearch로도 "Gemini 4 Carbon"의 실존을 확인하지 못해 "Argon의 재방송일 수 있다"는 의심을 전제로 깔았는데, **이번에는 WebSearch에서 aiweekly.co, officechai.com, digg.com, khaleejtimes.com, fourweekmba.com 등 다수의 독립 매체가 "Google이 10월 28일 Gemini 4 Carbon을 공개했다"고 일치해서 보도하는 것을 확인했다.** artificialanalysis.ai에도 `gemini-4-carbon-vs-gemini-4-argon` 비교 페이지가 실제로 존재한다(페이지 접속은 됐으나 점수 상세는 셀 비어 있어 59점을 그 페이지에서 직접 재확인하지는 못했다). 즉 **모델의 실존 자체는 이번에 확인됐지만, 어제 노트의 의심(Argon과 거의 동일한 포지셔닝 재탕 아니냐는 것)은 여전히 유효한 질문으로 남는다** - Carbon은 Argon의 "후속 버전"이 맞고, 벤치마크 수치도 다르므로 리브랜딩이 아니라 실제 신모델이라는 쪽으로 결론을 정정한다.

## 한 줄 요약

**Gemini 4 Carbon이 Artificial Analysis Intelligence Index v5.0에서 59점으로 1위에 올랐고(Claude Opus 5.5 58점, GPT-6 Astra 57점을 근소하게 앞섬), 코딩 에이전트 평가에서는 Antigravity CLI와 함께 59점으로 2위를 기록했다(Claude Opus 5.5 기반 Claude Code의 62점보다 낮음) - 어제까지 실존을 의심했던 모델이, 오늘은 여러 독립 매체가 교차 확인하는 실제 출시로 확인됐다.**

## 핵심 포인트

- **종합 지수 1위, 근소한 차이** - AAII v5.0에서 ***59점으로 1위***, 2위 Claude Opus 5.5(58점)·3위 GPT-6 Astra(57점)와 1점 차의 근소한 우위다. WebSearch로 확인한 순위표에는 Gemini 4 Argon(50점)·Claude Fable 5.1(49점)도 함께 나열돼, Argon 대비 ***9점이나 뛴 후속작***이라는 게 맞다.
- **코딩 에이전트에서는 Claude Code가 여전히 1위** - 코딩 에이전트 평가(Antigravity CLI 구동)에서 59점으로 2위에 그쳤고, ***Claude Opus 5.5 기반 Claude Code의 62점이 여전히 1위***다. "종합 지능 1위 ≠ 코딩 에이전트 1위"라는 괴리가 이번에도 재확인된다.
- **보안 특화 지표가 발표의 핵심 프레이밍** - WebSearch로 확인한 복수 매체에 따르면 이번 발표는 ***범용 성능보다 사이버보안 방어 역량을 중심 프레이밍으로 내세웠다*** - SEC-bench Pro 88.2%, ExploitGym 54.8%, CWE-bench 71.0%는 어제 노트의 수치와 일치해, 이 수치 자체는 Slack 발췌가 정확했던 것으로 보인다.
- **공개 범위는 제한적** - Carbon은 ***폐쇄형 모델로, 사이버 보안 방어자(cyber defenders) 일부에게만 먼저 공개***된다고 WebSearch로 확인됨 - "AAII 1위"라는 타이틀과 "누구나 쓸 수 있는 공개 모델"은 다른 이야기다.
- **지식 평가(AA-Omniscience)** - 54점으로 선두, 정답률은 Argon보다 10%포인트 높은 58%지만 환각률도 4%에서 11%로 올라갔다는 Slack 발췌 - 이 트레이드오프(정답률 상승 + 환각률 상승)는 WebSearch로 별도 재확인은 못 했다.

## 인상 깊은 문장

> "Gemini 4 Carbon 59, Claude Opus 5.5 58, GPT-6 Astra 57, Gemini 4 Argon 50, Claude Fable 5.1 49." (WebSearch로 교차확인한 AAII v5.0 순위, 복수 매체 일치)

## 댓글

hada 댓글 수·HN/Lobsters 큐레이션 여부는 원문 접근 차단으로 확인 불가. **정직하게 밝힐 점**: 이번 WebSearch 교차확인으로 Carbon의 실존은 확인했지만, 그 근거가 된 매체 다수가 "Google의 공개 발표 표를 그대로 인용"하는 구조였다 - 즉 제3자 독립 재현이 아니라 벤더 발표의 반복 보도일 가능성이 있다. artificialanalysis.ai 자체 페이지에서 59점을 숫자로 직접 재확인하지 못한 것도 같은 맥락의 한계다.

## 내 생각 · 적용점

**핵심 전이 1 - 가든의 "출처 한계" 원칙이 실제로 작동한 사례.** 어제 노트([[2026-10-29-gemini-4-carbon]])에서 "실존을 확인 못 했다"고 솔직하게 적어둔 덕에, 오늘 새 정보가 들어왔을 때 "틀렸던 전제를 정정한다"는 작업이 자연스럽게 가능했다. 만약 어제 노트가 불확실성을 숨기고 "Carbon이 출시됐다"고 확정적으로 썼다면, 오늘의 정정이 "원래 맞았던 걸 다시 확인"하는 것처럼 보여 인식론적 차이가 지워졌을 것이다 - **불확실성을 기록해두는 것 자체가, 나중에 정정이 들어왔을 때 그 정정의 의미를 더 선명하게 만든다.**

**핵심 전이 2 - "종합 1위 vs 코딩 에이전트 2위"라는 괴리가 이번에도 반복된다.** 어제 노트가 지적한 "AAII 1위·WebDev Arena 4위"의 괴리와 본질적으로 같은 패턴이다. 종합 지능 지수가 실제 작업형 에이전트 성능과 분리되는 경향은, 벤치마크 선택이 모델 비교의 서사를 얼마나 좌우하는지를 보여준다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 멀다. Carbon이 폐쇄형으로 보안 방어자 일부에게만 먼저 공개된다는 점에서, CRS가 당장 평가 대상으로 올릴 수 있는 모델도 아니다. 다만 "벤더가 발표한 벤치마크 1위 타이틀을, 그 모델을 실제로 쓸 수 있는지와 분리해서 봐야 한다"는 원칙은 어제 노트에서 이미 뽑았던 것과 동일하게 유지한다.

## 연관 자료

- [[2026-10-29-gemini-4-carbon]] - 바로 전날 작성한 선행 노트. 당시엔 실존 자체를 의심했으나, 이 노트에서 그 의심을 정정했다.
- [[2026-10-14-google-gemini-4-argon-general-availability]] - Carbon의 전신 모델, 같은 포지셔닝(장기 에이전트·사이버 보안)의 선행 발표.
- [[2026-10-01-google-gemini-4-argon]] - Argon 최초 발표 노트.

## 한 달 뒤 회고

*(2026-11-30 즈음 - Carbon의 공개 범위가 확대됐는지, "사이버 보안 방어자 한정 공개"가 실제로 일반 공개로 전환됐는지, artificialanalysis.ai에서 59점을 직접 재확인할 수 있게 됐는지 점검한다.)*
