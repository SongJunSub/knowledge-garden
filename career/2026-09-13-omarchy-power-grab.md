---
title: "Omarchy의 권력 장악 (tante) — 문제는 오픈소스 후원 자체가 아니라, 누구를 후원할지를 한 사람이 정한다는 것"
source_title: "Power grab"
source_url: "https://tante.cc/2026/09/11/power-grab/"
source_name: "tante.cc (개인 블로그), Hacker News·Lobsters 크로스포스팅"
referrer_url: "https://news.hada.io/topic?id=33563"
published_at: "2026-09-11"
summarized_at: "2026-09-13"
category: "career"
tags: ["omarchy", "dhh", "open-source-governance", "corporate-sponsorship", "hyprland", "digitalocean", "omacom-foundation", "code-of-conduct", "funding-politics"]
---

# Omarchy의 권력 장악

> 출처: [Power grab](https://tante.cc/2026/09/11/power-grab/) (tante · 개인 블로그, Hacker News "Omarchy Is a Power Grab"·Lobsters로 크로스포스팅) · GeekNews(id=33563) 경유 · 정리일 2026-09-13

> **출처 한계(매우 큼)**: 이번 세션은 `news.hada.io`뿐 아니라 **이번 조사에서 시도한 거의 모든 외부 도메인이 network egress 정책으로 차단**됐다 — `tante.cc`(원문), `news.ycombinator.com`, `lobste.rs`, `daily.dev`, `techtimes.com`, `panews.io`, `blogs.gnome.org`, `digitalocean.com`, `brennan.day`, 심지어 `en.wikipedia.org`까지 전부 `EGRESS_BLOCKED`로 실패했다(`curl` 직접 테스트로도 `CONNECT tunnel failed, response 403`, "organization policy" 확인). 즉 이 노트는 **원문·댓글을 단 한 줄도 직접 열람하지 못한 채**, WebSearch가 반환한 요약 스니펫들(여러 매체·플랫폼에 걸쳐 교차 확인됨)만으로 재구성했다. 정량적 숫자(후원 총액, 계약 기간)와 인용문은 WebSearch 결과에 이미 포함된 재인용을 그대로 옮긴 것이라 원문 문맥이 잘렸을 위험이 있고, tante 본인의 논조 전체(문장 단위 뉘앙스)는 확인 불가능하다는 점을 감안해서 읽어야 한다.

## 한 줄 요약

**Omarchy(DHH가 만든 Arch 기반 배포판)를 둘러싼 진짜 쟁점은 "기업이 오픈소스를 후원해도 되는가"가 아니라, ***한 개인의 정치적 취향이 어떤 프로젝트가 살고 어떤 프로젝트가 말라죽을지를 정하는 자금 배분 권한을 쥐고 있다***는 구조다.** DigitalOcean이 Omacom Foundation에 연 100만 달러(3년, 총 300만 달러) 상당을 약정한 시점과, Flathub·GNOME에 대한 월 50달러 상당의 후원을 끊은 시점이 거의 겹친다는 사실이 이 비대칭을 가장 선명하게 보여주는 사례로 인용된다.

## 핵심 포인트

- **규모**: Omacom Foundation은 2026-08-21 8명의 창립 후원자(각 100만 달러 — Shopify의 Tobi Lütke, Stripe의 Patrick Collison, Michael Dell, Jack Dorsey, Cloudflare의 Matthew Prince 등)로 800만 달러 규모로 출범, 8월 말 1Password·37signals 합류로 1,260만 달러, 9월 초 DigitalOcean의 300만 달러(연 100만×3년) 약정까지 더해져 **1,800만 달러 이상**으로 불어났다. Slack 발췌의 "1,800만 달러 이상" 표현과 WebSearch로 교차 확인된 액수가 일치한다.
- **배분 권한이 한 사람에게 있다는 게 핵심 급소**: 재단이라는 형식은 있지만 ***어느 프로젝트가 후원을 받을지 실질적으로 정하는 건 DHH 개인***이라는 게 비판의 핵심이다. tante의 원문 제목이 곧 논지다 — "Omarchy should not matter. But sadly it does. As a power grab."(오마르키는 별 게 아니어야 하는데, 안타깝게도 별 게 됐다. 권력 장악으로서.)
- **Hyprland 사례**: 창시자 Vaxry가 이끄는 윈도우 매니저 Hyprland가 Omacom Foundation의 독점 후원(3년 계약)을 받아 "상업적 압박 없이 개발에 집중"하게 됐다고 홍보된다. 그런데 Vaxry는 2024년 Hyprland Discord의 트랜스젠더 혐오 대응 방식을 두고 Freedesktop.org 행동강령팀과 충돌해 **Freedesktop 기여 금지 처분**을 받은 인물이다(Vaxry 본인은 Freedesktop의 관할권 자체를 부인). 비판자들은 이 지점을 짚어 "DHH가 정치적으로 결이 맞는(aligned) 개발자를 선별 지원한다"고 주장한다.
- **DigitalOcean의 대비**: DigitalOcean이 Omacom Foundation의 "Founding Corporate Patron"으로 300만 달러를 약정한 것과 거의 같은 시기에, Flathub와 GNOME에 대한 월 50달러 상당의 지원(사실상 상징적 규모지만 오랫동안 이어진 커뮤니티 인프라 후원)을 끊었다는 사실이 WebSearch로 교차 확인됐다. 액수 차이가 워낙 커서(300만 달러 대 월 50달러) 비교 자체가 기울어져 있다는 반론도 가능하지만, 비판자들은 "새로운 스타 프로젝트에 몰리는 돈"과 "조용히 끊기는 오래된 커뮤니티 인프라 후원"의 대비 자체를 문제로 삼는다.
- **자금난 프로젝트의 딜레마 (Slack 발췌, 확인 못한 부분)**: Slack 발췌는 "자금난에 놓인 프로젝트는 지원을 받기 위해 행동 강령과 공동체의 원칙을…"에서 잘렸다. 문맥상 "DHH의 후원을 받으려면 그의 정치적 색채나 행동강령 기준에 암묵적으로 맞춰야 하는 압력이 생긴다"는 논지로 이어질 가능성이 높지만, **원문을 확보하지 못해 이 문장의 실제 결론은 추정일 뿐**이다.
- **반론도 존재한다**: Framework은 자사의 Omarchy 관련 후원에 대해 "개인이나 조직의 신념·가치·정치적 입장이 아니라 오픈소스 채택 확대라는 정렬(alignment)만 보고 파트너십을 맺는다"고 공개 defense했고, 1Password 경영진도 "직원마다 생각이 다를 수 있고, 그것으로 도덕적 우위를 주장하거나 동료를 배척하는 건 불공정하다"는 입장을 냈다. 커뮤니티 반응도 갈린다는 관전평이 있다 — Hacker News는 상대적으로 우호적, Lobsters는 상대적으로 차갑다는 특징(정치적 경향 차이로 설명하려는 시도)이 WebSearch 요약에 등장하는데, **이건 스니펫 수준의 관전평이라 실제 댓글을 대조하지 못한 채 그대로 옮긴 것**임을 밝혀둔다.

## 인상 깊은 문장

> "Omarchy should not matter. But sadly it does. As a power grab." — tante, 원문 인용(WebSearch 재인용, 직접 대조 불가)

> "DHH received $3 million from DigitalOcean for Omarchy at basically the same time DigitalOcean cancelled their support of Flathub and GNOME that amounted to a value of $50 per month." — WebSearch 요약을 통해 확인된 문장(원문 직접 대조 불가)

## 댓글

hada(id=33563) 댓글 수는 이번 세션 접근 차단으로 확인 불가. 원문(tante.cc)이 **Hacker News**("Omarchy Is a Power Grab", news.ycombinator.com/item?id=49658869)와 **Lobsters**(lobste.rs/s/be7tgu/power_grab) 양쪽에 크로스포스팅됐다는 사실은 WebSearch로 확인했지만, 정확한 댓글 수·상위 댓글 내용은 두 사이트 모두 `EGRESS_BLOCKED`로 열람하지 못했다. 같은 주제로 Lobsters에는 "omarchy is not a distro", "A Word on Omarchy", "Normalized Fascism in Open Source: $12 Million Given to DHH"(brennan.day 원문) 등 별도 스레드도 다수 존재해, 이 사안이 단발성 뉴스가 아니라 몇 주째 이어지는 커뮤니티 논쟁임을 알 수 있다. **이해관계·편향 고지**: "Normalized Fascism"류 표현은 이미 강하게 편향된 프레이밍이고, 반대편의 Framework·1Password 해명 역시 스폰서 당사자의 자기 방어 발화다 — 이 노트는 양쪽 다 "당사자 또는 강한 논조의 3자 발화"로 다루며 어느 쪽도 검증된 사실관계로 취급하지 않는다. DHH 본인의 반론(있었는지 여부 포함)은 이번 조사로 확보하지 못했다.

## 내 생각 · 적용점

### 핵심 전이 1 — "재단이 있다"는 사실 자체가 거버넌스 분산을 뜻하지 않는다는, [[2026-09-11-who-owns-wordpress-automattic-governance]]와 정확히 같은 함정

[[2026-09-11-who-owns-wordpress-automattic-governance]]에서 정리한 WordPress 사례의 핵심은 "비영리 WordPress Foundation이 존재해도, 정작 실질적 통제점(wordpress.org)은 뮬렌웨그 개인이 쥐고 있었다"는 것이었다. Omacom Foundation도 형식은 재단이지만, ***어느 프로젝트에 얼마를 배분할지 정하는 실질적 재량은 DHH 개인에게 남아있다***는 비판이 이번 사례의 핵심이다. 두 사례를 겹쳐보면 하나의 원칙이 뚜렷해진다 — **"재단"이라는 명칭은 거버넌스 분산의 증거가 아니라, 오히려 개인 통제를 정당화하는 포장일 수 있다.** 확인해야 할 건 재단의 존재가 아니라 재단의 **의사결정 메커니즘**(이사회 표결인지, 1인 재량인지)이다.

### 핵심 전이 2 — [[2026-05-29-andrew-kelley-zig-interview]]의 Zig Software Foundation과 대조하면 "무엇이 다른가"가 명확해진다

[[2026-05-29-andrew-kelley-zig-interview]]에서 짚은 Zig의 501(c)(3) 비영리 재단은 미션을 창시자 개인의 변덕이나 시장 압력으로부터 구조적으로 분리하려는 설계였다. Omacom Foundation이 진짜 그런 구조라면(이사회·투명한 배분 기준이 있다면) 이번 비판은 근거가 약해지고, 반대로 배분이 DHH 1인 재량이라면 Zig가 피하려던 바로 그 위험(창시자 개인의 정치적·미적 취향이 생태계 자금 흐름을 좌우하는 것)을 재단이라는 이름으로 재현하는 셈이다. **이 노트가 확보한 자료로는 Omacom의 실제 의사결정 규정(이사회 구성, 표결 절차)을 확인하지 못했다** — 이게 이번 조사의 진짜 공백이고, 다음에 확인해야 할 지점이다.

### 핵심 전이 3 — 후원 정치화 논쟁은 이 노트 하나로 끝나지 않는, 같은 주(9월) 반복되는 패턴이다

[[2026-09-11-automattic-ceo-forced-leave]]가 다룬 "회사 이사회는 갈아치울 수 있어도 오픈소스 프로젝트 리더는 갈아치울 수 없다"는 사건과, 이 노트의 "재단은 있어도 배분 재량은 개인에게 있다"는 사건이 **같은 9월 한 주 간격으로 겹쳐 나왔다는 것 자체가 흥미롭다.** 두 사건 모두 "법적 형식(회사 이사회, 비영리 재단)과 실질적 통제(개인)가 불일치할 때 무슨 일이 벌어지는가"라는 동일한 질문을 다른 각도에서 던진다.

## 호스피탈리티 / CRS 적용 포인트

이 글은 리눅스 배포판·오픈소스 후원 정치에 대한 것이라 온다 CRS 제품에 직접 적용되는 지점은 없다. 억지로 끌어오지 않고, 전이 가능한 원칙만 남긴다.

- 온다가 특정 오픈소스 프로젝트(패키지, 라이브러리)를 핵심 의존성으로 삼을 때, "이 프로젝트가 재단·후원 프로그램의 지원을 받는다"는 사실만으로 안심하지 말고 **그 후원 배분이 투명한 규정에 따르는지, 아니면 특정 개인의 재량인지**를 확인하는 습관은 이번 사례와 [[2026-09-11-who-owns-wordpress-automattic-governance]]가 공통으로 남기는 실무 교훈이다. 개인 재량형 후원 구조는 후원자의 개인적 사정(건강, 정치적 입장 변화, 회사 이탈)에 따라 프로젝트 존속 자체가 갑자기 흔들릴 수 있다는 리스크로 읽어야 한다.

## 연관 자료

- [[2026-09-11-who-owns-wordpress-automattic-governance]] — "재단·비영리 형식이 있어도 실질 통제는 개인"이라는 정확히 같은 구조적 함정을 다룬 자매글
- [[2026-05-29-andrew-kelley-zig-interview]] — 미션을 개인 재량에서 분리하려 한 정반대 사례(Zig Software Foundation)와의 대조, "재단의 의사결정 메커니즘"이 관건임을 보여주는 기준점
- [[2026-09-11-automattic-ceo-forced-leave]] — 같은 9월 한 주 간격으로 나온, "법적 형식과 실질적 통제의 불일치"를 다루는 또 다른 사건

## 한 달 뒤 회고

*(2026-10-13 즈음: ①Omacom Foundation의 실제 의사결정 규정(이사회 구성, 배분 기준 공개 여부)이 밝혀졌는지, ②Vaxry의 Freedesktop 금지 처분과 Hyprland 후원 사이의 긴장이 커뮤니티에서 더 논의됐는지, ③DigitalOcean의 Flathub·GNOME 지원 중단이 실제로 이번 후원과 인과관계가 있다고 밝혀졌는지(아니면 우연한 시기 일치였는지), ④이번 세션의 전면적 egress 차단이 일시적 문제였는지 원문을 다시 열람할 수 있었는지 확인)*
