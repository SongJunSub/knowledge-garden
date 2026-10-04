---
title: "CogSend — 내 Cloudflare 계정 위에서 돌아가는 셀프 호스팅 소셜 예약 발행 도구 (deepakness) — 서버 대신 D1·R2에 글과 이미지를 맡겨, 플랫폼별 수정은 하되 데이터는 내 계정을 떠나지 않게 했다"
source_title: "cogsend: Self-hosted social media scheduler"
source_url: "https://github.com/deepakness/cogsend"
source_name: "GitHub (deepakness/cogsend)"
referrer_url: "https://news.hada.io/topic?id=34739"
published_at: "확인 불가"
summarized_at: "2026-10-04"
category: "engineering"
tags: ["self-hosted", "open-source", "cloudflare-workers", "cloudflare-d1", "cloudflare-r2", "social-media-scheduler", "mcp", "data-ownership"]
---

# CogSend — 내 Cloudflare 계정 위에서 돌아가는 셀프 호스팅 소셜 예약 발행 도구 (deepakness)

> 출처: [cogsend: Self-hosted social media scheduler](https://github.com/deepakness/cogsend) (GitHub, deepakness) · GeekNews(id=34739) 경유 · 정리일 2026-10-04

> **출처 한계**: `news.hada.io`가 이번 세션 egress 차단으로 직접 열리지 않았다. 대신 **공식 GitHub 저장소 README를 WebFetch로 직접 확보**해 아키텍처·기능·설치 요구사항·라이선스는 1차 소스로 확정했다. hada 댓글 수·HN/Lobsters 크로스포스팅 여부, 실사용 설치 후기는 확인하지 못했다.

## 한 줄 요약

**CogSend는 Mastodon·Bluesky·LinkedIn·Threads·X에 글을 한 번 작성하고 플랫폼별로 다듬어 즉시 또는 예약 발행하는 오픈소스 소셜 미디어 스케줄러다. 핵심은 "셀프 호스팅"의 방식인데, 별도 서버를 운영하는 게 아니라 사용자 자신의 Cloudflare 계정 위에서 Workers로 애플리케이션을 돌리고, 게시물·자격증명은 D1(SQLite)에, 이미지는 R2에 저장해 데이터와 API 자격증명이 전부 운영자 소유의 클라우드 계정 안에 머무르게 설계했다.**

## 핵심 포인트

- **"서버 없는 셀프 호스팅"** — 전통적인 셀프 호스팅처럼 VPS나 Docker 컨테이너를 운영하는 게 아니라, Cloudflare Workers·D1·R2라는 사용자 자신의 서버리스 계정 위에 애플리케이션 전체가 올라간다. README는 "posts go out through your own API credentials"를 핵심 철학으로 내세운다 — 게시물이 CogSend의 서버가 아니라 사용자 본인의 소셜 플랫폼 API 자격증명으로 직접 나간다는 뜻이다.
- **플랫폼별 커스터마이징 + 자동 스레드 분할** — 공통 초안을 유지하면서 X용 문구·LinkedIn용 문구처럼 플랫폼마다 다르게 손볼 수 있는 편집기(플랫폼별 탭 + 글로벌 탭)를 제공한다. 긴 글을 붙여넣으면 선택한 플랫폼의 글자 수 제한에 맞춰 자동으로 여러 게시물의 스레드로 쪼개준다. 게시물당 이미지 최대 4장과 대체 텍스트도 지원한다.
- **데이터 계층 — D1(게시물·자격증명) + R2(이미지)** — 자격증명은 AES-256-GCM으로 암호화해 저장하고, 단일 관리자 계정에는 2FA가 적용된다. Drizzle ORM으로 D1을 다룬다.
- **스케줄링·재시도·분석** — 즉시 발행과 예약 발행을 모두 지원하며, 일시적 오류는 최대 5회까지 자동 재시도한다. 7/30/90일 단위의 발행·실패 통계도 제공한다.
- **MCP 서버 엔드포인트까지 내장** — 최신 버전은 `/api/mcp`에 MCP(Model Context Protocol) 서버 엔드포인트를 노출해, Claude Code 같은 AI 에이전트가 초안을 만들고 검증하고 예약·발행까지 직접 수행할 수 있게 했다. 개인 API 키로 스크립트·단축어(Shortcuts)·cron job·MCP 클라이언트에서도 접근 가능하다.
- **요구사항과 비용** — Node 22.13+/24/26+(짝수 버전만 지원), Cloudflare 계정(R2는 무료 티어라도 결제 수단 등록 필수)이 필요하다. `git clone` → `npm install` → `npm run setup`으로 설치하며, 단일 관리자 인스턴스는 대체로 Cloudflare 무료 플랜 범위 안에서 운영 가능하다고 README는 설명한다. MIT 라이선스.

## 인상 깊은 문장

> "posts go out through your own API credentials."
> (GitHub README의 핵심 철학 서술, WebFetch로 직접 확인)

## 댓글

**hada 댓글 수·HN/Lobsters 크로스포스팅 여부는 확인하지 못했다.** 정직하게 감안할 점: (1) 이 노트는 제작자 본인의 README에 전적으로 의존한다 — 실제 설치 난이도, R2 결제 수단 등록이 실사용자에게 얼마나 장벽인지, MCP 엔드포인트의 보안 설계(토큰 유출 시 소셜 계정 전체가 노출될 위험) 같은 비판적 관점은 제3자 리뷰를 찾지 못해 이 노트에 반영하지 못했다. (2) GitHub에 동일한 이름으로 README를 그대로 복제한 포크(`Curzyori/cogsend`, `mikipalet/cogsend`, `markphelps/cogsend` 등)가 여러 개 검색되는데, 이게 정상적인 오픈소스 포크 관행인지 저장소 복제 스팸인지는 이 세션에서 판별하지 못했다 — 원 저장소(`deepakness/cogsend`)를 1차 소스로 삼았다는 점만 밝혀둔다.

## 내 생각 · 적용점

### 핵심 전이 — [[2026-09-13-dreeve-self-hosted-fitness-dashboard]]와 같은 "벤더 의존 대신 내가 쥔다"는 방향, 다른 비용 구조

Dreeve는 운동 데이터를 Strava API 응답에만 묶어두지 않고 표준 파일 포맷(FIT/TCX/GPX)으로 받아 자체 서버(VPS·Docker)에 쌓는 셀프 호스팅 대시보드였다. CogSend도 "게시물이 CogSend 서버가 아니라 내 API 자격증명으로 나간다"는 같은 방향의 데이터 주권 철학을 공유하지만, 호스팅 방식이 다르다 — Dreeve는 사용자가 직접 VPS/Docker를 운영해야 하는 전통적 셀프 호스팅인 반면, CogSend는 Cloudflare의 서버리스 플랫폼(Workers·D1·R2) 위에 올라가 "서버 운영 부담은 없지만 계정과 데이터는 사용자 소유"라는 중간 지점을 택했다. 같은 "벤더 락인 회피"라는 목표를 "직접 서버를 돌린다"와 "서버리스 플랫폼이지만 내 계정이다"라는 서로 다른 운영 부담 수준에서 달성하는 두 사례로 나란히 둘 만하다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 멀다** — 소셜 미디어 예약 발행이라는 소비자·1인 운영자용 도구를 B2B 호스피탈리티/CRS 제품에 그대로 옮길 지점은 없다. 다만 전이 가능한 설계 원칙 둘은 남는다. ①***"애플리케이션은 우리가 만들지만 데이터와 자격증명은 고객 소유 클라우드 계정 안에 둔다"***는 아키텍처는, CRS가 멀티테넌트 SaaS 외에 "고객사가 자체 클라우드 계정에 배포해 운영하는" 온프레미스형 옵션을 검토할 때 참고할 만한 패턴이다 — 특히 호텔사가 예약자 개인정보·결제 데이터를 벤더의 공용 인프라에 맡기길 꺼리는 경우, "우리 애플리케이션 코드 + 고객 소유 D1/R2 같은 데이터 계층"이라는 분리 모델이 신뢰 확보에 도움이 될 수 있다. ②***공통 초안을 유지하며 채널별로 다르게 다듬고 글자수 제한에 맞춰 자동 분할한다***는 기능은, CRS가 객실 설명·프로모션 문구를 OTA 채널마다(부킹닷컴·익스피디아·아고다 등 서식·글자수 제한이 다른) 배포할 때 "공통 초안 + 채널별 오버라이드 + 자동 포맷 조정"이라는 구조로 참고할 수 있는 작은 아이디어다.

## 연관 자료

- [[2026-09-13-dreeve-self-hosted-fitness-dashboard]] — 같은 "벤더 API에 데이터를 묶어두지 않고 직접 쥔다"는 방향을, 전통적 VPS/Docker 셀프 호스팅으로 구현한 대조 사례

## 한 달 뒤 회고

*(2026-11-04 즈음 — (1) `news.hada.io` 접근이 풀리면 hada 댓글·실사용 후기를 직접 확인, (2) 동명 포크들이 스팸인지 정상 포크인지 추가 조사, (3) MCP 엔드포인트의 보안 설계(토큰 범위·유출 시 영향 범위)에 대한 제3자 리뷰가 나왔는지 점검.)*
