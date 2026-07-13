---
title: "CLI가 실제로 무엇을 전송하는가 — 와이어 수준 포렌식과 'opt-out을 껐는데도 멈추지 않는' 동의의 형해화"
source_title: "What xAI Grok Build CLI actually sends to xAI - a wire-level analysis (grok 0.2.93)"
source_url: "https://gist.github.com/cereblab/dc9a40bc26120f4540e4e09b75ffb547"
source_name: "gist.github.com (@cereblab)"
referrer_url: "https://news.hada.io/topic?id=31375"
published_at: "2026-07-10"
summarized_at: "2026-07-13"
category: "engineering"
tags: ["wire-level-forensics", "consent-integrity", "trust-boundary", "opt-out", "data-exfiltration", "sandboxing", "secret-masking", "reproducible-evidence"]
---

# CLI가 실제로 무엇을 전송하는가 — 와이어 수준 포렌식과 'opt-out을 껐는데도 멈추지 않는' 동의의 형해화

> 출처: [What xAI Grok Build CLI actually sends to xAI — a wire-level analysis (grok 0.2.93)](https://gist.github.com/cereblab/dc9a40bc26120f4540e4e09b75ffb547) (@cereblab, "Independent AI Safety Checker") · 정리일 2026-07-13

## 한 줄 요약

**한 독립 리서처가 mitmproxy로 Grok Build CLI(grok 0.2.93)의 HTTPS 트래픽을 와이어 수준에서 캡처해, 이 CLI가 모델 요청(`/v1/responses`)과는 별개의 채널(`/v1/storage`)로 "에이전트가 읽지 않은 파일까지 포함한 저장소 전체 + Git 이력"을 GCS 버킷에 업로드하며, 이 업로드가 "Improve the model" opt-out을 꺼도 멈추지 않는다는 것을 실증했다. 다만 저자는 "학습에 실제로 사용됐는지는 네트워크 캡처만으로 입증할 수 없다"고 한계를 분명히 그었다. 어제 정리한 하네스 토큰 계측 글의 완벽한 짝 — 그쪽이 '비용'을, 이쪽이 '데이터 유출'을 같은 방법론(내 경계에서 직접 계측)으로 파헤친다.**

## 핵심 포인트

- **두 개의 독립 채널** — 모델 턴(`POST /v1/responses`)과 별개로 `POST /v1/storage` 채널이 작업공간 전체 스냅샷을 업로드한다.
- **27,800배 용량 격차** — 12GB 무작위 파일 세션에서 `/v1/responses`는 총 약 192KB였지만 `/v1/storage`는 캡처 중단 시점까지 5.10GiB. **"192KB로는 5GB를 인코딩할 수 없다"** — 모델이 처리한 게 아니라 코드베이스 자체가 빠져나갔다는 논거.
- **읽지 말라고 지정한 파일까지 복구** — "어떤 파일도 열지 마라"는 통제 프롬프트를 줬는데도 git bundle이 업로드됐고, `git clone`으로 열지 말라던 canary 마커와 전체 Git 이력이 복구됐다.
- **비밀정보 평문 유출** — 테스트용 `.env`의 canary API 키·DB 비밀번호가 마스킹 없이 요청 본문과 `session_state` 아카이브 양쪽에 그대로.
- **opt-out 무력화 (도덕적 급소)** — "Improve the model"을 꺼도 `/v1/settings`가 `trace_upload_enabled:true`, `upload_enabled:true`를 유지. 즉 **학습 opt-out은 "학습에 쓸지"만 제어할 뿐 "코드가 기기를 떠나는지"는 막지 못한다.**
- **문서 미고지·기본 활성화** — 검토한 설치 스크립트·quickstart에 이 저장/업로드 동작 언급이 없었다(단 저자는 전체 문서를 감사하진 않았다고 범위를 한정).
- **명시된 한계** — 학습 사용 미입증, 일부 로그 미보존, 모든 계정·설정 조합 미시험. 결과는 grok 0.2.93 · 2026년 7월 한정.

## 인상 깊은 문장

> "It uploads the whole repository — every tracked file's content plus git history — independent of what the agent reads."

> "192 KB cannot encode 5 GB, yet gigabytes of content exited via `/v1/storage`."

> "Opting out of training does not prevent codebase transmission."

## 댓글 — GN⁺의 HN 큐레이션 10개 클러스터 + 원 스레드(154개) 누락분 보강

**GeekNews 자체 댓글 1개(= GN⁺의 HN 큐레이션, 10개 클러스터). 원 스레드(HN item 48877371, 404p/154댓글)를 열어 GN⁺가 누락한 주요 클러스터까지 확인했다.**

- **무엇이 "정당한 컨텍스트 전송"과 "데이터 하베스팅"을 가르는가** — 결국 코드는 컨텍스트로 재전달돼야 하지만, 이 사례의 세 가지 델타가 선을 넘는다: ① **비밀 마스킹 없음** ② 임시 처리가 아니라 **명명된 GCS 버킷에 영속 저장** ③ **미고지 + 기본 on**. 이 세 기준은 "어떤 데이터 수집이 정당한가"의 보편 판단 틀이다.
- **비밀을 읽은 것 자체는 사실상 의도된 동작** — LLM은 읽기 전엔 비밀 유무를 판단할 수 없다. 평문 비밀을 `.env`에 두고 놀라는 쪽이 문제. **문제는 "읽은 것"이 아니라 "저장소 전체를 별도 채널로 영속 업로드한 것".**
- **샌드박싱 실전** — bubblewrap/네트워크 네임스페이스로 코딩 도구와 LLM 제공자를 분리, 프로젝트 디렉터리만 읽기·`.git` 읽기전용·특정 LLM 호스트만 허용. 자작 프록시로 스트림에서 비밀을 실시간 탐지·치환(gitleaks류) 후 전송하는 방어도.
- **원 스레드 누락분(전이 가치 높음)** — GitHub Copilot 엔지니어가 등장해 "Microsoft조차 모든 GitHub 저장소에 접근하지 못한다(4중 보호·감사)"고 반박했으나, "제3자 유출 없이 절대 확언 가능하냐"는 압박엔 "절대적 답은 불가능"이라 답했다. `[harness] disable_codebase_upload=true`로 끌 수 있다는 주장(바이너리 `strings`에서 관련 문자열 확인)과 "실제로 존중되는지는 미검증"이라는 단서. "중국 AI가 오히려 풀파일 업로드 안 하고 로컬에서 grep/sed로 청크만 보낸다"는 대조도.
- **검증 문화** — 다수가 "보고서 자체가 AI로 작성돼 환각 여부를 신뢰하기 어렵다, 재현이 필요하다"고 지적. AI가 폭로도 하고 폭로문도 쓰는 시대의 자연스러운 경계.

## 내 생각 · 적용점

> *특정 회사 비난이 목적이 아니다. 저자도 "학습 사용은 미입증"이라 못박았다. 내가 가져갈 것은 아래 원칙들이다.*

### 핵심 전이 1 — 어제 글과 정확히 같은 방법론, 다른 축을 잰다

이 글은 어제 정리한 [[2026-07-13-harness-token-overhead-instrument-your-own-boundary]]의 완벽한 짝이다. 둘 다 **"블랙박스 CLI가 실제로 무엇을 API 경계로 보내는지 프록시로 직접 계측"**한다. 그쪽이 *비용*(토큰 오버헤드)을, 이쪽이 *데이터 흐름*(무엇이 유출되는가)을 잰다. 결론도 같다 — **공급자가 말하는 것 말고, 내 경계에서 직접 봐야 안다.** mitmproxy/200줄 프록시 하나면 답할 수 있는 질문이다.

### 핵심 전이 2 — "opt-out을 껐는데도 멈추지 않는다"는 동의의 형해화

이 글의 도덕적 급소이자 가장 넓게 전이되는 원칙이다. **설정 토글이 실제 데이터 흐름이 아니라 "라벨"만 제어할 때, 사용자 동의는 형해화된다.** UI 스위치와 실제 시스템 동작의 괴리 = 신뢰 붕괴. 이건 온다/CRS처럼 게스트 개인정보를 다루는 서비스에 그대로 감사 원칙으로 옮겨진다 — **"우리의 동의 토글은 실제 파이프라인을 제어하는가, 아니면 라벨만 바꾸는가?"** 마케팅 수신 동의, 데이터 처리 동의, 쿠키 배너가 실제 데이터 흐름과 일치하는지 계측으로 확인해야 한다.

### 핵심 전이 3 — 신뢰 경계 설계: "무엇을 신뢰할지 선택하는 것이 현재 상태"

HN의 프레임이 정확하다 — 지금 우리는 **하네스·모델·제공자 중 무엇을 신뢰할지 선택**하고 있다. 그래서 나오는 실천이 코딩 도구와 LLM 제공자의 분리, 네트워크 네임스페이스 격리, 자작 프록시의 비밀 스크러빙이다. 이건 내 CLAUDE.md의 **"시크릿 비노출"** 원칙(온다 DB 비밀번호는 함수 내부에서 Secrets Manager→MYSQL_PWD로만 흐르고 대화/로그에 출력 금지)과 정확히 같은 사고다. 그리고 [[2026-07-06-anthropic-losing-developer-goodwill]]에서 본 **"모델 제공자가 하네스도 공급하는 이해충돌"**이 프라이버시 축에서 반복된다 — 어제 글이 *비용* 축에서 같은 이해충돌을 지적했다.

### 핵심 전이 4 — 재현 가능한 증거와 명시된 한계가 주장의 신뢰를 정한다

이 글이 신뢰받는 이유는 폭로의 세기가 아니라 **canary 마커·git bundle 복구·바이트 카운팅·SHA 같은 재현 가능한 증거**와 **"학습 사용은 입증하지 못했다"는 명시된 한계** 때문이다. AI가 폭로도 하고 폭로문도 쓰는 시대에, 이건 [[2026-07-13-harness-token-overhead-instrument-your-own-boundary]]의 감사 로그, [[2026-07-13-own-the-outer-loop]]의 Answerability와 같은 계열의 **방법론적 정직성**이다. 주장할 때 증거와 한계를 함께 내놓는 것 — 내가 가든에서 댓글 클러스터 수를 명시하고 "미확인"을 미확인이라 적는 것과 같은 규율.

## 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 별도 안내)

## 연관 자료
- [[2026-07-13-harness-token-overhead-instrument-your-own-boundary]] — *같은 방법론(경계 계측), 비용 축 vs 데이터 유출 축*
- [[2026-07-13-own-the-outer-loop]] — *Answerability = "무엇을 보냈는지 재구성 가능해야 한다"*
- [[2026-07-06-anthropic-losing-developer-goodwill]] — *"모델 제공자가 하네스도 공급하는 이해충돌"의 프라이버시판*
- [[2026-06-01-chatgpt-sheets-prompt-injection-exfiltration]] — *AI 경유 데이터 유출 계열*
- [[2026-06-08-aur-supply-chain-malware]] — *신뢰 경계·공급망 신뢰의 다른 사례*

## 한 달 뒤 회고
*(2026-08-13 즈음 — 내가 쓰는 코딩 CLI/에이전트가 무엇을 전송하는지 한 번이라도 프록시로 확인했는지, `.env`·시크릿을 작업 디렉터리 밖으로 분리했는지, 온다/CRS의 "동의 토글이 실제 파이프라인을 제어하는가"를 점검했는지 기록.)*
