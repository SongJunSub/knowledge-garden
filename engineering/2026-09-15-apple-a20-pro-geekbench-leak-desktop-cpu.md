---
title: "Apple A20 Pro, 유출된 Geekbench 7 스코어가 싱글코어에서 데스크톱 i9·Ryzen 9를 앞질렀다 (Tom's Hardware 등) — 지난주 이 가든이 정리한 '지속 성능 40%'라는 공식 발표가, 이번엔 실제 실리콘 유출 벤치마크로 (부분적으로) 확인됐다"
source_title: "Apple's A20 Pro shatters Geekbench 7 single-core record — 2nm chip beats desktop Intel Core i9 and AMD Ryzen 9 by up to 32%"
source_url: "https://www.tomshardware.com/pc-components/cpus/apples-a20-pro-shatters-geekbench-7-single-core-record-2nm-chip-beats-desktop-intel-core-i9-and-amd-ryzen-9-by-up-to-32-percent"
source_name: "Tom's Hardware"
referrer_url: "https://news.hada.io/topic?id=33673"
published_at: "2026-09-11 (추정, 복수 매체 보도 기준)"
summarized_at: "2026-09-15"
category: "engineering"
tags: ["apple", "a20-pro", "geekbench", "cpu-microarchitecture", "single-thread-performance", "benchmark-leak", "2nm-process"]
---

# Apple A20 Pro, 유출된 Geekbench 7 스코어가 싱글코어에서 데스크톱 i9·Ryzen 9를 앞질렀다 (Tom's Hardware 등)

> 출처: [Apple's A20 Pro shatters Geekbench 7 single-core record — 2nm chip beats desktop Intel Core i9 and AMD Ryzen 9 by up to 32%](https://www.tomshardware.com/pc-components/cpus/apples-a20-pro-shatters-geekbench-7-single-core-record-2nm-chip-beats-desktop-intel-core-i9-and-amd-ryzen-9-by-up-to-32-percent) (Tom's Hardware) · GeekNews(id=33673) 경유 · 정리일 2026-09-15

## 한 줄 요약
**출시(9월 18일) 전 유출된 Geekbench 7 스코어에서 Apple의 2나노 A20 Pro가 싱글코어 4,006점을 기록해, AMD Ryzen 9 9950X3D를 26%, Intel Core i9-14900KS를 최대 32% 앞질렀다 — 데스크톱 CPU를 스마트폰 칩이 싱글코어에서 넘어선, Geekbench 7 기준 신기록이다.** 다만 이건 출시 전 유출 샘플 하나(n=1)의 벤치마크이고, 멀티코어(11,460점)에서는 코어 수가 많은 데스크톱 CPU가 여전히 앞선다는 점, 그리고 Geekbench 자체가 실사용 성능의 좁은 단면만 보여주는 합성 벤치마크라는 한계도 함께 봐야 한다.

## 핵심 포인트
- **유출 스코어** — A20 Pro가 Geekbench 7에서 ***싱글코어 4,006점, 멀티코어 11,460점***을 기록. 전작 A19 Pro 대비 각각 약 25%·28% 향상으로, Geekbench 7 싱글코어 신기록.
- **데스크톱 CPU 대비** — 싱글코어 기준으로 ***AMD Ryzen 9 9950X3D(16코어)를 26%, Intel Core i9-14900KS를 최대 32%*** 앞선다는 게 이번 보도의 핵심 수치. 스마트폰 SoC가 하이엔드 데스크톱 CPU를 싱글코어 합성 벤치마크에서 정면으로 넘어선 사례로 보도됐다.
- **멀티코어는 여전히 데스크톱 우위** — 11,460점이라는 멀티코어 점수 자체는 준수하지만, 코어 수가 훨씬 많은 데스크톱 CPU의 멀티스레드 성능에는 못 미친다 — ***싱글코어 우위와 멀티코어 열세가 공존***하는, 저전력·소수 고성능 코어 설계의 전형적인 프로필이다.
- **n=1 유출이라는 한계가 명시적으로 지적됨** — 여러 매체가 "표본 하나에 소금을 좀 뿌려야 한다(a sample of one to sprinkle salt upon)"는 식으로 직접 경고했다. 정식 출시(9/18) 전 유출 벤치마크는 사전 양산 실리콘·비공식 소프트웨어 빌드일 가능성이 있어, 실제 출하 기기의 지속 성능·발열 하 성능과 다를 수 있다.
- **Geekbench 자체의 한계** — Geekbench는 실사용 성능의 대리 지표일 뿐이라는 지적도 함께 따라왔다 — 짧은 구간 벤치마크라 순간 성능은 잘 보여주지만, 지속 부하 상황의 실사용 체감과는 다를 수 있다는 것.

