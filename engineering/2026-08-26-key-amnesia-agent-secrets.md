---
title: "key-amnesia (fujitoid) — 위협 모델이 Git에서 '내 프로젝트를 읽는 에이전트'로 옮겨갔다는 걸 이름부터 못박은 시크릿 관리 도구"
source_title: "key-amnesia: Let your AI agent use your passwords and API keys - without ever letting it see them"
source_url: "https://github.com/fujitoid/key-amnesia"
source_name: "GitHub (fujitoid/key-amnesia)"
referrer_url: "https://news.hada.io/topic?id=32893"
summarized_at: "2026-08-26"
category: "engineering"
tags: ["ai-agent-security", "secrets-management", "devtools", "leak"]
---

# key-amnesia — AI 에이전트에게 시크릿을 보여주지 않고 쓰게 하는 도구

> 출처: [key-amnesia: Let your AI agent use your passwords and API keys - without ever letting it see them](https://github.com/fujitoid/key-amnesia) (GitHub, fujitoid) · 정리일 2026-08-26
> **출처 한계**: `news.hada.io`가 이 세션에서 차단돼 hada 댓글·게시 맥락은 확인하지 못했다. GitHub 원저장소 README는 정상적으로 읽었으므로, 아래 기술 내용은 원문 기반이다.

## 한 줄 요약

**`.gitignore`에 `.env`를 넣는 방식은 시크릿이 Git 이력에 커밋되는 것만 막을 뿐, 로컬 프로젝트 파일로 평문 존재하는 시크릿을 AI 에이전트가 읽는 것까지는 막지 못한다 — key-amnesia는 이 간극을 `LEAK`(Locally Exposed Agent Key)라는 이름으로 못박고, 시크릿을 암호화 볼트(Argon2id + SecretBox)에 저장한 뒤 `ka run` 으로 실행한 자식 프로세스의 환경변수에만 주입해 에이전트 자신은 값을 절대 보지 못하게 설계했다. 다만 명령 출력에 시크릿이 정확히 그대로 찍히는 경우만 검열(redact)하며, base64 등으로 변형된 값은 필터링을 통과할 수 있다는 한계를 저자 스스로 명시한다.**

## 핵심 포인트

- **위협 모델의 이동** — 기존 시크릿 관리의 위협은 "Git에 커밋되어 공개 저장소로 새는 것"이었다. key-amnesia는 새 위협을 ***"프로젝트 파일과 명령 실행 환경에 접근하는 AI 에이전트 자신"***으로 재정의한다. `.gitignore`는 첫 번째 위협만 막고 두 번째는 그대로 열어둔다는 게 출발점.
- **LEAK 정의** — `.env`, 셸 히스토리, MCP 설정 파일, 자격 증명 JSON처럼 **에이전트가 파일시스템 읽기 권한만으로 접근 가능한 평문 시크릿**을 `LEAK(Locally Exposed Agent Key)`로 명명. 침해가 아니라 "에이전트에게 읽기 권한을 준 것 자체가 노출"이라는 프레이밍.
- **동작 방식** — `ka run --cwd DIR --secret API_KEY -- <command>` 형태로 실행하면, 시크릿은 볼트에서 복호화되어 **자식 프로세스의 환경변수에만** 주입된다. 마스터 암호는 필요 시 **별도 콘솔 창**에서만 입력받아 에이전트의 관찰 범위 밖에 둔다.
- **볼트 암호화** — ***"Argon2id + SecretBox"*** 조합. 마스터 암호를 분실하면 복구가 불가능하도록 설계되어 있다 — 편의보다 "새지 않는 것"을 우선한 트레이드오프.
- **Redaction의 정직한 한계** — 명령이 시크릿 값을 표준출력에 그대로 찍으면 key-amnesia가 검열하지만, ***"base64 인코딩 등으로 변형된 값은 필터링되지 않을 수 있다"***고 저자가 스스로 밝힌다. 완벽한 방벽이 아니라 "가장 흔한 실수를 막는" 도구라는 스코프.
- **플랫폼 성숙도** — **Windows·Linux 정식 지원**, **macOS는 PID 파일 래퍼를 쓰는 실험 단계**. Apache License 2.0, 이 세션 확인 시점 기준 **61 스타 · 1 포크**로 아직 초기 프로젝트다.

## 인상 깊은 문장

> "Let your AI agent use your passwords and API keys - without ever letting it see them."
> (저장소 설명 자체가 이 도구의 전체 논지다. "쓰게 하되 보여주지 않는다"는 게 대칭적이지 않은 요구라서, 별도 프로세스 경계가 필요해진다.)

## 댓글

**hada 댓글 수·논지는 확인하지 못했다** — `news.hada.io`가 이 세션에서 egress 차단돼 있다. HN/Lobsters 큐레이션 여부도 검증 수단이 없었다. GitHub 저장소 통계(61 스타·1 포크)만으로는 커뮤니티 검증이 충분히 이뤄졌다고 보기 어렵다 — **초기 도구로서 프로덕션 채택 전 자체 코드 리뷰가 필요한 단계**로 읽는 게 정직하다.

## 내 생각 · 적용점

- **[[2026-07-13-grok-cli-wire-analysis-consent-and-trust-boundaries]]** — 그 노트가 실증한 실패 사례(테스트용 `.env`의 canary API 키·DB 비밀번호가 마스킹 없이 CLI의 네트워크 채널로 그대로 유출)가 바로 key-amnesia가 구조적으로 막으려는 대상이다. 그 글의 결론은 "opt-out은 학습에 쓸지만 제어할 뿐 코드가 기기를 떠나는지는 막지 못한다"였는데, key-amnesia는 **애초에 시크릿이 도구(에이전트)의 관찰 가능 범위에 들어가지 않게** 해서 이 문제를 다른 층위에서 공략한다 — opt-out이라는 "약속"이 아니라 프로세스 경계라는 "구조"로.
- **[[2026-07-25-hanwha-vision-github-token-firmware]]** — 정반대 방향의 대비. 그 사고는 Vite 빌드가 **빌드 시점의 `process.env` 전체**를 클라이언트 번들에 직렬화해 CI 환경변수가 그대로 출하된 "공급망 층"의 실패였다. key-amnesia가 겨냥하는 건 "로컬 개발환경에서 에이전트가 읽는" 층의 실패다. 두 사고를 나란히 놓으면, **환경변수를 "주변 신뢰"(ambient trust)로 다루는 관행 자체가 문제의 공통 뿌리**라는 게 보인다 — 빌드 도구든 AI 에이전트든, 프로세스 환경 전체에 접근 가능한 소비자는 결국 그 안의 시크릿을 유출할 잠재력을 가진다.
- **핵심 전이**: "시크릿을 안 보이게 하는 것"과 "시크릿을 안 쓰게 하는 것"은 다른 문제다. key-amnesia는 전자를, PolicyGuard류 DLP는 프롬프트에 무심코 타이핑된 시크릿을 잡는 후자에 더 가깝다 — 둘은 경쟁 관계가 아니라 **서로 다른 층을 막는 상호보완적 방어선**으로 봐야 한다.

## 호스피탈리티 / CRS 적용 포인트

온다처럼 AI 코딩 에이전트(Claude Code 등)를 실제 개발 워크플로에 쓰는 조직이라면, PMS·OTA 연동 API 키·결제 게이트웨이 시크릿이 로컬 `.env`에 평문으로 존재하고 에이전트가 그 저장소를 읽는 구조는 **가상의 위협이 아니라 지금 당장의 노출면**이다. 다만 key-amnesia 자체(61 스타, macOS 실험 단계)를 그대로 사내 인프라에 채택하기엔 이르다 — **"에이전트의 시크릿 접근을 프로세스 경계로 격리한다"는 원칙만 취하고, 실제 구현은 검증된 도구(Vault, 1Password CLI/Agent, SOPS 등)로 하는 편이 현실적**이다.

## 연관 자료

- [[2026-07-13-grok-cli-wire-analysis-consent-and-trust-boundaries]] — key-amnesia가 구조적으로 막으려는 정확히 그 실패 사례(플레인텍스트 시크릿의 무단 유출)를 와이어 레벨에서 실증한 글.
- [[2026-07-25-hanwha-vision-github-token-firmware]] — 같은 "환경변수 = 주변 신뢰"의 실패가 공급망(빌드 파이프라인) 층에서 벌어진 대비 사례.

## 한 달 뒤 회고

- 2026-09-26 즈음: key-amnesia의 GitHub 스타·이슈 트래커를 다시 확인해 초기 채택이 늘었는지, macOS 지원이 정식화됐는지 점검.
- 유사 포지션의 도구(1Password Agent mode, Doppler, Vault Agent 등 기존 시크릿 관리 도구의 "에이전트 격리" 기능)가 같은 문제를 어떻게 풀고 있는지 비교해, key-amnesia의 차별점이 실질적인지 재평가.
- news.hada.io 접근이 가능해지면 hada 댓글의 실제 논지(특히 redaction 한계에 대한 지적이 있었는지)를 보강.
