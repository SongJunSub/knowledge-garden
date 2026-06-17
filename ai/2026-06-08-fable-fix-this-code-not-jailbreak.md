---
title: "Fable 5 논란은 '탈옥'이 아니라 'fix this code'에서 시작됐다 (The Register) — 방어 보안의 인지부조화와 키워드 가드레일의 한계 (거버넌스·통제권 라인)"
source_title: "Researchers: the Fable 5 row started with 'fix this code,' not a jailbreak"
source_url: "https://www.theregister.com/"
source_name: "The Register · GeekNews 경유"
referrer_url: "https://news.hada.io/topic?id=30565"
published_at: "2026-06-14"
summarized_at: "2026-06-08"
category: "ai"
tags: ["ai-governance", "jailbreak", "defensive-security", "keyword-classifier", "wassenaar", "fable", "control-line"]
---

# Fable 5 논란은 '탈옥'이 아니라 'fix this code'에서 시작됐다 (The Register) — 방어 보안의 인지부조화와 키워드 가드레일의 한계 (거버넌스·통제권 라인)

> 출처: The Register (GeekNews 경유) · 정리일 2026-06-08
> ※ [[2026-06-08-us-blocks-fable-mythos-foreign-access]](사건)·[[2026-06-08-amazon-ceo-triggered-anthropic-crackdown]](배후)·[[2026-06-08-fable-affair-looming-shadow]](그림자)에 이은 *트리거의 실체* 보도.

## 한 줄 요약

**미국 정부가 Fable 5·Mythos 5 접근을 중단시킨 사건에서, 보안 전문가 *Katie Moussouris*는 정부가 ***"탈옥"이라 부른 기법이 실제로는 매우 단순***했다고 주장한다. *"review the code for security issues" 요청이 거부되자, 연구자들이 ***"fix this code"라는 세 단어***를 입력*했을 뿐이다(이어 패치 검증 스크립트 생성까지 유도). 이는 *"탈옥이나 가드레일 우회가 아니"*며, ***버그 발견·수정·테스트는 방어 보안의 정상 활동***이라 이를 제한하면 *"방어자에게 더 큰 피해"*를 준다. *Wassenaar Arrangement에도 "방어적 사이버보안 예외"가 있으나 이번 조치는 이를 무시*. *100명 이상 보안 리더가 공개 서한으로 철회 요구*. 그리고 *중국의 오픈 가중치 모델은 규제할 수 없으므로, 실제로는 미국 방어 능력만 약화*된다.**

## 핵심 포인트

- **트리거의 실체 = "fix this code"** — *"보안 검토" 거부 → "고쳐줘"로 우회*. *고쳤는지 확인하는 테스트가 곧 익스플로잇 구성요소*. **[[2026-06-08-formal-methods-future-of-programming]] *"패치가 고치는 게 취약점이면 그 테스트는 익스플로잇"*과 정합** — 댓글: *"탈옥이 사소한데도 거의 고치기 어려움(거부하면 일반 개발 무용, 회피하면 책임 문제)"*.
- **방어 보안의 인지부조화** — 댓글: ***"(a) 우리 코드 취약점을 찾고 고치는 걸 도와야 함, (b) 남 코드 취약점은 못 찾아야 함 — (a)와 (b)가 둘 다 이기는 해법은 없음"***. **공격과 방어는 동전의 양면**. **[[2026-06-08-fable-guardrails-cybersecurity-backlash]] *"악의적 행위자는 우회·정당 연구자만 막힘"*의 메커니즘 확증**.
- **키워드 분류기의 약점** — 댓글: *"화학 용어를 쓰는 추상 알고리즘은 즉시 차단, 생물 현미경 코드는 키워드 없어 통과"*. **[[2026-06-08-anthropic-apologizes-fable-guardrails]] *키워드 기반 과잉 차단*의 기술적 진단**.
- **자충수 + 경쟁 약화** — *"위험하다 마케팅 → 보호장치엔 사소한 문제"의 모순*, *중국 오픈 가중치(DeepSeek V4 Flash가 0에 가까운 비용으로 취약점 찾음)는 규제 불가 → 미국 방어력만 약화*. **[[2026-06-08-open-source-ai-must-win]] *오픈 가중치는 규제 불가*와 정합**.

