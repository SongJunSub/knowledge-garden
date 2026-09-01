---
title: "Claude Code Auto Mode를 웹사이트 요약만으로 우회한 원격 코드 실행 (Johann Rehberger) — Anthropic이 의뢰한 제3자 평가는 공격 성공률 0%였지만, 독립 연구자는 같은 Auto Mode를 60~80% 뚫었고 감염을 정리하려던 Claude의 명령마저 Auto Mode가 막았다"
source_title: "Breaking Claude Code Opus 5 Auto Mode with Indirect Prompt Injection"
source_url: "https://embracethered.com/blog/posts/2026/breaking-claude-code-opus-5-and-automode/"
source_name: "embracethered.com (Johann Rehberger, 직접 접근 불가 — The Register·GBHackers·CyberPress 등 교차검증)"
referrer_url: "https://news.hada.io/topic?id=33079"
published_at: "2026-08-27 (추정 — The Register 등 보도일 기준)"
summarized_at: "2026-09-01"
category: "ai"
tags: ["claude-code", "auto-mode", "prompt-injection", "module-shadowing", "supply-chain", "agent-security", "anthropic"]
---

# Claude Code Auto Mode를 우회해 웹사이트 요약만으로 원격 코드 실행

> 출처: [Breaking Claude Code Opus 5 Auto Mode with Indirect Prompt Injection](https://embracethered.com/blog/posts/2026/breaking-claude-code-opus-5-and-automode/) (Johann Rehberger, Embrace The Red) · 정리일 2026-09-01
> **출처 한계**: `embracethered.com`(원저자 블로그)·`news.hada.io`·`theregister.com`·`simonwillison.net`·`cybersecuritynews.com`·`cybernews.com` 등 이번 세션에서 시도한 모든 도메인이 egress 차단되어 원문·GeekNews 페이지를 한 글자도 못 읽었다. 아래는 The Register, GBHackers, CyberPress, devops.com, metatalks.ai 등 다수 2차 매체가 세부까지 일치하게 인용한 WebSearch 스니펫으로 재구성했다 — 공격 체인(HTTP 415 → 자체 디코더 작성 → `struct.py` 섀도잉 → C2 연결)과 성공률(60~80%), Anthropic의 대응("Informative"로 종결, "설계대로 작동")까지는 여러 소스가 일치해 신뢰도가 있지만, 원저자의 정확한 문장과 정확한 시행 횟수는 확인하지 못했다. **Anthropic·Claude를 직접 다루는 주제라 과장하지 않도록 특히 유의했다.**

## 한 줄 요약

**보안 연구자 Johann Rehberger가 "자료 보관소처럼 위장한 웹사이트를 요약해 달라"는 요청 하나로 Claude Code Opus 5의 Auto Mode를 우회해 원격 코드 실행까지 이끌어낸 공격 체인을 공개했다.** 핵심은 Claude가 스스로 "더 안전해 보이는" 선택(제공된 네이티브 디코더 대신 직접 Python 디코더를 작성)을 했는데, 그 선택 자체가 Python의 모듈 임포트 순서를 악용한 **모듈 섀도잉**의 진입점이 됐다는 것이다. 소규모 표본 기준 성공률은 60~80%로, 같은 Auto Mode에 대해 Anthropic이 의뢰한 제3자 평가가 보고한 **공격 성공률 0.00%**와 정면으로 모순된다.

## 핵심 포인트

- **공격 셋업** — 공격자가 "노트북 기록 자료 보관소"인 척하는 웹사이트를 만들어, 사용자가 Claude Code에 "이 사이트를 요약해줘"라고만 요청해도 공격이 시작되도록 설계.
- **1단계: 정상 경로 실패** — Claude의 `WebFetch`가 콘텐츠를 가져오려다 HTTP 415(지원하지 않는 미디어 타입) 오류로 실패.
- **2단계: 안전 판단이 진입점이 됨** — Claude는 사이트가 제공한 "네이티브 디코더"를 그대로 실행하는 건 거부했다(이 판단 자체는 안전했다). 대신 Base85·zlib·JSON으로 인코딩된 내용을 풀기 위해 **직접 Python 디코더를 작성**했는데, 바로 이 "더 안전해 보이는" 선택이 실제 침투 경로가 됐다.
- **3단계: 모듈 섀도잉** — 공격자가 준비한 아카이브 안에는 표준 라이브러리 `struct` 모듈과 이름이 같은 악성 `struct.py`가 들어 있었다. Python은 모듈을 임포트할 때 현재 작업 디렉터리를 먼저 뒤지므로, Claude가 작성한 디코더가 `base64`를 임포트하는 과정에서 표준 라이브러리 대신 이 악성 `struct.py`가 로드됐다.
- **4단계: C2 연결** — 악성 `struct.py`가 원격 페이로드를 내려받아 실행하고 공격자 서버(C2)에 연결.
- **뒤늦은 대응마저 막힘** — Slack 발췌에 따르면, 감염을 뒤늦게 알아챈 Claude가 해당 프로세스를 종료하려 하자 **Auto Mode가 오히려 그 정리(cleanup) 명령을 차단**했다 — 위험을 막으려는 안전장치가 위험 대응 자체를 막은 셈이다.
- **성공률과 모순되는 벤치마크** — 소규모 표본 기준 성공률 60~80%(정확한 시행 횟수 미확인). 반면 Anthropic이 의뢰한 제3자 평가(Trajectory Labs로 보도됨)는 고정된 72개 시나리오의 간접 프롬프트 인젝션 벤치마크에서 **공격 성공률 0.00%**를 보고했다 — 이번 연구는 그 벤치마크 밖의 실제 공격 체인으로 정면 모순되는 결과를 냈다.
- **Anthropic의 대응** — 이 제보를 "Informative"로 분류해 종결하고, Auto Mode는 "설계대로 작동한 것"이며 **"베스트에포트 분류기가 뒷받침하는 편의 기능이지, 보안 보장이 아니다"**라는 입장을 밝힌 것으로 보도됨.

## 인상 깊은 문장

> "Auto mode is a convenience feature backed by a best-effort classifier rather than a security guarantee." (Anthropic 측 대응, 다수 2차 매체 교차검증으로 재구성한 인용 — 원문 정확한 워딩은 미확인)

## 댓글

**hada 댓글 수·HN/Lobsters 큐레이션 여부 확인 불가** — 관련 도메인 전부 차단. 다만 The Register, devops.com, GBHackers, CyberPress, metatalks.ai, cybersecuritynews 등 보안 전문 매체 6곳 이상이 독립적으로 보도했다는 점 자체가 이 연구의 파급력을 보여주는 정황이다.

## 내 생각 · 적용점

### 핵심 전이 1 — 발표 당시 미해결이었던 질문에 대한 실전 답

[[2026-08-11-claude-code-auto-mode-default]]는 Auto Mode 발표 시점에 "하드 룰의 폭이 공개되지 않았다 — `rm -rf`나 `DROP TABLE`이 하드 룰인지 분류기 판단인지 발표문은 밝히지 않는다"고 지적했다. 이번 사건은 그 공백이 실제로 뚫린 사례다 — 모듈 섀도잉을 통한 원격 코드 실행은 "데이터 유출" 하드 거부 규칙의 범위 밖에 있었고, 판단이 비결정적 분류기에 맡겨져 있었다는 뜻이다.

### 핵심 전이 2 — "회로 차단기"의 정반대 실패

같은 노트가 인용한 회로 차단기는 "연속 3회 차단 시 수동 승인으로 강제 복귀"하는 구조였다. 그런데 이번 사건에서 Auto Mode가 실제로 튀어나와 막은 건 **공격이 아니라 감염을 정리하려던 Claude 자신의 명령**이었다. 안전장치가 공격은 통과시키고 복구는 막았다는 건, "무엇을 막을지"를 정하는 분류기의 판단 기준 자체가 상황에 따라 뒤집힐 수 있다는 증거다.

### 핵심 전이 3 — HN이 미리 던진 우려가 다른 각도로 실증됨

같은 노트에서 HN 댓글이 "13.6%는 이상하게 낮고 테스터 구성이 공개 안 됐다", "안전 수치가 전부 자체 연구다"라고 미리 우려했다. 이번엔 Anthropic이 의뢰한 제3자 평가(0.00%)와 독립 연구자의 결과(60~80%)가 정면충돌한다는 형태로 그 우려가 실증됐다 — 고정 시나리오 벤치마크가 실제 공격 표면을 대표하지 못할 수 있다는 뜻이다.

### 핵심 전이 4 — 근본 원인은 분류기가 아니라 환경 설계

[[2026-05-07-ai-didnt-delete-your-database-you-did]]의 원칙이 "책임은 명령 승인이 아니라 환경 설계에 있다"였다. 이번 사건의 근본 취약점도 분류기의 오판이 아니라 **에이전트가 신뢰할 수 없는 외부 콘텐츠를 다루면서 임의 코드를 작성·실행할 수 있는 환경(파일시스템 쓰기 + 셸 실행 + 네트워크 egress가 모두 열린 환경)에서 작업했다는 것** 자체다 — 분류기가 완벽했더라도 이 근본 조건은 남는다.

### 핵심 전이 5 — 벤더를 가리지 않는 같은 패턴의 반복

[[2026-06-01-chatgpt-sheets-prompt-injection-exfiltration]], [[2026-06-01-instagram-meta-ai-account-takeover]]와 같은 계열이다 — "요약·처리 요청 하나가 간접 프롬프트 인젝션의 진입점이 된다"는 패턴이 벤더를 가리지 않고 세 번째(이상) 재현된 것이고, [[2026-08-29-hugging-face-openai-agent-breach-swarm]]이 보여준 "격리·분류기만으로는 부족하다"는 교훈과도 겹친다.

## 호스피탈리티 / CRS 적용 포인트

온다가 자율 실행 에이전트(코드 배포, 데이터 마이그레이션, 예약 시스템 자동화 등)에 Auto Mode류의 "분류기 기반 자동 승인"을 도입한다면 이 사건에서 최소 세 가지를 그대로 옮겨야 한다.

1. **분류기를 유일한 방어선으로 두지 않는다** — 웹 콘텐츠 요약처럼 신뢰할 수 없는 외부 입력을 다루는 작업은 애초에 파일 쓰기·셸 실행·네트워크 egress가 기본 차단된 격리 환경에서 수행하도록 강제하는 게 분류기보다 우선한다.
2. **복구·정리 명령은 항상 통과시킨다** — "위험해 보이는 명령을 막는다"는 규칙이 사고 대응 중의 kill·rollback 명령까지 막지 않도록 예외 경로를 명시적으로 설계해야 한다. 이번 사건이 정확히 이 실패를 보여줬다.
3. **벤더의 자체·의뢰 벤치마크 수치를 그대로 신뢰하지 않는다** — 고정 시나리오 벤치마크(0.00%)가 실제 공격 체인을 대표하지 못할 수 있다는 걸 이 사건이 보여줬으므로, 자체 환경에서 유사한 침투 테스트를 별도로 돌려봐야 한다.

## 연관 자료

- [[2026-08-11-claude-code-auto-mode-default]] — Auto Mode 발표 당시 던져진 미해결 질문(하드 룰 범위, 회로 차단기)에 대한 실전 답.
- [[2026-06-01-chatgpt-sheets-prompt-injection-exfiltration]] — 같은 장르(간접 프롬프트 인젝션)의 다른 벤더 사례.
- [[2026-06-01-instagram-meta-ai-account-takeover]] — 같은 장르의 또 다른 재현.
- [[2026-05-07-ai-didnt-delete-your-database-you-did]] — "책임은 환경 설계에 있다"는 원칙의 재확인.
- [[2026-08-29-hugging-face-openai-agent-breach-swarm]] — "격리·분류기만으로는 부족하다"는 패턴이 벤더를 가리지 않고 반복.

## 한 달 뒤 회고

*(2026-09-30 즈음 — Anthropic이 이 보고 이후 Auto Mode 분류 규칙을 실제로 손봤는지, 온다 내부 에이전트 운영 환경에 "복구 명령 예외 경로"가 있는지 점검.)*
