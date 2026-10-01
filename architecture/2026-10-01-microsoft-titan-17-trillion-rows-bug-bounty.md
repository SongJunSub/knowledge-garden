---
title: "Microsoft Titan 17.3조 행 노출 (Faav, 16세 보안연구자) — AI 해킹도구가 열흘간 못 뚫은 걸 사람이 사용자명 필드에 'admin'을 넣어 뚫었다"
source_title: "16-year-old researcher breaks into Microsoft analytics service with access to 17 trillion rows of data"
source_url: "https://www.helpnetsecurity.com/2026/09/28/microsoft-titan-jwt-signature-flaw/"
source_name: "Help Net Security (복수 매체 교차보도)"
referrer_url: "https://news.hada.io/topic?id=34558"
published_at: "2026-09-28 (보도 기준, 추정)"
summarized_at: "2026-10-01"
category: "architecture"
tags: ["jwt-security", "token-verification", "bug-bounty", "responsible-disclosure", "ai-security-testing", "privilege-escalation", "trust-boundary"]
---

# Microsoft Titan 17.3조 행 노출 (Faav, 16세 보안연구자) — AI 해킹도구가 열흘간 못 뚫은 걸 사람이 사용자명 필드에 'admin'을 넣어 뚫었다

> 출처: [16-year-old researcher breaks into Microsoft analytics service with access to 17 trillion rows of data](https://www.helpnetsecurity.com/2026/09/28/microsoft-titan-jwt-signature-flaw/) (Help Net Security 외 iTnews·CyberSecurityNews·GBHackers 등 복수 매체) · 정리일 2026-10-01

## 한 줄 요약

**Microsoft 내부 분석 서비스 Titan이 로그인 토큰의 서명을 검증하지 않아, 16세 보안연구자 Faav가 사용자명 필드에 "admin"을 넣는 것만으로 관리자 권한을 얻어 17개 연결 분석 DB(메타데이터 추산 약 17.3조 행)에 접근 가능함을 증명했다. 이것은 침해 사고가 아니라 책임있는 공개(responsible disclosure)를 거쳐 Microsoft가 $5,000 버그바운티를 지급하며 마무리된 보안 연구 사례다 — 그리고 흥미롭게도, 열흘간 자동 탐색한 AI 도구는 끝내 못 뚫은 길을 사람의 "엉뚱한 직관" 한 번이 뚫었다.**

## 핵심 포인트

- **서명 미검증이 근본 결함** — Titan은 로그인 토큰(JWT) payload를 그대로 신뢰하고 ***서명을 검증하지 않았다***. 토큰을 위조해 아무 사용자나 사칭할 수 있는 구조였다.
- **AI 자동화의 고착과 사람의 직관** — Faav가 만든 자체 AI 해킹 도구 ***Antares***는 8월 25일부터 약 10일간 인증 체계를 분석했지만, ***이메일 형식의 사용자명만 집요하게 시도***하다 막혔다. 9월 5일 Faav가 직접 사용자명 필드를 "admin"으로 바꿔 넣자, Titan은 이를 로컬 사용자명으로 취급해 ***user ID 1(Admin 역할)에 매칭*** — 즉시 관리자 권한이 열렸다.
- **노출 규모는 추산치, 실제 접근은 제한적** — 관리자 권한으로 연결된 17개 분석 DB의 메타데이터 구조를 보면 총 저장량이 ***약 17.3조 행***으로 추산됐다. 하지만 Faav는 그 규모로 데이터를 실제로 긁지 않았다 — 메타데이터 DB 내 애플리케이션 계정 목록(~25,000개)과 Microsoft 직원 이메일 주소록(~17,990건)까지만 확인했고, 별도 Bing 분석 데이터셋은 대량 조회 대신 ***단일 행 샘플 2건***으로만 "접근 가능함"을 증명하는 선에서 멈췄다.
- **책임있는 공개 절차 그대로** — 9/5 Microsoft Security Response Center에 신고(케이스 144051), 9/9 Microsoft가 해당 엔드포인트를 잠금, 9/17 $5,000 버그바운티 지급. 전형적인 보안 연구 공개 사이클이다.

## 인상 깊은 문장

> "Microsoft 내부 분석 서비스 Titan이 로그인 토큰의 서명을 검증하지 않아, 실제 자격 증명 없이 관리자를 사칭하고 SQL 쿼리를 실행할 수 있었음" (Slack GN⁺ 발췌)

> "AI 해킹 도구 Antares가 열흘간 인증 검사를 분석했지만 이메일 형식의 사용자명만 시도해 막혔으며, 사람이 사용자명 필드를 `admin`으로 바꾸자 관리자 권한으로 실행됨" (Slack GN⁺ 발췌)

## 댓글

**이 사건이 실제 침해였는지 보안연구/버그바운티였는지 — 명확히 보안 연구·버그바운티다.** 복수 매체(Help Net Security, iTnews, CyberSecurityNews, GBHackers, runtimewire 등 9개 이상)가 일관되게 "Faav가 신고 → Microsoft가 9일 만에 엔드포인트 잠금 → 2주 뒤 $5,000 바운티 지급"이라는 동일한 타임라인을 보도한다. 악의적 데이터 유출이나 2차 피해 보고는 없다.

**출처 한계**: `news.hada.io`, `helpnetsecurity.com`, `itnews.com.au`, `tomshardware.com` 모두 이번 세션 egress 차단으로 직접 열람하지 못했다. 위 내용은 WebSearch로 교차확인한 9개 이상 매체의 보도를 종합한 것이며, 핵심 사실(서명 미검증·admin 사용자명·17.3조 행 추산·$5,000 바운티·타임라인)은 다수 독립 매체에서 일치해 신뢰도가 높다. 다만 1차 소스(Faav 본인의 공개 글이 있다면)를 직접 대조하지 못했고, hada 댓글 수·HN/Lobsters 큐레이션 유무는 확인하지 못했다. 또한 이 보도들의 원 출처가 연구자 본인의 디스클로저 글인지 Microsoft 발표문인지도 명확히 특정하지 못했다 — 2차 보도 체인을 통한 재구성이라는 한계가 있다.

## 내 생각 · 적용점

### 핵심 전이 1 — AI 자동화의 "그럴듯함 함정"과 사람의 직관은 상호보완적 자원

Antares는 열흘간 "이메일 형식 사용자명"이라는 가장 그럴듯한 가설에 고착돼 더 단순한 "admin"이라는 경로를 보지 못했다. AI가 사람보다 특정 가설을 훨씬 성실하고 집요하게 탐색하지만, 사람의 "엉뚱한" 직관이 여전히 결정적인 돌파구가 된다는 증거다. 이건 [[2026-06-08-hacking-google-with-ai-bug-bounty]]의 "AI는 스케일 곱셈기, 검증 하네스가 있어야 쓸모"와 대조하며 읽을 사례다 — brutecat의 사례는 AI가 "규모"로 이겼지만, Titan 사례는 사람이 "직관"으로 AI가 못 넘은 벽을 넘었다. **스케일과 직관은 경쟁이 아니라 서로 다른 축의 자원이다.**

### 핵심 전이 2 — "같은 깨진 패턴이 도처에 반복된다"

토큰 서명 미검증이라는 기본적인 인증 실수가 거대 조직의 내부 서비스에서조차 반복됐다. [[2026-09-16-baseten-github-admin-access-25-minutes]]의 "2023년 빌드 인자로 넘긴 GitHub 토큰이 Docker 이미지 히스토리에 남아 2026년까지 살아있었다"와 같은 계열이다 — 복잡한 제로데이가 아니라 **서명 검증·토큰 수명 관리 같은 기본 위생이 뚫리는 지점**이 반복해서 나타난다.

### 핵심 전이 3 — 책임있는 공개의 가치, 그리고 속도의 대조

연구자가 17.3조 행 전체를 긁지 않고 접근 가능성만 증명하는 선에서 멈췄고, Microsoft는 9일 만에 엔드포인트를 잠갔다 — 버그바운티 생태계가 제대로 작동한 사례다. 이건 [[2026-09-25-openai-agent-medicare-portal-breach]]의 "침입 발견 후 정부 통보까지 84일"과 정반대다. **발견에서 공개·조치까지의 속도 차이가 사고 대응의 질을 가른다.**

## 호스피탈리티 / CRS 적용 포인트

온다 CRS도 여러 분석·리포팅 DB를 연결하는 내부 서비스를 운영한다면 직접 적용 가능성이 높다. (1) 로그인 토큰 서명 검증은 개별 엔드포인트가 아니라 프레임워크·미들웨어 레벨에서 강제해, 특정 서비스가 "검증을 빼먹는" 일이 구조적으로 불가능하게 만든다. (2) 사용자명·역할(role) 필드를 신뢰할 수 없는 입력으로 취급해, role=admin 매칭을 별도 DB 조회로 재검증한다 — "필드값이 곧 권한"이 되는 설계를 피한다. (3) 내부 분석·리포팅 서비스에도 정기 펜테스트/버그바운티를 돌려, 파트너·채널 연동 API에 같은 패턴(서명 미검증, 필드 기반 암묵적 권한 매칭)이 없는지 주기적으로 점검한다.

## 연관 자료
- [[2026-06-08-hacking-google-with-ai-bug-bounty]] — *AI는 규모로, 사람은 직관으로 — 보안 테스팅에서 상호보완되는 두 자원*
- [[2026-09-16-baseten-github-admin-access-25-minutes]] — *정교한 익스플로잇이 아니라 기본 위생(토큰 수명 관리)이 뚫린 같은 계열의 사례*
- [[2026-09-25-openai-agent-medicare-portal-breach]] — *발견에서 공개까지의 속도가 정반대인 대조 사례(84일 지연)*

## 한 달 뒤 회고
*(2026-11-01 즈음 — CRS 내부 분석/리포팅 서비스의 토큰 서명 검증과 역할 필드 신뢰 경계를 점검했는지, 파트너 연동 API에 같은 패턴의 취약점이 없는지 확인했는지 기록.)*
