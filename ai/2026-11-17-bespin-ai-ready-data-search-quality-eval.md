---
title: "업무 질문과 정답 근거로 확인하는 검색 품질 평가 (베스핀글로벌) — 골든셋과 입력 검증 없이는 평가도 믿을 수 없다"
source_title: "[AI Ready Data] 업무 질문과 정답 근거로 확인하는 검색 품질 평가"
source_url: "https://blog.bespinglobal.com/post/ai-ready-data-search-quality-evaluation-with-business-questions-and-grounded-answers/"
source_name: "베스핀글로벌 기술 블로그 (Bespin Global)"
referrer_url: "https://ondainc.slack.com/archives/C0AJL0096H4"
published_at: "확인 불가"
summarized_at: "2026-11-17"
category: "ai"
tags: ["search-quality", "golden-set", "rag-evaluation", "ai-ready-data", "data-validation"]
---

# 업무 질문과 정답 근거로 확인하는 검색 품질 평가 (베스핀글로벌)

> 출처: [업무 질문과 정답 근거로 확인하는 검색 품질 평가](https://blog.bespinglobal.com/post/ai-ready-data-search-quality-evaluation-with-business-questions-and-grounded-answers/) (베스핀글로벌, AI Ready Data 시리즈) · Slack 직공유(TechArticles 봇) · 정리일 2026-11-17

## 한 줄 요약

**질문과 정답 근거가 함께 있는 골든셋을 만들어야 검색 품질을 "느낌"이 아니라 객관적으로 비교할 수 있고, 평가 전 입력 데이터 자체를 검증(빈 문항·중복 제거)하지 않으면 평가 결과 자체를 신뢰할 수 없다.**

## 핵심 포인트

- 질문과 정답 근거가 포함된 ***골든셋***을 구축해 검색 품질을 객관적으로 평가·비교한다.
- 단일 사실형 질문부터 예외 조건이 걸린 질문까지 ***다양한 질문 유형***을 평가셋에 반영해 검색 정확도를 측정한다.
- ***평가 전 입력 데이터 검증***을 통해 빈 문항이나 중복을 제거해 평가 자체의 신뢰성을 확보한다.

## 인상 깊은 문장

> "평가 전 입력 데이터 검증을 통해 빈 문항이나 중복을 제거해 평가의 신뢰성을 확보함" (Slack 발췌)

## 댓글

같은 베스핀글로벌 시리즈. "골든셋 규모가 몇 건인지", "평가 지표가 NDCG·Recall 중 무엇인지" 같은 구체적 수치는 발췌에 없어 확인하지 못했다. 차단·미확인 사정은 다른 4편과 동일.

## 내 생각 · 적용점

### 핵심 전이 1 — "평가 없는 튜닝은 튜닝이 아니다"의 전제 조건

[[2026-09-08-aws-opensearch-agent-search-quality-part2]]가 Rerank·Weight 튜닝을 NDCG로 검증한 뒤 적용하라고 했는데, 이 글은 그 "평가"가 성립하기 위한 전제조건(골든셋의 질문 다양성, 입력 데이터 검증)을 한 단 더 내려가 다룬다. 평가셋 자체가 더럽으면(빈 문항·중복) "평가 후 적용" 원칙도 무의미해진다.

### 핵심 전이 2 — 평가 전 입력 검증은 [[2026-07-14-on-data-quality-basics]]의 개별 단이 평가 데이터에도 적용됨을 보여준다

품질 사다리는 원래 "검색 대상 데이터"를 염두에 둔 틀이지만, 이 글은 "검색을 평가하는 데이터(골든셋)"도 같은 개별 단 검증(정확성·중복 제거)이 필요하다는 걸 보여준다 — 메타 수준에서 사다리가 반복되는 구조.

## 호스피탈리티 / CRS 적용 포인트

**적용 가능성 높음.** CRS AI 검색/상담 에이전트를 운영팀이 "잘 되고 있다"는 느낌으로만 판단하지 말고, "체크인 시간은?", "3인 투숙 시 추가 요금은?" 같은 실제 업무 질문 + 정답 근거(정책 조항)로 골든셋을 만들어 두면, 약관이 바뀌거나 모델이 바뀔 때마다 품질을 정량적으로 비교할 수 있다. 평가 전 입력 검증(빈 문항·중복 제거)은 이 골든셋을 직접 만드는 담당자에게 바로 적용 가능한 체크리스트다.

## 연관 자료

- [[2026-11-17-bespin-ai-ready-data-document-splitting]] — *같은 시리즈, 평가 대상이 되는 분할 결과*
- [[2026-09-08-aws-opensearch-agent-search-quality-part2]] — *"평가 후 적용" 원칙의 전제 조건*
- [[2026-07-14-on-data-quality-basics]] — *개별 단 검증이 평가 데이터에도 메타적으로 반복됨*
- [[2026-11-17-bespin-ai-ready-data-ops-flow]] — *같은 시리즈, 평가 다음 단계: 운영 반영 추적*

## 한 달 뒤 회고

*(2026-12-17 즈음 — 골든셋 구축 도구/프레임워크가 구체적으로 공개됐는지, CRS 상담 에이전트용 골든셋을 실제로 만들기 시작했는지 점검.)*
