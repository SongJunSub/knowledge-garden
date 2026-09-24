---
title: "Google, 목소리를 만들고 연기까지 지시하는 Gemini 3.8 TTS 공개 — 대사 하나하나에 감정과 숨소리를 지정하는 것이 새 기본값이 된다"
source_title: "Gemini 3.8 Flash TTS and Gemini 3.8 Flash-Lite TTS"
source_url: "https://blog.google/innovation-and-ai/models-and-research/gemini-models/gemini-3-8-text-to-speech/"
source_name: "Google 공식 블로그, GeekNews(id=34194) 경유"
referrer_url: "https://news.hada.io/topic?id=34194"
published_at: "2026-09-23"
summarized_at: "2026-09-24"
category: "ai"
tags: ["gemini", "tts", "voice-cloning", "google", "speech-synthesis", "voice-design"]
---

# Google, 목소리를 만들고 연기까지 지시하는 Gemini 3.8 TTS 공개

> 출처: [Gemini 3.8 Flash TTS and Gemini 3.8 Flash-Lite TTS](https://blog.google/innovation-and-ai/models-and-research/gemini-models/gemini-3-8-text-to-speech/) (Google 공식 블로그, GeekNews 경유) · 정리일 2026-09-24
>
> **출처 한계**: `news.hada.io`·`blog.google` 모두 egress 차단으로 원문 직접 열람은 못 했다. GeekNews 발췌(4개 불릿, 마지막 문장 "Google 발표…"에서 잘림)와 WebSearch(Unite.AI, MarkTechPost, fonearena, runtimewire 등 다수 2차 보도의 스니펫) 교차확인으로 재구성했다. 벤더 자체 발표라 "목소리 정체성이 흔들리지 않는다"는 품질 주장은 검증되지 않은 자사 서술이다.

## 한 줄 요약

**Google이 자연어로 목소리와 말투를 설계하고 대사별로 연기를 지시할 수 있는 Gemini 3.8 Flash TTS와, 대량·저비용 음성 생성에 최적화한 Flash-Lite TTS를 동시에 공개했다 — 2,000개 이상의 기성 목소리와 100개 이상의 언어를 지원하며, 30초 샘플로 목소리를 복제할 수 있다.**

## 핵심 포인트

- **창의적 연출용 Flash TTS와 대량·저비용용 Flash-Lite TTS로 이원화** — Flash TTS는 ***게임·오디오북·팟캐스트 등 깊은 창의적 연출과 캐릭터 디자인***을 겨냥하고, Flash-Lite TTS는 ***더빙·음성 콘텐츠·음성 에이전트처럼 고빈도·저비용 사용***에 최적화됐다.
- **자연어로 목소리를 설계하거나 30초 샘플로 복제** — 원하는 역할·억양·특성을 문장으로 설명해 ***새 목소리를 직접 설계***할 수 있고, ***2,000개 이상의 기성 목소리***도 제공한다. 목소리 복제는 ***30초 음성 샘플***로 이뤄지며, 본인 목소리이거나 사용 권한이 있는 목소리여야 하고 ***음성 동의 녹음을 원본 화자와 대조***하는 절차가 있다고 밝힌다.
- **대사 단위로 연기·감정·리듬을 지시** — 대사마다 ***속도·감정·웃음·한숨·맞장구(backchanneling)***까지 개별 지정할 수 있고, 두 사람이 주고받는 대화나 수 시간 분량의 오디오에서도 ***목소리 정체성·톤·음색·공간감을 일관되게 유지***한다고 주장한다(독립 검증 없음).
- **100개 이상의 언어·방언 지원** — 멕시코 스페인어·퀘벡 프랑스어·스코틀랜드 영어 같은 ***지역 방언까지 구분***해 지원한다는 점이 확인됐다. Hume AI 창업자 Alan Cowen이 이 발표에 크레딧으로 언급됐다는 보도(runtimewire)도 있으나 정확한 역할은 확인하지 못했다.

## 인상 깊은 문장

> "We're launching Gemini 3.8 Flash TTS and Gemini 3.8 Flash-Lite TTS ⚡️ Our most expressive audio models yet let you create custom voices across 100+ languages or pick from 2,000+ ready-to-use ones."
> (Google AI 공식 X(트위터) 계정, WebSearch로 확인한 발표 문구)

## 댓글

**확인 불가.** hada 댓글 수는 원문 접근 차단으로 확인하지 못했다. HN이나 Lobsters의 별도 큐레이션 스레드도 WebSearch로는 특정하지 못했다 — 발표 당일(2026-09-23)이라 아직 반응이 충분히 쌓이지 않았을 가능성이 있다. **벤더 자체 발표**이므로 "목소리 드리프트 없음", "수 시간 일관 유지" 같은 품질 주장은 마케팅 표현으로 감안해서 읽어야 하고, 딥페이크 음성 오용을 막기 위한 "동의 녹음 검증" 절차의 실효성도 원문만으로는 판단할 수 없다.

## 내 생각 · 적용점

### 핵심 전이 — "빠름 vs 깊음"을 나눈 Gemini 3.8 Live의 이원화 전략이 TTS에도 그대로 반복된다

[[2026-09-16-gemini-3-8-live-extended-thinking]]에서 짚었던 것처럼 Google은 같은 3.8 세대에서 실시간 대화용 Live와 고난도 추론용 Extended Thinking을 별도 모델로 쪼갰다. 이번 TTS 공개도 같은 논리다 — ***창의적 연출이 필요한 저빈도·고품질 용도(Flash TTS)와, 대량·저비용이 필요한 고빈도 용도(Flash-Lite TTS)를 처음부터 다른 모델로 분리***한 것이다. 한 모델에 "빠름"과 "깊음", 혹은 "표현력"과 "비용 효율"을 동시에 욱여넣지 않는다는 같은 설계 철학이 음성 계열에서도 반복되는 셈이다.

### 핵심 전이 — 로컬 완전 무료 음성 복제와 정면으로 대비된다

[[2026-09-08-voicestudio-local-voice-cloning]]은 계정도 API 키도 없이 내 컴퓨터 안에서 끝내는 완전 로컬 보이스 스튜디오였고, [[2026-08-22-huggingface-speech-to-speech-local-voice-agent]]도 로컬 구동을 기본값으로 설계한 오픈소스 파이프라인이었다 — 두 사례 모두 "프라이버시와 비용 통제"를 우선한다. 이번 Gemini 3.8 TTS는 정반대 축이다 — ***2,000개 이상의 목소리 라이브러리, 100개 이상 언어, 클라우드 규모의 인프라***를 내세우며 규모와 표현력으로 승부한다. 같은 "목소리 복제" 기능이라도 로컬 오픈소스는 통제권을, 클라우드 대형 벤더는 범위와 품질을 판다는 대비가 뚜렷하다.

## 호스피탈리티 / CRS 적용 포인트

전화 예약·컨시어지 음성 응대처럼 실시간성이 중요한 채널에 "대사마다 웃음·한숨·맞장구까지 지정하는" 수준의 연출력이 실제로 필요한지는 회의적이다 — 오히려 과도하게 감정 표현이 짙은 응대 음성은 고객 신뢰를 해칠 수도 있어, **직접 적용은 제한적**이라고 정직하게 밝힌다. 다만 전이 가능한 원칙은 있다 — 100개 이상 언어·방언을 지원한다는 점은, 다국어 숙박 예약 안내나 IVR 스크립트를 여러 언어로 일관된 브랜드 보이스로 대량 생성하는 데는 원칙적으로 쓸모가 있다. 도입을 검토한다면 "연기 지시" 기능보다 "다국어 일관 보이스" 기능 쪽이 CRS 맥락에 훨씬 가깝다.

## 연관 자료

- [[2026-09-16-gemini-3-8-live-extended-thinking]] — 같은 Gemini 3.8 세대의 "빠름 vs 깊음" 이원화 전략, TTS의 Flash/Flash-Lite 분리와 같은 설계 철학
- [[2026-09-08-voicestudio-local-voice-cloning]] — 완전 로컬 무료 음성 복제, 이번 클라우드 대형 라이브러리와 정반대 축
- [[2026-08-22-huggingface-speech-to-speech-local-voice-agent]] — 로컬 구동을 기본값으로 삼은 오픈소스 음성 파이프라인, 같은 대비 축
- [[2026-08-28-gemini-35-transcribe]] — 같은 회사의 직전 음성 계열(STT), 이번엔 반대 방향인 TTS

## 한 달 뒤 회고

*(2026-10-24 즈음 — 독립 진영(Artificial Analysis 등)의 음성 품질 벤치마크가 나왔는지, "동의 녹음 검증" 절차가 실제 딥페이크 음성 오남용 방지에 효과가 있었는지, 국내 서비스에 이 TTS가 채택된 사례가 나왔는지 점검.)*
