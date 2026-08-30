---
title: "소름 끼치는 크롤러들 (Konstantin Ryabitsev) — git.kernel.org 트래픽의 98%가 스크레이퍼, ASN을 막으니 수백만 개의 주거용 IP로 흩어져 각자 4~5번만 찌르고 사라진다"
source_title: "Creepy crawlies"
source_url: "https://people.kernel.org/monsieuricon/creepy-crawlies"
source_name: "people.kernel.org (Konstantin Ryabitsev)"
referrer_url: "https://news.hada.io/topic?id=33019"
published_at: "2026-08-29"
summarized_at: "2026-08-30"
category: "engineering"
tags: ["ai-crawlers", "git-kernel-org", "anubis", "proof-of-work", "residential-proxy", "asn-blocking", "open-source-infrastructure", "bot-traffic"]
---

# 소름 끼치는 크롤러들 (Konstantin Ryabitsev)

> 출처: [Creepy crawlies](https://people.kernel.org/monsieuricon/creepy-crawlies) (Konstantin Ryabitsev · people.kernel.org, LWN.net 전재) · GeekNews [id=33019](https://news.hada.io/topic?id=33019) 경유 · 정리일 2026-08-30
>
> **출처 한계 먼저 밝힌다**: `news.hada.io`, `people.kernel.org`, `lwn.net`, `lobste.rs`, `noise.getoto.net`, `en.wikipedia.org` 전부 이번 세션의 네트워크 egress 정책상 차단돼 원문·hada 댓글·LWN 댓글·Lobsters 댓글 어느 것도 한 줄도 직접 읽지 못했다. 아래 내용은 **전부 WebSearch 스니펫 교차검증**으로 재구성한 것이다 — 저자는 kernel.org 인프라를 관리하는 Linux Foundation의 시스템 관리자(닉네임 monsieuricon)이고 글은 2026-08-29 게시, LWN.net에 전재됐으며 Lobsters에도 별도 스레드(`lobste.rs/s/nbjo0i`)가 존재한다는 것까지는 여러 검색 스니펫이 일관되게 확인해줬지만, **정확한 원문 문장·인용 순서·글 전체 논지 전개·hada/LWN/Lobsters 댓글 수와 논조는 확인 불가**로 남긴다. 아래 수치(요청 수, 비율, CPU 코어 수)는 검색 스니펫에 반복적으로 등장해 신뢰도가 높지만, 원문을 직접 못 읽었으므로 문맥이나 단서가 누락됐을 가능성은 있다.

## 한 줄 요약

**git.kernel.org는 하루 약 600만 건의 요청을 받는데, 이 중 66%는 Anubis의 작업증명(PoW) 챌린지에서 즉시 차단되고 33%는 계산을 풀고 통과한다 — 관대하게 잡아도 정당한 트래픽은 전체의 약 2%뿐, 나머지는 전부 AI 학습용 스크레이퍼다.** ASN 단위 차단이 한동안 먹혔지만 크롤러는 곧 수백만 개의 주거용·모바일 IP로 흩어져 각 IP가 4~5번만 요청하고 로그에서 영원히 사라지는 방식으로 진화했고, 5개 지리분산 노드에 걸쳐 14개 CPU 코어가 **오로지 스크레이퍼용 커밋 렌더링**에만 소모되는 지경(git clone을 포함한 모든 정당한 접근을 합친 것보다 크다)에 이르렀다.

## 핵심 포인트

- **트래픽 구성** — 일 6M 요청 중 66%는 Anubis 챌린지에서 즉시 차단, 33%는 계산을 풀고 본 사이트에 도달. ***"관대한 가정을 해도 정당한 요청은 git.kernel.org 트래픽의 약 2%에 불과하고 나머지는 전부 스크레이퍼"***라는 게 저자의 결론.
- **비용의 실체** — 5개 지리분산 노드에 걸쳐 **14개 CPU 코어가 오로지 커밋을 HTML로 렌더링하는 데만** 상시 소모되며, 이 렌더링 부하가 git clone을 포함한 다른 모든 정당한 접근 방식을 합친 것보다 크다.
- **Anubis 챌린지 난이도 상향전** — Anubis(작업증명 기반 방화벽, PoW 퍼즐을 브라우저에서 풀게 해 스크립트형 크롤러를 걸러냄) 도입 초기엔 효과적이었으나, 몇 달 뒤 봇들이 난이도 4를 풀기 시작해 5로 상향 — 그러자 결국 5도 풀기 시작하며 오늘의 33% 통과율에 도달했다.
- **ASN 차단의 흥망** — 처음엔 크롤러가 나오는 클라우드/데이터센터 ASN(자율 시스템 번호) 전체를 차단하는 전략이 통했다 — 일부 정당한 사용자가 함께 막히는 부수 피해(collateral damage)를 감수하면서도.
- **크롤러의 진화 — 주거용/모바일 IP 분산** — ASN 차단이 통하자 크롤러는 **수백만 개의 랜덤 주거용·모바일 IP**로 옮겨갔다. 각 IP는 최신 브라우저인 척 위장하고 **4~5번만 요청한 뒤 다시는 로그에 나타나지 않는다** — IP 단위 차단·레이트리밋이 원천적으로 무력화되는 패턴.
- **구조적 함의** — 이건 단발성 공격이 아니라 **방어 수단이 통할 때마다 크롤러 쪽 비용 구조가 재배치되며 계속 우회로를 찾는 군비경쟁**이다. Anubis PoW든 ASN 차단이든, 막히면 다음 세대의 우회가 등장하는 패턴이 반복된다.

## 인상 깊은 문장

> (WebSearch로 재구성, 원문 직접 확인 불가) "With generous assumptions, legitimate requests are only about 2% of git.kernel.org traffic — everything else are scrapers."
> (정당한 트래픽이 소수자가 되고, 인프라 설계의 기본 전제가 "사람이 대부분"에서 "봇이 대부분"으로 뒤집힌 순간을 압축한 문장)

> (WebSearch로 재구성) "...more CPU cycles [are spent] rendering commits for scrapers than on all other kinds of legitimate access, including git clones."
> (오픈소스 인프라의 컴퓨팅 자원이 실제로 누구를 위해 쓰이고 있는지를 숫자로 드러낸다)

## 댓글

- **hada 댓글 수 확인 불가** — `news.hada.io` 세션 내 차단.
- **LWN.net 전재 + Lobsters 별도 스레드(`lobste.rs/s/nbjo0i/creepy_crawlies`) 존재는 WebSearch로 확인**했으나, 두 곳 모두 접근이 막혀 **정확한 댓글 수·논조는 확인하지 못했다.** 검색 스니펫에서 LWN 댓글 제목("I do not see this traffic", "Proxies + electricity")만 파편적으로 보였는데, 후자는 다른 사이트 운영자가 Hetzner VPS를 월 4유로에서 40유로+로 증설했다는 별도 사례를 공유한 것으로 보인다 — **본문과 무관한 개별 경험담일 수 있어 신뢰도 낮게 취급**한다.
- **읽을 때 감안할 점**: 저자는 kernel.org 인프라를 직접 운영하는 당사자다. 즉 이 글은 피해자·방어자의 1인칭 서술이며, 크롤러 업체(어느 AI 회사인지는 특정하지 않음)의 반론이나 "왜 학습 데이터가 필요한가"라는 반대편 논리는 이 글에 없다 — **n=1 인프라(대규모 오픈소스 git 호스팅)의 극단값**일 수 있고, 모든 사이트가 이 정도 비율을 겪는다고 일반화하기는 어렵다.

## 내 생각 · 적용점

**핵심 전이 1 — 같은 현상, 다른 규모의 증언이 가든에 이미 있다.** [[2026-08-08-patronview-bot-scraper-war]]는 150만 페이지 커머스 사이트에서 겪은 "주간 250만 건 요청, 분석도구엔 5,977 페이지뷰만 잡힌다"는 이야기였는데, 이번 kernel.org 사례(정당한 트래픽 2%)는 그 비대칭이 **오픈소스 코드 호스팅이라는 훨씬 큰 스케일에서, 훨씬 더 극단적인 숫자로 재현**된 것이다. 두 글을 나란히 놓으면 "AI 크롤러가 정당한 트래픽을 압도한다"는 게 특정 업종의 문제가 아니라 **인터넷 인프라 전반의 새로운 기본값**이라는 게 더 설득력 있게 보인다.

**핵심 전이 2 — ASN 차단 다음 단계가 실제로 뭘로 진화하는지, [[2026-08-02-how-to-block-some-bots]]가 이론으로 경고한 걸 실전에서 확인시켜준다.** 그 노트의 저자는 "1~3년치 로그를 먼저 분석하지 않으면 VPN·검색엔진·학교·도서관을 함께 차단할 수 있다"고 경고했는데, kernel.org는 실제로 그 부수 피해를 감수하며 ASN을 차단했다 — 그런데 그걸로 끝나지 않고 크롤러가 **수백만 개의 개별 주거용 IP로 흩어지는 다음 단계**로 진화했다. 즉 ASN 차단은 "효과 있는 해법"이 아니라 "크롤러를 다음 우회 전략으로 밀어내는 한 라운드"였을 뿐이라는 걸 실측으로 보여준다.

**핵심 전이 3 — 그 "수백만 개의 주거용 IP"가 어디서 오는지, 가든에 이미 정확히 짚은 노트가 있다.** [[2026-08-02-tv-streaming-stick-fraud-botnet]]은 약 3만8천 대의 저가 스트리밍 스틱이 낮엔 휴대전화로 위장해 주거용 프록시를 대여하는 이중생활을 폭로했다. Ryabitsev가 묘사한 "각 IP가 4~5번 요청하고 사라지는" 패턴은 정확히 이런 **주거용 프록시 봇넷 임대 서비스의 소비자 측 사용례**로 읽힌다 — 저가 IoT 기기의 이중생활(광고 사기용 프록시 임대)이 AI 학습 크롤러의 IP 소싱 인프라와 같은 시장일 가능성이 높다는 걸, 서로 다른 두 글이 양쪽에서 확인해주는 셈이다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 멀다** — 온다의 CRS/예약 API 트래픽 규모는 git.kernel.org(대형 오픈소스 인프라, 전 세계 개발자·봇 트래픽)와 자릿수가 다르고, 이 정도 규모의 AI 크롤러 위협이 온다 트래픽에서 실측된 바도 없다. 다만 전이 가능한 원칙은 남는다: **①** 비용이 큰 엔드포인트(가용 객실 검색, 요금 계산처럼 DB/연산 부하가 큰 API)에 반복 조회 패턴이 관측되면 IP 단위 레이트리밋보다 **PoW형 챌린지(Anubis 방식)나 행동 기반 탐지**가 더 오래 버틴다는 게 이 사례의 시사점. **②** ASN 차단 같은 단일 방어선을 "해결"이 아니라 "한 라운드"로 여기고, 우회 진화를 관측할 로그 체계를 미리 갖추는 게 중요하다는 교훈은 규모와 무관하게 유효하다.

## 연관 자료

- [[2026-08-08-patronview-bot-scraper-war]] — 같은 비대칭(정당한 트래픽이 소수)을 커머스 사이트 규모에서 먼저 보여준 자매 사례
- [[2026-08-02-how-to-block-some-bots]] — ASN·IP 차단의 부수 피해를 이론으로 경고했던 글의 실전 확인편
- [[2026-08-02-tv-streaming-stick-fraud-botnet]] — 크롤러가 옮겨간 "수백만 개의 주거용 IP"가 실제로 어디서 임대되는지 보여주는 공급 측 이야기

## 한 달 뒤 회고

*(2026-09-30 즈음 — ① Anubis가 주거용/모바일 IP 분산 공격에 대응할 다음 조치(예: 행동 기반 챌린지, 트래픽 셰이핑)를 내놨는지 후속 보도 확인. ② 다른 대형 오픈소스 호스팅(GitHub, GitLab, sourcehut 등)이 유사 수치를 공개했는지 — [[2026-08-28-sourcehut-bans-llm-generated-content]]와 결이 다른 각도(콘텐츠 정책이 아니라 인프라 비용)로 재연결 가능성. ③ 온다 자체 API 로그에서 비정상적으로 짧은 세션·낮은 재방문율의 IP 패턴이 실제로 관측되는지 한 번쯤 점검.)*
