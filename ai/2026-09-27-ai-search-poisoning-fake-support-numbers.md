---
title: "ChatGPT와 Gemini가 가짜 고객센터 번호를 안내하도록 만드는 사기 수법 (Aurascape) — 프롬프트를 공격하지 않고 웹 자체를 오염시킨다"
source_title: "When AI Recommends Scammers: New Attack Abuses LLM Indexing to Deliver Fake Support Numbers"
source_url: "https://aurascape.ai/resources/auralabs-research/llm-search-poisoning-fake-support-numbers/"
source_name: "Aurascape (Aura Labs)"
referrer_url: "https://news.hada.io/topic?id=34292"
summarized_at: "2026-09-27"
category: "ai"
tags: ["geo", "prompt-poisoning", "ai-search", "scam", "llm-trust"]
---

# ChatGPT와 Gemini가 가짜 고객센터 번호를 안내하도록 만드는 사기 수법 (Aurascape) — 프롬프트를 공격하지 않고 웹 자체를 오염시킨다

> 출처: [When AI Recommends Scammers: New Attack Abuses LLM Indexing to Deliver Fake Support Numbers](https://aurascape.ai/resources/auralabs-research/llm-search-poisoning-fake-support-numbers/) (Aurascape 연구팀) · GeekNews(id=34292) 경유 · 정리일 2026-09-27
>
> **출처 한계**: `aurascape.ai`, `news.hada.io`, 그리고 교차확인용 Dark Reading·Gizmodo·Netcraft·CyberHoot·remio.ai 등 2차 매체 전부 이 세션에서 egress 차단돼 직접 열람하지 못했다. WebSearch 스니펫으로만 재구성했으며 인용문은 검색 결과에 노출된 표현을 그대로 옮긴 것이다. 최초 항공사 타깃 조사(2025-12)와 GeekNews 노출 시점(2026-09) 사이 간극은 374개 기업으로 확장된 후속판이 존재할 가능성으로 추정되나 원문 미접근으로 확정하지 못했다.

## 한 줄 요약

**정부·대학 등 고신뢰 사이트를 해킹해 가짜 고객센터 번호를 대량 게시하는 방식으로, ChatGPT·Gemini·Google AI Overview가 사기 연락처를 정상적인 기업 정보로 안내하게 만드는 공격이 발견됐다 — 최소 374개 기업(Fortune 100 포함)이 사칭당했고, 이는 프롬프트 인젝션이 아니라 LLM이 신뢰하는 크롤 대상 자체를 오염시키는 전략이다.**

## 핵심 포인트

- **공격 방식 — 웹 자체를 공격한다** — 프롬프트 인젝션·탈옥이 아니라, 정부·대학의 해킹된 고신뢰(.gov/.edu) 사이트, 워드프레스 블로그, YouTube 설명란, Yelp 리뷰에 스캠 PDF·텍스트를 심는다.
- **GEO(생성엔진최적화) 악용 디테일** — 실제 사용자 질문 문구를 그대로 매칭("Emirates 예약 전화번호"), Q&A/리스트 포맷 사용, 같은 브랜드명·전화번호를 문서 안에서 반복해 LLM이 파싱하기 쉽게 구조화한다. 여러 사이트에 동일 가짜 번호를 반복해 "다출처 일치"라는 착시 신호를 만든다.
- **규모** — Fortune 100 포함 최소 374개 기업 사칭(항공사·은행·여행 플랫폼·소프트웨어 업체 등), 악성 페이지 수만 개 탐지.
- **AI가 가짜를 신뢰할 만하다고 인용하는 구조적 이유** — LLM의 소스 판별은 "사실 여부"가 아니라 질문 문구와의 매칭·파싱 용이성·도메인 권위(빌려온 것)에 의존한다.
- **사회공학** — 환불·항공편 취소·계정 잠금처럼 시간 압박이 큰 상황에서 사용자가 검증 없이 AI 최상단 답을 그대로 신뢰한다. 연구팀이 실제 가짜 번호로 전화하니 상담원이 "돕겠다"며 신용카드 정보를 요구했다.

## 인상 깊은 문장

> "적어도 374개 기업(Fortune 100 포함)이 이 캠페인에 휩쓸렸다."

> "GEO는 생성형 검색 제품 전반에서 관찰되고 있다 — 구식 SEO 스팸의 AI 시대 사촌." (Netcraft, 재구성 인용)

## 댓글

**hada 댓글 미확인.** GitHub 미러(InsightFlow #1169)에도 댓글 수·hada 반응이 기재되지 않았다. HN에 별도 스레드가 존재하는 것은 확인했으나(제목만 검색됨, item id=46196807 추정) 내용은 확인하지 못했다. 1차 출처와 주요 2차 보도 전부 이 세션에서 egress 차단돼, 전부 WebSearch 스니펫 재구성이며 원문 전체 인용은 불가능하다는 점을 재차 밝힌다.

## 내 생각 · 적용점

### 핵심 전이 1 — "fetch≠cite" 구조와 정확히 같은 취약점

[[2026-07-16-how-chatgpt-picks-sources]]가 밝힌 "fetch와 cite는 다르다, 신뢰는 제3자에게서 빌린다"는 구조가 이번 공격이 왜 통하는지를 정확히 설명한다 — 이 가든이 이미 이론으로 정리해둔 함정을 실전 사기 캠페인이 그대로 악용한 사례다.

### 핵심 전이 2 — 대량 생산 콘텐츠가 실제로 인용 근거가 됐다는 반복 실증

[[2026-09-03-perplexity-manufactured-buying-guides]](21만 개 페이지 콘텐츠 팜)와 [[2026-08-30-cats-txt-llms-txt-geo-fake-standard]](가짜 정보도 크롤·색인·재현·추천의 4단계를 전부 통과한다는 실험)가 이미 증명한 "AI 인용 = 권위라는 착시"가, 이번엔 실제 피해가 발생하는 사기로 이어졌다.

### 핵심 전이 3 — 신뢰 경계 붕괴라는 같은 패턴

[[2026-08-25-waf-auto-block-agent-trust-boundary]]의 "판단 근거 자체가 공격자 손안에 있었다"는 신뢰 경계 붕괴 패턴이 구조적으로 동일하다 — 입력 채널(크롤 대상)을 장악하면 그 위의 어떤 판단 로직도 오염된다. [[2026-05-21-trevor-lasn-aeo-geo-ai-search]](GEO/AEO 최적화 원칙)와 나란히 놓으면 "선의의 GEO"와 "악의적 GEO 악용"을 대조할 수 있고, [[2026-06-08-json-ld-personal-websites]](구조화 데이터로 공식 정보 명시)는 방어책과 직결된다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용 가능성이 높다 — 이미 항공·여행·은행이 타깃이라 호텔·CRS가 다음 표적이 될 개연성이 크다(환불, 예약취소, 포인트 도용, 오버부킹 항의 등 급한 게스트 시나리오가 항공사 사례와 구조적으로 동일하다). 첫째, **공식 연락처를 구조화 데이터로 선점** — 호텔·CRS 공식 사이트에 schema.org `Organization`/`ContactPoint` JSON-LD와 평문 HTML로 고객센터 번호·공식 URL을 명시해, LLM이 파싱하기 쉬운 "강한 1페이지"를 만들어 fetch/cite 경쟁에서 가짜 페이지를 이기도록 한다([[2026-07-16-how-chatgpt-picks-sources]]의 실무 결론과 일치). 둘째, **GEO 모니터링 루틴화** — 주기적으로 "[브랜드명] 고객센터/예약 취소 번호"를 ChatGPT·Perplexity·Gemini·Google AI Overview에 직접 질의해 가짜 번호 유포 여부를 브랜드 보호 체크리스트에 추가한다. 셋째, **게스트 커뮤니케이션에 결정적 경로 명시** — 예약 확인서·이메일·앱에 "공식 문의는 항상 이 URL/번호"라고 반복 고지해 게스트가 위기 상황에서 AI 답변을 맹신하지 않고 CRS 자체 채널로 돌아오도록 유도한다. 넷째, **위조 페이지 신속 신고 프로세스**를 CRS 벤더 표준 대응 매뉴얼에 포함한다.

## 연관 자료

- [[2026-07-16-how-chatgpt-picks-sources]] — "fetch≠cite" 구조, 이번 공격이 통하는 이유
- [[2026-09-03-perplexity-manufactured-buying-guides]] — 콘텐츠 팜이 실제 인용 근거가 된 실증 사례
- [[2026-08-30-cats-txt-llms-txt-geo-fake-standard]] — 가짜 정보도 4단계를 전부 통과한다는 실험
- [[2026-08-25-waf-auto-block-agent-trust-boundary]] — 신뢰 경계 붕괴의 같은 패턴
- [[2026-05-21-trevor-lasn-aeo-geo-ai-search]] — 선의의 GEO 원칙, 대조축
- [[2026-06-08-json-ld-personal-websites]] — 구조화 데이터 방어책

## 한 달 뒤 회고

*(2026-10-27 즈음 — 호스피탈리티 업계를 직접 겨냥한 유사 사례가 보도됐는지, 온다가 공식 연락처 구조화 데이터·GEO 모니터링을 실제로 점검했는지 확인.)*
