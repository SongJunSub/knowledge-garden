---
title: "PHP2Shell 연쇄 공격으로 미국 정부 관련 서버 포함 25대의 루트 권한 탈취 (GeekNews) — Slack 발췌는 Unit 42의 검증이라 했지만, 실제로는 Unit 42가 관련 주장을 철회했다"
source_title: "PHP2Shell 연쇄 공격으로 미국 정부 관련 서버 포함 25대의 루트 권한 탈취"
source_url: "https://news.hada.io/topic?id=36240"
source_name: "GeekNews"
referrer_url: "https://ondainc.slack.com/archives/C0AJL0096H4"
published_at: "확인 불가"
summarized_at: "2026-10-30"
category: "backend"
tags: ["php2shell", "pan-os", "palo-alto", "rce", "privilege-escalation", "vulnerability-disclosure"]
---

# PHP2Shell 연쇄 공격으로 미국 정부 관련 서버 포함 25대의 루트 권한 탈취 (GeekNews)

> 출처: [GeekNews](https://news.hada.io/topic?id=36240) · Slack `#개발-뉴스-dev-news`(GeekNews 자동봇) 경유 · 정리일 2026-10-30

> **출처 한계**: `news.hada.io`가 이 세션에서 egress 전면 차단(WebFetch `getaddrinfo ENOTFOUND` 확인). Slack 발췌 불릿은 마지막이 "내부망 접근 경로를 확…"에서 끊긴다. WebSearch로 TheNextWeb, SecurityWeek, Cybernews, Unit 42 자체 공시, HelpNetSecurity 등을 교차확인했는데, **Slack 발췌의 핵심 주장 하나가 실제 보도와 다르다**: Slack은 "공급업체의 Unit 42도 공격 도구와 결과를 독립적으로 검증했다"고 적었지만, WebSearch로 확인한 Unit 42 자체 공시(unit42.paloaltonetworks.com)는 오히려 **이전에 자신들이 내놓은 평가(유럽 정부기관 침해가 PHP2Shell 악용이라는 연결)를 철회**했다고 밝히고 있다. "25대 서버·정부기관 포함"이라는 수치의 1차 출처는 보안업체 Dream 단독 보고이며, 매체별로 CVE 번호도 엇갈린다(Linux 커널 결함을 "Fragnesia, CVE-2026-46300"로 부르는 보도도 있고 다른 번호를 쓰는 보도도 있다). 이 노트는 Slack 발췌를 그대로 베끼지 않고 교차확인된 사실로 바로잡았다.

## 한 줄 요약

**보안업체 Dream이 PHP2Shell 두 취약점과 "Fragnesia"라는 Linux 커널 권한 상승 결함을 결합한 무인증 루트 탈취 체인을 보고했다 — 자동화 도구가 24대 방화벽에 영구 웹셸을 심었고 그중 미국 정부 관련 환경의 서버 2대에서는 공격이 더 깊이 진행됐는데, 이 수치는 Dream 단독 보고이며, Slack 발췌가 "검증했다"고 적은 Palo Alto Unit 42는 실제로는 관련된 다른 주장(유럽 정부기관 침해와 PHP2Shell의 연결)을 철회한 상태다.**

## 핵심 포인트

- **PHP2Shell 시리즈의 네 번째 국면** — 이 가든은 이미 [[2026-10-22-wiz-php2shell-ai-exploit-chain]](발견), [[2026-10-23-amazon-madpot-php2shell-pre-disclosure-attacks]](공개 전 공격), [[2026-10-29-php2shell-exploitation-kev-update]](KEV 등재·연방 데드라인)를 추적해왔다. 이번 글은 ***"루트 권한까지 완성된 구체적 공격 체인이 관찰됐다"***는 다음 국면이다.
- **Fragnesia 체인** — PHP2Shell 두 결함 + Linux 커널 권한 상승 취약점("Fragnesia")을 묶어 ***무인증으로 방화벽 루트 권한***을 확보하는 자동화 공격. 1만 9,000대를 발견한 뒤 240대를 자동 공격해 그중 24대에 영구 웹셸을 남겼다는 것이 Dream의 보고다.
- **"검증"이 아니라 "철회"** — Slack 발췌와 달리, Unit 42는 자체 공시에서 유럽 정부기관 침해를 PHP2Shell 악용과 연결했던 ***이전 평가를 철회***했다고 밝혔다. "공급업체가 독립적으로 검증했다"는 서술은 교차확인 결과 반대 방향의 사실이다.
- **표적은 인터넷에 노출된 관리 인터페이스** — Palo Alto는 PAN-OS·Panorama 전 버전이 영향받으며, 위험은 ***관리 인터페이스가 인터넷에 노출된 경우***에 가장 크다고 확인했다. 패치는 10/25부터 10/30까지 순차 배포 중(이 노트 작성일이 바로 마감일이다).

## 인상 깊은 문장

> "Palo Alto said it's retracting its earlier assessment that the post-compromise activity targeting the European government agency involved the exploitation of the PHP2Shell flaws." (SecurityWeek/Unit 42 공시 발췌, WebSearch 교차확인)

## 댓글

hada 댓글 수·HN/Lobsters 큐레이션 확인 불가(원문 접근 차단). **가장 솔직하게 밝혀야 할 점**: Slack이 자동 추출한 요약이 "벤더가 검증했다"는 식으로 사실을 긍정적으로 왜곡했다. 자동 요약 봇을 1차 자료로 쓸 때는 핵심 주장(특히 "누가 무엇을 검증/확인했다"는 문장)을 WebSearch로 반드시 재확인해야 한다는 교훈을 이번에 직접 얻었다. "25대 서버"·"정부기관 포함" 수치도 Dream 단독 보고이고 매체 간 CVE 번호 표기가 엇갈려, 숫자 자체도 확정적으로 받아들이기 어렵다.

## 내 생각 · 적용점

**핵심 전이 1 — 자동 요약을 1차 자료로 쓸 때, "누가 검증했다"는 서술은 가장 먼저 교차확인해야 할 문장이다.** 오늘 바로 아래([[2026-10-30-zombie-statistics-ai-citation-provenance]])에서 정리한 "AI가 인용하는 숫자는 어디서 오는가" 글의 핵심("인용 링크가 있어도 숫자의 기원과 타당성을 보장하지 않는다")이 이 노트를 쓰면서 그대로 재현됐다 — Slack 발췌는 "Unit 42가 검증했다"는 명제형 문장을 담고 있었지만 실제로는 반대였다.

**핵심 전이 2 — 트리아지 우선순위는 심각도 점수가 아니라 실제 악용 증거로 결정된다는 패턴의 반복.** [[2026-10-29-php2shell-exploitation-kev-update]]에서 정리한 패턴(패치보다 공격이 먼저 시작되는 경우가 반복됨)이 이번에도 이어진다 — 체인 공격이 KEV 등재 직후 바로 다음 국면(루트 권한 완성)으로 넘어갔다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용 가능성 높다. [[2026-10-29-php2shell-exploitation-kev-update]]에서 남긴 원칙(PHP 8.1 이하 백포트 확인, 자체 자산 스캔)에 더해, 이번 사례는 "관리 인터페이스를 인터넷에 노출하지 않는다"는 원칙을 재확인시켜준다. CRS/PMS 스택의 방화벽·VPN 관리 콘솔이 인터넷에서 직접 접근 가능하다면, 패치 적용 여부와 무관하게 관리 인터페이스 자체를 내부망/VPN 뒤로 숨기는 것이 1차 방어선이어야 한다.

## 연관 자료

- [[2026-10-29-php2shell-exploitation-kev-update]] — 바로 전 국면(KEV 등재·연방 3일 데드라인), 이 글의 "루트 권한 체인 완성"은 그다음 국면.
- [[2026-10-23-amazon-madpot-php2shell-pre-disclosure-attacks]] — 공개 전부터 있었던 공격이라는 선행 증거.
- [[2026-10-30-zombie-statistics-ai-citation-provenance]] — "인용·검증 표현을 그대로 믿지 말라"는 원칙이 이 노트를 쓰며 직접 재현됨.

## 한 달 뒤 회고

*(2026-11-30 즈음 — Dream의 "25대 서버" 수치가 독립적으로 재검증됐는지, Unit 42가 PHP2Shell 관련 평가를 추가로 수정했는지, PAN-OS 패치가 전체 완료됐는지 확인한다.)*
