---
title: "나비에-스토크스 해법 발표의 이면 (Tristan Buckmaster) — '경력을 망치고 싶냐'는 압박과 Anthropic 소속 공동연구자를 저자에서 빼려 한 시도"
source_title: "Statement"
source_url: "https://cims.nyu.edu/~tristanb/statement.pdf"
source_name: "Tristan Buckmaster(NYU) 개인 성명 PDF · TechCrunch·Fortune·Unite.AI 등 교차보도"
referrer_url: "https://news.hada.io/topic?id=33379"
published_at: "2026-09-07"
summarized_at: "2026-09-09"
category: "ai"
tags: ["openai", "anthropic", "navier-stokes", "research-ethics", "authorship-dispute", "tristan-buckmaster", "levent-alpoge", "ai-for-math"]
---

# 나비에-스토크스 해법 발표의 이면 (Tristan Buckmaster)

> 출처: [Statement](https://cims.nyu.edu/~tristanb/statement.pdf) (Tristan Buckmaster, NYU) · GeekNews(id=33379) 경유 · 정리일 2026-09-09

> **출처 한계**: 성명 원문이 실린 `cims.nyu.edu`와 `news.hada.io` 모두 이번 세션 egress 차단으로 직접 열람하지 못했다. TechCrunch, Fortune, Unite.AI, officechai.com, latestincyber.substack.com 등 복수 매체가 성명 내용을 직접 인용·보도한 스니펫과, Buckmaster 본인의 Mastodon 게시물("Today, Levent Alpöge and I have made public three results…") 스니펫을 WebSearch로 교차 확인해 재구성했다. **당사자 양쪽 모두 이해관계가 크다**: Buckmaster·Alpöge는 밀레니엄 문제급 성과의 우선권과 학술적 공로가 걸려 있고, OpenAI(Bubeck)는 자사의 "최초 해결" 내러티브가 걸려 있다 — 아래 내용은 어느 쪽 말이 사실인지 판정하지 않고 양쪽 주장을 각각 출처를 밝혀 정리한다.

## 한 줄 요약

**NYU 수학자 Tristan Buckmaster가 Anthropic 소속 연구자 Levent Alpöge와 함께 강제 다공성매질·부시네스크·3D 비압축 오일러 방정식에서 매끄러운 외력 아래 유한시간 발산을 증명(Lean 형식화 포함)해 공개하면서, 그 직전 OpenAI 측(Sébastien Bubeck)과 있었던 협의 과정을 성명으로 공개했다 — Bubeck이 내부 모델의 100쪽짜리 나비에-스토크스 증명을 언급하며 "공동 발표" 또는 "Buckmaster 단독 발표(단, Alpöge는 Anthropic 소속이라는 이유로 저자에서 제외)" 중 하나를 택하라고 압박했고, 공개 의사를 밝히자 "경력을 망치고 싶냐"고 말했다고 주장한다. OpenAI·Bubeck·Sam Altman은 이 계정을 전면 부인한다.**

## 핵심 포인트

- **실제 증명 성과** — Buckmaster·Alpöge(+ IPM 논문은 Matei P. Coiculescu 공저)는 ① 2차원 토러스 위 강제 비압축 다공성매질 방정식, ② 2차원 부시네스크 시스템, ③ 3차원 비압축 오일러 방정식에서 ***매끄러운(시공간 모두 매끄러운) 외력 아래 유한시간 발산***을 증명했다고 밝혔다. 세 결과 모두 Lean으로 형식검증해 공개 저장소에 올렸다. **이는 나비에-스토크스 방정식 자체에 대한 증명은 아니다** — OpenAI가 주장하는 결과(강제 나비에-스토크스)와는 별개의, 관련된 방정식들에 대한 성과다.
- **협의 경위(Buckmaster 계정)** — 9월 3일, Anthropic이 큰 문제를 풀었다는 소문이 도는 가운데 Buckmaster는 OpenAI 소속 한 수학자에게 자신의 프로젝트가 "개인적이고 두 회사 어디에도 소속되지 않은 공동연구"임을 강조하며 알렸다. 사흘 뒤인 9월 6일 통화에서 Bubeck은 ***내부 모델이 이미 강제 나비에-스토크스에 대한 100쪽 분량의 증명을 만들었다***고 말했다고 한다 — 이는 Buckmaster에 따르면 "거의 아무도 시도하지 않던" 좁은 접근법과 같은 방향이었다.
- **두 가지 선택지 제시** — Bubeck은 (1) Buckmaster·Alpöge가 자신들의 부분 결과로 논문을 내고 OpenAI가 다음 날 "전체 해법"을 발표하는 공동 발표, 또는 (2) Buckmaster가 단독으로 발표하고 상금을 주장하되 OpenAI 모델도 문제를 풀었다고 명시하며 ***Alpöge를 저자에서 제외***하는 안 중 하나를 고르라고 했다고 주장한다. Alpöge를 제외하려 한 이유는 그의 Anthropic 소속이었다고 밝힘.
- **압박성 발언 주장** — Buckmaster가 공개 의사를 밝히자 Bubeck이 ***"경력을 망치고 싶은 거냐(Why would you ruin your career?)"***, ***"당신이 내가 친절하길 원하지 않는다면, 나도 친절할 필요 없다"***고 말했다고 주장한다.
- **데이터 접근 의혹** — Buckmaster의 핵심 우려 중 하나는, 공개 전 자신들의 비공개 Codex 세션 대화·초안이 OpenAI 연구자들에게 어떤 경로로든 노출됐을 가능성이다.
- **OpenAI 측 반박** — Bubeck은 이 계정을 "거짓이며 선동적(false and inflammatory)"이라 반박했고, 자신이 문자 메시지로 Buckmaster 팀에 먼저 발표할 선택지를 제안했다는 증거를 공개했다고 주장한다. OpenAI는 공식적으로 ***"우리(연구자와 에이전트 모두)는 그들이 공개적으로 발표하기 전까지 어떤 경로로도 그들의 작업을 보지 못했다 — 특히 이 문제를 풀기 위해 특정 사용자 데이터에 접근한 적이 없다"***고 밝혔다. Sam Altman도 이 계정을 부인한 것으로 보도된다.
- **Tao의 평가** — Terence Tao는 Buckmaster에게 직접 전화로 설명을 들은 뒤 이 성과를 "놀라운 성취(a remarkable achievement)"라 평가하며, 같은 방법을 나비에-스토크스까지 밀어붙이는 데 뚜렷한 장애물이 보이지 않는다고 말했다고 보도된다. 동시에 Tao는 이 사건 전체(소문에 뒤이은 대규모 AI 자원 투입, 약 2,250만 달러 규모 컴퓨팅 비용)를 자신이 우려하는 "미해결 문제의 비재생적 채굴"의 구체적 사례로 지목했다 — 이는 [[2026-09-09-tao-ai-mining-unsolved-math-problems]]에서 다룬다.

## 인상 깊은 문장

(WebSearch로 교차 확인된 각 매체의 재인용, Buckmaster 성명 원문 직접 열람은 못 함) "Why would you ruin your career?" / "If you don't want me to be nice, then I don't have to be nice." — Buckmaster가 전한 Bubeck의 발언.

(OpenAI 공식 반박 재인용) "We (the researchers and the agents) did not see any of their work through any means until they released it publicly — in particular, no specific user data was accessed in order to solve this problem."

## 댓글

hada(GeekNews) 댓글 수·논조는 news.hada.io 접근 차단으로 확인하지 못했다. **출처 한계**: 이 사건은 진행 중인 그(he-said/she-said) 분쟁이다 — Buckmaster의 성명은 원문(PDF)을 직접 확인하지 못한 채 그를 인용한 여러 매체(TechCrunch, Fortune, Unite.AI 등)의 재인용으로 재구성했고, OpenAI/Bubeck 측 반박도 마찬가지로 2차 보도에 의존했다. 양측 다 "문자 메시지 증거"를 언급하지만 그 원문 캡처를 이 노트가 직접 검증하지는 못했다. **정직하게 밝히면, 이 노트는 "무엇이 사실인가"를 판정하지 않고 "각 진영이 무엇을 주장했는가"만 정리한다.**

## 내 생각 · 적용점

### 핵심 전이 1 — 저자 자격(authorship) 분쟁은 "소속 회사"가 연구 성과를 오염시킬 수 있다는 신호

Alpöge를 Anthropic 소속이라는 이유만으로 저자에서 빼려 했다는 주장이 사실이라면, 이는 순수한 학술적 공로 판단이 아니라 ***"어느 회사의 AI가 풀었는가"라는 기업 간 경쟁 서사가 학술 저자 자격까지 침범한 사례***다. AI 기업들이 연구 성과를 마케팅 자산으로 삼기 시작하면, 공동연구·오픈사이언스의 관행 자체가 기업 경쟁 구도에 종속될 위험이 있다는 걸 보여준다.

### 핵심 전이 2 — "우리는 그들의 작업을 보지 못했다"는 부인과, 애초에 그 우려가 나온 맥락

OpenAI의 공식 부인 문구("we did not see any of their work through any means")는 정확하고 강한 부인처럼 보이지만, 애초에 이런 의혹이 나온 배경 자체 — 즉 OpenAI가 Buckmaster의 프로젝트 존재를 미리 알고 있었고, 같은 좁은 접근법(강제 나비에-스토크스)으로 같은 시기에 결과를 냈다는 사실 — 은 부인문으로 해소되지 않는다. [[2026-09-05-anthropic-fermat-last-theorem-lean]]처럼 자사 발표문을 볼 때 "회사의 공식 부인/설명"과 "그 부인이 실제로 반박하는 범위"를 구분해서 읽는 습관이 여기서도 유효하다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 멀다 — CRS 팀이 학술 저자 자격 분쟁을 겪을 일은 없다. 다만 전이 가능한 원칙: ***경쟁사·파트너사 소속 인력이 섞인 공동 프로젝트(예: 채널사·PMS 벤더와의 공동 개발)에서 "누구 소속이냐"가 성과 배분이나 공로 인정에 부당하게 개입하지 않도록 사전에 계약·크레딧 규칙을 명문화***해두는 게 이 사건이 주는 교훈이다 — 사후에 구두 합의 내용을 두고 다투는 상황 자체가 이번 분쟁의 핵심 패턴이기 때문이다.

## 연관 자료

- [[2026-09-09-openai-navier-stokes-proof]] — 이 분쟁의 배경이 된 OpenAI의 나비에-스토크스 해법 발표 본편
- [[2026-09-09-tao-ai-mining-unsolved-math-problems]] — Tao가 이 사건을 구체적 실례로 지목한 "미해결 문제의 비재생적 채굴" 비판
- [[2026-09-05-anthropic-fermat-last-theorem-lean]] — 같은 시기 Anthropic 쪽의 대규모 AI+Lean 수학 성과, 이번 분쟁의 배경 소문("Anthropic이 큰 문제를 풀었다")과 맞닿음

## 한 달 뒤 회고

*(2026-10-09 즈음 — Buckmaster·OpenAI 양측 주장 중 문자 메시지 등 제3자가 검증 가능한 증거가 공개됐는지, Alpöge의 저자 지위가 어떻게 정리됐는지, 이 분쟁이 AI 기업들의 학술 공동연구 관행에 실질적 변화(사전 공개 협약 등)를 가져왔는지 점검.)*
