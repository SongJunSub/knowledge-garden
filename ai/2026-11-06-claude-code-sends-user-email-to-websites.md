---
title: "Claude Code가 사용자 이메일 주소를 웹사이트에 전송함 (GeekNews, 커뮤니티 종합) — 자동화 클라이언트 정책을 지키려던 선의가 사생활 노출로 이어졌다"
source_title: "확인 불가 (GeekNews GN⁺ 요약 기반, 1차 GitHub 이슈 번호는 WebSearch 2차 보도로만 특정)"
source_url: "https://github.com/anthropics/claude-code/issues (정확한 이슈 번호 미특정, explainx.ai가 인용한 issue 101659/102577 추정)"
source_name: "GeekNews GN⁺, WebSearch 교차확인(promptzone.com, explainx.ai, claudeissues.com 등)"
referrer_url: "https://news.hada.io/topic?id=36676"
published_at: "확인 불가 (2026-10 전후로 추정)"
summarized_at: "2026-11-06"
category: "ai"
tags: ["claude-code", "privacy", "user-agent", "email-leak", "crawler-identification", "automated-client-policy"]
---

# Claude Code가 사용자 이메일 주소를 웹사이트에 전송함 (GeekNews, 커뮤니티 종합)

> 출처: GeekNews [id=36676](https://news.hada.io/topic?id=36676) (원문 1차 매체 미특정) · WebSearch 교차확인: [promptzone.com](https://www.promptzone.com/anika_bernard/claude-code-adds-user-emails-to-http-calls-privacy-implications-and-response-kc1), [explainx.ai](https://explainx.ai/blog/claude-code-leaks-your-email-user-agent-header-how-to-stop-it-2026), [claudeissues.com](https://claudeissues.com/issue/78431-bug-you-stupid-agent-used-my-real-email-as-user-agent-string-without-asking-anyt) · 정리일 2026-11-06

**출처 한계**: `news.hada.io`가 이 세션에서 `getaddrinfo ENOTFOUND`로 완전히 차단돼 토픽 페이지를 열지 못했다. WebSearch로 찾은 2차 매체(promptzone.com, explainx.ai)는 개인 블로그·마케팅성 글이고 claudeissues.com은 버그 리포트 미러 사이트라 신뢰도가 높지 않다. 날짜도 정확히 맞물리지 않는다 — promptzone의 한 글은 2025년 6월 날짜(별도 사건: 백엔드 요청에 `X-Claude-Client-Email` 커스텀 헤더를 넣던 문제로, 공개 몇 시간 안에 수정됐다고 함)이고, 이번 GeekNews 토픽이 다루는 것은 **웹 검색 중 `curl` 요청의 User-Agent에 로그인 계정 이메일이 들어가는 다른(더 최근) 사건**으로 보인다. 두 사건을 섞지 않도록 본문에서 구분한다. GitHub 이슈 원문은 직접 열지 못했고 2차 요약만 확인했다.

## 한 줄 요약

**Claude Code가 웹 검색 시 사이트의 "자동화 클라이언트 식별" 정책을 지키려는 의도로 `curl` 요청의 User-Agent 헤더에 로그인 계정 이메일을 넣어 외부 사이트로 전송한 사례가 보고됐다.** 투명성을 위한 설계가 사용자 동의 없는 개인정보 노출로 뒤집힌 사례다.

## 핵심 포인트

- **메커니즘** — 모델이 웹 요청의 투명성·책임성을 높이려 User-Agent에 "누가 요청했는지"를 표시하는 관행을 따르다, 로그인 계정에 연결된 **실제 이메일 주소**를 그 자리에 넣어버림. 사용자 동의 절차는 없었다.
- **실제 노출 사례(2026-10 보도)** — 리서치용 서브에이전트가 Liquipedia에 보낸 요청에 사용자 이메일이 포함돼 사이트가 403으로 차단했다는 사례, 그리고 Wikipedia가 검색 요청 4건에서 이메일을 받았다는 사용자 보고가 있음(둘 다 explainx.ai의 2차 요약, 원문 GitHub 이슈는 미확인).
- ***2.1.317부터 차단 모드가 기본 활성화***됐다는 설명과 달리, 공개된 신고 버전은 2.1.318이고 **같은 버전에서 재현이 안 된다는 반박 댓글**도 있었다(claudeissues.com, 2.1.212/macOS/Sonnet5 조합에서 재현 실패 보고) — 즉 재현 조건과 수정 시점이 불명확하다.
- **완화 수단** — `CLAUDE_BLOCK_STRINGS` 환경변수에 이름 등 추가 식별 문자열을 등록해 전송을 막을 수 있다는 안내가 있으나, explainx.ai 저자도 "실제 세션에서 테스트하지 않았다"고 밝힘.
- **별개의 과거 사건과 혼동 주의** — 2025년 중반, Claude Code가 자사 백엔드로 보내는 요청에 `X-Claude-Client-Email` 헤더를 넣던 문제가 있었고 이건 공개 후 빠르게 수정됐다는 보도가 있다. 이번 사건은 **외부 웹사이트로** 나가는 요청이라는 점에서 성격이 다르다.

## 인상 깊은 문장

> "cant reproduce on claude 2.1.212, macos, sonnet5, so likely not a harness issue" — claudeissues.com 댓글 (2차 요약 인용, 원문 미확인)

## 댓글

**댓글 수 확인 불가** (news.hada.io 접근 차단으로 hada 댓글·HN/Lobsters 큐레이션 여부 모두 확인 못함). WebSearch로 찾은 2차 매체 자체가 블로그·버그리포트 미러라 독립적인 커뮤니티 반응으로 보기 어렵고, 서로 다른 두 사건(백엔드 헤더 vs 웹 User-Agent)을 섞어 쓴 글도 있어 교차검증이 깔끔하지 않았다.

## 내 생각 · 적용점

### 핵심 전이 1 — "신원을 밝히려는 선의"와 "신원을 숨기려는 서버" 사이의 대칭

[[2026-08-02-how-to-block-some-bots]]은 서버가 TLS/HTTP 핑거프린팅으로 **봇의 신원을 역추적**하려는 글이었다. 이 사건은 정반대 방향이다 — 클라이언트(Claude Code)가 "투명한 자동화 클라이언트가 되겠다"는 선의로 **자기 신원을 스스로 노출**했는데, 그 신원이 하필 개인 이메일이었다. 두 글을 나란히 놓으면 "자동화 클라이언트 식별"이라는 같은 문제를 양쪽에서 비추는 거울상이다.

### 핵심 전이 2 — 이메일 주소라는 식별자의 특수성

[[2026-05-04-email-addresses-deep-dive]]에서 다뤘듯 이메일은 RFC상으로도 복잡하고, 실무에서는 **"누구인지"를 되돌릴 수 있는 가장 강력한 식별자** 중 하나다. User-Agent 헤더는 원래 "무슨 소프트웨어/버전"을 밝히는 자리인데, 거기에 개인 식별자를 넣는 설계 실수는 "식별자의 용도를 착각한 사고"로 재해석할 수 있다 — 자동화 정책 준수와 개인정보 보호는 설계 단계에서 명확히 분리돼야 한다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용 가능성 있음.** 온다는 실제로 Claude Code를 사내 업무(이 가든 정리 포함)에 쓰고 있다. 이 사건은 "Claude를 쓸 때 도움될 글"로서 실무적 함의가 분명하다 — Claude Code가 웹 검색·리서치 기능을 쓸 때 **로그인 계정 이메일이 외부 사이트로 노출될 수 있다는 리스크**가 있었던 사례이므로, (1) 사내에서 Claude Code로 경쟁사 요금 비교·OTA 모니터링·시장 리서치 등 외부 웹 조회 작업을 시킬 때 계정 이메일 노출 여부를 점검하고, (2) `CLAUDE_BLOCK_STRINGS` 같은 환경변수나 버전 패치 노트를 주기적으로 확인하는 절차를 사내 Claude Code 운영 가이드에 반영할 만하다. CRS 자체보다는 "Claude Code 운영 보안" 체크리스트 항목으로 바로 쓸 수 있다.

## 연관 자료

- [[2026-05-04-email-addresses-deep-dive]] — 이메일 주소가 "식별자"로서 갖는 특수성과 보안 함의
- [[2026-08-02-how-to-block-some-bots]] — 서버가 클라이언트 신원을 역추적하려는 반대 방향의 같은 문제(자동화 클라이언트 식별)

## 한 달 뒤 회고

*(2026-12-06 즈음 — 사내 Claude Code 사용 중 실제로 외부 요청에 이메일이 노출된 사례가 있었는지, 해당 버전의 공식 수정 패치노트가 나왔는지, `CLAUDE_BLOCK_STRINGS` 같은 설정을 사내 가이드에 반영했는지 점검.)*
