---
title: "Claude Code·Codex·Cursor는 같은 제품을 42%만 고른다 (Armature) — 벤더 인지도가 아니라 코드베이스 언어가 도구 선택을 좌우한다"
source_title: "Which tools do Claude Code, Codex and Cursor choose? We measured 16,893 sessions to find out."
source_url: "https://armature.tech/blog/which-tools-coding-agents-install"
source_name: "armature.tech (Armature)"
referrer_url: "https://news.hada.io/topic?id=33247"
published_at: "2026-09-03"
summarized_at: "2026-09-05"
category: "ai"
tags: ["claude-code", "codex", "cursor", "tool-choice", "benchmark-methodology", "vendor-selection", "agentic-coding"]
---
# Claude Code·Codex·Cursor는 같은 제품을 42%만 고른다 (Armature) — 벤더 인지도가 아니라 코드베이스 언어가 도구 선택을 좌우한다

> 출처: [Which tools do Claude Code, Codex and Cursor choose? We measured 16,893 sessions to find out.](https://armature.tech/blog/which-tools-coding-agents-install) (Armature) · 정리일 2026-09-05

## 한 줄 요약
**"결제 붙여줘, 이메일 보내는 기능 넣어줘" 같은 같은 요구를 세 코딩 에이전트에 반복시켰더니, 어떤 서드파티 서비스를 실제로 설치하는지가 에이전트마다 갈렸다 — 세 에이전트가 같은 제품을 고른 비율은 42%뿐이었고, 그 이유는 브랜드 선호가 아니라 ***코드베이스의 언어·맥락***이었다.**

## 핵심 포인트
- **방법론** — 75개 저장소(10개 프로그래밍 언어) · 1,163개 프롬프트 변형에 걸쳐 Claude Code·Codex·Cursor를 실행, 16,893회 세션 중 51개 코드베이스·18개 분야의 유효 세션 5,292개를 1차 분석했다.
- **일치율 42%** — 결제·DB·이메일·파일 저장 같은 같은 종류의 요구에도 세 에이전트가 ***같은 벤더를 고르는 경우는 절반이 안 된다***. 결제는 Stripe가 10건 중 9건을 가져가 예외적으로 쏠렸지만, 이메일·DB 등 다른 카테고리는 훨씬 고르게 흩어졌다.
- **언어가 승자를 가른다** — 같은 "이메일 서비스 붙여줘"라는 요구인데도 ***TypeScript는 Resend, Python은 SendGrid, Go는 Postmark, Java는 Azure ACS***로 승자가 갈렸다. 벤더의 절대적 우위가 아니라 **에이전트가 학습한 언어별 생태계 관행(그 언어 커뮤니티에서 흔히 쓰는 SDK·문서 품질)**이 선택을 좌우한다는 뜻이다.
- **정보 탐색 방식 자체가 다르다** — Codex는 세션의 94%에서 웹 검색을 수행하고, Cursor는 약 3분의 2, ***Claude Code는 약 30%만 검색하고 나머지는 이미 아는 지식에 의존***한다. 같은 질문에 다른 방법론으로 접근하는 셈이라 결과가 갈리는 것도 자연스럽다.
- **Claude Code의 자체 구현 비율이 유독 높다** — Claude Code는 외부 서비스를 붙이는 대신 ***자체 구현(in-house)을 택하는 비율이 19%로, Codex·Cursor의 약 10%보다 거의 두 배***다. 서드파티 의존을 줄이는 방향의 편향인지, 단순히 학습된 코드 패턴의 차이인지는 이 글만으로 단정하기 어렵다.
- **인지도와 채택은 다른 축** — 유명 제품이 후보로 자주 거론돼도 실제 설치로 이어지지는 않는다는 관찰이 나온다 — **"언급되는 것"과 "선택되는 것" 사이에 별도의 필터가 있다는 뜻**.
- **이해관계 고지가 필요한 지점** — Armature는 "코딩 에이전트에게 자사 제품이 선택되도록 돕는" B2B 서비스를 파는 YC 스타트업이다. 이 연구 자체가 **그 서비스의 존재 근거(에이전트가 어떤 기준으로 벤더를 고르는지 알아야 그 선택에 개입할 수 있다)를 입증하는 마케팅 콘텐츠**이기도 하다.

## 인상 깊은 문장
> "Claude Code, Codex and Cursor land on the same tool in only 42% of runs, and they get there differently: Codex searches the web in 94% of sessions, Cursor in roughly two-thirds, and Claude Code in about 30%, leaning instead on what it already knows."

> "Resend and Postmark lead email at 35.6% and 27.4%" — 그런데 언어별로 쪼개면 TypeScript는 Resend, Python은 SendGrid, Go는 Postmark, Java는 Azure ACS로 승자가 또 갈린다.

## 댓글
이 글은 news.hada.io 원문·hada 댓글에 이 세션에서 접근하지 못했다(도메인 egress 차단). Hacker News에 "Which tools do Claude, Codex and Cursor choose? We measured 17k runs to find out"라는 제목으로 올라와 논의된 정황은 WebSearch로 확인했으나, 정확한 포인트 수·댓글 내용은 확인하지 못했다. **출처 한계**: 1차 자료(armature.tech)도 이 세션 네트워크 정책상 직접 열람하지 못했고, 이 노트의 수치·인용은 전부 WebSearch로 얻은 스니펫·2차 요약(ai-tldr.dev, programming.dev, cctest.ai 교차 확인)을 종합 재구성한 것이다 — 원문 그래프·전체 방법론 각주는 확인하지 못했다. **이해관계**: Armature는 이 연구의 결론("에이전트가 무엇을 고르는지는 조작 가능한 변수다")이 자사 제품 수요와 정확히 일치하는 회사다 — 수치를 버릴 이유는 아니지만 프레이밍에는 판매 동기가 섞여 있다고 보는 게 정직하다.

## 내 생각 · 적용점

### 핵심 전이 1 — "위험도로 도구를 고르라"는 조언에 "어떤 도구든 골라도 편향돼 있다"는 실측이 덧붙는다

[[2026-08-02-opinionated-guide-which-ai-to-use]]에서 정리한 Ethan Mollick의 조언은 **"고위험엔 최고 모델, 저위험엔 무료 모델"**이라는 위험도 축이었다. 이 글은 다른 축을 보여준다 — **같은 에이전트에게 같은 요구를 시켜도, 코드베이스의 언어·맥락에 따라 완전히 다른 서드파티가 선택된다**는 것. 즉 "어떤 에이전트를 쓸까"뿐 아니라 "그 에이전트가 이 언어·이 맥락에서 무엇을 고르는 경향이 있는가"까지 알아야 위임의 결과를 예측할 수 있다. Mollick의 조언이 **"누구에게 맡길까"**를 다뤘다면, 이 글은 **"맡긴 뒤 그가 무엇을 고를지는 나도 통제 못 한다"**는 사실을 실측으로 보여준다.

### 핵심 전이 2 — Claude→Codex 이주 경험담(n=1 체감)과 이 글(n=5,292 실측)이 같은 질문에 다른 근거 강도로 답한다

[[2026-05-17-claude-to-codex-migration-reddit]]는 사용자 한 명이 "Codex가 완료 보고를 더 정직하게 한다"고 느낀 1차 체감 보고였다. 이 글은 그 질문("Claude Code와 Codex가 실제로 다르게 행동하는가")에 **훨씬 큰 표본과 정량 지표(웹 검색 비율 94% vs 30%, 자체구현 비율 19% vs 10%)로 답한다.** 흥미로운 점은 두 자료가 가리키는 방향이 겹친다는 것이다 — **Claude Code는 상대적으로 "이미 아는 것에 의존"하고 "자체 구현을 선호"하는 성향**이 실측으로도 나온다. Reddit 글의 "Claude가 더 자기주도적/과신하는 경향"이라는 주관적 인상이, 이 글의 "검색을 덜 하고 자체 구현을 더 한다"는 행동 지표와 결이 통한다 — 다만 이건 **정황적 일치일 뿐 같은 원인을 증명한 것은 아니다.**

### 핵심 전이 3 — "같은 프롬프트, 다른 결과"라는 방법론이 이번에도 반복된다, 그리고 같은 함정도 반복된다

[[2026-08-16-one-prompt-eleven-models]]는 같은 프롬프트를 11개 모델에 3회씩 돌려 크레딧 소모의 변동폭(같은 모델 안에서도 249~1,055)이 평균보다 더 중요하다는 걸 보여줬다. 이 글도 같은 방법론 계열(같은 요구를 반복 실행해 분포를 본다)이다. 그 노트에서 세운 원칙 — **"단일 실행 벤치마크는 통계적 타당성이 없다"** — 을 이 글에 그대로 적용하면, **1,163개 프롬프트 변형·5,292 세션이라는 표본 크기 자체는 이전 사례보다 훨씬 크고 신뢰할 만하다**는 게 이 연구의 강점이다. 다만 "51개 코드베이스"라는 표본이 실제 프로덕션 코드베이스의 분포를 대표하는지는 이 글만으로 검증할 수 없다.

## 호스피탈리티 / CRS 적용 포인트
- **가장 직접적인 시사점은 "AI가 고른 서드파티를 그대로 신뢰하지 않는다"는 원칙이다.** CRS/PMS 개발에서 에이전트에게 "결제 붙여줘, 알림 서비스 붙여줘" 같은 위임을 할 때, 에이전트가 고른 벤더가 **팀의 기존 계약·데이터 레지던시·감사 요구사항과 맞는지**를 반드시 확인하는 게이트가 필요하다 — 이 글의 데이터가 그 게이트의 근거다(선택이 42%만 일치할 만큼 변덕스럽다).
- **언어별 스택이 다르면 같은 요구에도 다른 벤더가 나온다는 사실은, 멀티레포·폴리글랏 환경에서 "일관된 벤더 정책"을 코딩 에이전트에게 맡기면 안 된다는 뜻이다.** 벤더 선택은 CLAUDE.md 같은 규칙 파일에 명시적으로 고정해두는 편이 안전하다.

## 연관 자료
- [[2026-08-02-opinionated-guide-which-ai-to-use]] — 위험도 기반 도구 선택 원칙과, 이 글의 "선택 자체의 변덕" 실측이 다른 축에서 만난다
- [[2026-05-17-claude-to-codex-migration-reddit]] — n=1 체감 보고와 n=5,292 실측이 같은 질문("Claude가 Codex와 다르게 행동하는가")에 다른 근거 강도로 답한다
- [[2026-08-16-one-prompt-eleven-models]] — "같은 프롬프트, 다른 결과"라는 같은 방법론 계열, 표본 크기의 중요성이라는 교훈도 공유

## 한 달 뒤 회고
*(2026-10-05 즈음 — CRS/PMS 개발에서 에이전트에게 서드파티 연동을 위임할 때 벤더 선택을 검증하는 게이트를 실제로 뒀는지, 이 연구의 42% 일치율이 우리 팀의 실제 사용 경험과도 맞는지 점검.)*
