---
title: "PS5 Linux 리드 TheFlow 하차 (Andy Nguyen) — 신뢰를 지킬 줄 모르는 'LLM 모더'들이 프로젝트의 존립 근거였던 익스플로잇을 소니에 팔아넘겼다"
source_title: "I am stepping away from the ps5 scene and stopping all my work on ps5 linux."
source_url: "https://x.com/theflow0/status/2099987019954831744"
source_name: "X (@theflow0, Andy Nguyen)"
referrer_url: "https://news.hada.io/topic?id=33792"
published_at: "2026-09-15"
summarized_at: "2026-09-17"
category: "ai"
tags: ["AI코딩", "vibe-coding", "오픈소스", "PS5", "해킹씬", "디스킬링", "메인테이너번아웃", "책임소재"]
---

# PS5 Linux 리드 TheFlow 하차 (Andy Nguyen)

> 출처: [Andy Nguyen(@theflow0) X 포스트](https://x.com/theflow0/status/2099987019954831744) (Andy Nguyen · X, 2026-09-15) · GeekNews [id=33792](https://news.hada.io/topic?id=33792) 경유 · 정리일 2026-09-17

**출처 한계 — 먼저 밝힘**: 이번 세션은 `news.hada.io`, `x.com`, `gamingonlinux.com`, `frvr.com`, `kotaku.com`, `itsfoss.com`, `news.ycombinator.com` 등 이 사건을 다룬 사실상 모든 도메인이 egress 프록시에서 차단됐다(WebFetch 시도 전부 `EGRESS_BLOCKED`). 그래서 **GeekNews 원문 페이지 자체를 한 번도 열지 못했고, hada 댓글 수·논조는 전혀 확인할 수 없다.** 아래 내용은 전부 WebSearch가 반환한 다수 매체(GamingOnLinux, Kotaku, ITsFoss, FRVR, Gadget Review, gtaboom 등)의 스니펫을 교차확인해 재구성한 것이다. 여러 매체가 동일한 인용문("a bunch of noobs using LLMs...", "slop kiddies", GTA VI 관련 발언)을 일관되게 보도하고 있어 **핵심 사실관계 자체의 신뢰도는 높다고 판단**하지만, 원문 X 포스트 전체 스레드나 hada 댓글의 뉘앙스는 검증하지 못한 채로 남긴다.

## 한 줄 요약

**PS5 Linux 프로젝트를 이끌던 보안 연구자 Andy Nguyen("TheFlow0")이 하차했다 — GTA VI 출시까지 비공개로 묻어두기로 "합의"했던 마지막 하이퍼바이저 취약점을, LLM을 활용해 독자적으로 같은 버그를 찾은 다른 모더들이 합의한 지 하루도 안 돼 소니 버그바운티(HackerOne)에 신고해버렸고, 이에 Nguyen은 "이 씬은 원래 실력 있는 연구자들의 모임이었는데 이제는 자기가 뭘 짜는지도 모르는 LLM 초보자들뿐"이라며 프로젝트 전체를 접었다.**

## 핵심 포인트

- **배경** — Nguyen은 PS5 "Phat" 모델을 완전한 Linux 머신(Ubuntu 24.04 데스크톱, Steam·에뮬레이터 구동)으로 바꾸는 PS5 Linux 프로젝트의 핵심 개발자였고, PS5 Pro 지원까지 마쳐 **2027년 정식 공개**를 계획하고 있었다.
- **묻어두기로 한 마지막 익스플로잇** — 그는 현재 펌웨어에서 여전히 살아있는 하이퍼바이저 버그 하나를 의도적으로 비공개로 유지했다. 목적은 ***GTA VI가 정식 출시될 때까지 익스플로잇을 살려둬서, 유저들이 게임을 합법 구매하면서도 여전히 Linux를 돌릴 수 있는 펌웨어 버전을 갖게 하려는 계산된 전략***이었다.
- **배신** — LLM 도구를 활용해 독자적으로 같은 취약점을 찾은 연구자(보도에 "Jordy"로 언급)들에게 대기를 요청했고 합의를 받아냈지만, ***"기다리겠다고 합의해놓고 하루도 지나지 않아 그걸 낭비하기로(=신고하기로) 했다"***며 실제로는 곧장 소니 버그바운티에 제출됐다.
- **하차 선언과 원색적 표현** — Nguyen은 X에서 "*이 씬은 원래 실력 있는 연구자들의 모임이었는데, 지금은 그냥 LLM을 쓰면서 자기가 뭘 짜는지도 모르는 초보자들뿐(***"just a bunch of noobs using LLMs and writing hacks they don't even understand"***)이다"라고 썼고, 신고자들을 ***"slop kiddies"***라 칭했다. PS5 Pro Linux 지원과 2027년 공개 계획은 그대로 폐기됐다.
- **같은 시기 RPCS3의 선례** — 이 사건은 진공 상태에서 나온 게 아니다. PS3 에뮬레이터 RPCS3는 이보다 몇 달 앞선 5월 9일, "AI 슬롭 코드 PR 제출을 멈춰라. 이제부턴 (AI 사용 여부를) 밝히지 않고 제출하는 사람은 밴한다"는 공지를 냈다 — ***"직접 디버깅하고 코딩하는 법을 배워라, 이해도 못 하고 작동도 안 하는 슬롭을 만드는 대신"*** 이라는 표현까지 거의 동일하다. **"오해 못 하는 코드를 짜는 LLM 초보자"라는 불만이 이번 시즌 PS 진영 해킹 커뮤니티에서 반복되는 패턴**이라는 뜻이다. → [[2026-08-28-sourcehut-bans-llm-generated-content]]
- **HN 큐레이션 흔적** — WebSearch에서 "PS5 Linux lead quits: 'a bunch of noobs using LLMs' that 'they don't understand' | Hacker News" 제목의 HN 스레드(`news.ycombinator.com/item?id=49727627`)가 잡혔다. **다만 `news.ycombinator.com` 자체가 이 세션에서 차단돼 포인트·댓글 수·논조는 전혀 확인하지 못했다** — 존재만 URL로 확인.

## 인상 깊은 문장

> "I asked them to at least wait for GTA 6 to come out so that people would have the opportunity to legally purchase the game and also enjoy Linux. They agreed to wait, but not a day passed, and they decided to waste it instead." — Andy Nguyen

> "[The scene] used to be a group of highly talented researchers, but now it is just a bunch of noobs using LLMs and writing hacks they don't even understand." — Andy Nguyen (X, 다수 매체가 동일하게 인용)

## 댓글

**hada 댓글 수·논조는 확인 불가**(위 출처 한계 참고). HN에 관련 스레드가 존재하는 것은 확인했으나 포인트·댓글 수·논조는 접근 차단으로 검증 못 함. **이 노트는 사실상 단일 발화자(Nguyen 한 명의 X 포스트 + 격앙된 표현)에서 출발한 n=1 사건**이라는 점을 분명히 해둔다 — "LLM 초보자들뿐"이라는 진단은 통계나 코드 감사가 아니라 **당사자 개인의 분노 섞인 주관적 평가**다. 다만 같은 시즌 RPCS3가 거의 동일한 불만("이해 못하는 슬롭")을 공식 공지로 냈다는 점에서, 최소한 **PS 에뮬/모딩 커뮤니티 내 복수 메인테이너가 독립적으로 같은 패턴을 지적하고 있다**는 정황 증거는 있다. Nguyen 본인이 "합의를 어긴 상대"에 대한 감정적 대응(원색적 표현, GTA6 언급의 다소 기이한 상업적 계산)을 하고 있다는 점도 감안해야 한다 — 이 사건은 "AI 코드 품질 비판"이라기보다 **"신뢰를 배신당한 인간관계 드라마"에 LLM이 방아쇠 역할을 한 사례**에 더 가깝다.

## 내 생각 · 적용점

### 핵심 전이 1 — 이 글은 가든의 "AI 비판 시리즈"에 곧이곧대로 편입시키기엔 결이 다르다
[[2026-05-05-agentic-coding-is-a-trap]]이나 [[2026-08-28-sourcehut-bans-llm-generated-content]]는 논거를 갖춘 비판·정책 문서였다. 이 사건은 **감정적 폭로에 가깝다** — Nguyen의 분노 대부분은 "LLM 코드 품질"이 아니라 "약속을 어긴 배신"을 향해 있고, "노봅들이 LLM 쓴다"는 진단은 그 분노에 곁들여진 부차적 일반화에 더 가깝다. 가든의 "채택 옹호 6 vs 회의론 1 비율 보정" 실험 맥락에서 보면, **이 글을 "회의론" 쪽 증거로 무게 있게 세는 건 과대평가**다. 그보다는 **[[2026-08-25-ai-dependence-eroding-coding-expertise-growth-path]]의 디스킬링 연구가 실제 커뮤니티 갈등으로 터진 n=1 일화** 정도로 읽는 게 정직하다.

### 핵심 전이 2 — "이해 못 하는 코드"는 이 가든이 이미 연구로 추적한 현상의 실사례
[[2026-08-25-ai-dependence-eroding-coding-expertise-growth-path]]는 "강한 AI 지원을 받은 초보자는 계획 단계를 건너뛰고 실력에 대한 착각에 빠진다"는 UPenn발(원문 미확인) 연구를 다뤘다. Nguyen이 묘사하는 "자기가 뭘 짜는지도 모르는 채로 하이퍼바이저 익스플로잇을 찾아낸 모더들"은 **그 연구가 예측한 정확한 실패 양상**이다 — 다만 하이퍼바이저 익스플로잇처럼 도메인 난이도가 극단적으로 높은 영역이라 "이해 없이도 결과물은 나온다"는 게 더 놀랍기도 하다(그만큼 LLM의 검색·패턴매칭 능력이 세졌다는 반증이기도 하다).

### 핵심 전이 3 — RPCS3와 나란히 놓으면 "메인테이너 번아웃"이라는 실무적 축이 보인다
[[2026-08-28-sourcehut-bans-llm-generated-content]] 노트에서 정리했듯, 이번 시즌 오픈소스 AI 정책들은 저작권 임계값·정체성·소송 리스크·정치윤리 등 서로 다른 동기로 갈렸다. 이 사건과 RPCS3 사례는 그 목록에 **다섯 번째 동기 — "메인테이너가 이해 못하는 코드에 지쳐서" 라는 순수하게 실무적인 소진**을 추가한다. SourceHut처럼 약관으로 명문화하기 전 단계, 즉 **개인이 참다못해 프로젝트를 버리는 형태의 초기 신호**로 읽을 수 있다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 제한적이다 — 온다는 오픈소스 모딩 커뮤니티가 아니고, CRS는 외부 기여자의 PR을 받는 구조도 아니다. 그럼에도 이 사건이 던지는 시사점은 구체적이다.

- **"작성자도 이해 못하는 코드가 머지된다"는 리스크는 CRS 같은 미션 크리티컬 시스템에서 훨씬 위험하다.** PS5 익스플로잇은 실패하면 "씬이 시끄러워지는" 수준이지만, CRS의 결제·객실 인벤토리·권한 로직에서 같은 일이 벌어지면 **환불 오류, 오버부킹, 권한 우회**로 직결된다. [[2026-05-07-vibe-coding-agentic-engineering-converging]]에서 짚은 "경계 조건/보안 영역엔 강제 라인 단위 리뷰" 원칙이 여기서도 그대로 유효하다.
- **RPCS3의 "AI 사용 범위를 PR 설명에 명시하라"는 정책은 CRS 코드 리뷰 관행에 그대로 가져올 만하다.** "이 PR의 어느 부분이 AI 생성이고, 어떤 테스트·리뷰를 거쳤는지"를 강제 항목으로 두는 것 — 이미 [[2026-05-07-vibe-coding-agentic-engineering-converging]]에서 "vibe/hybrid/agentic 3단계 메타데이터" 액션으로 제안했던 것과 동일한 결론에 다른 경로로 다시 도달한다.
- **신뢰는 있어도 책임은 없다는 비대칭**이 이 사건에도 있다 — Nguyen이 신뢰했던 대상(합의한 모더들)이 저버린 건 인간 대 인간의 신뢰였지만, 그 배신을 가능하게 한 "본인도 이해 못 하는 버그를 LLM으로 찾아낸" 역량은 AI가 제공했다. CRS 개발에서도 "AI가 찾아낸 취약점/버그를 누가, 어떤 책임 하에 보고·머지하는가"를 명확히 해두지 않으면 유사한 책임 공백이 생길 수 있다.

## 연관 자료
- [[2026-08-28-sourcehut-bans-llm-generated-content]] — 같은 시즌 오픈소스 AI 정책 계열, RPCS3 사례와 함께 "메인테이너 번아웃"이라는 다섯 번째 동기를 보여줌
- [[2026-08-25-ai-dependence-eroding-coding-expertise-growth-path]] — "이해 못 하는 코드"의 배경이 되는 디스킬링 연구, 이 사건은 그 연구의 실사례
- [[2026-05-05-agentic-coding-is-a-trap]] — 가든의 "채택 옹호 vs 회의론 비율 보정" 실험, 이 글은 그 저울에 가볍게만 얹혀야 하는 이유를 본문에서 설명
- [[2026-05-07-vibe-coding-agentic-engineering-converging]] — vibe coding과 agentic engineering의 정의, "책임 없는 신뢰"라는 개념이 이 사건의 CRS 적용점과 직결

## 한 달 뒤 회고
- (2026-10-17 즈음) PS5 Linux 프로젝트가 실제로 다른 메인테이너에게 인수됐는지, 아니면 방치됐는지 확인.
- (2026-10-17 즈음) RPCS3에 이어 다른 PS 진영 프로젝트가 유사한 "AI 사용 명시" 정책을 도입했는지, 이 사건이 그 흐름에 영향을 줬는지 가볍게 점검.
