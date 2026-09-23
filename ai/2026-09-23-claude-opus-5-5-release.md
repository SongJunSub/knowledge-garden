---
title: "Claude Opus 5.5 출시 — 비용은 40% 낮추고 속도는 30% 올리면서 Fable 5.1 수준 성능까지 (Anthropic)"
source_title: "Claude Opus 5.5 출시"
source_url: "https://www.anthropic.com/news/claude-opus-5-5"
source_name: "Anthropic 공식 발표, GeekNews(id=34135) 경유"
referrer_url: "https://news.hada.io/topic?id=34135"
published_at: "2026-09-22"
summarized_at: "2026-09-23"
category: "ai"
tags: ["claude-opus-5-5", "anthropic", "model-release", "pricing", "writing-style"]
---

# Claude Opus 5.5 출시

> 출처: [Claude Opus 5.5 출시](https://news.hada.io/topic?id=34135) (Anthropic, GeekNews 경유) · 정리일 2026-09-23
>
> **출처 한계**: `news.hada.io`·`anthropic.com` 모두 egress 차단으로 원문 직접 열람 불가. GeekNews 발췌(4개 불릿, 마지막 문장은 API 가격에서 잘림)와 WebSearch 교차확인(BNN Bloomberg, 9to5Mac, the-decoder)으로 재구성했다.

## 한 줄 요약

**Claude 5.5 제품군의 첫 모델인 Opus 5.5는 대부분 작업에서 Fable 5.1 수준의 성능을 내면서도 기본 설정 기준 Opus 5보다 작업 비용은 40% 낮고 출력 생성은 30% 이상 빠르며, 불필요한 전문용어·장황한 표현을 줄이고 사용자가 지정한 글쓰기 규칙을 더 잘 따르도록 개선됐다.**

## 핵심 포인트

- **Fable 5.1 수준 성능을 더 낮은 비용에** — 대부분의 작업에서 ***Fable 5.1 수준의 성능***을 내며, 코딩·컴퓨터 사용·문서 작성 등 전문 업무 능력을 끌어올렸다.
- **비용 40% 절감 + 속도 30% 향상** — 기본 설정의 일반적인 작업 비용은 Opus 5보다 ***40% 낮고***, 출력 생성은 ***30% 이상 빨라졌다*** — 토큰 단가와 작업에 필요한 토큰 사용량을 함께 줄인 결과다.
- **대규모 코드·지식 업무에서 성능·효율 동시 개선** — WebSearch 교차확인으로는 컨텍스트 윈도우가 100만 토큰까지 확장됐고, 기본 reasoning effort가 Opus 5의 high에서 medium으로 낮아졌다.
- **"Claudish" 글쓰기 습관 교정** — ***중요한 정보를 먼저 전달하고 불필요한 전문용어와 장황한 표현을 줄이며***, 사용자가 지정한 글쓰기 규칙(스타일 가이드)을 더 잘 따르도록 개선했다 — the-decoder는 이를 "덜 Claude스러운(Claudish) 글쓰기"라고 표현했다.
- **API 가격** — 100만 토큰당 입력 4달러 / 출력 20달러(Opus 5는 5달러/25달러), 캐시 읽기 단가도 0.50달러에서 0.20달러로 낮아졌다. Sonnet 5.5·Haiku 5.5도 향후 수 주 내 출시 예정.

## 인상 깊은 문장

> "기본 설정의 일반적인 작업 비용은 Opus 5보다 40% 낮고, 출력 생성은 30% 이상 빨라짐. 토큰 단가와 작업에 필요한 토큰 사용량을 함께 줄임."
> (GeekNews 발췌 원문)

## 댓글

**확인 불가.** hada 댓글 수를 직접 확인하지 못했다(원문 페이지 egress 차단). Anthropic 자사 발표문이므로 벤치마크·비용 수치는 자사 선정 기준일 가능성을 감안해야 한다 — 다만 같은 날 나온 [[2026-09-23-claude-opus-5-5-reasoning-effort-cost]]의 Artificial Analysis 제3자 수치와 비교하면 큰 괴리는 없다.

## 내 생각 · 적용점

### 핵심 전이 — 가든의 Claude 5 계열 출시 타임라인에 "글쓰기 습관 교정"이라는 새 축이 더해짐

[[2026-07-25-claude-opus-5-release]], [[2026-06-30-claude-sonnet-5-release]], [[2026-09-02-claude-fable-5-1-mythos-5-1-release]]로 이어지는 가든의 Claude 5 계열 출시 기록에 이번 글이 더하는 것은 성능·비용 수치가 아니라 ***"장황한 표현을 줄이고 사용자 글쓰기 규칙을 더 잘 따른다"***는 대목이다. 이는 가든이 이미 [[2026-08-16-why-opus-5-feels-worse]] 같은 글에서 다뤘던 "벤치마크 점수와 실제 체감 품질의 괴리" 문제에 Anthropic이 직접 반응한 것으로 읽힌다 — 점수보다 "글이 덜 AI스럽게 읽히는가"가 실사용 만족도에 더 크게 기여한다는 방증이다.

## 호스피탈리티 / CRS 적용 포인트

CRS 운영에서 AI가 작성하는 텍스트(장애 리포트, 고객 응대 초안, 내부 공지)는 "정확하지만 장황하고 AI스럽다"는 피드백을 받기 쉽다. Opus 5.5의 "핵심을 먼저, 장황함은 줄이고, 지정된 글쓰기 규칙을 더 잘 따른다"는 개선점은 CRS 내부 문서 자동화 파이프라인에 그대로 적용 가치가 있다 — 다음 모델 교체 시 벤치마크 점수보다 실제 산출 문서 샘플을 먼저 비교해볼 것.

## 연관 자료

- [[2026-07-25-claude-opus-5-release]] — 직전 세대 Opus 5 출시
- [[2026-06-30-claude-sonnet-5-release]], [[2026-09-02-claude-fable-5-1-mythos-5-1-release]] — 같은 Claude 5 계열 출시 시리즈
- [[2026-08-16-why-opus-5-feels-worse]] — 벤치마크와 체감 품질 괴리 논의의 짝
- [[2026-09-23-claude-opus-5-5-reasoning-effort-cost]] — 같은 날 나온 추론 설정별 성능·비용 분석(후속 글)

## 한 달 뒤 회고

*(2026-10-23 즈음 — 실제 CRS 업무 문서에 Opus 5.5를 적용해 "장황함 감소" 체감 여부와 토큰 비용 절감분을 확인.)*
