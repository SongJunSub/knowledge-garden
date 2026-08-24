---
title: "[AWS] Amazon Bedrock에서 Codex 사용하기 — OpenAI Codex를 IAM·PrivateLink·CloudWatch로 감싸는 두 번째 추론 엔드포인트 'Bedrock Mantle'"
source_title: "Amazon Bedrock에서 Codex 사용하기"
source_url: "https://aws.amazon.com/ko/blogs/tech/codex-on-bedrock/"
source_name: "AWS 한국 기술 블로그 (aws.amazon.com) · Slack #개발-뉴스-dev-news 경유(TechArticles 봇, GeekNews 아님)"
referrer_url: "https://ondainc.slack.com/archives/C0AJL0096H4"
summarized_at: "2026-08-24"
category: "ai"
tags: ["aws", "bedrock-mantle", "codex", "openai", "iam", "privatelink", "cloudwatch", "enterprise-governance", "source-limitation"]
---

# [AWS] Amazon Bedrock에서 Codex 사용하기

> 출처: [Amazon Bedrock에서 Codex 사용하기](https://aws.amazon.com/ko/blogs/tech/codex-on-bedrock/) (AWS 한국 기술 블로그 · Slack #개발-뉴스-dev-news 경유) · 정리일 2026-08-24

## 한 줄 요약

**OpenAI의 코딩 에이전트 Codex를 Amazon Bedrock 위에서 쓸 수 있게 하는 통로가 `bedrock-runtime`이 아니라 별도의 `bedrock-mantle`이라는 신설 엔드포인트다.** OpenAI Responses API·Chat Completions API와 Anthropic Messages API까지 노출하는 이 엔드포인트는 AWS SigV4/IAM 인증을 쓰기 때문에, 조직은 OpenAI 계정·API 키 없이 **기존 AWS IAM·PrivateLink·CloudWatch 통제 안에서 Codex를 운영**할 수 있다. 요점은 "OpenAI 모델이 Bedrock에서도 돈다"가 아니라, **비-AWS 벤더 에이전트를 AWS 거버넌스 표면(IAM 정책·네트워크 격리·지표 수집)으로 그대로 감싸는 패턴이 표준화되고 있다**는 것.

## 핵심 포인트 (원문 직접 접근 불가 — 인접 AWS 공식 자료·서드파티 분석 교차 확인 기반, 출처 한계는 "댓글" 항목 참고)

- **`bedrock-mantle`은 `bedrock-runtime`과 구분되는 별도 SigV4 서비스명의 엔드포인트다.** Project Mantle이라는 대규모 추론 서빙 엔진 위에서 OpenAI Responses API(`/v1/responses`)·Chat Completions API·Anthropic Messages API를 동시에 노출해, 기존 OpenAI/Anthropic 기반 앱을 최소 코드 변경으로 Bedrock에 얹을 수 있게 설계됐다.
- **Codex CLI가 이 엔드포인트를 네이티브 지원한다(v0.124.0 기준).** 사용자는 ChatGPT 로그인이나 `OPENAI_API_KEY` 대신 **Bedrock API 키 또는 AWS IAM 자격증명**으로 인증한다 — 조직이 OpenAI 계정을 별도로 관리할 필요가 없다는 뜻.
- **AWS PrivateLink 지원(2026-02 확장)** — VPC 서브넷에 인터페이스 엔드포인트(ENI)를 프로비저닝해 Mantle 트래픽을 인터넷 경유 없이 사설 네트워크 안에 가둘 수 있다. ENI에 보안 그룹을 붙이고, 엔드포인트 정책으로 어떤 IAM 주체·액션만 통과시킬지 추가로 제한할 수 있다.
- **CloudWatch 지표(2026-06 추가)** — `AWS/BedrockMantle` 네임스페이스로 추론 횟수·입출력 토큰 총량·클라이언트 에러 수를 계정/프로젝트/모델/프로젝트+모델 단위까지 세분화해 발행한다. `bedrock-runtime`에서 이미 제공하던 관측성을 Mantle 쪽에도 뒤늦게 동등하게 맞춘 형태.
- **과금은 토큰당(pay-per-token), 좌석 라이선스·개발자별 커밋 없음** — 사용량이 기존 AWS 약정(commitment)에 그대로 반영된다.

## 인상 깊은 문장

**이 한국어 블로그 글 원문에서 직접 인용한 문장은 없다** — 도메인 차단으로 원문에 접근하지 못했다. 대신 같은 내용을 다루는 AWS 공식 발표(영문, whats-new/blogs)에서 확인한 표현을 남긴다.

> "Amazon Bedrock customers can now monitor inference traffic to the bedrock-mantle endpoint with Amazon CloudWatch metrics, the same way they already do for the bedrock-runtime endpoint."
> (Bedrock 고객은 이제 CloudWatch 지표로 bedrock-mantle 엔드포인트의 추론 트래픽을, 이미 bedrock-runtime에 대해 하던 것과 같은 방식으로 모니터링할 수 있다.) — AWS What's New, 2026-06

## 댓글

**이 글은 GeekNews 경유가 아니라 Slack `#개발-뉴스-dev-news`에서 "TechArticles" 봇이 aws.amazon.com을 직접 링크한 것**이라 hada 댓글 자체가 애초에 존재하지 않을 가능성이 높다 — `site:news.hada.io`로 검색했으나 이 글을 다루는 GeekNews 스레드를 찾지 못했고, HN/Lobsters에서도 이 한국어 블로그를 직접 다룬 논의는 확인되지 않는다. 즉 **커뮤니티 반응 자체를 확인할 수단이 없다.**

**출처 한계(중요)**: `aws.amazon.com` 도메인 전체가 이 세션 네트워크 정책상 차단돼 원문을 한 줄도 읽지 못했다(WebFetch `EGRESS_BLOCKED`) — [[2026-08-23-claude-code-bedrock-agentcore-deployment]]에서 겪은 것과 동일한 제약이다. 다만 이번엔 WebSearch로 **Bedrock Mantle 자체를 다루는 다른 AWS 공식 페이지들(What's New 공지 2건, AWS News Blog, AWS Machine Learning Blog)과 서드파티 분석(Medium, dev.to, DevelopersIO, GitHub issue)을 다수 교차 확인**할 수 있었다 — 그래서 위 "핵심 포인트"는 이 특정 한국어 글의 인접 정황 증거치고는 근거가 상당히 두텁다. 그럼에도 **이 한국어 블로그 글 고유의 저자, 발행일, 예시 코드, 온다 관점에서 궁금한 한국어 특유의 설명 방식은 전혀 확인하지 못했다** — Slack 발췌 4개 불릿(Mantle 언급, IAM 권한, PrivateLink+과금, 보안/관측성)과 위에서 독립 확인한 사실이 내용상 정확히 일치한다는 점만 검증된 것이고, "이 글이 실제로 그렇게 썼다"는 문장 단위 확인은 아니다.

## 내 생각 · 적용점

### 핵심 전이 1 — "발표"(2026-06)에서 "구현 디테일"(지금)로, 같은 이야기의 다음 장

[[2026-06-01-openai-frontier-models-codex-on-aws]]는 *"기업이 기존 보안·컴플라이언스·조달·청구·거버넌스 워크플로 안에서 AI를 도입할 수 있게"*라는 원칙 수준의 발표였다. 이번 글은 그 원칙이 **구체적으로 무슨 엔드포인트, 무슨 IAM 액션, 무슨 CloudWatch 네임스페이스로 구현됐는지**를 보여주는 후속편이다 — "거버넌스 경로를 연다"는 약속이 3개월도 안 돼 `bedrock-mantle`이라는 실제 서비스명·PrivateLink 지원·전용 지표 네임스페이스로 구체화된 걸 확인할 수 있다.

### 핵심 전이 2 — AgentCore(Claude 배포)와 Mantle(Codex 추론)은 같은 문제의 서로 다른 층위 해법이다

[[2026-08-23-claude-code-bedrock-agentcore-deployment]]는 **로컬 Claude Agent SDK 에이전트를 AWS AgentCore로 배포**하는 이야기였다(에이전트 실행/오케스트레이션 층위). 이번 글은 **OpenAI Codex의 모델 추론 호출 자체**를 IAM·PrivateLink로 감싸는 이야기다(추론 API 층위). 벤더는 다르고(Claude vs Codex), AWS가 대신 감싸주는 층위도 다르지만(실행 vs 추론), **"비-AWS 벤더 에이전트/모델을 AWS 거버넌스 표면 안으로 끌어들인다"는 동일한 전략**이 두 서비스로 나란히 굴러가고 있다는 게 흥미롭다.

### 핵심 전이 3 — IAM 엔드포인트 정책은 DoorDash가 자체 구축했던 것의 "관리형 버전"이다

[[2026-08-22-computer-use-skills-files-api-ga]]에서 짚었듯, DoorDash 사례([[2026-08-10-doordash-ai-agent-gateway]])는 *"MCP는 도구 호출 방식만 표준화했을 뿐 인증·권한·감사는 해결하지 않는다"*는 공백을 자체 게이트웨이로 메웠다. Mantle의 "엔드포인트 ENI에 보안 그룹 부착 + 엔드포인트 정책으로 IAM 주체·액션 제한"은 정확히 그 공백(자격증명 중앙화·세밀 권한 통제)을 **AWS가 관리형으로 대신 제공**하려는 시도다 — 자체 구축이냐 벤더 채택이냐의 저울이 이번에도 벤더 쪽에 옵션 하나를 더 얹은 셈.

## 호스피탈리티 / CRS 적용 포인트

- **원칙적 적용 가능성은 있지만, 온다가 실제로 검토한 사례는 없다 — 정직하게 밝힌다.** 만약 온다 엔지니어링 조직이 사내에서 OpenAI Codex(또는 유사 코딩 에이전트)를 쓰게 된다면, 각 개발자가 개인 OpenAI 계정/API 키로 접근하는 대신 **Bedrock Mantle을 통해 AWS IAM 자격증명으로 인증**하면 얻는 것이 명확하다 — 조직 IAM 정책 하나로 접근을 통제하고, 퇴사·이동 시 IAM 권한 회수만으로 즉시 차단되며, CloudWatch로 팀/프로젝트 단위 사용량을 감사할 수 있다. 이는 CRS 시스템처럼 **감사 로그·권한 회수가 규제·파트너 계약상 요구되는 B2B 환경**에서 특히 의미가 크다.
- **PrivateLink는 CRS 데이터가 민감한 조직에 더 직접적으로 맞는 포인트다.** 파트너 호텔/OTA 연동 코드베이스를 다루는 코딩 에이전트가 외부로 나가는 트래픽을 VPC 안에 가두고 싶다면(소스 코드·설정값 유출 경로 최소화), Mantle의 PrivateLink 지원이 그 요건에 부합한다 — 다만 이것도 "요건에 부합해 보인다"는 판단이지, 온다가 실제로 이 아키텍처를 저울질했다는 뜻은 아니다.
- **다만 이 노트만으로 구체적인 도입 결정을 내리기엔 근거가 얕다** — 원문을 못 읽었으므로 이 글이 실제로 제시한 구성 예시·비용 비교·제약사항(예: Mantle이 지원하지 않는 Codex 기능이 있는지)은 확인하지 못했다. CRS 쪽 적용을 실제로 검토한다면 원문을 다른 경로로 재확보하는 게 먼저다.

## 연관 자료

- [[2026-06-01-openai-frontier-models-codex-on-aws]] — 같은 주제의 앞선 발표(원칙·거버넌스 서사), 이 노트는 그 구현 디테일(Mantle 엔드포인트) 심화판
- [[2026-08-23-claude-code-bedrock-agentcore-deployment]] — 같은 AWS Bedrock 위, 다른 벤더(Claude)·다른 층위(에이전트 실행)의 대칭 사례. 이 세션에서 겪은 `aws.amazon.com` 전면 차단이라는 동일한 출처 한계도 공유
- [[2026-08-22-computer-use-skills-files-api-ga]] · [[2026-08-10-doordash-ai-agent-gateway]] — Mantle의 IAM 엔드포인트 정책이 대신 풀어주려는 "자격증명 중앙화·감사·권한 회수" 원칙의 선행 사례

## 한 달 뒤 회고

*(2026-09-24 즈음 — ①이 한국어 블로그 원문을 다른 경로로 확보해 저자·발행일·고유 예시를 검증할 수 있었는지 ②`bedrock-mantle`과 `bedrock-runtime`의 역할 분리가 실무에서 혼란을 일으키는지(둘 다 Bedrock인데 엔드포인트가 다르다는 점) ③온다에서 사내 코딩 에이전트 IAM 게이트웨이 논의가 실제로 있었는지 기록.)*
