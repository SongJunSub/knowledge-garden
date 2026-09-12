---
title: "Proof of Capture (María Benavente·Alex Hornstein) — Apple Reference Image에 하루 늦게 맞불을 놓은 100달러 스테가노그래피 카메라"
source_title: "Proof of Capture: cryptographic media provenance for photos"
source_url: "https://merybenavente.me/blog/proof-of-capture"
source_name: "merybenavente.me (María Benavente 개인 블로그) · GitHub(merybenavente/proof_of_capture)"
referrer_url: "https://news.hada.io/topic?id=33552"
published_at: "2026-09-10"
summarized_at: "2026-09-12"
category: "ai"
tags: ["steganography", "image-provenance", "open-source-hardware", "apple", "watermarking", "c2pa", "deepfake-detection", "raspberry-pi"]
---

# Proof of Capture (María Benavente·Alex Hornstein)

> 출처: [Proof of Capture](https://merybenavente.me/blog/proof-of-capture) (María Benavente·Alex Hornstein, Recurse Center) · GeekNews(id=33552) 경유 · 정리일 2026-09-12

> **출처 한계**: 이번 세션은 `news.hada.io`·`merybenavente.me`·`news.ycombinator.com`·GeekNews 프랑스어 미러(`fr.news.hada.io`) 모두 egress 정책으로 직접 열람하지 못했다. 대신 ①GitHub 저장소 페이지(`github.com/merybenavente`, `github.com/merybenavente/proof_of_capture`)는 예외적으로 접근이 가능해 README 요지·기술 스펙(비트 구성, 하드웨어 부품, 가격)을 직접 확인했고, ②WebSearch로 교차 확인한 스니펫(Apple Reference Image와의 발표 시점 대조, HN 스레드 존재)을 보강했다. **hada 댓글 수·논조는 확인 불가.**

## 한 줄 요약

**Apple이 2026년 9월 9일 "센서로 찍은 사진임을 암호학적으로 증명"하는 Reference Image를 공개하자, 바로 다음 날 María Benavente·Alex Hornstein이 같은 문제를 겨냥한 오픈소스 대안 Proof of Capture를 내놓았다 — 메타데이터나 서버 기록에 의존하는 대신, ***촬영 순간 608비트 서명을 스테가노그래피로 픽셀 자체에 새겨*** 메타데이터가 지워지거나 재압축돼도 진위를 검증할 수 있게 만든 100달러 미만의 라즈베리파이 카메라다.**

## 핵심 포인트

- **접근 자체를 뒤집는다** — 사후에 "이 사진이 가짜인지" 탐지하는 대신, ***촬영되는 순간에 "이 사진이 진짜"임을 증명***하는 쪽으로 문제를 뒤집는다. Apple Reference Image는 서명된 데이터를 Apple Private Cloud Compute로 보내 "변경 불가능한 디지털 네거티브"로 별도 보관하는 방식인 반면, Proof of Capture는 ***서명 자체를 사진 픽셀 안에 스테가노그래피로 직접 새겨*** 메타데이터가 통째로 사라져도 서명이 사진과 함께 남는다.
- **608비트 페이로드** — `POC` 매직 넘버(32비트) + perceptual hash(64비트) + raw ECDSA 서명 r‖s(512비트) = 총 608비트를 Level-2 Haar DWT의 LL 서브밴드에서 DCT 계수를 quantization index modulation으로 조작해 심는다.
- **엄격한 일치가 아니라 perceptual hash** — 바이트 단위 완전 일치 대신 지각 해시(perceptual hash)를 서명해, ***재압축·리사이즈 같은 정상적인 변환은 통과시키면서 의도적 편집은 잡아낸다*** — WhatsApp급 압축을 견디도록 설계된 이유다. 모든 사진을 2048px 폭으로 정규화해 리사이즈 후에도 블록 그리드 동기화를 유지한다.
- **100달러 미만 하드웨어** — Raspberry Pi Zero 2W($18) + Pi Camera Module 3($35) + ATECC608 보안 요소 칩($6) + 아케이드 버튼($3) + microSD($8) + 3D 프린트 케이스. 암호화 키가 하드웨어 보안 요소 안에 있어 소프트웨어만으로는 위조 서명을 만들기 어렵다.
- **Recurse Center에서 여름 동안 완성** — 두 저자가 프로그래머 리트리트 Recurse Center에서 만난 사이, "카메라 애호가" 둘의 여름 프로젝트로 시작해 GitHub에 오픈소스로 공개했다(`merybenavente/proof_of_capture`, 조회 시점 31커밋).
- **Apple 발표와의 타이밍** — Apple Reference Image 발표(9/9)와 Proof of Capture 공개(9/10) 사이가 단 하루라는 점이 화제의 핵심 축이다 — 같은 문제의식(생성 AI 사진과 실사진 구분)에 빅테크의 폐쇄형 서버 기반 해법과 개인 개발자의 오픈소스 하드웨어 해법이 거의 동시에 등장한 대조.

## 인상 깊은 문장

> "A camera that cryptographically signs photographs at the moment of capture, so anyone can later verify they are real."
> (촬영 순간에 사진에 암호학적으로 서명해, 누구나 나중에 그것이 진짜임을 검증할 수 있게 하는 카메라.)

## 댓글

**출처 한계**: `news.hada.io` 접근이 이번 세션 내내 차단돼 **hada 댓글 수·논조는 확인 불가**. Hacker News에 별도 제출(`news.ycombinator.com/item?id=49649222`, 제목 "Proof of Capture: Apple Reference Image, but open source and using steganography")이 있는 것은 WebSearch로 확인했지만, HN 페이지 직접 열람이 막혀 ***정확한 포인트·댓글 수는 확인하지 못했다***. WebSearch 스니펫으로 잡힌 논조 하나는 회의적 지적이다 — 이 방식이 편집을 감지는 하지만 "어디까지가 정당한 편집(크롭·보정)인지 문서화하고 원본 이미지 ID로 연결하는 추가 인증 레이어가 없다"는 지적, 그리고 서명 방식 자체가 은밀한 추적 수단으로 쓰일 수 있다는 우려다. 이 역시 검색 스니펫을 통한 재구성이라 원문 대조는 하지 못했다.

## 내 생각 · 적용점

### 핵심 전이 1 — [[2026-06-30-claude-code-steganographic-marking]]과 정확히 같은 기법, 정반대의 투명성

Claude Code가 날짜 문자열의 유니코드 아포스트로피에 리셀러·증류 탐지 신호를 몰래 심었던 사건과, 이 카메라는 ***"눈에 띄지 않게 픽셀/텍스트 안에 정보를 숨긴다"***는 기법 자체는 동일하다. 그런데 목적과 공개성이 정반대다 — Claude Code 사례는 사용자 모르게 사업적 감시 신호를 심어 리버스 엔지니어링으로 발각되며 신뢰 논란을 낳았고, Proof of Capture는 스테가노그래피를 쓴다는 사실 자체를 공개하고 검증 방법까지 오픈소스로 배포한다. **같은 도구가 은폐냐 공개냐에 따라 완전히 다른 신뢰 결과를 낳는다**는 걸 나란히 두고 보면 확인할 수 있다 — 스테가노그래피 자체는 중립적 기술이고, 신뢰를 가르는 건 "발견됐을 때 무엇을 하려던 것인지 설명할 수 있는가"다.

### 핵심 전이 2 — [[2026-08-16-how-ai-text-watermarking-works]]의 "거쳤다 vs 썼다" 한계를 정반대 방향에서 우회한다

AI 텍스트 워터마킹은 ***"이 글이 AI를 거쳤다"***는 약한 신호만 줄 뿐 ***"누가 썼다"***는 증명하지 못한다는 근본적 한계가 있었다 — 사람 글을 AI가 교정만 봐도 마크가 붙는다는 게 문제였다. Proof of Capture는 반대 방향에서 같은 인증 문제를 푼다 — "이게 AI가 아니라 특정 카메라 센서가 특정 순간에 찍은 것"이라는 ***양성 증명(positive proof)***을 촬영 시점에 만들어, AI 생성물과 실사진을 사후 추정이 아니라 사전 서명으로 가른다. 텍스트 워터마킹이 "출력에 약한 흔적을 남기는" 접근이라면, 이 카메라는 "입력(캡처) 시점에 강한 서명을 만드는" 접근이라는 점에서, 같은 진위 판별 문제를 완전히 다른 지점(생성 후 vs 생성 시점)에서 공략한다.

### 핵심 전이 3 — [[2026-06-01-korea-mandatory-ai-image-censorship]]의 "사후 검열"과 정확히 반대되는 해법 축

한국의 이미지 검열 의무화 규제는 ***"이미 업로드된 이미지를 AI로 사후 스캔"***해 딥페이크·비동의 음란물을 걸러내려 했고, 그 노트가 지적한 실효성 문제는 "진짜 제작자는 국내 규제를 우회한다"는 것이었다. Proof of Capture는 정반대 축에 있다 — 사후 검열이 아니라 ***촬영 시점의 능동적 증명***으로 문제를 다룬다. 다만 두 접근은 서로 대체재가 아니라 보완재에 가깝다 — 검열은 "나쁜 이미지가 퍼졌을 때 걸러내는" 수단이고, Proof of Capture는 "좋은 이미지가 진짜임을 증명하는" 수단이라 애초에 노리는 위협 모델이 다르다(전자는 악의적 합성 유포, 후자는 진위 논쟁 발생 시 검증).

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 니치하지만 원칙은 옮겨온다.** 온다 CRS/PMS 생태계에서 사진 진위가 걸리는 지점은 있다 — 객실 파손 클레임 사진, 청소 전후 인증 사진, 게스트 신원 확인용 셀프 촬영 등이다. 지금은 대부분 "타임스탬프 메타데이터"나 "업로드 시점 서버 기록"에 의존하는데, 이런 메타데이터는 재업로드·재압축 과정에서 쉽게 사라지거나 조작 여지가 있다. Proof of Capture가 보여주는 원칙 — ***"사후 검증이 아니라 촬영 시점에 하드웨어 보안 요소로 서명해, 편집 여부를 이후 어떤 경로로도 되돌릴 수 있게 만든다"*** — 은 호스트-게스트 간 파손·정산 분쟁에서 "그 사진이 진짜 그 시점에 찍힌 원본인가"를 다툴 때 참고할 만한 설계 방향이다. 다만 라즈베리파이 기반 전용 하드웨어를 게스트·호스트에게 쥐여줄 수는 없으니, 직접 적용은 스마트폰 카메라 앱 차원의 서명(Apple Reference Image 계열)이 보편화된 뒤에나 현실적이라는 한계는 정직하게 밝힌다.

## 연관 자료

- [[2026-06-30-claude-code-steganographic-marking]] — 같은 스테가노그래피 기법을 은폐 목적(리셀러 탐지)으로 쓴 사례, 이 글의 공개 목적과 정반대 신뢰 결과를 대조
- [[2026-08-16-how-ai-text-watermarking-works]] — "거쳤다 vs 썼다"의 텍스트 워터마킹 한계와, 촬영 시점 양성 증명이라는 이 글의 다른 해법 축
- [[2026-06-01-korea-mandatory-ai-image-censorship]] — 사후 검열 규제와 촬영 시점 사전 증명이라는 대비되는 두 축(대체재가 아니라 보완재)

## 한 달 뒤 회고

*(2026-10-12 즈음 — news.hada.io·HN 접근이 풀리면 실제 댓글 수·논조와 "추적 악용 가능성" 비판의 구체 내용을 1차 출처로 확인했는지, Apple Reference Image와의 상호 채택(예: Apple이 오픈 표준을 참고했는지) 소식이 있었는지 점검.)*
