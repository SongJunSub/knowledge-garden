---
title: "계속되는 Bambu Lab의 3D 프린터 AGPL 위반 — 소스를 숨긴 벤더가, 그 소스를 되찾으려던 개발자에게 DMCA를 겨눴다"
source_title: "An ongoing 3D-printer AGPL violation"
source_url: "https://lwn.net/SubscriberLink/1089390/46116614cc74b814/"
source_name: "LWN.net"
referrer_url: "https://news.hada.io/topic?id=32921"
summarized_at: "2026-08-27"
category: "engineering"
tags: ["open-source", "agplv3", "license-violation", "right-to-repair", "3d-printing", "reverse-engineering"]
---

# 계속되는 Bambu Lab의 3D 프린터 AGPL 위반

> 출처: [An ongoing 3D-printer AGPL violation](https://lwn.net/SubscriberLink/1089390/46116614cc74b814/) (LWN.net) · 정리일 2026-08-27
> **출처 한계**: `news.hada.io`·`lwn.net`(구독자 전용 링크)·`sfconservancy.org`·`tomshardware.com`·`notebookcheck.net`·`3dprintingindustry.com`·`itsfoss.com`·`korben.info` 전부 이 세션에서 접근이 막혔다. LWN 원문은 애초에 구독자 전용(SubscriberLink)이라 접근이 가능했더라도 전문 열람은 어려웠을 것이다. 아래 내용은 WebSearch가 반환한 여러 매체(SFC 공식 발표 요약, Tom's Hardware, Notebookcheck, mayhemcode.com, Slashdot 등)의 스니펫을 교차 검증해 재구성한 것이다. **사건 자체의 골격(위반 유형·DMCA·SFC 대응)은 다수 독립 매체에서 일관되게 확인돼 신뢰도가 높지만, 정확한 인용문·타임라인 세부(정확한 날짜)는 원문 대조를 못했다.** 또한 이 GeekNews 토픽이 "계속되는"이라는 제목을 단 걸 보면 SFC가 2026년 5월 18일에 위반을 최초 공식 확인한 사건의 **후속 업데이트성 기사**로 추정되나, 이 정확한 GeekNews 게시 시점의 새 사실관계는 특정하지 못했다.

## 한 줄 요약

**Bambu Lab은 경쟁사의 AGPLv3 라이선스 슬라이서 소프트웨어 PrusaSlicer를 수정해 자사 제품 Bambu Studio를 만들면서, 4년 넘게 완전한 대응 소스(Corresponding Source)를 공개하지 않았다.** Software Freedom Conservancy(SFC)는 2026년 5월 이를 두 가지 AGPLv3 위반으로 공식 확인했다 — **①소스 미공개, ②라이선스로 보장된 권리를 행사한 개발자에 대한 공격적 법적 위협.** 후자의 당사자는 폴란드 개발자 **Paweł Jarczak** — 그는 Bambu Lab이 "Bambu Connect" 미들웨어로 없애버린 직접 프린터 제어 기능을, AGPLv3 슬라이서인 OrcaSlicer를 포크해(`OrcaSlicer-BambuLab`) 되살렸다. Bambu Lab은 그에게 **비공개 중지 요구서(cease-and-desist)**를 보내 리버스 엔지니어링·User-Agent 문자열을 이용한 사칭·**DMCA 1201조**(5~10년 징역·25만 달러 벌금 위협)를 근거로 들었다 — 그가 한 일은 사실상 **동일한 User-Agent 문자열을 쓰는 네트워크 코드를 리버스 엔지니어링한 것**뿐이었다. 커뮤니티(Louis Rossmann·Gamers Nexus 등 유튜버 포함)가 그의 코드를 미러링하며 반발했고, Bambu Lab은 이후 법적 압박에서 물러섰다는 보도가 나왔다. SFC는 대체 소프트웨어 개발과 법적 집행을 계속 추진 중이라고 밝혔다.

## 핵심 포인트

- **AGPLv3 위반 ①: 소스 미공개** — Bambu Lab이 PrusaSlicer(AGPLv3)를 기반으로 Bambu Studio를 만들었다고 4년간 공개적으로 밝혀왔음에도, **완전한 대응 소스 코드를 제공하지 않았다.** 일부 기능은 **동적으로 불러오는 `.so` 파일**과 Bambu Lab 서버에서 도는 **독점 애플리케이션**을 결합해 제공되는데, 이는 네트워크 서비스 뒤에 AGPL 코드의 일부를 숨기지 못하게 한 **AGPLv3의 근본 취지와 정면 충돌**한다.
- **AGPLv3 위반 ②: 권리 행사에 대한 보복** — Paweł Jarczak가 AGPLv3가 보장하는 권리(소스 기반 수정·재배포)를 행사해 만든 포크에 대해, Bambu Lab이 **법적 위협으로 그 권리 행사 자체를 억누르려 했다.**
- **Jarczak 사건 경위** — 2026년 4월 23일, 그는 Bambu Lab이 "Authorization Control System"으로 제거한 직접 프린터 제어 기능을 되살린 `OrcaSlicer-BambuLab` 포크를 GitHub에 공개했다. Bambu Lab은 같은 달 **비공개 중지 요구서**를 보내 ①리버스 엔지니어링 ②하드코딩된 버전으로 공식 Bambu Studio를 사칭했다는 혐의 ③**DMCA 1201조**(기술적 보호조치 우회 금지 조항, 형사 처벌 위협 포함)를 근거로 들었다. 실제로 그가 한 일은 **동일한 User-Agent 문자열을 쓰는 네트워크 코드를 리버스 엔지니어링**한 것 — User-Agent 문자열 설정 자체가 사칭이 아니라는 건 이미 확립된 판례라는 지적이 커뮤니티에서 나왔다.
- **커뮤니티 반발과 미러링** — 유튜버 **Louis Rossmann**과 **Gamers Nexus**가 Jarczak의 `OrcaSlicer-BambuLab` 코드를 재호스팅해 지지 의사를 밝혔고, SFC도 해당 코드가 포함된 OrcaSlicer를 미러링하며 대응에 나섰다.
- **Bambu Lab의 후퇴** — 이후 보도(Notebookcheck)에 따르면 Bambu Lab은 SFC의 공개 비판과 "법적 위협" 지적 이후 **Jarczak에 대한 법적 압박에서 물러섰다.**
- **SFC의 계획** — 위반을 공식 확인한 뒤 **대체 소프트웨어 개발 지원과 법적 집행(legal enforcement)**을 함께 추진하겠다고 밝혔다 — 단순 성명이 아니라 실제 소송·컴플라이언스 압박으로 이어질 가능성을 열어둔 셈이다.

## 인상 깊은 문장

> (WebSearch로 재구성, SFC 발표 취지) "Bambu does not provide the complete, Corresponding Source Code for their Slicer software, and has publicly stated for four years that Bambu's slicer is a modified version of PrusaSlicer."
> (4년간 스스로 인정해온 사실과, 4년간 하지 않은 의무가 정확히 같은 문장 안에 있다)

> (WebSearch로 재구성, mayhemcode.com 제목) "Paweł Jarczak Fixed Something That Bambu Broke — Then They Threatened Him."
> (이 사건 전체를 한 문장으로 압축한다 — 벤더가 없앤 기능을 고객이 라이선스가 보장한 권리로 되살렸더니, 그 벤더가 법으로 위협했다)

## 댓글

- **hada 댓글 수·논지 확인 불가**(news.hada.io 차단).
- **원출처(LWN)는 구독자 전용**이라 댓글란(LWN 특유의 고품질 기술 커뮤니티 토론)의 논조도 확인하지 못했다 — LWN이 이 소재를 다뤘다는 사실 자체가, 이 사건이 오픈소스 라이선스 커뮤니티에서 진지하게 취급되고 있다는 방증이긴 하다.
- **Slashdot에도 별도 토픽("Open Source Project Shuts Down Over Legal Threats from 3D Printer Company Bambu Lab")이 있다는 것은 확인**했으나, 댓글 내용 자체는 확인하지 못했다.

## 내 생각 · 적용점

### 핵심 전이 1 — "소유했다고 통제하는 건 아니다"가 소프트웨어 벤더에서도 똑같이 반복된다

[[2026-08-25-reverse-engineering-my-peripherals-ownership]]에서 정리한 결론은 ***"값을 치렀다고 그 기기의 동작을 실제로 통제하는 건 아니며, 그 통제를 되찾는 비용이 문제"***였다 — 주변기기 제조사가 서명 검증을 부실하게 걸어 소유주의 통제권을 사실상 박탈한 사례였다. 이 Bambu Lab 사건은 **같은 문제의 법적 버전**이다 — Jarczak은 Bambu Lab이 벤더 록인으로 없앤 기능을 AGPLv3가 이미 보장한 권리(소스를 보고 고칠 권리)로 되찾으려 했을 뿐인데, 벤더는 그 권리 행사 자체를 DMCA로 막으려 했다. **하드웨어 쪽은 "서명 검증이 허술해 몰래 되찾을 수 있었던" 사례였고, 이쪽은 "라이선스가 공식적으로 되찾을 권리를 줬는데도 법으로 막힌" 사례다** — 통제권을 되찾는 두 가지 다른 경로(기술적 우회 vs 법적 권리)가, 결국 둘 다 벤더의 저항에 부딪힌다는 점에서 같은 패턴을 보여준다.

### 핵심 전이 2 — "소스가 곧 확장 시스템"이라는 주장이 여기서는 방어가 아니라 공격당하는 쪽의 무기였다

[[2026-08-04-devtools-must-be-open-source]]가 다룬 David Crawshaw의 주장은 ***"소스 코드가 있어야 개인화할 수 있다"***는 긍정적 프레이밍이었다. 이 사건은 그 주장이 왜 옳은지를 **정반대 방향에서** 증명한다 — Bambu Lab이 소스를 숨기지 않았다면 Jarczak이 애초에 "리버스 엔지니어링"을 할 필요조차 없었을 것이다. **AGPLv3 같은 강한 카피레프트 라이선스는 정확히 이런 상황(벤더가 소스를 숨기고 기능을 제거)을 막기 위해 설계됐는데, 그 라이선스가 지켜지지 않으면 사용자는 결국 리버스 엔지니어링이라는 더 위험하고 법적으로 불안정한 경로로 내몰린다.** 소스 공개 의무는 "친절"이 아니라, 이런 강제 우회 경로 자체를 없애는 안전장치라는 걸 이 사건이 보여준다.

## 호스피탈리티 / CRS 적용 포인트

- **AGPLv3 등 강한 카피레프트 라이선스 코드를 온다 내부에서 수정·통합할 때 대응 소스 공개 의무를 정확히 점검한다.** 온다가 직접 AGPL 코드를 임베드하거나 SaaS 형태로 서비스한다면(네트워크 서비스도 AGPLv3의 "배포"에 해당), 이 사건이 정확히 보여준 함정 — 일부 기능을 독점 서버·동적 모듈로 분리해 "기술적으로는 소스를 숨긴다"는 판단 — 을 절대 반복하지 않는다.
- **벤더 종속(vendor lock-in) 리스크 평가에 "라이선스 준수 이력"을 항목으로 추가할 만하다.** CRS가 통합하는 PMS·POS·결제 벤더가 오픈소스를 기반으로 하면서 준수 의무를 지키지 않는 이력이 있다면, 그건 기술 부채가 아니라 **법적 리스크가 우리 공급망에 그대로 전이**된다는 신호다.
- 직접 적용은 여기까지다 — 3D 프린터 슬라이서라는 소재 자체는 CRS와 거리가 멀고, DMCA 1201조 위협의 구체적 형사법 리스크는 온다 실무와 별개다.

## 연관 자료
- [[2026-08-25-reverse-engineering-my-peripherals-ownership]] — "소유했다고 통제하는 건 아니다"라는 같은 문제의 기술적(비공식) 버전 vs 이 사건의 법적(공식 권리) 버전
- [[2026-08-04-devtools-must-be-open-source]] — "소스가 곧 확장 시스템"이라는 주장이, 이 사건에서는 그 소스가 없을 때 사용자가 치르는 대가로 뒤집혀 나타남

## 한 달 뒤 회고
*(2026-09-27 즈음 — ①LWN·SFC 원문 접근이 가능해지면 이 노트의 재구성 내용을 원문과 직접 대조. ②SFC가 예고한 "대체 소프트웨어 개발·법적 집행"이 구체적으로 어떤 형태로 나왔는지. ③Bambu Lab이 결국 대응 소스를 실제로 공개했는지, 아니면 계속 미룬 채 "계속되는" 상태로 남았는지 확인.)*
