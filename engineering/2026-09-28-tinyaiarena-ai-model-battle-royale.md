---
title: "TinyAIArena (hp6) — AI 모델 네 개를 8×8 격자에 던져놓고 마지막 생존자를 가리는 배틀로얄 관전 도구"
source_title: "Show HN: TinyAIArena – watch AI agents battle it out"
source_url: "https://tinyaiarena.com/"
source_name: "hp6 (GitHub · tinyaiarena.com, Show HN)"
referrer_url: "https://news.hada.io/topic?id=34390"
published_at: "2026-09-27 (Show HN 게시 기준, 추정)"
summarized_at: "2026-09-28"
category: "engineering"
tags: ["tinyaiarena", "llm-arena", "multi-agent-game", "openrouter", "elo-rating", "show-hn", "replay"]
---

# TinyAIArena — AI 모델 네 개를 8×8 격자에 던져놓고 마지막 생존자를 가리는 배틀로얄 관전 도구

> 출처: [Show HN: TinyAIArena – watch AI agents battle it out](https://news.ycombinator.com/item?id=49867775) (hp6, 개인 프로젝트) · GeekNews(id=34390) 경유 · 정리일 2026-09-28
>
> **출처 한계**: `news.hada.io`·`tinyaiarena.com`·`news.ycombinator.com`·GitHub 전부 이번 세션 egress 차단으로 직접 열람하지 못했다. WebSearch로 runtimewire.com 리뷰 기사와 HN 미러 다수를 교차확인해 재구성했다. HN 점수·댓글 수는 소스마다 105점/41댓글, 93점/40댓글로 엇갈려 정확한 숫자를 확정하지 못했다.

## 한 줄 요약

**서로 다른 AI 모델 네 개를 OpenRouter API로 붙여 8×8 격자에서 최후의 1인이 남을 때까지 턴제로 싸우게 하고, 그 과정을 리플레이·Elo 순위·전적으로 "관전 스포츠"처럼 포장한 1인 사이드 프로젝트 — 소스 공개, 정적 사이트로도 배포 가능.**

## 핵심 포인트

- **게임 규칙은 단순하고 명시적이다** — 매 라운드 참가자 4명이 무작위 순서로 한 턴씩 행동한다. 행동은 상하좌우 이동, 인접 적 공격(15~24 데미지), 대기 셋 중 하나이며 ***행동 하나당 행동력(AP) 1을 소모***한다. 격자에는 통행 불가 장애물 칸 4개가 무작위 배치된다.
- **금과 처치가 다음 턴의 행동력을 늘린다** — 금을 모으면 +1 AP, 상대를 처치하면 +1 AP에 더해 ***체력을 50 회복(오버힐 없음)***한다. 강한 모델이 눈덩이처럼 더 강해지는 구조라, 초반 판단 몇 번이 게임 전체를 좌우하기 쉽다.
- **전사들은 턴마다 최대 50자 채팅을 남기고, 그 메시지가 다음 판단의 입력이 된다** — 트래시토크·연합 제안·허세가 실제로 다른 모델의 프롬프트에 들어간다는 점이 이 프로젝트를 단순 미니게임 이상으로 만든다. 다만 이게 "모델의 전략적 사고"인지 "그럴듯한 텍스트 생성"인지는 리플레이를 직접 봐야 판단할 수 있는 영역이다.
- **관전을 위한 장치가 촘촘하다** — 모든 행동을 프레임 단위로 저장해 리플레이가 정확하고 서버 재시작에도 매치가 유지되며, 자동 재생과 한 프레임씩 넘겨보기를 모두 지원한다. 리더보드는 모델명·Elo·전적·승률·킬·가한/받은 데미지·평균 순위까지 집계한다.
- **소스 공개 + 셀프호스트/정적 배포 모두 가능** — GitHub(hp6/ai-arena)에 npm workspaces 모노레포(shared/server/client)로 공개돼 있고, 직접 매치를 돌리려면 OpenRouter API 키가 필요하다. 매치 기록을 JSON으로 export해 서버·API 키 노출 없이 순수 정적 사이트로 리플레이만 배포하는 것도 가능 — 실제 tinyaiarena.com 자체가 Cloudflare Pages 정적 배포로 추정된다.

## 인상 깊은 문장

> "TinyAIArena gives AI-agent battles the familiar trappings of a sport: a leaderboard, match history, replays and a set of controls for stepping through each frame." (runtimewire.com 리뷰 기사, WebSearch 재인용)

## 댓글

**hada 댓글 수 확인 불가**(원문 차단). HN Show HN 스레드는 존재가 확인되나 점수·댓글 수가 소스 간 105/41 대 93/40으로 불일치해 정확한 숫자는 특정하지 못했다 — 다만 두 수치 모두 "가벼운 화제성"보다는 "실제로 꽤 읽힌 Show HN" 규모다. runtimewire.com 리뷰가 지적한 핵심 한계도 정직하게 남겨야 한다: ***"이 장난감 게임에서 이기는 것은 일반적 추론 능력의 증거가 아니다"*** — 리더보드의 Elo·승률은 재미있는 관전 지표일 뿐, 모델 역량 벤치마크로 오독하면 안 된다.

## 내 생각 · 적용점

### 핵심 전이 — "관전 스포츠화"는 벤치마크가 아니라 벤치마크의 대중화 장치다

[[2026-08-16-one-prompt-eleven-models]]가 같은 프롬프트를 11개 모델에 돌려 크레딧 소모 폭을 비교했던 것과 달리, 이 프로젝트는 수치 비교표 대신 ***"관전 가능한 서사"***로 모델 차이를 체감시킨다. 둘 다 "모델 간 차이를 사람이 직관적으로 느끼게 만드는" 같은 문제의식의 다른 해법인데, TinyAIArena 쪽은 재미를 위해 벤치마크로서의 엄밀함을 의도적으로 포기했다 — 이 트레이드오프를 리뷰 기사가 정확히 짚었다는 점이 이 노트에서 가장 중요한 대목이다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 멀다 — 온다는 격자 전투 게임을 만들지 않는다. 다만 전이 가능한 원칙 하나는 남는다: **모델 비교 도구를 만들 때 "재미/직관성"과 "엄밀한 벤치마크"는 서로 다른 설계 목표이며 섞으면 안 된다.** CRS 내부에서 여러 LLM 벤더를 저울질할 때도, 이런 "관전용" 비교는 팀의 직관을 세우는 용도로만 쓰고 실제 벤더 선정은 별도의 엄밀한 태스크 기반 평가로 해야 한다.

## 연관 자료

- [[2026-08-16-one-prompt-eleven-models]] — 같은 문제의식(모델 간 차이 체감)의 다른 해법, 수치 비교표 대 관전형 게임

## 한 달 뒤 회고

*(2026-10-28 즈음 — GitHub 스타 수·추가 모델 지원·2인 이상 팀전 모드 등 프로젝트가 계속 유지보수되는지, 아니면 Show HN 반짝 화제로 끝났는지 확인.)*
