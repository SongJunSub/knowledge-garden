---
title: "Java 클래스 파일은 왜 0xCAFEBABE로 시작할까? — 이름이 정해지기도 전에 정해진 매직 넘버"
source_title: "Why CAFEBABE?"
source_url: "https://www.artima.com/insidejvm/whyCAFEBABE.html"
source_name: "Artima (Bill Venners), GeekNews(id=34148) 경유"
referrer_url: "https://news.hada.io/topic?id=34148"
published_at: "2026-09-22 (정확한 게시일 미확인, 원 인터뷰는 2000년대 초반)"
summarized_at: "2026-09-23"
category: "backend"
tags: ["java", "jvm", "class-file", "magic-number", "history", "hexspeak"]
---

# Java 클래스 파일은 왜 0xCAFEBABE로 시작할까?

> 출처: [Java 클래스 파일은 왜 0xCAFEBABE로 시작할까?](https://news.hada.io/topic?id=34148) (Artima, GeekNews 경유) · 정리일 2026-09-23
>
> **출처 한계**: `news.hada.io`·`artima.com` egress 차단으로 원문 직접 열람 불가. GeekNews 발췌(4개 불릿, 마지막 문장 잘림)와 WebSearch(Artima "Why CAFEBABE?" Patrick Naughton 인터뷰, InfoWorld, Hexspeak 위키백과) 교차확인으로 재구성했다.

## 한 줄 요약

**모든 Java 클래스 파일의 첫 4바이트는 언어 이름이 "Java"로 정해지기도 전에, Java 원년 멤버 Patrick Naughton이 재미있고 기억하기 쉬운 값을 찾다가 즉흥적으로 고른 0xCAFEBABE이며, 실제로는 Peet's Coffee의 바리스타들을 가리키는 농담이 언어 이름과 우연히 맞아떨어진 결과다.**

## 핵심 포인트

- **1996년부터 이어진 개발자들의 추측과 궁금증** — Java 클래스 파일은 ***`0xCAFEBABE`라는 4바이트 식별값***으로 시작하며, 1996년 이 값의 유래를 묻는 질문에 개발자들의 추측과 말장난이 이어졌다.
- **커피를 연상시키지만, 언어 이름이 정해지기 전에 정한 값** — 원년 멤버 Patrick Naughton에 따르면 이 값은 ***"언어에 Java라는 이름이 붙기 전에" 정한 값***으로, 재미있고 기억하기 쉬운 숫자를 찾은 결과다 — Java라는 이름과의 연관성은 순전한 우연이었다.
- **Peet's Coffee의 바리스타들을 가리키는 표현이었다는 후일담** — Naughton은 이 값이 ***Peet's Coffee의 바리스타들을 가리키는 표현***이었다고 답했으며, 다른 후보로는 `0xDEADBABE`가 있었다.
- **James Gosling은 다른 후일담을 남김** — 덧글에 연결된 후일의 설명에서는 ***James Gosling이 식당 별명인 'Cafe Dead'에서 `CAFEDEAD`를 만들…*** [GeekNews 발췌 문장 잘림] — Java 클래스 파일 형식에는 이 밖에도 `0xDEADBEEF`, `0xDEADC0DE` 같은 다른 유명 hexspeak 매직 넘버들과 같은 계보의 개발자 문화(재미있고 기억하기 쉬운 16진수 단어 만들기)가 반영돼 있다.

## 인상 깊은 문장

> "재미있고 유일하며 기억하기 쉬운 것을 찾고 있었다. 0xCAFEBABE가 Peet's Coffee의 귀여운 바리스타들을 가리키는 우회적 표현이었던 것은, 훗날 언어 이름이 Java가 된 것에 대한 예고였을 뿐 순전한 우연이었다."
> (Patrick Naughton, Artima 인터뷰, WebSearch 교차확인 재인용)

## 댓글

**확인 불가.** hada 댓글 수를 확인하지 못했다(원문 egress 차단). 이 일화 자체는 Artima·Quora·여러 기술 블로그에서 반복적으로 인용되는 잘 알려진 이야기이므로 신빙성은 높은 편이나, "언어 이름이 정해지기 전"이라는 시점과 "커피 이름과의 우연"이라는 서사가 여러 차례 재구성되며 각색됐을 가능성은 열어둔다.

## 내 생각 · 적용점

### 핵심 전이 — 가벼운 역사 일화지만, "레거시 포맷의 식별자는 함부로 못 바꾼다"는 원칙과 연결

이 자체는 가벼운 트리비아지만, 가든의 [[2026-09-16-java-27-ga-release]](최신 Java 릴리스)와 나란히 놓으면 흥미로운 대비가 생긴다 — Java는 27번째 메이저 버전에 이르도록 진화했지만, 1996년에 정해진 이 4바이트 매직 넘버는 30년째 그대로 모든 `.class` 파일의 첫 부분에 남아 있다. ***한 번 정해진 바이너리 포맷 식별자는 언어가 아무리 바뀌어도 바꾸기 어렵다***는, 하위 호환성의 관성을 보여주는 실증 사례로 읽을 수 있다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 멀다 — 가벼운 리소스·역사 이야기로, 억지로 CRS에 연결하지 않는다. 다만 "한 번 정한 파일 포맷 매직 넘버/버전 식별자는 이후 수십 년간 되돌리기 어렵다"는 교훈은, CRS 내부 데이터 포맷이나 API 버전 헤더를 처음 설계할 때 신중해야 한다는 원칙적 참고로만 남긴다.

## 연관 자료

- [[2026-09-16-java-27-ga-release]] — 최신 Java 릴리스, 30년 전 매직 넘버와의 대비

## 한 달 뒤 회고

*(2026-10-23 즈음 — 별도 회고 불필요. 가벼운 역사 트리비아로, 실무 적용을 계획하지 않는다.)*
