---
title: "Firefox 157, 모든 플랫폼에서 JPEG XL 기본 지원 — Safari가 몇 년째 갖고 있던 기능을 Rust로 다시 쓴 디코더로 따라잡다"
source_title: "Intent to ship: JPEG XL"
source_url: "https://hacks.mozilla.org/2026/08/intent-to-ship-jpeg-xl/"
source_name: "Mozilla Hacks (Mozilla 공식 개발자 블로그) 외 교차검증"
referrer_url: "https://news.hada.io/topic?id=32900"
published_at: "2026-08-26"
summarized_at: "2026-08-27"
category: "frontend"
tags: ["firefox", "jpeg-xl", "image-format", "rust", "browser-engine", "web-standards"]
---

# Firefox 157, 모든 플랫폼에서 JPEG XL 기본 지원

> 출처: [Intent to ship: JPEG XL](https://hacks.mozilla.org/2026/08/intent-to-ship-jpeg-xl/) (Mozilla Hacks 추정) · 정리일 2026-08-27
> **출처 한계**: `news.hada.io`·`hacks.mozilla.org`·`phoronix.com`·`hwbusters.com`·`mail-archive.com`(Mozilla dev-platform 메일링 리스트)·`news.ycombinator.com` 모두 이 세션에서 egress 차단이다. `source_url`은 WebSearch 결과 제목("Intent to Ship: JPEG XL – Mozilla Hacks")으로 재구성한 추정이며 페이지 본문을 직접 열어 대조하지 못했다. 아래 내용은 **Slack 발췌 4줄 + Phoronix·Slashdot·Neowin·Hardware Busters 기사 제목과 WebSearch 스니펫을 교차한 재구성**이다 — 특히 정확도·손상 파일 처리·다운스케일·점진적 렌더링 관련 "기본 활성화 전 검증 계획" 항목은 Slack 발췌 자체가 "…" 로 잘려 있어 항목 존재만 확인했고 구체 내용은 확인하지 못했다. hada 댓글 수·논지도 확인 불가.

## 한 줄 요약

**Firefox 157(2026년 9월 말 출시 예정)부터 모든 플랫폼에서 JPEG XL 디코딩이 기본 활성화된다.** 디코더는 Mozilla가 Google Research에 "안전하고 빠르고 컴팩트하고 호환되는 Rust 구현"을 요청해 만들어진 ***jxl-rs***다. Nightly에서는 이미 기본값이었고, Firefox 152부터 모든 채널의 *Firefox Labs*에서 `image.jxl.enabled`를 켤 수 있었다 — 이번 발표는 그 단계적 검증을 거쳐 **전체 기본값으로 승격**하는 마지막 단계다. jxl-rs 0.6.0의 멀티스레드 디코딩은 테스트 환경에서 Safari의 C++ `libjxl`보다 **소폭 빠르지만**, 작은 이미지에서는 다른 포맷 대비 성능 격차가 오히려 커진다. Safari는 이미 몇 년째 JPEG XL을 지원해온 터라, 이번 발표를 다룬 매체 다수가 "Safari 사용자가 누려온 기능을 Firefox가 뒤늦게 따라잡는다"는 프레임으로 제목을 뽑았다.

## 핵심 포인트

- **범위** — Firefox 157부터 **모든 플랫폼**에서 JPEG XL 디코딩 기본 활성화. Chrome/Chromium 진영은 별도 트랙(2022년 한 차례 지원 철회 이력이 있는 포맷)이라 이번 발표는 Firefox 한정.
- **디코더 교체 배경** — Mozilla가 기존 C++ 구현 대신 **Google Research에 Rust 재구현(jxl-rs)을 요청**했고, 그 결과물을 채택했다. "무엇을 지원할지"가 아니라 **"어떻게 안전하게 지원할지"**가 더 오래 걸린 협상 지점이었다는 뜻으로 읽힌다.
- **단계적 롤아웃 이력** — Nightly 기본 활성화 → Firefox 152부터 전 채널 **Firefox Labs** 옵트인 → Firefox 157 전체 기본값. 새 이미지 코덱을 브라우저 기본값으로 바꾸는 전형적인 **점진적 검증** 경로.
- **성능** — jxl-rs 0.6.0의 **멀티스레드 디코딩**이 테스트 환경에서 Safari의 C++ `libjxl`보다 소폭 앞선다. 다만 **작은 이미지**에서는 다른 이미지 포맷과의 성능 격차가 오히려 벌어진다 — 대형 사진에는 유리하지만 아이콘·썸네일류에는 아직 약점이 있다는 뜻.
- **기능 지원 범위** — 애니메이션·점진적(progressive) 표시는 지원. 반면 **HDR 이미지는 SDR로 강제 변환**되어 표시된다(HDR 메타데이터를 살리지 못함).
- **기본 활성화 전 검증 항목**(Slack 발췌가 문장 중간에 잘려 구체 결과는 미확인) — 정확성(디코딩 결과가 사양대로인지), 손상된 파일 처리, 다운스케일 렌더링, 점진적 렌더링 등을 점검했다는 취지만 확인.

## 인상 깊은 문장

> "Firefox 157 Will Include JPEG XL By Default On All Platforms" / "Firefox is finally bringing a feature Safari users have been enjoying for years"
> (Slashdot·Neowin 기사 제목 그대로 — 원문 본문의 직접 인용은 이 세션에서 확보하지 못했지만, 두 매체 모두 "뒤늦은 추격"이라는 동일한 프레임으로 이 소식을 보도했다는 점 자체가 이 기능의 위치를 잘 보여준다.)

## 댓글

- **hada 댓글 수·논지 확인 불가**(news.hada.io 차단).
- Hacker News에 관련 스레드(id=49437946)가 존재하는 것은 검색으로 확인했으나, `news.ycombinator.com` 자체가 차단돼 **포인트·댓글 수·논조는 이 노트에 담지 못했다.**
- **읽을 때 감안**: 이 기능은 2022년 Chrome이 JPEG XL 지원을 철회한 뒤로 "죽은 포맷" 취급을 받아온 이력이 있다. Firefox의 이번 채택이 이 포맷의 실질적 부활 신호인지, 아니면 Chrome 없이는 웹 전반의 채택으로 이어지기 어려운 제한적 사건인지는 이 노트만으로는 판단할 수 없다.

## 내 생각 · 적용점

### 핵심 전이 1 — "언어를 안전하게 다시 쓰고 나서야 기본값으로 승격"하는 순서는, 이번 배치의 다른 두 노트와 같은 계열이다

[[2026-08-26-eve-online-python3-migration]]은 "먼저 두 버전에서 동시에 돌려보고 차이를 진단한 뒤에야 배포"하는 순서를, [[2026-08-26-rust-never-type-stabilized]]는 "무엇을 바꿔야 하는지는 오래전에 알았지만 안전하게 바꿀 방법을 찾는 데 10년이 걸렸다"는 서사를 보여줬다. JPEG XL도 정확히 같은 축이다 — Mozilla는 **기능 자체보다 "안전한 구현"을 먼저 확보**하려고 별도로 Rust 재구현을 요청했고, 그 다음에야 Nightly → Labs → 기본값 순서로 승격시켰다. 세 노트 모두 **"바꿔야 한다는 결론과 안전하게 바꾸는 방법 사이의 거리"**가 실제 소프트웨어 변경에서 얼마나 오래, 얼마나 신중하게 다뤄지는지를 보여주는 같은 계열의 사례다.

### 핵심 전이 2 — "성능이 소폭 앞선다"는 벤치마크 수치 뒤에 "작은 이미지에서는 격차가 커진다"는 단서가 붙는다

이 글의 성능 수치는 [[2026-08-06-pi-minimalism-coding-harness]]에서 짚었던 **"인상적인 숫자 뒤에 조건이 숨어 있다"**는 패턴을 그대로 반복한다 — "Safari보다 빠르다"는 헤드라인 뒤에 "테스트 환경에서", "작은 이미지에서는 격차가 벌어진다"는 단서가 바로 붙는다. 브라우저 벤더의 발표라도 인용할 땐 조건절까지 함께 옮겨야 한다는 원칙을 재확인.

## 호스피탈리티 / CRS 적용 포인트

- **직접 적용은 멀다.** 온다 CRS/B2B 프로덕트가 이미지 포맷 디코딩 자체를 다루지는 않는다.
- 다만 파트너 호텔의 객실·시설 사진을 웹에 서빙하는 프런트엔드가 있다면, **새 이미지 포맷의 브라우저 지원율이 100%에 도달하기까지 몇 년에 걸친 단계적 롤아웃을 거친다**는 이 사례의 타임라인(Nightly→Labs→기본값, 그마저 Chrome은 빠짐)은 "다음 이미지 포맷으로 언제 전환할지" 판단할 때 참고할 만한 현실적인 시간 감각을 준다 — 벤더가 "지원 시작"을 발표해도 실사용 커버리지는 한참 뒤에야 따라온다.

## 연관 자료
- [[2026-08-26-eve-online-python3-migration]] — "먼저 검증, 그 다음 기본값 전환"이라는 같은 리스크관리 순서
- [[2026-08-26-rust-never-type-stabilized]] — 안전하게 바꾸는 방법을 찾는 데 오래 걸린다는 같은 주제, 언어/런타임 표준화 축
- [[2026-08-06-pi-minimalism-coding-harness]] — "인상적인 수치 뒤에 조건이 숨어 있다"는 벤치마크 읽는 법의 같은 교훈

## 한 달 뒤 회고
*(2026-09-27 즈음 — ①실제로 Firefox 157이 예정대로 출시돼 JPEG XL이 기본 활성화됐는지, ②Chrome 진영의 재도입 움직임이 이 발표 이후 달라졌는지, ③"기본 활성화 전 검증"에서 실제로 어떤 손상 파일·다운스케일 이슈가 발견됐는지 — 원문 접근이 가능해지면 이 노트의 추정 표시를 확정 사실로 교체.)*
