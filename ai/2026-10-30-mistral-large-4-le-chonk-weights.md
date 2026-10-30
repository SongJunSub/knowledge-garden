---
title: "Mistral Large 4(Le Chonk), 코딩과 보안 성능을 강화한 가중치 공개 (GeekNews) - 3주 전 '오픈웨이트인데 아직 안 열린' 모델이, 이번엔 진짜로 열렸다"
source_title: "Mistral Large 4(Le Chonk), 코딩과 보안 성능을 강화한 가중치 공개"
source_url: "https://news.hada.io/topic?id=36233"
source_name: "GeekNews"
referrer_url: "https://ondainc.slack.com/archives/C0AJL0096H4"
published_at: "2026-10-27"
summarized_at: "2026-10-30"
category: "ai"
tags: ["mistral", "open-weight", "le-chonk", "coding-benchmark", "cybersecurity", "model-release"]
---

# Mistral Large 4(Le Chonk), 코딩과 보안 성능을 강화한 가중치 공개 (GeekNews)

> 출처: [GeekNews](https://news.hada.io/topic?id=36233) · Slack `#개발-뉴스-dev-news`(GeekNews 자동봇) 경유 · 정리일 2026-10-30

> **출처 한계**: `news.hada.io`가 이 세션에서 egress 전면 차단(WebFetch `getaddrinfo ENOTFOUND` 확인). Slack 발췌 마지막 불릿이 "Artificial Analy…"에서 끊겨 방어적 보안 평가 세부 수치는 확인 못했다. 대신 WebSearch로 교차확인한 결과, 복수 매체(forklog, betanews, thenewstack, aiweekly 등)가 "가중치 공개는 10월 말(10월 27일로 보도하는 곳이 다수)"이라고 일치해서 보도하고 있어, 이번 발췌의 "가중치 공개" 자체는 실제로 일어난 일로 교차확인됐다. 다만 라이선스가 ***Large 3의 Apache 2.0과 달리 커스텀 라이선스***로 바뀌었다는 보도가 있어, "오픈웨이트"의 실제 이용 조건은 발췌·검색 모두에서 확정하지 못했다.

## 한 줄 요약

**Mistral이 1조 파라미터 네이티브 멀티모달 모델 Large 4("Le Chonk")의 가중치를 10월 말 공개했다 - 10월 6일 API 프리뷰 이후 3주간 강화학습을 추가해 코딩(AAII 48%로 GLM-5.3과 동률, 토큰은 47% 적게 사용)과 방어적 보안 성능을 끌어올렸다고 주장하지만, 라이선스가 Apache 2.0에서 커스텀 라이선스로 바뀌었다는 보도가 있어 "오픈웨이트"의 실제 자유도는 확인이 더 필요하다.**

## 핵심 포인트

- **프리뷰에서 3주 추가 학습 후 가중치 공개** - 공개 프리뷰([[2026-10-07-mistral-large-4-le-chonk]]) 이후 ***3주간 강화학습을 추가***해 코딩, 방어적 사이버보안, 추론 효율을 높였다는 설명. WebSearch로 "10월 말(10월 27일경)" 공개라는 보도와 시기가 일치한다.
- **GLM-5.3과 벤치마크 동률, 토큰은 덜 씀** - AAII에서 ***48%로 GLM-5.3과 사실상 동률***을 기록하면서, 작업당 평균 토큰을 ***47% 적게*** 사용한다는 효율성 주장.
- **Terminal-Bench 4.0 오픈웨이트 선두** - 프리뷰보다 13%포인트 높은 ***41%***로 오픈웨이트 모델 중 선두, 출력 토큰은 30% 줄였다. Low/Medium/High 추론 모드 선택 가능.
- **"오픈웨이트"인데 라이선스는 Apache 2.0이 아니다** - WebSearch로 확인한 보도에 따르면 ***Large 3는 Apache 2.0이었지만 Large 4는 커스텀 라이선스***를 쓴다는 지적이 있다 - 구체적 이용 제한 조항은 이 검색으로도 확정하지 못했다.

## 인상 깊은 문장

> "Mistral AI has staged a Hugging Face landing page for Mistral-Large-4, with a countdown toward an open-weights release scheduled for the end of October." (WebSearch로 확인, aiweekly.co 등 복수 매체 재인용)

## 댓글

hada 댓글 수·HN/Lobsters 큐레이션 여부는 원문 접근 차단으로 확인 불가.

## 내 생각 · 적용점

**핵심 전이 - [[2026-10-07-mistral-large-4-le-chonk]]가 지적했던 "오픈웨이트라는 라벨과 실제 공개 사이의 간극"이 이번에 실제로 메워졌는지가 핵심 질문이다.** 3주 전 노트는 "발표 시점에 오픈웨이트라고 불리지만 가중치는 아직 안 풀렸다"는 간극을 짚었다. 이번에 가중치가 실제로 공개된 것은 WebSearch로 교차확인됐으니 그 간극의 "시간" 축은 해소됐다. 하지만 **"Apache 2.0 → 커스텀 라이선스"로 바뀌었다는 보도가 맞다면, 간극이 사라진 게 아니라 "시간의 간극"에서 "이용 조건의 간극"으로 옮겨간 것**이다 - 가중치 파일 자체는 받을 수 있어도, 상업적 이용·재배포 조건이 Large 3보다 좁아졌을 가능성이 있다. [[2026-08-13-qwen38-2-4t-a95b-open-weights]]가 처음 던진 "오픈웨이트가 곧 자유로운 이용을 뜻하지 않는다"는 교훈이, Mistral에서도 다른 형태로 반복된다.

## 호스피탈리티 / CRS 적용 포인트

CRS 벤더 평가 관점에서 "유럽 자체 데이터센터" 포지셔닝([[2026-10-07-mistral-large-4-le-chonk]])은 이미 짚었던 대로 유럽 고객사 데이터 주권 논거로 참고할 만하다. 이번 노트에서 새로 추가할 점은, 실제로 이 모델을 자체 인프라에 올려 쓰려는 경우 ***"오픈웨이트"라는 표현만 보고 Apache 2.0급 자유도를 기대하면 안 되고, 커스텀 라이선스의 구체 조항(상업적 이용·재배포 제한 여부)을 직접 확인하는 절차가 선행돼야 한다***는 것이다. 직접 적용은 여전히 멀다.

## 연관 자료

- [[2026-10-07-mistral-large-4-le-chonk]] - 바로 이 모델의 API 프리뷰 발표 노트, "오픈웨이트인데 아직 안 열렸다"는 간극을 처음 짚은 선행 노트. 이번 글이 그 시리즈의 완결편.
- [[2026-08-13-qwen38-2-4t-a95b-open-weights]] - "오픈웨이트가 로컬 실행·완전한 자유를 뜻하지 않는다"는 선행 교훈, 이번엔 라이선스 조항 변경이라는 새 변형으로 재확인.

## 한 달 뒤 회고

*(2026-11-30 즈음 - 실제 공개된 가중치의 라이선스 전문을 확인해 Apache 2.0과 구체적으로 무엇이 다른지, 커뮤니티가 실제로 재배포·파인튜닝에 제약을 느꼈는지 점검한다.)*
