---
title: "Trevor Lasn — AEO·GEO: AI 검색 시대의 콘텐츠 최적화 (axelk의 정반대 응답)"
source_title: "AEO and GEO: Optimizing for AI Overviews, ChatGPT, Claude, Gemini, Perplexity"
source_url: "https://trevorlasn.com/blog/aeo-geo-ai-search-optimization/"
source_name: "trevorlasn.com · GeekNews 경유"
referrer_url: "https://news.hada.io/topic?id=29752"
published_at: "2026-05-21"
summarized_at: "2026-05-21"
category: "frontend"
tags: ["aeo", "geo", "seo", "ai-search", "semantic-html", "agent-friendly", "content-strategy", "robots-txt"]
---

# Trevor Lasn — AEO·GEO: AI 검색 시대의 콘텐츠 최적화 (axelk의 정반대 응답)

> 출처: [AEO and GEO: Optimizing for AI Overviews, ChatGPT, Claude, Gemini, Perplexity](https://trevorlasn.com/blog/aeo-geo-ai-search-optimization/) · 정리일 2026-05-21

## 한 줄 요약
**검색이 *링크 목록*에서 *AI가 사용자를 대신해 읽는 소스*로 진화하면서 콘텐츠는 *AEO(Answer Engine Optimization, 답변 엔진 인용 소스)*와 *GEO(Generative Engine Optimization, 생성형 AI 답변에 등장하기)*를 동시에 노려야 함** — 핵심 처방은 *자격(eligibility) = 크롤링·렌더링·인덱싱 차단 해결이 콘텐츠 최적화보다 우선* + *모델이 학습 데이터만으로 합성할 수 없는 구체적 수치·고유 경험·독자 디테일* + *학습용/검색용 봇 robots.txt 구분* + *Semantic HTML·Core Web Vitals·접근성*은 *agent와 모델 모두에 도움* + *자율 에이전트가 DOM·컨트롤을 해석할 수 있는 명확한 마크업·구조화된 폼*. Google 공식 입장: *AEO·GEO = SEO의 변형*.

## 핵심 포인트

- **검색의 본질 전환** — *페이지 = 목적지*에서 *페이지 = 모델이 사용자를 대신해 읽는 소스*로. 트래픽 목표가 *클릭*에서 *인용*으로 *위로 한 단계 추상화*.
- **AEO vs GEO 구분** — *AEO = 답변 엔진의 인용 소스 노리기* (출처 박스에 등장), *GEO = 생성형 AI 답변 본문에 등장하기* (인용 없이도 합성된 답변에 영향). 둘이 *겹치지만 다른 메커니즘*.
- **Google 공식 = SEO 변형** — *AEO·GEO를 별개 분야로 부풀리지 말 것*. 일반 검색과 AI Overview의 *랭킹·품질 시스템이 동일*. *기존 SEO 잘 하면 AEO·GEO 자동 진전*.
- ***자격(Eligibility) 우선*** — *크롤링·렌더링·인덱싱 차단 문제 해결*이 *콘텐츠 최적화보다 우선*. *접근 막힌 페이지는 어떤 콘텐츠도 무의미*. 콘텐츠 작업 *이전에* 인프라 작업.
- **인용되는 콘텐츠 = *합성 불가능한 디테일*** — *모델이 학습 데이터만으로 작성할 수 없는 구체적 수치·고유 경험·독자적 디테일*. 일반 정보는 *인용 없이 요약*되고, 고유 정보는 *인용*. **AEO·GEO 핵심 = *디테일이 자산***.
- **봇 구분 robots.txt** — *학습용(GPTBot, ClaudeBot)*과 *검색용(Googlebot, OAI-SearchBot)*을 *분리 정책 가능*. **학습은 차단하고 검색·인용은 허용**의 *세밀 정책*이 *axelk vs Lasn 분기의 실무 도구*.
- **기술 인프라 = agent-friendly web** — Semantic HTML / Core Web Vitals / 접근성이 *크롤러·AI·자율 에이전트 모두에 도움*. **a16z 헤드리스의 *agent-friendly SoR 3 요건*의 *웹 콘텐츠 차원 시연***.
- **에이전트 시대 명확한 마크업** — *자율 에이전트가 DOM과 컨트롤을 해석하도록 명확한 마크업·구조화된 폼 필드*. *예약 확정 버튼을 식별 못 하는 에이전트는 포기하고 다른 사이트로*. **agent 친화도 = 미래 트래픽**.
- **측정 도구** — Search Console·Bing Webmaster Tools의 *impressions·clicks 변동*. [[2026-05-20-greg-wilson-twelve-ways-ai-coding-measurement-wrong]] *12 오류 시험* 통과 점검 필요 (선택 편향·약한 기준선 등).

## 인상 깊은 문장

> "Pages are no longer destinations — they're sources the model reads on behalf of the user."  
> (페이지는 더 이상 목적지가 아니라 모델이 사용자를 대신해 읽는 소스)

> "Pages that contain what the model can't synthesize on its own get cited; general information gets summarized without citation."  
> (모델이 스스로 합성할 수 없는 내용을 담은 페이지가 인용되고, 일반 정보는 인용 없이 요약된다)

> "An agent that can't identify the *Confirm reservation* button gives up and moves to another site."  
> (예약 확정 버튼을 식별 못 하는 에이전트는 포기하고 다른 사이트로 이동한다)

## 내 생각 · 적용점

### **5번째 가든 반대 명제 라인업 *명시 승격*** — axelk ↔ Lasn = 콘텐츠 생태계 응답 분기

어제([[2026-05-21-axelk-ai-is-plagiarism-at-scale]]) axelk 자산을 박으며 *5번째 반대 명제 라인업 후보지만 명시 승격 자제*했다. **24시간 만에 *정확한 반대 자산이 도착*** — Lasn은 *같은 사실(AI가 웹 콘텐츠 학습·인용)*에 *정반대 처방*:

| 사실 | axelk 응답 | Lasn 응답 |
|---|---|---|
| AI가 웹 콘텐츠을 학습 | *무단 표절·차단·법적 보호·보상 요구* | *새 검색 인프라·접근 허용·인용 최적화* |
| 검색 부패 | *Google이 무단 복제를 보상하는 문제* | *AEO·GEO로 *원본이 인용되도록 노력*하는 처방* |
| 비용·이익 분배 | *비용 사회화·이익 사유화 거부* | *인용 트래픽이 새 가치 자리* |

→ **5번째 가든 반대 명제 라인업 = *axelk ↔ Lasn = 콘텐츠 생태계 응답 분기***

견제 편향:
- *axelk만* → *극단 거부 편향* (AI 사용 자체를 비판하면서도 가치 있는 적응 회피)
- *Lasn만* → *최적화 순응 편향* (구조적 불공정을 *내가 적응할 문제*로 사사화)
- **둘 다 필요** — *법적/윤리적 압력*과 *실무적 적응*은 *서로의 균형추*

가든의 *4번째 반대 명제 라인업* (Dorsey ↔ Hashimoto/Ries = 조직 차원 응답 분기)와 *구조가 유사* — *조직 차원 ↔ 콘텐츠 생태계 차원*의 *각각 분기*.

### **16번째 가든 자가 진단 = *콘텐츠 생태계 응답 위치 시험***

*가든이 콘텐츠 생태계 측에서 *axelk 측인가 Lasn 측인가 둘 다인가* 정직히 진단하는가?*

가든의 현 상태 점검:
- *axelk 측*: 원문 출처 명시·핵심 문장 절반 이상 인용 회피·요약+자기 해석 중심·상업 재판매 없음
- *Lasn 측*: ??
  - Semantic HTML로 frontmatter·헤더·링크 구조화 ✓ (이건 기본)
  - robots.txt? — 가든은 GitHub 호스팅이라 *사용자가 직접 제어 못함*
  - *학습용/검색용 봇 분리 정책* — 가든의 위치 명시 필요
  - *합성 불가능한 디테일* (구체 수치·고유 경험·독자 해석) — 가든은 이 측면이 *강점*
- *둘 다*: 가든이 *axelk 측 의무를 시연하면서 Lasn 측 가치도 추구*하는 *균형 자세*

운영 의례:
- 새 글 정리 시 *axelk 시험 + Lasn 시험 둘 다 통과*하는지 frontmatter 옵션 점검
- 분기 회고에서 *가든이 어느 측으로 기울었는지* 정직 카운트
- *Lasn 측 위치 명시 가능성* (예: robots.txt 정책 명시 페이지) 검토

### [[2026-05-21-a16z-software-going-headless]] *agent-friendly SoR 3 요건*의 *웹 콘텐츠 차원 시연*

a16z 헤드리스는 *DB 측 SoR 3 요건* (명시적 데이터 모델·에이전트 단위 권한·폐쇄 루프 실행). **Lasn은 그 *웹 콘텐츠 측 시연***:

| 차원 | 3 요건 |
|---|---|
| DB (a16z) | 명시적 데이터 모델 / 에이전트 단위 권한 / 폐쇄 루프 실행 |
| **웹 콘텐츠 (Lasn)** | **Semantic HTML / 학습용·검색용 봇 robots.txt 분리 / DOM·폼 명확 마크업** |

→ **agent-friendly *3계층 짝 완성*** — *에이전트 측 (Codex Goals 6요소)* + *DB 측 (a16z 헤드리스)* + *웹 콘텐츠 측 (Lasn)*. *agent가 접근하는 모든 표면이 표준화되는 흐름*.

### [[2026-05-20-greg-wilson-twelve-ways-ai-coding-measurement-wrong]] *측정 엄밀성*의 *AEO·GEO 적용*

Lasn은 *Search Console impressions·clicks*를 측정 도구로 권한다. **Wilson 12 잣대 적용**:
- *#1 쉬운 숫자 Goodhart*: impressions·clicks이 *AEO 가치 진짜 측정*인가? → *인용 횟수·인용 정확도*가 더 본질
- *#2 약한 기준선*: *AEO 적용 전 vs 후* 비교는 *시간 변수 혼입*. 통제군 필요
- *#5 시스템 사고*: *인용 증가가 *원본 트래픽 감소*로 이어지는 시스템 효과 추적
- **15번째 자가 진단 첫 외부 적용 사례** — *AEO 효과* 수치 인용 시 *Wilson 잣대 미통과* 표시

### [[2026-05-17-jvns-moving-away-from-tailwind]] / [[2026-05-18-datatype-variable-font-charts]] *기본기 회귀 라인*의 *SEO 차원*

가든의 *기본기 회귀 라인*:
- JVNS: Tailwind → CSS
- Datatype: 차트 라이브러리 → 폰트
- **Lasn: HTML 디바이스 마크업 → *Semantic HTML 기본기*** ← 이번

3개 자산이 *프론트엔드 영역 기본기 회귀*의 *시간 순차 시연*. *AI 시대 = 기본 표준 재발견*이라는 패턴이 *영역 전반*에서 관찰.

### [[2026-04-30-laws-of-ux]] *UX 법칙*과의 *agent UX 짝*

가든의 *Laws of UX*는 *인간 사용자 UX*. Lasn의 *DOM 마크업·폼 필드 명확*은 ***agent UX***. 두 자산이 *짝*:
- 인간 UX: *명확한 라벨·예측 가능한 동작·피드백*
- **agent UX**: *Semantic HTML·구조화된 폼·접근성*

→ **agent UX = 인간 UX의 정밀화** — *접근성을 누가 강제하는가의 차이*. 인간은 *법으로 강제*, agent는 *작동 안 하면 다른 사이트로 이탈*하는 *경제적 강제*. **결과적으로 *agent UX가 인간 UX 표준*을 *시장 메커니즘으로 끌어올리는 가능성***.

### CRS / MangoLove / BugSip 즉시 적용 후보

1. **CRS *예약 확정 흐름 agent UX 점검*** — *Lasn의 예약 확정 버튼 비유*가 정확히 CRS 도메인. *AI 에이전트가 *조선호텔 예약 자동화 가능한가*를 *시뮬레이션*. 못 하면 *Semantic HTML·폼 필드 라벨* 보강. 2026 호텔 운영 차별점 후보.
2. **CRS 마케팅 콘텐츠 *합성 불가능한 디테일* 설계** — *조선호텔의 객실별 고유 경험·역사적 사실·내부자만 아는 디테일*을 *AEO 인용 미끼*로 배치. *일반 호텔 정보*는 인용 없이 요약될 뿐.
3. **MangoLove *클라이언트 AEO/GEO 자문 1축*** — 클라이언트 평가에 *AEO·GEO 적합도* 1축 추가. *agent-friendly 3계층*(Codex Goals + a16z 헤드리스 + Lasn) 잣대.
4. **[[project_bugsip]] *학습 콘텐츠 *합성 불가능 디테일*** — BugSip 학습 콘텐츠가 *일반적 코드 리딩 가이드*면 AI가 *인용 없이 요약*. *기여자만의 고유 경험·실제 디버깅 일지·내부 디테일*이 *인용 자격*. 콘텐츠 전략 변경 후보.
5. **가든 *robots.txt 정책 명시 페이지*** — GitHub Pages 호스팅으로 직접 제어 어려우나, *README에 가든의 학습용·검색용 봇 정책 명시*는 가능. *axelk + Lasn 균형 자세*를 *공개 선언*.

## 연관 자료
- [AEO and GEO (Trevor Lasn)](https://trevorlasn.com/blog/aeo-geo-ai-search-optimization/)
- [GeekNews — 29752](https://news.hada.io/topic?id=29752)
- [[2026-05-21-axelk-ai-is-plagiarism-at-scale]] — axelk *(5번째 라인업 정반대 자산)*
- [[2026-05-21-a16z-software-going-headless]] — a16z 헤드리스 *(agent-friendly 3계층 짝)*
- [[2026-05-19-openai-codex-goals-persistent-objectives]] — Codex Goals *(에이전트 측 프로토콜)*
- [[2026-05-20-greg-wilson-twelve-ways-ai-coding-measurement-wrong]] — Wilson *(AEO 측정 첫 적용)*
- [[2026-05-17-jvns-moving-away-from-tailwind]]·[[2026-05-18-datatype-variable-font-charts]] — 기본기 회귀 *(SEO 차원 시연)*
- [[2026-04-30-laws-of-ux]] — UX 법칙 *(agent UX 짝)*
- [[2026-05-18-gruber-ai-is-technology-not-product]] — Gruber *(인용 인프라화의 콘텐츠 측 어휘)*
- [[2026-05-21-mr-market-product-age-ends-brain-age-begins]] — Mr Market *(콘텐츠 제공자 측 판단력 가치)*

## 한 달 뒤 회고
*(2026-06-21 즈음 — 5번째 라인업(axelk ↔ Lasn)에 *세 번째 자산*이 도착해 라인이 *2 → 3* 자산으로 두꺼워졌는지, 16번째 자가 진단(콘텐츠 생태계 응답 위치)이 분기 회고에서 돌았는지, CRS 예약 흐름 agent UX 시뮬레이션이 실제로 돌았는지, BugSip 학습 콘텐츠가 *합성 불가능 디테일* 중심으로 재정렬되었는지 기록.)*
