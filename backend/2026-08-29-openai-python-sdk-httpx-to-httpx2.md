---
title: "OpenAI Python SDK, HTTPX에서 HTTPX2로 (openai-python 3.0.0) — 인증서 검증이 certifi에서 OS 신뢰 저장소로 조용히 바뀌면서, 컨테이너·프록시 환경이 배포 당일 깨졌다"
source_title: "httpx2.md — Migrating to HTTPX2"
source_url: "https://github.com/openai/openai-python/blob/main/httpx2.md"
source_name: "openai/openai-python (GitHub)"
referrer_url: "https://news.hada.io/topic?id=32981"
published_at: "2026-08-12"
summarized_at: "2026-08-29"
category: "backend"
tags: ["openai-sdk", "httpx", "httpx2", "pydantic", "certificate-validation", "dependency-supply-chain", "breaking-change", "python"]
---
# OpenAI Python SDK, HTTPX에서 HTTPX2로 (openai-python 3.0.0)

> 출처: [httpx2.md — Migrating to HTTPX2](https://github.com/openai/openai-python/blob/main/httpx2.md) (openai/openai-python, GitHub · openai-python 3.0.0, 2026-08-12 릴리스) · 정리일 2026-08-29
> **출처 한계**: `news.hada.io`·`community.openai.com`이 이 세션에서 egress 차단돼 hada 댓글·OpenAI 커뮤니티 스레드 원문은 직접 못 읽었다. `github.com`은 접근 가능해 SDK 공식 마이그레이션 가이드(`httpx2.md`)와 실제 파손 사례(simonw/llm 이슈 #1608)는 원문으로 확보했다. GeekNews의 정확한 게시일은 확인 못했고, SDK 3.0.0 릴리스일(2026-08-12)을 published_at으로 채택했다.

## 한 줄 요약

**OpenAI Python SDK 3.0.0(2026-08-12)이 동기·비동기 HTTP 클라이언트의 기본 라이브러리를 HTTPX에서 HTTPX2로 교체했다.** HTTPX2는 원작자가 아니라 Pydantic 팀이 HTTPX의 유지보수를 이어받아 만든 후속 프로젝트로, API 호출·응답 모델·스트리밍 등 기본 사용 경로는 그대로 동작한다고 공식 문서는 밝힌다. 하지만 **인증서 검증 기준이 `certifi` 라이브러리에서 운영체제의 신뢰 저장소로 바뀌면서**, `httpx`가 자동 설치되지 않게 됐고, 이 두 변화가 배포 당일 최소 컨테이너 이미지·기업 TLS 검사 프록시·`httpx`를 암묵적으로 가정한 서드파티 패키지(`simonw/llm` 등)를 실제로 깨뜨렸다.

## 핵심 포인트

- **왜 갈아탔나** — HTTPX2는 ***"Pydantic Services가 HTTPX의 개발·유지보수를 이어가는 프로젝트"***(WebSearch 교차검증)로, 기존 설계를 유지하면서 안정적 관리·보안 업데이트를 이어가는 것이 목표라고 한다. 원작 라이브러리의 유지보수 리스크를 상업적 스튜어드십으로 흡수한 사례.
- **암묵적 의존성이 명시적 의존성으로 바뀐 것이 핵심 파손 지점** — 이전엔 `openai`를 설치하면 `httpx`가 딸려 왔기 때문에, `openai`를 통해서만 `httpx`를 얻어 쓰던 다운스트림 패키지가 많았다. 3.0.0부터는 `httpx2`만 설치되므로, ***`httpx`를 직접 import하면서 자기 `pyproject.toml`에 선언하지 않았던 패키지는 "모듈 `httpx` 없음" 오류로 신규 설치가 깨진다*** — `simonw/llm` 이슈 #1608이 정확히 이 사례다(원문 확보).
- **테스트 모킹까지 조용히 깨졌다** — `simonw/llm` 이슈에 따르면 `pytest-httpx`는 `httpx`를 패치하지만 `httpx2`는 패치하지 않아서, ***테스트가 모킹을 우회해 실제 OpenAI API로 요청을 보내고 더미 키로 401 오류를 낸다*** — CI에서 "실패"가 아니라 "실제 네트워크 호출"로 나타나는, 알아채기 어려운 실패 모드.
- **인증서 검증 기준 전환** — `certifi`의 CA 번들 대신 ***"운영체제의 인증서 저장소를 사용"***한다. 공식 가이드가 명시한 문제 환경 셋: **①시스템 CA 인증서가 없는 최소 컨테이너 이미지 ②기업 TLS 검사 프록시 사용 환경 ③커스텀/수정된 certifi 번들에 의존하던 배포.** 해결책은 `SSL_CERT_FILE`/`SSL_CERT_DIR` 환경변수 지정, 또는 SSL 컨텍스트를 프로그래매틱하게 직접 주입.
- **하위 호환 경로는 유지, 단 "임시"라고 못 박음** — 커스텀 HTTP 클라이언트가 필요하면 `DefaultHttpx2Client`로 옮기면 되고, 기존 `DefaultHttpxClient`류 이름도 계속 작동은 하지만 내부적으로 HTTPX2 클라이언트를 생성한다. 정말 옛 `httpx`가 필요하면 수동 설치 후 주입하는 ***"레거시 호환성은 마이그레이션 보조용이며 언제든 중단될 수 있다"***는 경고가 명시돼 있다.

## 인상 깊은 문장

> "HTTPX2 is installed automatically with `openai`; the previous `httpx` package is not."
> (HTTPX2는 `openai` 설치 시 자동으로 설치된다. 이전의 `httpx` 패키지는 설치되지 않는다.)
> — 이 한 줄이 이번 전환에서 실제로 깨진 것들의 근본 원인이다: "전이 의존성으로 뭔가를 암묵적으로 얻던 코드"가 전부 노출됐다.

> "Legacy HTTPX support is provided as a migration aid and may be discontinued."
> (레거시 HTTPX 지원은 마이그레이션 보조 수단으로 제공되며 언제든 중단될 수 있다.)

## 댓글

- **hada 댓글 확인 불가** — GeekNews 페이지 자체가 이 세션에서 차단돼 댓글 수·논조를 못 봤다.
- **HN/Lobsters 별도 큐레이션 여부도 확인 못함** — 이번 세션에서 별도 스레드를 찾지 못했다(존재하지 않는다는 뜻은 아니다, 검색이 닿지 않았을 뿐).
- **대신 실제 파손 사례로 논쟁의 실체를 확인했다** — OpenAI 개발자 커뮤니티에 "OpenAI Python SDK 3.0.0 - now installing/needing Pydantic team's httpx2 fork"라는 스레드가 있다는 것을 WebSearch로 확인했으나 원문은 못 읽었다(`community.openai.com` 차단). 대신 `simonw/llm` 저장소의 실제 이슈(#1608, GitHub에서 원문 확보)로 "누락된 의존성 선언"과 "테스트가 조용히 실제 API를 때리는" 두 가지 구체적 파손이 3.0.0 배포 당일 실제로 일어났음을 확인했다 — **이건 단순 우려가 아니라 실제 재현된 사례다.**
- **읽을 때 감안**: 이 노트는 OpenAI 공식 마이그레이션 가이드(자기 소개형 문서)와 제3자 이슈 하나에 근거한다. "얼마나 많은 패키지·배포가 실제로 영향받았는지"에 대한 집계 수치는 어디에도 없다 — n=1(simonw/llm) 사례를 일반화하지 않도록 주의.

## 내 생각 · 적용점

**핵심 전이 1 — "전이 의존성으로 뭔가를 암묵적으로 얻는다"는 패턴이 [[2026-06-08-aur-supply-chain-malware]]의 신뢰 신호 문제와 거울처럼 대칭이다.** AUR 노트의 결론은 ***"신뢰 신호가 검증 없는 자기 신고면 무의미하다"***였다 — 거기서는 커밋 author 필드가 위조 가능한데도 신뢰 신호로 쓰였다는 게 문제였다. 이번 사례는 방향이 다르지만 뿌리는 같다: `httpx`라는 패키지가 "명시적으로 선언한 의존성"이 아니라 "다른 패키지가 우연히 딸려온 부산물"로 존재했고, 그 부산물의 존재 자체가 암묵적 계약이 돼버렸다. **의존성 그래프에서 "내가 직접 요구하지 않았는데 항상 거기 있던 것"은 언젠가 사라진다** — AUR 사례가 "신뢰를 자기 신고에 의존하지 말라"였다면, 이번 사례는 "의존성을 전이(transitive) 관계에 의존하지 말고 직접 선언하라"는 같은 교훈의 패키지 관리 버전이다.

**핵심 전이 2 — 인증서 검증 기준 전환은 [[2026-08-22-ssl-everything-you-learned-is-deprecated]]가 짚은 "TLS 운영의 전제가 조용히 바뀐다"는 흐름의 또 다른 사례다.** 그 노트의 핵심은 인증서 수명이 398일에서 47일로 줄면서 ***"사람이 갱신한다"는 전제 자체가 폐기***된다는 것이었다 — 자동화 없이는 운영 불가능해지는 방향. 이번 HTTPX2 전환은 층위는 다르지만 같은 방향의 변화다: `certifi`라는 "누구나 파이썬 패키지로 관리하던 정적 CA 번들"에서 "운영체제가 관리하는 신뢰 저장소"로 옮겨가는 건, 인증서 신뢰 체계의 책임을 **애플리케이션 레이어에서 인프라 레이어로 이동**시키는 결정이다. 두 변화를 겹쳐 보면, TLS/인증서 생태계 전반이 "애플리케이션이 알아서 관리하던 방식"에서 "플랫폼/OS가 표준으로 관리하는 방식"으로 이동 중이라는 더 큰 그림이 보인다 — 개별 애플리케이션 개발자 입장에서는 통제권이 줄어드는 대신 "OS를 최신으로 유지하라"는 새로운 책임이 생긴다.

**핵심 전이 3 — 최소 컨테이너 이미지 문제는 실무에서 바로 재현 가능한 체크리스트다.** `certifi`를 명시적으로 pin해서 CA 번들을 컨테이너에 구워 넣던 배포(멀티스테이지 빌드로 OS 패키지를 최소화한 `distroless`/`scratch` 기반 이미지 등)는, "시스템 CA 인증서가 없다"는 정확히 그 실패 모드에 해당한다. **openai SDK를 최신으로 올리기 전에, 컨테이너 이미지에 `ca-certificates`가 실제로 설치돼 있는지 확인하라는 게 이번 사례의 가장 실무적인 교훈이다.**

## 호스피탈리티 / CRS 적용 포인트

**온다 백엔드가 `openai` Python SDK를 호출하는 곳이 있다면 실질적 CRS 접점이 두 개 있다.**
1. **컨테이너 이미지 감사** — CRS·PMS 연동 서비스 중 OpenAI API를 호출하는 컨테이너가 최소 베이스 이미지(alpine, distroless 등)를 쓴다면, `openai` 패키지를 3.0.0 이상으로 올리기 전에 시스템 CA 인증서 존재 여부를 먼저 확인해야 한다 — 그렇지 않으면 프로덕션에서 조용히 TLS 핸드셰이크가 실패할 수 있다.
2. **전이 의존성 감사** — [[2026-06-08-aur-supply-chain-malware]] 노트에서 짚은 원칙과 같은 결로, 온다의 다른 파이썬 서비스 중 `openai`를 통해 `httpx`를 암묵적으로 얻어 쓰는 코드가 있는지(직접 import했는데 `requirements.txt`/`pyproject.toml`에 명시 안 된 경우) 점검할 가치가 있다 — 이건 openai SDK에 국한된 문제가 아니라 파이썬 의존성 관리 일반의 함정이다.

## 연관 자료

- [[2026-06-08-aur-supply-chain-malware]] — "신뢰 신호가 검증 없는 자기 신고면 무의미하다"는 원칙의 거울상: 이번엔 신뢰가 아니라 의존성 자체가 암묵적 전이 관계로 존재했다는 게 문제.
- [[2026-08-22-ssl-everything-you-learned-is-deprecated]] — TLS 신뢰 체계의 책임이 애플리케이션에서 인프라/OS로 이동하는 같은 방향의 더 큰 흐름.
- [[2026-08-24-pqc-ml-kem-developer-guide]] — 같은 시즌에 정리한 또 다른 암호화/인증서 관련 개발자 가이드, TLS 생태계가 계속 전제를 바꾸고 있다는 배경을 공유.

## 한 달 뒤 회고 (2026-09-29 즈음)
- `simonw/llm` 외에 다른 주요 파이썬 패키지에서 같은 파손 사례가 더 나왔는지, `pytest-httpx`가 HTTPX2를 지원하게 됐는지 확인.
- 온다의 파이썬 서비스 중 `openai` SDK를 3.0.0 이상으로 올린 곳이 있다면, 컨테이너 CA 인증서·전이 의존성 감사를 실제로 했는지 점검.
- 이번에 확인 못한 hada 댓글·OpenAI 커뮤니티 스레드 원문을 나중에라도 대조.
