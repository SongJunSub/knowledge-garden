---
title: "\"단어를 신중하게 골랐을 뿐\" (Unsung, aresluna.org) — 고정폭 글꼴의 양쪽 정렬은 도구가 아니라 문장 자체를 고쳐써서 만든다"
source_title: "\"I just chose words carefully.\""
source_url: "https://unsung.aresluna.org/i-just-chose-words-carefully/"
source_name: "Unsung (aresluna.org)"
referrer_url: "https://news.hada.io/topic?id=33063"
published_at: "2026-08 (미확인, 최선 추정)"
summarized_at: "2026-08-31"
category: "frontend"
tags: ["typography", "justified-text", "monospace-font", "fixed-width", "web-history", "craftsmanship"]
---

# "단어를 신중하게 골랐을 뿐" — 고정폭 글꼴 위에서 문장으로 만든 양쪽 정렬

> 출처: ["I just chose words carefully."](https://unsung.aresluna.org/i-just-chose-words-carefully/) (Unsung, aresluna.org) · 정리일 2026-08-31

## 한 줄 요약

**1990년대 후반 GameFAQs에 올라온 Super Metroid 공략글(rs1n, 약 17,000단어·1,700줄)은 본문 전체의 오른쪽 끝이 글자 단위로 정확히 맞춰진 완전 양쪽정렬이다. 놀라운 건 도구가 아니라 방법 — 고정폭(모노스페이스) ASCII 텍스트에는 자동 정렬 프로그램도, 이중 공백도, 하이픈 연결도 쓰지 않았다. 저자는 그저 "단어를 신중하게 골라서 오른쪽 끝이 맞도록" 문장 자체를 고쳐 썼을 뿐이다. Unsung 블로그는 이 오래된 공략글을 다시 끌어와, 조판이 위도우·오리펀을 피하려고 문장을 손질하는 관행이 화면 텍스트에서는 거의 사라졌다는 점을 짚는다.**

## 핵심 포인트

- **원 공략글**: GameFAQs 아이디 `nemes1ss`(실명 rs1n)가 1996~2000년 사이 작성한 *Super Metroid FAQ/Speed Guide*. 약 17,000단어, ***약 1,700줄 전체가 오른쪽 끝까지 완전 정렬***.
- **고정폭 글꼴의 근본 제약**: 가변폭 글꼴(책·워드프로세서)은 문자마다 폭이 달라 단어 간격을 미세 조정해 정렬할 여지가 있지만, ***고정폭에서는 모든 글자·공백의 폭이 동일***해서 남는 공간을 밀어넣으려면 단어 사이를 벌리는 수밖에 없고, 그 결과가 고르게 나뉘지도 않는다.
- **하이픈 연결도 답이 아니다**: 조판이 흔히 쓰는 줄바꿈 하이픈은 고정폭 화면에서는 지나치게 도드라져 보이고, ***복사·붙여넣기를 방해***해 깔끔한 해법이 되지 못한다.
- **선택한 해법: 문장 자체를 고친다** — 자동 정렬기·이중 공백을 쓰지 않고, ASCII 편집기에서 각 줄이 우측 경계에 정확히 맞도록 ***단어를 골라 문장을 다시 쓰는*** 방식. 저자의 말대로 ***"I just chose words carefully so that everything lined up on the right hand side."***
- **10여 년째 반복 재조명**: 2013년 Matt Gemmell의 트윗, 2021년 Neatorama·Michael Tsai 블로그, 그리고 이번 Unsung 포스트까지 — 같은 공략글이 인터넷에서 주기적으로 "발견"되며 화제가 된다.

## 인상 깊은 문장

> "I just chose words carefully so that everything lined up on the right hand side."

> "It's not done with hyphenation or variable spacing. It's monospaced text in a monospaced font. […] which is _manually_ fully justified… via word choice. Just because the author could." (Matt Gemmell, 이 공략글을 소개하며)

## 댓글

**hada.io 자체가 이 세션에서 egress 차단**돼 hada 댓글 수를 확인하지 못했다. HN에는 "I just chose words carefully." 스레드(id=49503601)가 존재하는 것을 WebSearch로 확인했고, 검색엔진 스니펫상 포인트·댓글 수가 노출되긴 했으나 `news.ycombinator.com` 자체도 이 세션에서 차단돼 직접 열어 대조하지 못했다 — 정확한 수치로 신뢰하지 말 것. Lobsters 큐레이션 여부도 미확인. **출처 한계**: `news.hada.io`, `unsung.aresluna.org`, `news.ycombinator.com`, `gamefaqs.gamespot.com`, `metafilter.com`, `strategywiki.org`, `en.wikipedia.org` 등 이번 세션에서 시도한 거의 모든 1차 도메인이 egress 프록시에 막혀, 이 노트 전체를 WebSearch 스니펫 교차검증만으로 재구성했다. 원문(Unsung 블로그)의 정확한 게시일과 저자 실명, 원 공략글 저자 표기(`rs1n`/`rsln` 등 검색 스니펫마다 흔들림)는 확정하지 못해 최선 추정으로 남긴다.

## 내 생각 · 적용점

### 핵심 전이 1 — 도구를 안 쓴 게 아니라 도구의 결과가 마음에 안 들어서 재료를 고쳤다

[[2026-08-27-weekday-calculation-mersenne-bit-tricks]]의 나눗셈 대신 곱셈·시프트 3연산으로 요일을 구하는 트릭과 이 공략글은 같은 동기 구조를 공유한다 — 둘 다 "쓸 수 있는 적절한 도구"(자동 정렬 프로그램 / 나눗셈 연산)가 있는데도 그 결과(이중 공백의 지저분함 / 느린 연산)가 마음에 안 들어서, 더 원시적인 재료(단어 선택 / 비트 연산)를 직접 조작해 제약을 정면돌파했다. 제약이 오히려 더 정교한 손기술을 요구한다는 공통점.

### 핵심 전이 2 — 같은 고정폭 제약, 다른 레이어에서 공략

[[2026-07-06-jetendard-font-korean-devfont]]는 고정폭 코딩 폰트가 한글·영문 자간 불균형을 만드는 문제를 ***렌더링 레이어(글자 스케일 조정)***에서 풀었다. 이 공략글은 같은 고정폭 제약을 ***콘텐츠 레이어(단어 선택)***에서 풀었다. 둘 다 "고정폭이라는 물리적 제약은 못 바꾸니, 그 위/아래 레이어를 조작해 가독성을 만든다"는 동일한 문제 구조의 다른 해법.

### 핵심 전이 3 — 아무도 요청하지 않은 완성도

[[2026-08-27-make-what-nobody-asked-for]]가 말하는 "비즈니스 근거 없이 존재부터 하는 작업이 취향·정체성을 훈련한다"는 이 공략글에 정확히 들어맞는다. 게임 공략에 완전 양쪽정렬을 요구한 사람은 아무도 없었다 — 17,000단어를 그 기준에 맞춰 고쳐 쓴 건 순전히 저자 자신의 기준이었다. 결과물의 실용적 가치(공략 정보)와 무관한 형식적 완성도에 투자한 이 사례는, "쓸모의 제약이 없는 작업이 오히려 주의력을 훈련한다"는 그 노트의 주장을 뒷받침하는 구체적 증거다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 매우 멀다** — 예약 시스템에 완전 양쪽정렬 텍스트가 필요할 일은 없다. 다만 원칙 하나는 전이 가능하다: 고정폭·제한폭 출력(SMS 예약 확인, 영수증 프린터, 일부 PMS 콘솔의 고정폭 로그 화면)에서 텍스트가 어색하게 줄바꿈될 때, 렌더링 로직을 더 정교하게 만드는 대신 ***문구 자체를 그 폭에 맞게 다듬는*** 선택지가 있다는 태도 정도. 이번 배치 3건 중 CRS 접점이 가장 얕은 글임을 정직하게 밝힌다.

## 연관 자료
- [[2026-08-27-weekday-calculation-mersenne-bit-tricks]] — 적절한 도구 대신 원시 재료를 손으로 조작해 제약을 돌파한 같은 동기 구조
- [[2026-07-06-jetendard-font-korean-devfont]] — 같은 고정폭 제약을 렌더링 레이어에서 공략한 대응 사례
- [[2026-08-27-make-what-nobody-asked-for]] — 쓸모와 무관한 완성도 투자라는 이 사례의 일반 원리

## 한 달 뒤 회고
*(2026-09-30 즈음 — 이 글이 계기가 되어 가든 자체의 노트 포맷에서 "굳이 손볼 필요 없는 곳까지 손보고 있진 않은지" 되짚어볼 것. HN 스레드(id=49503601)를 직접 열 수 있게 되면 포인트·댓글 수를 정정.)*
