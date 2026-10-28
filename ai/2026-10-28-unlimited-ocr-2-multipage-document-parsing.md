---
title: "Unlimited-OCR 2 - 페이지 간 문맥을 이어 수백 페이지 문서를 파싱하는 OCR 모델 (Baidu, GeekNews) — 메모리를 고정 크기로 압축해 문서가 길어져도 지연이 거의 늘지 않는다고 자체 보고"
source_title: "Unlimited-OCR 2 - 페이지 간 문맥을 이어 수백 페이지 문서를 파싱하는 OCR 모델"
source_url: "https://news.hada.io/topic?id=36137"
source_name: "GeekNews"
referrer_url: "https://ondainc.slack.com/archives/C0AJL0096H4"
published_at: "확인 불가"
summarized_at: "2026-10-28"
category: "ai"
tags: ["ocr", "document-parsing", "baidu", "long-context", "attention-compression", "multipage-document"]
---

# Unlimited-OCR 2 - 페이지 간 문맥을 이어 수백 페이지 문서를 파싱하는 OCR 모델 (Baidu, GeekNews)

> 출처: [GeekNews](https://news.hada.io/topic?id=36137) · Slack `#개발-뉴스-dev-news`(GeekNews 자동봇) 경유 · 정리일 2026-10-28

> **출처 한계**: `news.hada.io` 이 세션에서 egress 전면 차단(WebFetch `getaddrinfo ENOTFOUND` 확인). Baidu 발표 원문·논문 모두 열람하지 못해, Slack 발췌 3줄(끊김)만으로 작성했다. 벤치마크 수치(MPDocBench, MarathonDocBench)는 **Baidu 자체 공개 평가**이며 제3자 독립 검증은 확인하지 못했다.

## 한 줄 요약

**Baidu가 여러 페이지를 한 요청으로 처리하는 OCR 모델 Unlimited-OCR 2를 공개했다 — 페이지 간 문맥을 활용해 유한한 컨텍스트 윈도 안에서도 매우 긴 문서를 이어서 파싱하도록 설계했으며, 텍스트·시각 정보 간 어텐션 상호작용을 고정 크기 참조 집합으로 압축하는 SR-SWA 기법으로 문서가 길어져도 단계별 디코딩 지연과 메모리 사용량을 거의 일정하게 유지한다. 자체 공개 평가에서 수십 페이지 규모 MPDocBench 84.6점, 수백 페이지 규모 MarathonDocBench 77.1점으로 비교 모델 중 가장 높은 종합 점수를 기록했다고 주장한다.**

## 핵심 포인트

- **페이지 간 문맥을 이어 파싱** — 단일 페이지씩 독립 처리하는 일반적인 OCR과 달리, ***여러 페이지를 한 요청으로 처리***하며 앞선 페이지의 문맥을 다음 페이지 파싱에 활용한다. 수백 페이지짜리 긴 문서(계약서, 보고서 등)를 통째로 하나의 흐름으로 읽어낸다는 뜻이다.
- **SR-SWA — 고정 크기로 압축해 선형 비용을 막는다** — 텍스트와 시각 정보 간 어텐션 상호작용을 ***고정 크기 참조 집합***으로 압축해, 문서가 길어져도 ***단계별 디코딩 지연과 메모리 사용량을 거의 일정하게 유지***한다. 일반적인 긴 문맥 처리는 길이에 비례해 비용이 늘어나는데, 이 압축이 그 비례 관계를 끊는 핵심 설계로 보인다.
- **자체 평가 수치** — 수십 페이지 규모 ***MPDocBench 84.6점***, 수백 페이지 규모 ***MarathonDocBench 77.1점*** — 비교 모델 중 가장 높은 종합 점수. 다만 이 수치가 어떤 비교 모델·어떤 평가 조건에서 나왔는지는 발췌가 끊겨 확인하지 못했다.

## 인상 깊은 문장

> "SR-SWA는 텍스트와 시각 정보 간 어텐션 상호작용을 고정 크기 참조 집합으로 압축해, 문서가 길어져도 단계별 디코딩 지연과 메모리 사용량을 거의 일정하게 유지함" (Slack GeekNews 발췌)

## 댓글

hada 댓글 수·HN/Lobsters 큐레이션 확인 불가. **정직하게 밝힐 점**: MPDocBench·MarathonDocBench 두 벤치마크 모두 벤더(Baidu) 자체 공개 평가이고, 독립 재현 결과는 이번 조사로 확인하지 못했다 — "비교 모델 중 가장 높다"는 주장을 그대로 받아들이기보다 벤더가 제시한 숫자로 읽어야 한다.

## 내 생각 · 적용점

**핵심 전이 — [[2026-09-20-jina-ocr-v1-low-budget-gpu-document-parsing]]과 OCR 모델 경쟁의 두 다른 축.** 그 글(Jina AI의 jina-ocr-v1)은 ***속도*** 축에서 경쟁했다 — DeepSeek-OCR 위에 투기적 디코딩(FastMTP)을 얹어 저가형 GPU에서 최대 1.95배 빠르게 만들었다. 이번 Unlimited-OCR 2는 ***길이*** 축에서 경쟁한다 — 문서가 길어져도 비용이 거의 늘지 않는 구조를 만들었다. 두 글을 나란히 보면 2026년 하반기 OCR 모델 경쟁이 "더 빠르게"와 "더 길게"라는 서로 다른 제약을 각자 풀고 있다는 그림이 보인다 — 아직 두 축을 동시에 최적화한 모델은 가든에 등장하지 않았다.

## 호스피탈리티 / CRS 적용 포인트

호텔·예약 운영에서 긴 계약서, 다개월 정산서, 여권·비자 서류 묶음처럼 ***여러 페이지가 서로 참조하는 문서***를 다룬다면, "페이지 간 문맥을 이어 파싱"하는 능력은 직접 적용 가능성이 있다 — 페이지별로 끊어 처리하면 놓치는 문맥(예: 1페이지의 계약 조건이 50페이지의 특이사항에 적용되는 경우)을 잡아낼 수 있다. 다만 벤더 자체 수치라는 점을 감안해, 실제 도입 전 CRS 문서 샘플로 내부 평가를 먼저 해야 한다는 원칙은 유지한다.

## 연관 자료

- [[2026-09-20-jina-ocr-v1-low-budget-gpu-document-parsing]] — 같은 OCR 모델 경쟁의 다른 축(속도 vs 길이).

## 한 달 뒤 회고

2026-11-28 즈음, Baidu의 공식 발표문이나 논문 접근이 풀렸다면 MPDocBench·MarathonDocBench의 비교 모델 목록과 평가 조건을 확인하고, 제3자 독립 평가가 나왔는지 점검한다.
