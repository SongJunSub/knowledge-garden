---
title: "Slack #개발-뉴스-dev-news 다이제스트 (2026-08-21) — 하네스·에이전트 협업·런타임/보안 15건"
source_name: "Slack #개발-뉴스-dev-news"
source_url: "https://ondainc.slack.com/archives/C0AJL0096H4"
published_at: "2026-08-21"
summarized_at: "2026-08-21"
category: "weekly"
tags: ["digest", "slack", "dev-news", "geeknews", "agentic-workflow", "runtime", "security"]
---

# Slack #개발-뉴스-dev-news 다이제스트 (2026-08-21)

> 출처: [#개발-뉴스-dev-news](https://ondainc.slack.com/archives/C0AJL0096H4) · 정리일 2026-08-21

자동 스케줄 루틴이 Slack `#개발-뉴스-dev-news` 채널(GeekNews 봇 + TechArticles 봇)에 그날 올라온 링크를 훑어 2~4문장으로 요약한 라이트 다이제스트. 개별 정독·전이·CRS 접점까지 붙이는 본가든의 `정리해줘` 파이프라인과는 다른, 가벼운 원문 링크 모음이다. 이 배치는 2026-08-21 KST 채널 게시분 15건 전체를 다룬다(이전 배치 기록이 없어 이번 실행을 기준선으로 삼음).

## AI 에이전트 / 하네스

- **[같은 LLM인데 왜 결과가 다를까? 답은 하네스에 있다](https://tech.hancom.com/harness-engineering/)** (한글과컴퓨터) — 에이전트 성능 차이는 모델 자체보다 프롬프트·컨텍스트·하네스 설계 층위에서 갈린다는 주장. AGENTS.md 같은 지시 문서로 실수를 점진적으로 보강하고, 에이전트가 움직이는 "무대" 전체를 설계해야 장기 실행 작업의 안정성이 나온다고 정리한다.
- **[우리팀에 새롭게 입사한 Kiro Crew를 활용하여 업무 생산성 올리기](https://aws.amazon.com/ko/blogs/tech/welcom-to-the-kiro-crew/)** (AWS) — 저장소 이슈 분류·PR 리뷰를 24시간 상주로 수행하는 자율 에이전트 Kiro Crew 도입기. UI와 에이전트 런타임 사이를 게이트웨이가 조율하고, 웹/CLI/Slack 등 여러 채널에서 맥락을 유지하며 사람 부재중에도 스케줄대로 작업한다.
- **[Claude Code Dynamic Workflow 쉽게 이해하기](http://devocean.sk.com/blog/techBoardDetail.do?id=168424&boardType=techBlog&isShared=Y)** (데보션/SK) — 반복·분기·병렬 같은 제어 흐름을 JS 코드로 고정해 에이전트의 즉흥 판단 오류를 줄이는 Dynamic Workflow 소개. `pipeline`/`parallel`로 서브에이전트를 조립하고, 스키마로 결과를 데이터화해 자동 검증까지 엮는다.
- **[대화를 지식으로 바꾸기: Slack이 인간-에이전트 팀을 만드는 방법](https://news.hada.io/topic?id=32712)** (Slack CPO Jaime DeLanghe) — AI가 공개 채널의 대화·결정·진행상황을 해석해 조직 지식으로 전환하는 흐름. Claude 기반 에이전트가 초안·요약·모니터링을 맡고 사람이 검토·결정하는 "순환형 핸드오프"가 협업의 기본 리듬이라 주장한다.
- **[AI 답변을 그대로 붙여넣지 마세요](https://news.hada.io/topic?id=32699)** — 질문자는 챗봇의 일반 답이 아니라 상대의 맥락·판단이 담긴 답을 원한다는 요지. AI는 초안 파트너로 쓰되 직접 읽고 자기 견해로 추려 전달해야 하며, 강한 의견이 없으면 그렇다고 정직하게 말해도 된다고 조언한다.

## 인수 / 비즈니스

- **[Stripe의 OpenRouter 인수, 결제 회사가 LLM 라우터를 산 이유](https://news.hada.io/article/openrouter-is-not-just-a-proxy)** — Bloomberg 추정 70억 달러+ 규모의 Stripe-OpenRouter 인수를 다룬 후속 분석 글. *같은 인수 건은 이미 [[2026-08-20-openrouter-joining-stripe]]에서 원문(OpenRouter 공식 블로그) 기준으로 깊게 정리했으므로 여기서는 링크만 남기고 중복 노트는 만들지 않는다.*

## 백엔드 / 검색 / 런타임

- **[일본어 상품 검색 정확도 높이기: Kuromoji → Sudachi](https://techblog.lycorp.co.jp/ko/japanese-search-kuromoji-to-sudachi)** (라인) — 오래된 사전·과도한 토큰 분해로 정확도가 낮았던 Kuromoji를 신조어·복합어 처리가 나은 Sudachi로 교체한 사례. 수동 사전 등록이 상품 도메인의 운영 한계였고, 분석기 교체로 검색 품질과 최신 용어 대응력을 함께 끌어올렸다.
- **[Bun 1.4 출시 — Zig에서 Rust로 재작성](https://news.hada.io/topic?id=32707)** — Node.js 테스트 1,517개 신규 통과·이슈 2,900개+ 수정, 유휴 CPU 5배·메모리 최대 35% 감소, Linux 시작 속도 50% 향상. Bun 본체를 Zig에서 Rust로 재작성한 첫 정식 릴리스이며 Claude Code·Prisma Compute가 이미 이 위에서 돌고 있다고 언급된다.
- **[GS Neotek의 Claude Code on Amazon Bedrock 도입기](https://aws.amazon.com/ko/blogs/tech/gsneotek-bedrock-budget-with-athena-and-iam/)** (AWS) — 별도 LLM Gateway 없이 Bedrock 로그를 집계해 사용자별 비용을 산출하고 예산 초과자를 준실시간 차단하는 경량 아키텍처. 상용 솔루션의 라이선스 비용과 오픈소스의 보안 취약점 관리 부담을 동시에 줄이려는 실용적 절충안이다.

## 보안 / 플랫폼

- **[AliExpress가 WebAudio 핑거프린팅으로 Bluetooth 멀티포인트 전환을 방해함](https://news.hada.io/topic?id=32706)** — 소리가 없는데도 알리익스프레스 페이지가 PC의 블루투스 오디오 경로를 계속 활성 상태로 유지시켜 멀티포인트 헤드폰 전환을 막는 현상 추적기. 원인은 `<audio>` 태그가 아니라 난독화된 스크립트가 숨겨진 `AudioContext`(Oscillator→Analyser→ScriptProcessor→Gain 0)를 돌려 핑거프린팅하는 부작용이었다.
- **[Google, 일부 소스 코드의 Git 태그 배포를 Google Drive 요청 방식으로 대체](https://news.hada.io/topic?id=32692)** — Git 태그 공개 대신 Google Forms 신청 후 Drive tarball 접근을 주는 방식으로 바뀌었고, GrapheneOS에 따르면 처리 기간이 시간 단위에서 주 단위로 늘었다는 지적. tarball엔 소스가 같아도 Git 구조·리비전이 없어 Android 개발 흐름이 불편해지며, GPLv2 위반 여부를 두고 공방이 있다.

## 사이드 프로젝트 / 문화

- **[프로그래머를 위한 음악 이론](https://news.hada.io/topic?id=32708)** — 악기를 못 다루는 개발자가 "왜 하필 그 음들인가"를 암기가 아니라 Web Audio API로 물리·산수부터 직접 유도해보는 글. 시간에 따라 변하는 숫자 하나에서 출발해 12음·음계·화음·코드 진행까지 의존성 없는 순수 JS로 브라우저에서 바로 들어볼 수 있게 구성했다.
- **[온디바이스에서 피아노를 자동 완성하는 1억 2,500만 매개변수 모델](https://news.hada.io/topic?id=32709)** — MIDI 연주를 실시간으로 이어가는 RollTab을 iPhone 15에서 초당 108개 음표로 구동. 음높이·시작 간격·길이·세기를 복합 토큰 하나로 묶어 Transformer를 음표당 1회만 실행하며, 데이터량 증대보다 피아노 중심 선별·중복 제거가 더 효과적이었다고 밝힌다.
- **[Kaneo - 필요한 것만 담은 오픈소스 프로젝트 관리 도구](https://news.hada.io/topic?id=32714)** — Jira/Linear 대체를 목표로 한 셀프호스팅 프로젝트 관리 툴. `drim` CLI로 HTTPS·DB·서비스 구성을 원클릭 배포하거나 Docker Compose로 컨테이너+PostgreSQL을 단일 구성한다.
- **[AI 시대, 개발자는 면사무소가 아니라 목욕탕을 만들어야 한다](https://news.hada.io/topic?id=32662)** — 건축가 정기용의 일화(주민이 원한 건 새 면사무소가 아니라 목욕탕)를 빌려, 공급자가 그럴듯하다고 판단한 해결책과 사용자의 삶을 들여다봐야 보이는 실제 문제를 대비한다. 개발자도 코드보다 제품을 쓸 사람의 삶을 먼저 봐야 한다는 취지.

## 한계

원문을 직접 WebFetch하지 않고 Slack 봇(TechArticles·GeekNews 봇)이 채널에 게시한 발췌 요약을 근거로 재구성했다 — 원문 전체 논지·댓글 반응·반박은 반영되지 않았을 수 있다. 다음 실행부터는 이 파일의 `summarized_at`을 기준선으로 그 이후 게시분만 다룬다.