## 인상 깊은 문장
> "Apple's A20 Pro shatters Geekbench 7 single-core record — 2nm chip beats desktop Intel Core i9 and AMD Ryzen 9 by up to 32%" (Tom's Hardware, 기사 제목)

> "Geekbench isn't the best indicator of real-world performance, and this is just a sample of one to sprinkle salt upon." (복수 매체 논조를 WebSearch로 재구성 — 원문 문장 그대로의 직접 대조는 못함)

## 댓글
**정직하게 밝힌다** — GeekNews(id=33673) 원문과 Tom's Hardware 기사 본문 모두 이 세션의 egress 정책으로 WebFetch 차단됐다. 관련 Hacker News 스레드(`item?id=49653448`, 제목 "Apple A20 Pro Geekbench Result")의 존재는 WebSearch로 확인했지만, 페이지 자체가 차단돼 ***댓글 수·정확한 포인트·논조는 확인하지 못했다.*** hada 댓글 수도 마찬가지로 확인 불가. 대신 WebSearch로 Tom's Hardware·Notebookcheck·Inven Global·Beebom·KAD·Archynewsy 등 복수의 독립 매체를 교차확인했고, 핵심 수치(싱글코어 4,006점·멀티코어 11,460점, Ryzen 9 9950X3D 대비 26%, i9-14900KS 대비 32%)가 일치했다. "n=1이고 합성 벤치마크라 salt를 뿌려야 한다"는 경고도 매체 여럿에서 독립적으로 나왔다는 점은 신뢰도를 조금 높이지만, 어느 매체도 유출 스코어의 출처(어느 기기·어느 빌드에서 나왔는지)를 명확히 밝히지 않았다는 점은 이 보도 자체의 한계로 남는다. 벤치마크 유출 기사 특유의 이해관계도 감안해야 한다 — 트래픽이 잘 나오는 주제라 "신기록"·"32% 앞질렀다" 같은 강한 표현이 헤드라인에 쓰이기 쉽다.

## 내 생각 · 적용점

### 핵심 전이 1 — 일주일 전 이 가든이 정리한 공식 발표가, 이제 (부분적으로) 실제 벤치마크로 확인되는 순간
[[2026-09-10-apple-iphone-18-pro-a20-chip]]에서 Apple 자체 발표를 정리하며 "성능 수치는 전부 Apple 자체 발표이며 독립 벤치마크는 출시 이후에나 나온다"고 못 박고, 한 달 뒤 회고 항목에 "독립 리뷰(Geekbench 등)가 GPU 40%·AI 2배·지속성능 40% 주장과 얼마나 일치하는지 확인"이라고 적어뒀었다. 이번 유출이 바로 그 첫 데이터 포인트다 — 다만 정확히 같은 항목을 확인해주는 건 아니다. 그 노트가 강조한 건 "지속 성능"(장시간 부하 하 성능 유지)이었는데, 이번 유출은 순간 스코어인 Geekbench 싱글/멀티코어 점수라 ***지속 성능 주장 자체를 검증해주지는 않는다.*** "싱글코어가 데스크톱 CPU를 앞선다"는 이번 결과와 "지속 성능이 40% 좋아졌다"는 지난주 공식 주장은 서로 다른 축이라는 걸 구분해서 봐야 한다.

### 핵심 전이 2 — Xring O3가 "따라잡았다"던 목표선을, 이번엔 Apple 스스로 데스크톱 CPU 너머로 밀어냈다
[[2026-08-25-xiaomi-xring-o3-cpu-apple-level-single-thread]]가 다룬 서사는 "샤오미가 실행 포트·캐시를 늘려 Apple급 싱글스레드에 근접했다"는, 경쟁사가 Apple을 기준점 삼아 따라붙는 구도였다. 이번 A20 Pro 유출은 그 기준점 자체가 이동했다는 걸 보여준다 — "Apple급 싱글스레드"의 비교 대상이 이제 다른 모바일 SoC가 아니라 ***데스크톱 하이엔드 CPU***로 넓어졌다. 두 노트를 겹치면, "싱글스레드 성능 경쟁"이 모바일 SoC 사이의 경쟁에서 모바일 vs 데스크톱의 경계 자체를 흐리는 경쟁으로 확장되고 있다는 흐름이 보인다 — 다만 양쪽 다 벤더 자체 발표거나 검증되지 않은 유출 수치라, 이 흐름 자체도 아직은 마케팅과 실측 사이 어딘가에 있다는 걸 함께 기록해둔다.

## 호스피탈리티 / CRS 적용 포인트
정직하게 밝힌다 — 이 글은 소비자용 스마트폰 칩의 유출 벤치마크라, 온다(B2B 호스피탈리티/CRS) 관점의 직접 적용은 없다. [[2026-09-10-apple-iphone-18-pro-a20-chip]]에서 이미 짚었듯 온다가 아이폰 칩 설계에 영향을 줄 수 있는 영역이 아니다. 굳이 원칙만 하나 남기면, ***"벤더 발표 수치"와 "제3자 유출 벤치마크"와 "독립 리뷰 실측치"는 신뢰도가 서로 다른 세 단계이고, 이번처럼 아직 두 번째 단계(유출)에 머문 주장을 세 번째 단계(검증됨)로 오인하지 않는 습관***은 벤더가 제시하는 성능·비용 지표를 검토할 때(PMS·채널매니저 등 협력사의 "속도 개선 N%" 주장 포함) 일반적으로 전이할 수 있는 원칙이다.

## 연관 자료
- [[2026-09-10-apple-iphone-18-pro-a20-chip]] — A20 Pro 공식 발표 노트, 이번 유출이 검증(혹은 부분 검증)하는 대상
- [[2026-08-25-xiaomi-xring-o3-cpu-apple-level-single-thread]] — "모바일 SoC가 Apple급 싱글스레드를 따라잡는다"는 같은 서사의 이전 장, 기준점이 이동했음을 보여주는 대조

## 한 달 뒤 회고
*(2026-10-15 즈음 — 9/18 정식 출시 이후 독립 리뷰어의 Geekbench·실사용 벤치마크가 이번 유출 스코어(싱글 4,006·멀티 11,460)와 얼마나 일치하는지, 그리고 [[2026-09-10-apple-iphone-18-pro-a20-chip]]이 예고했던 "지속 성능 40%" 주장도 함께 검증되는지 확인.)*