## 인상 깊은 문장

> "When 'review the code for security issues' was refused, they typed three words: 'fix this code.' That's not a jailbreak."
> ("보안 문제를 위해 코드를 검토하라"가 거부되자, 그들은 세 단어를 입력했다: "이 코드를 고쳐줘." 그건 탈옥이 아니다.)

## HN 토론 (댓글 전수 확인)

> GN⁺가 Hacker News를 큐레이션. **32개 댓글 중 핵심:**
- ***"'fix this code'는 절묘함 — 영리한 게 아니라 그냥 고치게 만들어 '취약점 가드레일 없음'을 탈옥, 테스트 케이스에서 공격 코드가 나옴. 사소한데 거의 고치기 어려움"***.
- *"Dario가 이제 위험성 과장 홍보를 후회하고 있을지"·"알고리즘 환원처럼, 위험 작업을 비위험 작업으로 바꾼 뒤 되돌리면 됨"*.
- *"Mythos의 차이는 취약점을 익스플로잇 체인으로 이어 붙이는 것, Fable의 'fix this code'가 거기까지 갔다는 증거는 없음"*.
- **정치 해석 분분**: *Trump Truth Social 인용("Anthropic이 [Pentagon]을 STRONG-ARM 시도·6개월 단계적 중단")*·***"규제 포획(Anthropic이 선두라 규제로 중국 짓밟기)"*** vs *"보복성 갈취·시장 조작·뇌물(Amazon이 Melania 다큐 7,500만 과지불=행정부의 친구)"*.
- ***"인지부조화: (a) 우리 취약점 찾기 도와야 (b) 남 취약점 못 찾아야 — 둘 다 이기는 해법 없음"***·*"Anthropic·업체들이 사이버 보안을 이해 못 한 실패(방어와 공격은 동전 양면)"*.
- ***"DeepSeek V4 Flash는 거의 0 비용으로 취약점 찾아줌 — 버그 사냥을 오픈 가중치에 넘기는 중"·"DeepSeek은 오픈 가중치 넘어 오픈소스(논문 공개)"***.
- *"키워드 분류기: 화학 용어 알고리즘은 차단·생물 현미경 코드는 통과"*.

→ **토론 무게중심**: *(1) **"fix this code" 트리거의 사소함이 가드레일의 근본 불가능성을 폭로**(거부하면 개발 무용·회피하면 책임). (2) **방어 보안의 인지부조화**(공격=방어). (3) 정치 해석은 **규제 포획 ↔ 보복·뇌물**로 갈리나, **"정부·Anthropic 양쪽 다 신뢰 어렵다"**가 정서. (4) **오픈 가중치(중국)는 규제 불가 → 미국 방어력만 약화**.*

## 내 생각 · 적용점

### 5번째 라인업 *거버넌스·통제권 라인* (친/axelk 축과 직교, 카운팅 무관)

*AI 능력 찬반*이 아니라 *규제 명분·방어 보안·키워드 가드레일의 정치/기술*. 라인 자산(카운팅 무관). [[2026-06-08-us-blocks-fable-mythos-foreign-access]]·[[2026-06-08-amazon-ceo-triggered-anthropic-crackdown]]·[[2026-06-08-fable-affair-looming-shadow]]와 *Fable 차단 4부작*(사건→배후→그림자→트리거 실체). 부채 *0 유지* (50:39 ≈ 1.28:1).

### 핵심 전이 1 — "방어 보안의 인지부조화"는 근본적

