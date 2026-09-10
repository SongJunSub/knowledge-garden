---
title: "Desert Ant Labs, 기기에서 직접 처리하는 로컬 AI 모델 18개 공개 (Desert Ant Labs) — 자사 영상 앱의 클라우드 API 호출(Dolby·Claude Sonnet)을 자체 소형 모델로 대체하며 얻은 처방"
source_title: "On-device intelligence for every product"
source_url: "https://desertant.com/blog/introducing-desert-ant-labs/"
source_name: "Desert Ant Labs 자체 발표, GeekNews(id=33446) 경유"
referrer_url: "https://news.hada.io/topic?id=33446"
published_at: "2026-09-08"
summarized_at: "2026-09-10"
category: "ai"
tags: ["on-device-ai", "local-inference", "small-specialized-models", "source-available-license", "cost-per-call", "ios-android-sdk"]
---

# Desert Ant Labs, 기기에서 직접 처리하는 로컬 AI 모델 18개 공개

> 출처: [On-device intelligence for every product](https://desertant.com/blog/introducing-desert-ant-labs/) (Desert Ant Labs 자체 발표) · GeekNews(id=33446) 경유 · 정리일 2026-09-10

> **출처 한계**: 이 세션에서 `news.hada.io`(id=33446)와 `desertant.com` 둘 다 WebFetch 접속이 egress 정책으로 차단돼 원문을 1차로 직접 읽지 못했다. WebSearch로 desertant.com 블로그·모델 페이지·GitHub(`Desert-Ant-Labs/desert-ant-core`)·Hugging Face·Hacker News(item id=49624823) 스니펫을 교차 확인해 재구성했다. hada 자체 댓글 수·GN⁺ 큐레이션 여부는 확인 불가. 이번 발표는 벤더 자체 발표(n=1, 이해관계 당사자)이므로 성능 배수(4.7배·470배 등)는 전부 자체 벤치마크임을 감안해야 한다.

## 한 줄 요약

**유럽 스타트업 Desert Ant Labs가 2026년 9월 8일, 오디오·비전·텍스트 각각 한 가지 일만 하는 소형 특화 모델 18개(안정 12개, 베타 6개)를 iOS·Android·Web SDK로 동시 공개했다.** 각 모델은 기기 안에서 완전히 오프라인으로 돌며, 자사가 5년째 만들어온 영상 편집 앱 Detail이 클립 자동편집·오디오 개선 같은 기능을 넣을 때마다 클라우드 API(Dolby, Claude Sonnet)로 폴백해야 했던 경험에서 출발했다. 핵심 주장은 "반복 작업마다 대형 모델을 호출하는 대신, 작업 하나에 맞춘 작은 모델을 로컬에서 돌리면 서버 왕복도, 호출당 비용도, 기기 밖으로 나가는 데이터도 없앨 수 있다"는 것이다. 다만 무게추가 있다 — SDK 코드는 오픈소스가 아니라 "Desert Ant Labs Source-Available License"(비-OSI, GitHub이 비표준 라이선스로 분류)이고, SDK당 월간활성기기(MAU) 10만 대까지만 무료다. "로컬 무료"와 "오픈소스"는 이 발표에서 다른 말이다.

## 핵심 포인트

- 출시일 **2026-09-08**, 총 **18개 모델 = 안정 12개 + 베타 6개**. SDK는 Swift·Kotlin·JavaScript(각각 Core ML·LiteRT·WebAssembly 기반)로 제공, 가중치는 Hugging Face에 공개.
- 대표 모델 **Voz**(음성 전사) — 아이폰에서 **10분 분량 오디오를 2초에 전사**하며 ***"OpenAI Whisper보다 4.7배 빠르다"***, 단어별 시작·종료 타임스탬프까지 포함.
- **Clear**(오디오 개선) — **9MB** 모델이 노트북 녹음을 "스튜디오 사운드"로 **1초 만에**(iPhone 16 Pro, 실시간 대비 **302배** 속도) 변환 — Detail 앱이 쓰던 Dolby 오디오 개선 API를 대체한 자리.
- **Clips**(영상 하이라이트 추출) — **284MB** 모델이 10분 영상에서 약 12개 클립을 **5초 만에** 뽑아내며, ***"같은 품질로 (Claude) Sonnet보다 10배 빠르고 에너지는 470배 적게 쓴다"***(자체 주장) — Detail 앱이 쓰던 Claude Sonnet 기반 클립 선별을 대체한 자리.
- 나머지 안정 모델: Redact(PII 마스킹), Tongue(언어 감지), Uhm(간투사 감지), Ear(발화 언어 판별), Align(단어 정렬). 베타 6개: Eye(이미지 미학 랭킹), Face(얼굴 탐지), Moderator(음란물 감지), Schemer(타입 지정 JSON 추출), Toxic(혐오발언 탐지), Who(화자 분리).
- 가격 정책: SDK당 월간활성기기 10만 대까지 무료, 사용자당 추론 횟수는 무제한. 그 이상 구간의 가격은 공개되지 않았다. 코드 라이선스는 비-OSI "소스공개"(Source-Available) — Apache/MIT 같은 진짜 오픈소스는 아니다.
- Hacker News 반응(item id=49624823, WebSearch로 확인된 **310포인트·84댓글**) — 가장 많이 나온 불만은 ***"Python SDK가 없다"***는 것이었고, 회사 측은 "온다"고만 답했을 뿐 일정은 공개하지 않았다.

## 인상 깊은 문장

> "음성 인식, 녹음 음질 개선, 개인정보 가리기 등을 기기 안에서 처리하는 소형 특화 모델 18개를 공개함. 안정 버전 12개와 베타 6개로 구성" (Slack 요약 발췌)

> "반복 작업마다 대형 모델 API를 호출하는 대신 작업에 맞는 작은 모델을 로컬에서 실행해, 서버 왕복과 호출당 비용 없이 데이터를 기기에 유지하는 방식임" (Slack 요약 발췌)

> "Little brains in every product." (desertant.com 홈페이지 타이틀, WebSearch 스니펫으로 확인)

## 댓글

GeekNews(id=33446) 원문은 `news.hada.io` 자체가 이 세션에서 차단돼 hada 댓글 수·GN⁺ 큐레이션 여부를 전혀 확인하지 못했다. 대신 WebSearch로 확인한 Hacker News 스레드(item id=49624823)는 310포인트·84댓글로 반응 자체는 뜨거웠던 것으로 보이고, 가장 두드러진 불만은 Python SDK 부재였다 — 즉 표면적으로는 성능·라이선스에 대한 회의보다 "쓰고 싶은데 내 스택이 지원 안 된다"는 실용적 아쉬움에 가까워 보인다. 다만 이 스레드도 WebFetch로 직접 열람하지 못해, 검색 스니펫에 안 잡힌 다른 논쟁(라이선스 비판, 벤치마크 회의론 등)이 있었을 가능성은 배제할 수 없다. 명백한 이해관계: 이번 발표는 벤더 자체 발표이자 자사 제품(Detail)의 마케팅을 겸한다 — 4.7배·470배 같은 비교 수치는 전부 자체 벤치마크이고 독립 검증은 확인되지 않았다.

## 내 생각 · 적용점

### 핵심 전이 1 — [[2026-05-11-local-ai-needs-to-be-the-norm]]의 이론이 실제 상용 제품에서 뒤집어 증명된 사례

그 노트의 명제는 "클라우드 의존이 제품의 본질을 바꾼다"와 "사용자 자기 데이터를 변환하는 작업(요약·분류·추출·재작성)에 로컬 모델이 적합하다"였다. Desert Ant Labs의 창업 서사가 정확히 그 명제를 당한 쪽의 시점에서 보여준다 — Detail 앱에 클립 자동편집·오디오 개선 기능을 넣는 순간 클라우드 API(Dolby, Claude Sonnet)에 의존하게 됐고, 그게 비용·속도 문제로 불거지자 아예 그 API 자리를 대체할 자체 모델을 만들어 되돌렸다. 이론이 먼저 있고 사례가 나중에 따라온 게 아니라, 이론이 예측한 고통을 실제로 겪은 팀이 처방까지 만들어 낸 흔치 않은 짝이다.

### 핵심 전이 2 — [[2026-08-11-meta-muse-glimmer-30b-local-agentic]]과 "로컬 AI"라는 같은 단어 아래 정반대 베팅이 대조된다

Muse Glimmer는 Apache 2.0으로 공개된 30B 범용 에이전트 모델 하나로 "상시 가동 로컬 에이전트"를 노렸다. Desert Ant Labs는 정반대다 — 18개의 초소형 단일 작업 모델(9MB~284MB급)을 쪼개서 내놓았고, 코드는 비-OSI 소스공개 라이선스에 MAU 10만이라는 무료 상한을 걸었다. 하나는 "큰 뇌 하나를 진짜 오픈소스로", 다른 하나는 "작은 뇌 여럿을 무료지만 폐쇄 라이선스로"다. 두 노트를 겹치면 "로컬 AI 붐"이라는 한 문구 아래 라이선스 철학도, 모델 크기 전략도 전혀 다른 두 갈래가 공존한다는 게 드러난다 — "로컬"이라는 말만 보고 오픈성·무료성을 같은 것으로 묶으면 안 된다는 실무 규칙이 여기서 나온다.

### 핵심 전이 3 — [[2026-08-24-local-llm-feels-dumber-than-benchmarks]]가 짚은 서빙 스택 리스크를 "스코프를 좁혀서" 회피하는 설계

그 노트의 급소는 범용 LLM을 어떤 어텐션 백엔드·KV 캐시 정밀도로 서빙하느냐에 따라 같은 가중치도 다른 모델처럼 동작한다는 것이었다. Desert Ant Labs의 18개 모델은 애초에 그 문제가 생길 여지를 줄이는 쪽으로 설계됐다 — 범용 LLM을 유연한 추론 엔진 위에 올리는 대신, 작업 하나당 모델 하나를 고정된 네이티브 런타임(Core ML·LiteRT·WASM)에 얹어 배포한다. 유연성을 버리고 예측 가능성을 산 셈이다. "서빙 스택 변동성을 어떻게 통제할까" 대신 "애초에 변동 여지가 없도록 스코프를 좁힐 수 있는가"라는 다른 질문을 던지는 사례로 읽힌다.

## 호스피탈리티 / CRS 적용 포인트

- 온다 CRS에도 반복적이고 좁은 작업에 매번 대형 LLM API를 호출하는 워크로드가 있다면(예: 리뷰 감정 분류, 문의 1차 언어 감지·분류, 짧은 다국어 번역, 정형 데이터 요약), Desert Ant Labs가 보여준 원칙 — "작업 하나에 맞춘 작은 모델을 로컬/자체호스팅으로 대체해 호출당 비용과 서버 왕복을 없앤다" — 은 비용 최적화 측면에서 그대로 참고할 만하다. 특히 Redact(PII 마스킹)·Tongue(언어 감지)·Schemer(타입 지정 JSON 추출) 같은 모델의 작업 범주는 예약자 개인정보 마스킹, 문의 언어 자동 감지, 비정형 텍스트→정형 데이터 추출처럼 CRS 도메인 이름만 바꾸면 거의 그대로 들어맞는다.
- 다만 이건 "이런 원칙이 있다"는 관찰이지, 온다가 실제로 이런 워크로드를 식별했거나 로컬/자체호스팅 전환을 검토·적용한 사례는 이 정리 시점에 확인된 바 없다. Desert Ant Labs의 모델 코드 자체도 비-OSI 소스공개 라이선스라 그대로 가져다 쓸 수 있는 게 아니라, 설계 원칙만 전이 가능하다.
- [[2026-08-24-local-llm-feels-dumber-than-benchmarks]]에서 짚었듯 이런 전환의 성패는 벤치마크가 아니라 자체 워크로드 골든셋으로 직접 재보는 데 달려 있다 — Desert Ant Labs의 4.7배·470배 수치도 자체 벤치마크이므로 도입 근거로 그대로 쓰면 안 되고, CRS 실제 데이터로 검증해야 적용 여부를 판단할 수 있다.
- 직접 적용은 아직 멀다는 걸 분명히 밝힌다 — 여기서 지금 가져갈 수 있는 건 도입 결정이 아니라, "반복 호출인가 / 작업 범위가 좁은가 / 데이터가 민감한가"라는 점검 체크리스트 정도까지다.

## 연관 자료

- [[2026-05-11-local-ai-needs-to-be-the-norm]] — "클라우드 의존이 제품 본질을 바꾼다"는 이론이 이번엔 실제 제품(Detail)의 창업 서사로 증명된 사례
- [[2026-08-11-meta-muse-glimmer-30b-local-agentic]] — 진짜 Apache 2.0 범용 30B 모델 vs 소스공개 라이선스의 18개 특화 소형 모델, 같은 "로컬 AI" 아래 다른 라이선스·스코프 베팅
- [[2026-08-24-local-llm-feels-dumber-than-benchmarks]] — 범용 LLM 서빙 스택의 변동 리스크를, 이번엔 스코프를 좁혀 회피하는 설계 대안

## 한 달 뒤 회고

*(2026-10-10 즈음 — ①Python SDK가 실제로 나왔는지 ②독립 벤치마크·커뮤니티 재현 검증(4.7배·470배 등 자체 수치)이 나왔는지 ③MAU 10만 초과 구간의 실제 가격이 공개됐는지 ④온다 CRS 워크로드 중 이 원칙을 적용해볼 후보를 실제로 식별했는지.)*
