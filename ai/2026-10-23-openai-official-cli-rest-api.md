---
title: "OpenAI CLI - OpenAI REST API를 위한 공식 명령줄 도구 (OpenAI) — 구독을 API로 바꿔주는 회색지대 프록시들 옆에, 드디어 API 키로 당당히 쓰는 정식 창구가 생겼다"
source_title: "OpenAI CLI"
source_url: "https://developers.openai.com/api/docs/libraries/openai-cli"
source_name: "OpenAI 공식 개발자 문서(developers.openai.com), WebSearch 교차확인"
referrer_url: "https://news.hada.io/topic?id=35818"
published_at: "확인 불가"
summarized_at: "2026-10-23"
category: "ai"
tags: ["openai", "cli-tool", "rest-api", "developer-tooling", "batch-processing", "terminal"]
---

# OpenAI CLI - OpenAI REST API를 위한 공식 명령줄 도구 (OpenAI)

> 출처: [OpenAI CLI](https://developers.openai.com/api/docs/libraries/openai-cli) (OpenAI 공식 개발자 문서) · GeekNews [id=35818](https://news.hada.io/topic?id=35818) 경유 · 정리일 2026-10-23
>
> **출처 한계**: `news.hada.io`와 `developers.openai.com` 모두 이 세션에서 egress 차단으로 직접 WebFetch는 못 했지만, WebSearch 스니펫으로 공식 문서 페이지 내용을 상당 부분 교차확인했다. ***공식 CLI의 존재, Homebrew(`brew install openai/tools/openai`)·Go 설치 경로, `OPENAI_API_KEY`/`OPENAI_ADMIN_KEY`/`OPENAI_BASE_URL` 환경변수, `--format`(json/jsonl/pretty/raw/yaml/explore) 출력 옵션, Apache-2.0 라이선스는 복수 소스 일치로 신뢰도가 높다.*** 다만 Slack 발췌의 세부(이미지 생성·편집, 파일 업로드/다운로드, 터미널 내 이미지 미리보기, JSONL 배치 제출·결과 다운로드 흐름)는 WebSearch 스니펫 수준에서는 "독스가 그런 기능을 언급한다"는 정도로만 확인됐고, 정확한 하위 명령어 전체 목록까지는 대조하지 못했다. hada 댓글 수·HN/Lobsters 큐레이션 여부도 확인 불가.

## 한 줄 요약

**OpenAI가 터미널·쉘 스크립트에서 바로 OpenAI REST API를 호출할 수 있는 공식 CLI를 내놨다 — 별도 애플리케이션 작성 없이 텍스트 응답 생성, 이미지 생성/편집, 파일 업로드/다운로드를 지원하고, JSONL 배치 제출로 여러 요청을 한꺼번에 처리할 수 있으며, 기본 출력은 사람이 읽기 쉬운 텍스트이지만 `--format` 옵션으로 JSON/JSONL까지 바꿀 수 있다.**

## 핵심 포인트

- **"API를 쓰려고 앱을 짜야 하는" 장벽을 없앤다** — 특정 API를 한 번 호출하거나 반복 작업을 자동화하려고 매번 작은 스크립트·앱을 작성하던 걸, ***쉘에서 바로 명령어 하나로*** 끝낼 수 있게 한다. WebSearch로 확인한 "resource-based 명령어 패턴"(`openai responses create` 같은 식)은 리소스마다 일관된 서브커맨드 구조를 쓴다는 뜻으로, API 엔드포인트 구조를 그대로 CLI 문법에 매핑한 설계로 보인다.
- **인증은 환경변수 하나 — `OPENAI_API_KEY`** — API 키를 환경변수로 읽고, Admin API 엔드포인트는 별도로 `OPENAI_ADMIN_KEY`를 쓴다. `OPENAI_BASE_URL`로 호출 대상 호스트를 바꿀 수 있다는 것도 확인됐다 — 호환 API를 쓰는 다른 백엔드로 CLI를 그대로 돌릴 수 있는 길을 열어둔 설계다.
- **이미지 생성/편집과 파일 업로드/다운로드** — 생성한 이미지를 로컬에 저장하고, 지원하는 터미널에서는 바로 미리보기할 수 있다는 서술이다(WebSearch로는 기능 존재 수준만 확인, 미리보기 메커니즘 세부는 미확인). 파일 업로드·다운로드까지 CLI 한 범위 안에서 처리된다는 건, 파인튜닝·배치·어시스턴트 API처럼 파일을 매개로 하는 워크플로를 통째로 터미널에서 끝낼 수 있다는 뜻이다.
- **JSONL 배치 — 제출하고 기다리고 받는 흐름을 CLI가 감싼다** — 여러 요청을 JSONL 파일로 한꺼번에 제출하고, 완료를 기다린 뒤 결과를 내려받는 흐름을 지원한다. 여러 파일·데이터를 일괄 처리하는 스크립트에 활용할 수 있다는 설명인데, ***이건 그 자체로는 OpenAI의 별도 Batch API를 CLI가 감싼 것으로 보인다*** — WebSearch에서 같은 역할을 하는 서드파티 라이브러리(`openai-batch-helper`)가 따로 존재한다는 걸 봐도, 이게 원래는 사람이 직접 폴링 로직을 짜야 했던 영역이라는 걸 짐작할 수 있다.
- **출력 형식 — 사람 우선, 기계도 지원** — 기본 출력은 읽기 쉬운 텍스트이고, `--format` 플래그로 json/jsonl/pretty/raw/yaml/explore까지 바꿀 수 있다는 게 WebSearch로 확인됐다. 사람이 터미널에서 바로 써도 되고, 다른 스크립트의 입력으로 파이프해도 되는 두 용도를 한 플래그로 커버하는 설계다.

## 인상 깊은 문장

> "별도 애플리케이션을 작성하지 않고 터미널과 쉘 스크립트에서 OpenAI API를 호출" (Slack 발췌 인용)

## 댓글

**hada 댓글 수·HN/Lobsters 큐레이션 여부 확인 불가.** 정직하게 짚을 점: ①이 노트는 공식 문서 존재와 핵심 설계(인증·출력 형식·설치 경로)는 WebSearch로 교차확인했지만, 모든 하위 명령어·정확한 플래그 목록까지 1차 자료로 대조하지는 못했다. ②WebSearch 결과 자체가 "같은 이름(`openai` 또는 `openai-cli`)의 서드파티 도구가 여러 개 존재한다"고 경고한다 — Python SDK가 예전에 설치하던 레거시 `openai` 커맨드와 혼동하기 쉽다는 점은 사용자가 실제로 설치할 때 주의해야 할 부분이다. ③공식 CLI가 새로 나왔다는 사실 자체는 "API를 더 쉽게 많이 쓰게 만든다"는 벤더의 이해관계와 맞물려 있다는 것도 당연히 감안해야 한다.

## 내 생각 · 적용점

### 핵심 전이 1 — [[2026-09-04-cliproxyapi-oauth-account-to-api]]가 파고든 "구독 계정을 API처럼 쓰는 회색지대"와 정확히 반대편에, 이 공식 CLI가 "API 키로 정식 과금하는 터미널 접근"이라는 정반대 노선을 제시한다

CLIProxyAPI는 ChatGPT Codex·Claude Code·Gemini 등의 ***구독 계정 OAuth 로그인***을 가로채 API처럼 호출하게 해주는 도구였고, 그 존재 이유 자체가 각 서비스 이용약관의 회색지대에 걸쳐 있었다. OpenAI CLI는 ***API 키(`OPENAI_API_KEY`) 기반의 정식 API 과금 경로***를 터미널에서 그대로 쓰게 해주는 공식 도구다. 두 글을 나란히 두면, "터미널에서 LLM API를 쓰고 싶다"는 같은 욕구가 (1) 구독을 우회해 API처럼 쓰는 회색지대 루트와 (2) API 키로 정식 과금하는 공식 루트로 갈라진다는 게 분명해진다 — OpenAI CLI의 등장은 적어도 OpenAI 쪽에서는 ①번 수요를 ②번으로 흡수하려는 시도로 읽을 수 있다.

### 핵심 전이 2 — [[2026-10-12-jevgrep-coding-agent-cli]]가 보여준 "써드파티 CLI가 특정 판정 모델(Jev)에 특화된 좁은 작업 하나를 터미널 커맨드로 감싼다"는 설계와, 이 공식 CLI의 "리소스 기반 범용 커맨드로 API 표면 전체를 감싼다"는 설계가 대비된다

jevgrep은 "코드 검색"이라는 좁고 구체적인 작업 하나를 CLI 커맨드 하나로 만든 사례였다. OpenAI CLI는 그 반대 극단 — 텍스트 생성·이미지·파일·배치까지 ***API 표면 전체를 범용 리소스 패턴으로 감싸는*** 설계다. 좁고 특화된 서드파티 CLI와 넓고 범용적인 공식 CLI가 공존하는 게 지금 LLM 도구 생태계의 자연스러운 분업이라는 걸 두 노트가 함께 보여준다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용 가능성 있음 — 반복 작업·배치 스크립트에.**

- **CRS 쪽에서 OpenAI API를 이미 쓰고 있다면, 운영 스크립트나 일회성 점검(특정 프롬프트 테스트, 대량 텍스트 분류 등)을 별도 앱 작성 없이 이 CLI로 바로 돌릴 수 있는지 검토할 가치가 있다.** 특히 JSONL 배치 제출 흐름은 "여러 파트너사 데이터를 일괄 처리"하는 류의 작업에 바로 맞는 패턴이다.
- **`OPENAI_BASE_URL` 같은 호스트 재지정 옵션이 실제로 있다면, 사내 게이트웨이나 호환 API 뒤에 CLI를 그대로 물릴 수 있는지도 확인할 만하다.**
- **[[2026-09-04-cliproxyapi-oauth-account-to-api]]가 짚은 ToS 회색지대를 피하려면, 이 공식 CLI처럼 API 키 기반의 정식 경로를 우선하는 게 B2B 환경에서는 당연히 더 안전한 선택이다** — 구독 계정을 API처럼 쓰는 편법은 서비스 약관 위반 리스크를 조직이 떠안는 결정이라는 걸 그 노트가 이미 경고했다.

## 연관 자료

- [[2026-09-04-cliproxyapi-oauth-account-to-api]] — "구독 계정을 API로 바꾸는 회색지대 프록시"의 정반대편, API 키 기반 정식 과금 경로를 공식 제공하는 이 CLI와 대비.
- [[2026-10-12-jevgrep-coding-agent-cli]] — 좁고 특화된 작업(코드 검색)을 감싼 서드파티 CLI, 이 공식 CLI의 "API 표면 전체를 범용으로 감싼다"는 설계와 대비되는 같은 장르의 도구.

## 한 달 뒤 회고

2026-11-23 즈음, `developers.openai.com` egress가 풀리면 ①전체 하위 명령어 목록과 정확한 플래그 ②이미지 터미널 미리보기가 실제로 어떤 터미널에서 동작하는지 ③JSONL 배치가 내부적으로 OpenAI Batch API를 그대로 쓰는지를 1차 자료로 확인.
