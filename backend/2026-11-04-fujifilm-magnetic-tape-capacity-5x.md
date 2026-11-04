---
title: "Fujifilm, AI 데이터 보관 수요 늘자 '자기 테이프' 생산능력 5배 확대(GeekNews) — 부진했던 해를 기준으로 삼은 5배라는 숫자"
source_title: "Fujifilm to raise data tape production fivefold as AI drives storage demand"
source_url: "https://thenextweb.com/news/fujifilm-magnetic-tape-production-fivefold-ai"
source_name: "TheNextWeb"
referrer_url: "https://news.hada.io/topic?id=36536"
published_at: "2026-10-29"
summarized_at: "2026-11-04"
category: "backend"
tags: ["magnetic-tape", "data-storage", "ai-infrastructure", "cold-storage", "fujifilm"]
---

# Fujifilm, AI 데이터 보관 수요 늘자 '자기 테이프' 생산능력 5배 확대(GeekNews)

> 출처: [Fujifilm to raise data tape production fivefold as AI drives storage demand](https://thenextweb.com/news/fujifilm-magnetic-tape-production-fivefold-ai) (TheNextWeb) · GeekNews 경유 · 정리일 2026-11-04
>
> **출처 한계**: thenextweb.com·news.hada.io 모두 이 세션에서 egress 차단으로 원문을 직접 열람하지 못했다. WebSearch로 TheNextWeb·hwbusters.com·Fujifilm 공식 보도자료(fujifilm.com/news/hq/14137, 2026-10-29일자)까지 교차확인해 1차 출처급 신뢰도를 확보했다.

## 한 줄 요약

**Fujifilm이 약 100억 엔을 투자해 가나가와현 오다와라 공장의 LTO 자기 테이프 생산능력을 2028회계연도까지 출하용량 기준 약 5배로 늘리기로 했는데, 그 기준점이 테이프 수요가 부진했던 2025회계연도라는 점을 함께 봐야 한다.**

## 핵심 포인트

- **약 100억 엔, 2026~2028 회계연도** — Fujifilm은 ***"약 100억 엔(약 5,600만~6,300만 달러)"***을 투자해 2026회계연도부터 2028회계연도까지 오다와라 공장의 제조설비와 인력을 확충한다. Fujifilm이 LTO 테이프 전용 설비에 투자한 역대 최대 규모라고 밝혔다.
- **최신 LTO Ultrium10에 집중** — 투자는 ***"최신 세대 FUJIFILM LTO Ultrium10"*** 생산에 주력하며, 목표는 ***"2025회계연도 대비 출하용량 기준 약 5배"*** 확대다.
- **생성형 AI·클라우드의 장기 보관 수요** — Fujifilm은 이 투자를 생성형 AI 학습·추론과 클라우드 서비스 확산으로 쌓이는 대용량 데이터의 ***"장기 보관 수요"***와 연결했으며, 특히 주요 클라우드 서비스 사업자·데이터센터 운영사에서 테이프 활용이 늘고 있다고 밝혔다.
- **"5배"의 기준점은 부진했던 해다** — LTO Program 공식 통계로는 2025년 테이프 출하량이 전년 대비 9% 줄어 160.3엑사바이트였다가, 2026년 1분기에 57% 급증했다. 즉 5배 목표는 수요가 꺾였던 2025회계연도를 기준으로 잡은 것이라, 숫자가 실제보다 커 보일 수 있다.
- **신규 라인은 2028년 전에는 완전 가동되지 않는다** — 확대된 생산능력이 언제부터, 얼마나 이미 계약(선주문)됐는지는 공개되지 않았다.

## 인상 깊은 문장

> "Storing and using the enormous amounts of data accumulated through AI training and inference is becoming increasingly important." — Fujifilm 공식 발표 (WebSearch 교차확인 인용)

## 댓글

GeekNews hada 댓글 수는 원문 접근 차단으로 확인하지 못했다. HN/Lobsters 큐레이션 여부도 확인 불가. **이해관계**: Fujifilm 자체 발표를 근거로 한 투자 홍보성 뉴스라, "5배"라는 수치의 기준점(부진했던 2025회계연도)을 스스로 강조하지 않는다. 테이프 수요의 실제 반등 정도(2026년 1분기 57% 증가)와 투자 규모가 비례하는지는 별도로 따져봐야 한다.

## 내 생각 · 적용점

AI 인프라 소식 대부분이 GPU·추론 비용에 쏠려 있는데, 이 글은 AI가 만들어내는 데이터의 **콜드 스토리지 뒷단**을 보여준다는 점이 다르다. 이 가든에 콜드 스토리지·장기 데이터 보관을 직접 다룬 선행 노트는 grep으로 찾지 못했다 — 직접 연결되는 기존 노트는 없다. 다만 "AI가 쌓는 데이터는 핫 패스(추론)뿐 아니라 콜드 패스(보관)에도 비용 구조를 만든다"는 축은, 향후 로그·대화 기록 보관 비용을 다루는 글이 나오면 연결할 지점으로 남긴다.

## 호스피탈리티 / CRS 적용 포인트

**적용은 멀다.** CRS는 예약·고객 데이터 규모가 테이프 아카이브를 고려할 수준이 아니고, 핫 데이터(조회 빈도 높은) 위주 운영이라 직접 접점이 없다. 전이 가능한 원칙만 남기면: AI 기능(대화 로그, 추천 이력)을 늘릴수록 "이 데이터를 얼마나 오래, 얼마나 싸게 보관할 것인가"를 설계 초기에 정해야 한다는 점 — 지금은 S3 등 클라우드 콜드 스토리지 티어로 충분하지만, 데이터 볼륨이 임계점을 넘으면 저장 매체 자체의 경제성을 다시 따져야 한다.

## 연관 자료

- 직접 연결 노트 없음 (이 가든에 콜드 스토리지·장기 데이터 보관을 다룬 선행 노트를 찾지 못함)

## 한 달 뒤 회고

*(2026-12-04 즈음 — LTO Program의 2026년 2분기 출하량 통계가 나와 "57% 급증"이 일시적 반등인지 추세인지 확인.)*
