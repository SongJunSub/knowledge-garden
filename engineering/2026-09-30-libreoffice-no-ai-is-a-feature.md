---
title: "그렇다, 이제 AI가 없는 것도 기능이다 (LibreOffice) — 벤더 종속 없는 AI 통합이 나올 때까지, 기본 설치엔 아무것도 넣지 않는다는 여섯 가지 조건"
source_title: "Yes, no AI is now a feature"
source_url: "https://blog.documentfoundation.org/blog/2026/09/03/yes-no-ai-is-now-a-feature/"
source_name: "The Document Foundation (TDF Community Blog)"
referrer_url: "https://news.hada.io/topic?id=34470"
published_at: "2026-09-03"
summarized_at: "2026-09-30"
category: "engineering"
tags: ["libreoffice", "open-source-governance", "ai-policy", "user-control", "vendor-lock-in", "odf"]
---

# 그렇다, 이제 AI가 없는 것도 기능이다 (LibreOffice)

> 출처: [Yes, no AI is now a feature](https://blog.documentfoundation.org/blog/2026/09/03/yes-no-ai-is-now-a-feature/) (The Document Foundation, TDF Community Blog) · GeekNews(id=34470) 경유 · 정리일 2026-09-30
>
> **출처 한계**: `blog.documentfoundation.org`, `news.hada.io`, `gamingonlinux.com`, `linuxiac.com`, `metatalks.ai` 등 1차·2차 소스 다수가 이 세션에서 egress 차단돼 직접 열람하지 못했다. WebSearch로 GamingOnLinux, Linuxiac, MetaTalks.ai, 36Kr 등 복수 매체의 스니펫을 교차확인해 재구성했다. 여섯 가지 조건의 정확한 문구는 최소 2개 매체(GamingOnLinux 계열 인용, MetaTalks.ai)에서 거의 동일하게 확인돼 신뢰도가 높다고 판단했다. 다만 원문 전체의 논조·맥락(예: 어떤 계기로 이 글이 나왔는지, 커뮤니티 내부 논쟁이 있었는지)은 확인하지 못했다. LibreOffice 26.8이 이 발표 직후 "다운로드 기록을 경신했다"는 후속 보도가 여러 매체에서 나왔는데, 이는 배포처(TDF)의 자체 집계라 제3자 검증은 없다.

## 한 줄 요약

**LibreOffice/The Document Foundation은 AI 자체를 거부하지 않지만, 사용자 통제·프로젝트 원칙을 모두 충족하는 AI 통합 방식이 나오기 전까지 기본 설치에 AI 기능을 넣지 않겠다고 선언했다 — 추론 위치 선택권, 무단 데이터 전송 금지, 텔레메트리 금지, 단일 벤더 종속 금지, ODF 형식 출력, 완전한 선택적 설치라는 여섯 가지 조건을 명시하고, 현재 시장에 나온 어떤 AI 통합도 이 조건을 전부 충족하지 못한다고 못박았다.**

## 핵심 포인트

- **여섯 가지 조건** — TDF가 명시한 조건은 다음과 같다: ①**추론 위치를 사용자가 선택** — 로컬 컴퓨터, 사용자가 직접 통제하는 인프라, 사용자가 독립적으로 고른 서비스 중에서 선택할 수 있어야 한다. ②**무단 데이터 전송 금지** — 승인 없이는 어떤 문서 내용도 컴퓨터 밖으로 나가지 않아야 한다. ③**텔레메트리 금지** — LibreOffice는 원래 사용 데이터를 수집하지 않는데, 이 원칙은 AI 기능에도 그대로 적용돼야 한다. ④**단일 벤더 종속 금지** — 특정 회사의 API에서만 동작하는 통합은 릴리스 노트에 뭐라고 적든 ***"종속 메커니즘(lock-in mechanism)"***이며, 인터페이스는 여러 백엔드가 구현할 수 있도록 개방돼야 한다. ⑤**ODF 형식 출력** — AI가 생성한 콘텐츠도 다른 콘텐츠와 마찬가지로 ODF 형식이어야 하고 구조·스타일·시맨틱을 유지해야 한다. 독점 형식으로 문서를 생성하는 어시스턴트는 ***콘텐츠 종속을 영속화***한다. ⑥**완전한 선택적 설치** — 관리자가 AI를 설치·제거할 수 있어야 하고, 원하지 않는 사용자에게는 인터페이스에 아예 보이지 않아야 한다.
- **AI 자체 거부가 아니라 통합 방식의 문제** — 이 여섯 조건을 강조하는 이유는 AI에 대한 이념적 반대가 아니라, ***현재 배포되는 AI 통합 방식(주로 단일 벤더 클라우드 API 종속형)이 오픈소스 프로젝트의 원칙과 충돌한다***는 실용적 판단이다.
- **현재 어떤 통합도 조건을 못 채운다** — TDF는 이 여섯 조건을 모두 충족하는 통합 방식이 아직 시장에 없다고 명시적으로 밝혔고, 그래서 기본 설치에는 아무것도 넣지 않는다.
- **서드파티 확장으로는 이미 가능** — AI를 원하는 사용자는 서드파티 확장 기능을 설치해 Ollama, LM Studio 등 로컬 모델이나 다른 OpenAI 호환 엔드포인트에 연결할 수 있다. 대부분 로컬 실행 모델을 경유하도록 설계돼 문서가 기기 밖으로 나가지 않는다.
- **영구적 입장은 아니라는 여지** — TDF는 로컬 추론이 일반 하드웨어에서 더 쉬워지고 오픈 모델이 계속 발전하면 향후 접근 방식을 재평가하겠다고 밝혔다 — "AI 영구 거부"가 아니라 "지금 나온 통합 방식이 조건 미달"이라는 조건부 유보다.

## 인상 깊은 문장

> "An integration that only works with a single company's API is a lock-in mechanism, regardless of how it is described in the release notes." (WebSearch 교차확인 인용)

> "An assistant that generates documents in a proprietary format perpetuates content lock-in." (WebSearch 교차확인 인용)

## 댓글

**hada 댓글 수는 확인하지 못했다**(news.hada.io 세션 차단). WebSearch로 확인한 바로는 GamingOnLinux, Linuxiac, MetaTalks.ai, 36Kr 등 리눅스·오픈소스 전문 매체와 중국어권 매체까지 다수가 이 발표를 다뤘고, "LibreOffice 26.8이 발표 직후 다운로드 기록을 경신했다"는 후속 보도가 이어졌다. 다만 이 다운로드 수치는 TDF 자체 집계로 보이며, "AI 없음을 마케팅 포인트로 내세운 것이 실제로 다운로드 증가의 인과적 원인인지"는 상관관계 이상으로 검증되지 않았다. **정직하게 밝힐 점**: TDF는 오픈소스 재단이지 상업적 AI 벤더가 아니므로 이 발표에 직접적인 상업적 이해관계는 적지만, "우리는 원칙을 지킨다"는 서사 자체가 기부·후원을 유치하는 데 유리한 포지셔닝이라는 점은 감안할 만하다.

## 내 생각 · 적용점

### 핵심 전이 1 — 이번 시즌 오픈소스 AI 정책 계보에 "여섯 조건부 유보"라는 여섯 번째 갈래가 추가된다

[[2026-08-30-debian-generative-ai-policy-contributor-responsibility]] 노트가 정리했듯, 최근 오픈소스 진영의 AI 정책은 저작권 임계값([[2026-08-02-gcc-ai-policy]], GCC의 "약 15줄" 기준), 소송 전략(Oracle/OpenJDK 금지), 정체성(Codeberg), 정치·윤리적 전면 금지([[2026-08-28-sourcehut-bans-llm-generated-content]], SourceHut), 그리고 "허용하되 기존 기준 그대로"(Debian)까지 다섯 갈래였다. LibreOffice는 이 중 어디에도 정확히 들어맞지 않는 ***여섯 번째 갈래***다 — AI 코드 기여 정책(다른 다섯 사례의 주제)이 아니라 ***제품에 AI 기능을 넣을지 말지***를 다루고, "금지"도 "허용"도 아니라 ***"조건이 채워지기 전까지 기본값에서 뺀다"***는 조건부 유보를 택했다. 다섯 사례가 모두 "AI로 만든 코드를 프로젝트가 받아줄 것인가"였다면, 이 사례는 "AI 기능을 프로젝트가 사용자에게 켜줄 것인가"라는 뒤집힌 질문이라는 점에서 계보에 새 축을 더한다.

### 핵심 전이 2 — "유지관리자-사용자 신뢰 관계" 프레임이 이 조건들의 근거를 설명한다

[[2026-09-27-who-is-open-source-about]]는 오픈소스를 "유지관리자가 사용자에게 베푸는 일방적 선물"이 아니라 ***신뢰를 주고받는 관계***로 재정의했다 — 사용자가 소프트웨어를 설치하는 것은 자신의 시스템을 유지관리자에게 위탁하는 행위이고, 유지관리자에게는 그 신뢰를 저버리지 않을 의무가 있다는 논지였다. LibreOffice의 여섯 조건(무단 데이터 전송 금지, 텔레메트리 금지, 벤더 종속 금지)은 정확히 이 신뢰 의무를 AI 기능이라는 새로운 위험 표면에 적용한 것으로 읽을 수 있다 — "AI를 켜는 순간 사용자 문서가 어디로 가는지 사용자가 모르게 되는 것"은 그 신뢰 관계를 정면으로 위반하는 사례이기 때문이다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용 가능성이 이번 배치 중 가장 높다.** 온다가 CRS 제품에 AI 기능(문의 자동 분류, 요금 추천, 리뷰 요약 등)을 넣을 때 LibreOffice의 여섯 조건은 벤더 선택·설계 체크리스트로 거의 그대로 옮겨 쓸 수 있다. ①**추론 위치 선택권**: 파트너사(호텔)가 민감한 예약·고객 데이터를 어느 리전·어느 벤더로 보내는지 알고 통제할 수 있어야 한다. ②**무단 데이터 전송 금지**: 게스트 개인정보나 결제 정보가 승인 없이 제3자 AI API로 나가지 않도록 명시적 동의·감사 로그가 필요하다. ③**텔레메트리 최소화**: AI 기능 사용 로그를 수집하더라도 그 범위를 명확히 밝힌다. ④**단일 벤더 종속 금지**: 특정 LLM 벤더 API에만 하드코딩된 통합은 나중에 벤더 교체 비용을 키운다 — 인터페이스를 추상화해 벤더를 바꿀 수 있게 설계한다. ⑤**표준 형식 출력**: AI가 생성한 요약·추천이 CRS의 표준 데이터 스키마를 벗어나지 않게 한다. ⑥**완전한 선택적 적용**: 파트너사가 AI 기능을 켜고 끌 수 있어야 하고, 원하지 않는 파트너에게 강제로 노출되지 않아야 한다. 이 여섯 축을 그대로 "온다 AI 기능 도입 체크리스트"로 삼을 만하다.

## 연관 자료

- [[2026-08-30-debian-generative-ai-policy-contributor-responsibility]] — 이번 시즌 오픈소스 AI 정책 계보, LibreOffice는 "AI 코드 기여"가 아니라 "AI 기능 탑재" 축의 새로운 사례
- [[2026-08-28-sourcehut-bans-llm-generated-content]] — 정치·윤리적 근거의 전면 금지, LibreOffice의 실용적 조건부 유보와 대조
- [[2026-08-02-gcc-ai-policy]] — 저작권 임계값 기준 정책, 같은 계보의 다른 축
- [[2026-09-27-who-is-open-source-about]] — 오픈소스를 신뢰 관계로 보는 프레임, LibreOffice 여섯 조건의 근거가 되는 논지

## 한 달 뒤 회고

*(2026-10-30 즈음 — 여섯 조건을 모두 충족하는 AI 통합이 실제로 등장했는지, TDF가 실제로 기본 설치에 AI를 넣는 방향으로 움직였는지, "다운로드 기록 경신"이라는 자체 집계 수치가 제3자 통계(예: distrowatch)로도 확인되는지 점검.)*
