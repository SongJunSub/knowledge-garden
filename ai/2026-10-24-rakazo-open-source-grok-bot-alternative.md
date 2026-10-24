---
title: "Rakazo (elie222) — Grok Bot의 오픈소스 대체제, 내 PC·내 계정에서 역할별 AI 비서를 직접 운영한다"
source_title: "Rakazo"
source_url: "https://github.com/elie222/rakazo"
source_name: "GitHub, WebSearch 교차확인"
referrer_url: "https://news.hada.io/topic?id=35894"
published_at: "확인 불가"
summarized_at: "2026-10-24"
category: "ai"
tags: ["personal-agent", "open-source", "self-hosted", "grok-bot", "agent-memory"]
---

# Rakazo (elie222) — Grok Bot의 오픈소스 대체제, 내 PC·내 계정에서 역할별 AI 비서를 직접 운영한다

> 출처: [Rakazo](https://github.com/elie222/rakazo) (GitHub, elie222) · GeekNews(id=35894) 경유 · 정리일 2026-10-24
>
> **출처 한계**: `news.hada.io`는 egress 차단으로 WebFetch 실패. 대신 GitHub 저장소 README를 직접 WebFetch해 기능·라이선스·스타 수를 확인했고, WebSearch로 제작자 정보를 교차확인했다. Slack 발췌의 "이메일 정리·영업 조사·경비 처리 역할별 비서", "봇별 브라우저 프로필과 로그인 상태 유지", "정해진 일정에 반복 작업 실행" 항목은 README에서 직접 확인되지 않았다(README는 "루틴"이라는 일반 용어만 언급) — 마케팅 사이트나 별도 문서에 있을 가능성이 있지만 이번 세션에서는 미확인으로 남긴다. 제작자는 GitHub 계정 `elie222`(Inbox Zero 운영자로 추정되는 Elie Steinbock)로 보이나, 일부 3차 소스는 "Inbox Zero Inc."를 개발사로 적어 완전히 일치하지는 않는다.

## 한 줄 요약

**Rakazo는 "Grok Bot"처럼 대화를 이어가고 브라우저·터미널·파일·데스크톱을 조작하는 AI 비서를, 벤더에 종속되지 않고 자기 PC·자기 모델 키로 셀프 호스팅할 수 있게 만든 Apache-2.0 오픈소스 플랫폼이다.**

## 핵심 포인트

- **지속형 봇 — 매번 처음부터 설명하지 않는다.** 각 봇이 자체 대화·메모리·루틴·작업 기록을 유지한다. ***일회성 챗봇이 아니라 업무 맥락이 쌓이는 팀원***이라는 설계가 README에서도 확인된다.
- **실제 작업 환경을 조작한다.** 브라우저, 터미널, 파일, 그래픽 데스크톱에 접근해 사람이 하듯 도구를 직접 조작한다. Slack 발췌가 강조한 "실제 작업 수행"이 README의 작업 환경 접근 기능과 일치한다.
- **컴퓨터를 공유하거나 전용으로 분리할 수 있다.** 여러 봇이 함께 쓰는 "Team Computer"와 개인용 "Private Computer"를 둘 다 제공한다. Docker, E2B, Daytona 등 여러 샌드박스 백엔드를 지원한다.
- **다른 봇이나 임시 하위 에이전트에 위임 가능.** 봇이 작업을 다른 봇이나 단기 서브에이전트로 넘기는 구조를 README에서도 확인했다 — 이는 Grok Bot이 Cursor cloud agent를 만들고 검증까지 맡기는 운영 방식과 같은 방향이다.
- **모델·컴퓨팅 제공자를 직접 고른다.** Pi를 통해 자체 모델 키를 쓰거나 전체 스택을 로컬에서 실행할 수 있다. Composio, Pipedream Connect, MCP, OpenAPI로 외부 앱을 연동한다.
- **베타 단계, Apache 2.0 라이선스, 약 5.5k 스타(2026-10-24 기준 GitHub 페이지).** 활발히 성장 중인 프로젝트로 보이나 ***n=1 스냅샷***이라는 한계는 있다.

## 인상 깊은 문장

> "Rakazo is an open-source platform for running persistent AI teammates." (GitHub 저장소 설명, WebFetch로 확인)

## 댓글

**hada 댓글 수 확인 불가** (news.hada.io 차단). HN/Lobsters 큐레이션 여부도 확인 못했다. 짚을 한계: ①Slack 발췌의 역할별 비서(이메일·영업·경비) 구체 사례는 README 수준에서는 확인되지 않아 과장 가능성을 배제할 수 없다. ②"Grok Bot의 오픈소스 대체제"라는 포지셔닝 자체가 경쟁 벤더 제품을 기준점으로 홍보 효과를 노린 프레이밍일 수 있다는 점은 감안해야 한다.

## 내 생각 · 적용점

**핵심 전이 1 — [[2026-08-13-grok-bot-agent-teammate]]가 공개한 "지시만 하면 끝까지 수행하고 승인이 필요할 때 돌아오는 AI 팀원"이라는 Grok Bot 원형을, Rakazo는 벤더 종속 없이 직접 운영하는 쪽으로 복제한다.** 그 노트가 가장 반복적으로 지적한 공포("브라우저 인증 정보를 봇이 가져가 제어권을 넘겨받는 장면")는 Rakazo에서도 그대로 유효한 위험이다 — 셀프 호스팅이 신뢰 모델을 벤더에서 사용자 자신으로 옮길 뿐, 그 위험 자체를 없애지는 않는다.

**핵심 전이 2 — [[2026-09-02-grok-bot-spacexai-engineering-org]]가 보여준 "역할별 봇이 조직의 실제 업무를 나눠 맡는" 운영 패턴이 Rakazo의 Team Computer·작업 위임 구조와 정확히 겹친다.** 그 노트는 한 사람이 동시에 관리하는 에이전트가 15개에서 200개 이상으로 늘었다는 수치를 남겼는데, Rakazo처럼 누구나 셀프호스팅할 수 있는 도구가 생기면 이 "동시 관리 에이전트 수" 확장이 빅테크 바깥에서도 일어날 수 있다는 뜻이다.

## 호스피탈리티 / CRS 적용 포인트

**부분 적용 가능성 — 역할별 운영 에이전트 개념은 참고할 만하나, 자격증명·데이터 노출 리스크는 그대로 안고 간다.**

- CRS 운영에서 "영업 조사", "경비 처리"류의 반복 작업을 역할별 봇으로 나눠 각자 메모리를 유지하게 하는 구조는, 파트너 호텔·OTA 데이터를 다루는 내부 운영 스크립트에 적용해볼 여지가 있다.
- 다만 [[2026-08-13-grok-bot-agent-teammate]]가 경고한 자격증명 위험은 셀프호스팅이라고 사라지지 않는다 — 봇이 파트너 시스템에 로그인해 브라우저를 조작한다면, 그 로그인 세션·토큰 노출 범위를 반드시 먼저 설계해야 한다.
- B2B 환경에서는 "벤더 제공 에이전트"와 "셀프호스팅 오픈소스 에이전트" 중 어느 쪽이 데이터 주권 요구에 더 맞는지 검토할 때 참고 사례가 된다.

## 연관 자료

- [[2026-08-13-grok-bot-agent-teammate]] — Rakazo가 대체하려는 원형 제품, 같은 "지시 기반 AI 팀원" 설계와 자격증명 위험 경고.
- [[2026-09-02-grok-bot-spacexai-engineering-org]] — 역할별 봇이 조직 업무를 나눠 맡는 실제 운영 사례, Rakazo의 Team Computer·위임 구조와 겹침.
- [[2026-10-05-openmuse-open-source-personal-agent]] — 같은 장르(오픈소스·셀프호스팅 개인 에이전트)의 다른 프로젝트, 비교 참고.

## 한 달 뒤 회고

2026-11-24 즈음, news.hada.io 접근이 풀리면 원 토픽의 Slack 발췌에 있던 "이메일·영업·경비 역할별 비서" 구체 사례와 "봇별 브라우저 프로필" 기능이 실제 README/문서에 있는지 재확인. Rakazo의 스타 수·채택 추이도 함께 점검.