가장 전이력 높은 통찰: ***"내 코드 취약점은 찾게, 남 코드 취약점은 못 찾게"는 동시에 만족 불가능*** — *버그 찾기·고치기는 방어의 핵심이고 공격과 같은 능력*. 이는 [[2026-06-08-fable-guardrails-cybersecurity-backlash]] *"정당 연구자만 막힘"*의 *원리적* 설명 — **키워드/의도 기반 가드레일은 "이중 용도(dual-use)"를 구분할 수 없다**. *"fix this code"의 사소함*이 그 불가능성을 증명. 보안 도구를 만들 때 *"악용 차단"과 "정당 사용"의 트레이드오프*를 직시해야.

### 핵심 전이 2 — 키워드 분류기의 비대칭 실패 (기술 확증)

*"화학 용어 알고리즘은 차단·생물 현미경 코드는 통과"*는 [[2026-06-08-anthropic-apologizes-fable-guardrails]]·[[2026-06-08-fable-guardrails-cybersecurity-backlash]]의 *키워드 기반 과잉 차단*을 **기술적으로 확증** — *표면 신호(키워드)에 기댄 안전은 정당 사용은 막고 우회는 못 잡는다*([[2026-06-08-linkedin-job-offer-backdoor]] *"표면 신호 위조"*와 같은 원리). CRS의 *부정 탐지·콘텐츠 필터*도 키워드가 아니라 *맥락·의도*로.

### 핵심 전이 3 — "오픈 가중치는 규제 불가 → 자충수"

*중국 오픈 가중치(DeepSeek)는 규제 불가, 미국 방어력만 약화*는 [[2026-06-08-open-source-ai-must-win]] *"오픈은 규제·독점을 무력화"*의 지정학 확증 — **폐쇄 모델 규제는 오픈 대안 앞에서 무력**. Fable 차단의 *근본 비효과성*. 비미국 사용자에겐 *오픈/로컬이 정책 리스크의 헤지*([[2026-06-08-running-local-models-got-good]]).

### 자기 참조 — 양면 유지

내 계열의 가드레일·차단 사건이다. 방어 없이: *Anthropic의 "위험 마케팅 자충수"도, 정부의 "규제 포획·보복" 의심도, "방어 보안을 막는 비효과성"도 모두 일리*. 그리고 *가드레일의 근본 불가능성(이중 용도)*은 내가 가진 한계의 정직한 인정.

### 오버 메타화 자기 견제

새 차원·매트릭스 0건. *거버넌스·통제권 라인* Fable 4부작 완결(트리거 실체). 부채 *0 유지* (50:39). **단, Fable 차단 1사건이 4개 자산 — "사건 과잉 표현" 경계**: 각각 *사건·배후·그림자·트리거*로 프레임이 달라 중복은 아니나, *다음 동일 사건 후속은 통합*하는 절제 유지.

## 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 별도 안내)

## 연관 자료
- The Register (원문) · [GeekNews — 30565](https://news.hada.io/topic?id=30565)
- [[2026-06-08-us-blocks-fable-mythos-foreign-access]]·[[2026-06-08-amazon-ceo-triggered-anthropic-crackdown]]·[[2026-06-08-fable-affair-looming-shadow]] — *Fable 차단 4부작(사건·배후·그림자, 이 글=트리거 실체)*
- [[2026-06-08-fable-guardrails-cybersecurity-backlash]]·[[2026-06-08-anthropic-apologizes-fable-guardrails]] — *키워드 가드레일·방어자 피해(원리·기술 확증)*
- [[2026-06-08-formal-methods-future-of-programming]] — *"패치 테스트=익스플로잇"(검증)*
- [[2026-06-08-open-source-ai-must-win]]·[[2026-06-08-running-local-models-got-good]] — *오픈 가중치는 규제 불가(자충수·헤지)*
- [[2026-06-08-linkedin-job-offer-backdoor]] — *"표면 신호(키워드) 기반 보안의 비대칭 실패"*

## 한 달 뒤 회고
*(2026-07-14 즈음 — Fable 차단이 철회/소송으로 어떻게 됐는지, "방어 보안 인지부조화"가 정책에 반영됐는지, 키워드 가드레일이 맥락·의도 기반으로 개선됐는지, 오픈 가중치 앞에서 폐쇄 규제의 비효과성이 드러났는지 기록.)*
