---
title: "기본값이 곧 제품 철학이다 — 리눅스 유저가 한 달간 Windows 11을 '의도된 기본 방식 그대로' 써본 결과"
source_title: "You paid me, a long-time Linux user, to use Windows 11 exclusively for a month: here's how it went"
source_url: "https://www.osnews.com/story/145459/you-paid-me-a-long-time-linux-user-to-use-windows-11-exclusively-for-a-month-heres-how-it-went/"
source_name: "osnews.com"
referrer_url: "https://news.hada.io/topic?id=31278"
published_at: "2026-07-08"
summarized_at: "2026-07-12"
category: "engineering"
tags: ["default-design", "ui-consistency", "user-autonomy", "developer-workstation", "tool-evaluation", "onboarding", "just-works"]
---

# 기본값이 곧 제품 철학이다 — 리눅스 유저가 한 달간 Windows 11을 '의도된 기본 방식 그대로' 써본 결과

> 출처: [You paid me, a long-time Linux user, to use Windows 11 exclusively for a month](https://www.osnews.com/story/145459/you-paid-me-a-long-time-linux-user-to-use-windows-11-exclusively-for-a-month-heres-how-it-went/) (Thom Holwerda, OSNews) · 정리일 2026-07-12

## 한 줄 요약

**장기 리눅스 사용자 Thom Holwerda가 독자 후원을 받아 한 달간 "Microsoft가 의도한 기본 방식 그대로"만 Windows 11을 써봤다. 설정 앱·이모지 선택기·클립보드 관리자 같은 일부 기능은 유용했지만, 일관성·맞춤성·프라이버시·사용자 자율 존중에서 경쟁이 안 된다고 결론 내리고 리눅스로 복귀했다. 핵심은 OS 스펙 비교가 아니라 "커스터마이즈로 가릴 수 있는 문제라도 기본값이 나쁘면 그 제품이 사용자를 어떻게 대하는지가 드러난다"는 것이다.**

## 핵심 포인트

- **일부러 "기본값"만 써본 실험** — 저자는 커스터마이즈로 문제를 가리는 대신, MS가 밀어붙이는 기본 설정·기본 앱(Edge, 새 Outlook, Store)만 사용했다. 기본 경험이 곧 제품의 태도라는 전제다.
- **일관성 붕괴** — Win32·WinUI 3·Fluent·Metro가 섞여 타이틀바 높이·버튼·컨텍스트 메뉴·폰트 렌더링이 제각각. "몇 단어마다 언어가 바뀌는 책을 읽는 느낌."
- **사용자 자율의 침식** — 강제 온라인 계정(EU DMA에도 불구), 텔레메트리 프롬프트, 지워도 되살아나는 폴더, 구독 없으면 광고를 띄우는 새 Outlook.
- **"그냥 동작해야 하는 것"의 실패** — 절전(sleep)이 깨져 절전 중 팬이 최대로 돌며 발열. 동일 하드웨어에서 리눅스는 문제없이 처리.
- **긍정 요소** — 설정 앱 구성, 이모지 선택기(Super+.), 클립보드 관리자(Super+v)는 텍스트 입력 흐름을 실제로 개선했다.
- **결론** — 정직하게 노력해도 일관성·맞춤성·프라이버시·사용자 존중에서 리눅스를 못 따라감 → 복귀.

## 인상 깊은 문장

> "For someone used to desktop Linux, where respect for the user, consistency, customizability, and performance are still held in high regard, Windows 11 feels like an endless string of punches in the face."

> "No two titlebars are of the same height... It's like reading a book where every few words, the language and script randomly change."

## 댓글 — GeekNews(한국어) + GN⁺의 Lobste.rs 큐레이션 전수 확인

**한국어 유저 댓글 8개(작성자 6명) + GN⁺가 Lobste.rs 토론을 큐레이션한 블록 1개(내부 11개 의견 클러스터).** 한국 유저 토론의 두 축이 특히 전이 가치가 크다.

- **한글 IME 설정의 번거로움 = 리눅스 데스크톱 채택의 최대 장벽** — 여러 댓글(nandeska, euphcat, neoplastic)이 "다른 건 다 좋은데 한글 입력 하나 때문에 워크스테이션으로 못 쓴다"고 지적. "그거 딱 하나 빼면 리눅스 워크플로가 훨씬 자연스럽다"(euphcat).
- **"익숙함 ≠ 본질적 우수함"** — euphcat: "리눅스가 익숙한 프로그래머 vs 윈도우가 익숙한 프로그래머라면?" 즉 도구 평가에서 자기 숙련도를 도구의 객관적 품질로 착각하는 편향.
- **Lobste.rs 클러스터**: ① 절전/발열 실경험("가방에 넣었더니 데일 정도로 뜨거웠다") ② "기본값이 나쁘면 커스터마이즈 환경도 결함을 안고 있을 가능성이 크다" ③ "흩어진 오픈소스 진영은 정돈됐는데 OS 전체를 통제하는 한 회사(MS)는 오히려 흐트러졌다"는 역설 ④ 몸에 밴 Windows/Mac 유저에겐 리눅스도 "endless punches"일 수 있다는 균형 잡힌 반론.

## 내 생각 · 적용점

### 핵심 전이 1 — "기본값 = 제품 철학"은 온보딩·기본 설정 설계의 보편 원칙

이 글의 진짜 메시지는 Windows vs Linux가 아니다. **"커스터마이즈로 가릴 수 있는 문제라도, 기본값이 나쁘면 그 제품이 사용자를 어떻게 대하는지가 드러난다"**는 것이다. 우리가 만드는 어드민/게스트 화면도 마찬가지 — "설정에서 끌 수 있으니 괜찮다"가 아니라, 첫 진입 시 사용자가 마주하는 기본 상태가 제품의 태도를 규정한다. [[2026-07-06-less-is-more-ai-era]]의 "덜어냄"과 결이 같다.

### 핵심 전이 2 — 일관성은 성능만큼 중요한 UX 자산

"타이틀바 높이조차 제각각 → 몇 단어마다 언어가 바뀌는 책"이라는 비유는, 디자인 시스템/코드 컨벤션이 없을 때 사용자와 개발자가 치르는 인지 비용을 정확히 짚는다. [[2026-06-08-what-was-good-about-win2000-ui]]가 "옛 UI의 응집성"을 그리워한 것과 같은 축이고, 마침 같은 날 정리한 [[2026-07-12-good-tools-are-invisible]]("좋은 도구는 보이지 않는다")의 논지와 정확히 맞닿는다 — 도구가 계속 의식된다는 것은 도구가 사용자를 섬기지 못하고 있다는 신호.

### 핵심 전이 3 — "익숙함"을 "본질적 우수함"으로 착각하지 말 것

euphcat/Lobste.rs 반론의 핵심은 도구 평가의 메타 원칙이다. 기술 스택·프레임워크·에디터를 고를 때 "내가 익숙해서 빠른 것"과 "객관적으로 나은 것"을 분리해야 한다. [[2026-05-29-choose-boring-technology-2015]]·[[2026-05-28-favorite-developer-tools]]의 도구 선택 논의에 붙일 균형추.

## 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 별도 안내)

## 연관 자료
- [[2026-07-12-good-tools-are-invisible]] — *"좋은 도구는 보이지 않는다"와 "일관성이 인지 비용을 좌우한다"가 정확히 같은 축*
- [[2026-06-08-what-was-good-about-win2000-ui]] — *UI 응집성이라는 잃어버린 가치*
- [[2026-06-28-linux-older-hardware-revival]] — *리눅스 데스크톱의 실용적 위치*
- [[2026-05-29-proven-design-over-looking-futuristic]] — *화려함보다 검증된 설계·기본값 존중*

## 한 달 뒤 회고
*(2026-08-12 즈음 — CRS/어드민 화면에서 "설정으로 끌 수 있다"에 기대지 않고 기본 상태 자체를 다듬었는지, 화면 간 컴포넌트 일관성 점검을 한 번이라도 돌렸는지 기록.)*
