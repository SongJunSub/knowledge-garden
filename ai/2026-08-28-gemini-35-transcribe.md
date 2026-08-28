---
title: "Gemini 3.5 Transcribe (Google): 실시간·녹음 음성을 정밀하게 텍스트로 변환 — WER은 제3자(Artificial Analysis)가 쟀지만, 비교 대상은 여전히 자사 이전 모델(Chirp 3)뿐이다"
source_title: "Intelligent transcription with Gemini 3.5 Transcribe"
source_url: "https://blog.google/innovation-and-ai/models-and-research/gemini-models/gemini-3-5-transcribe/"
source_name: "Google Blog (공식 발표)"
referrer_url: "https://news.hada.io/topic?id=32967"
published_at: "2026-08-26"
summarized_at: "2026-08-28"
category: "ai"
tags: ["gemini", "google", "speech-to-text", "stt", "voice-agent", "word-error-rate", "multimodal", "model-release", "call-center"]
---

# Gemini 3.5 Transcribe (Google): 실시간·녹음 음성을 정밀하게 텍스트로 변환

> 출처: [Intelligent transcription with Gemini 3.5 Transcribe](https://blog.google/innovation-and-ai/models-and-research/gemini-models/gemini-3-5-transcribe/) (Google Blog · GeekNews 경유, id=32967) · 정리일 2026-08-28
> **출처 한계**: `blog.google`·`news.hada.io`·`ai.google.dev`·`9to5google.com`·`the-decoder.com`·`marktechpost.com`·`news.ycombinator.com` 등 이 주제를 다룬 1차·2차 소스 대부분이 이 세션 네트워크 egress 정책으로 차단됐다. 아래 내용은 WebSearch가 반환한 여러 매체(the-decoder, 9to5google, MarkTechPost, GIGAZINE, Android Authority, Engadget, yourstory 등)의 스니펫을 교차 대조해 재구성한 것이고, `cloud.google.com`(파트너 블로그, 일본어)만 예외적으로 직접 fetch에 성공했다. GeekNews 원문·hada 댓글 수·논지는 전혀 확인하지 못했다. HN에 별도 스레드(item id 49468818, "Gemini-3.5-Transcribe")가 존재하는 것은 검색으로 확인했지만 포인트·댓글 수·논지는 페이지 자체가 차단돼 읽지 못했다. Lobsters 큐레이션은 검색에 잡히지 않았다(부재를 확인한 것이지, 없다고 단정할 근거는 약하다).

## 한 줄 요약

**Google이 2026-08-26 `Gemini 3.5 Transcribe`를 공개했다 — 배경 소음·전문 용어·말더듬·자기 수정까지 처리해 정돈된 텍스트로 바꾸는, 자사 역대 최고 정밀도의 음성-텍스트 모델이라고 주장한다.** 실시간 스트리밍용 `gemini-3.5-transcribe-live`(Live API, 1초 미만 지연)와 녹음 음성용 `gemini-3.5-transcribe`(Interactions API, 화자 구분 최대 3명·단어 단위 타임스탬프) 두 갈래로 나뉜다. **Artificial Analysis가 측정한 평균 단어 오류율(WER)은 스트리밍 4.0%·비스트리밍 2.6%**이고, 전작 Chirp 3 대비 최종 전사까지 걸리는 시간이 70% 줄었다고 밝혔다. 85개 이상 언어를 자동 감지하며 지역 억양·방언, 발화 단위 실시간 언어 전환(code-switching)까지 수동 설정 없이 처리하고, 맞춤 어휘로 업계 전문 용어·고유명사를 학습시킬 수 있다. 이미 Android Gboard의 음성 입력 기능 "Rambler"와 macOS Gemini 앱에 탑재됐고 Chrome 지원이 예고돼 있다. **다만 이번 발표에서 비교 대상은 처음부터 끝까지 자사 이전 모델(Chirp 3) 하나뿐이다** — WER을 제3자(Artificial Analysis)가 측정했다는 점이 신뢰도를 높이긴 하지만, 그 측정치를 놓고 견줄 경쟁 STT(Whisper, Deepgram, AssemblyAI, Azure Speech 등)는 이번 발표에도 검색으로 찾은 어떤 2차 소스에도 등장하지 않는다.

## 핵심 포인트

- **모델 두 갈래 — 스트리밍 vs 녹음, API가 다르다** — `gemini-3.5-transcribe-live`는 Live API에서 **1초 미만 지연의 양방향 스트리밍**을 지원해 대화형 음성 앱에 맞춰져 있고, `gemini-3.5-transcribe`는 Interactions API에서 **화자 구분(최대 3명 확정 지원, 3명 초과는 실험적)과 단어 단위 타임스탬프**를 붙여 녹음 음성(회의·통화·인터뷰)을 대상으로 한다. 같은 브랜드지만 용도가 처음부터 분리 설계됐다.
- **WER — 스트리밍 4.0% / 비스트리밍 2.6%, 제3자 측정** — Artificial Analysis가 측정한 수치라는 점이 ***이 발표를 다른 자사 벤치마크 발표와 구분 짓는 지점***이다. 다만 비교 기준은 여전히 Chirp 3(자사 전작)뿐이고, 경쟁사 STT와의 대조는 이번 발표·검색으로 찾은 2차 소스 어디에도 없다.
- **지연 — Chirp 3 대비 최종 전사 시간 70% 단축** — "최종 전사(final transcript)까지 걸리는 시간"이라는 표현이 정확히 무엇을 재는지(첫 토큰 지연인지 전체 완료 시간인지)는 원문을 직접 읽지 못해 확인하지 못했다 — 수치를 그대로 옮기되 정의는 불확정으로 남긴다.
- **85개 이상 언어 + 지역 억양·방언 + 발화 단위 언어 전환** — 언어 감지가 발화(utterance) 단위로 이뤄져, 한 세션 안에서 화자가 언어를 바꿔도(코드 스위칭) 수동으로 언어를 다시 지정할 필요가 없다고 보도됨. 다국어 게스트 응대처럼 언어가 실시간으로 섞이는 상황을 겨냥한 설계로 읽힌다.
- **맞춤 어휘(custom vocabulary)** — 업계 전문 용어·고유명사·철자를 사전에 제공해 인식률을 높이는 기능. 주문번호·우편번호·파일명 같은 구조화된 문자열 인식 사례가 보도에 언급됐다.
- **자기 수정·간투사 정리** — "화요일에 만나요 — 아니 수요일이요" 같은 발화 중 정정을 정돈된 텍스트로 반영하고, "음"·"어" 같은 간투사를 제거하며 자동 포맷팅한다고 밝혔다.
- **이미 제품에 탑재됨** — Android Gboard 음성 입력 기능 "Rambler", macOS Gemini 앱에 이미 적용됐고 Chrome 지원이 예고됐다. Google AI Studio와 Gemini Enterprise Agent Platform에서 공개 프리뷰로 제공된다.
- **파트너 블로그가 밝힌 타깃 업종** — `cloud.google.com`의 파트너용 블로그(일본어, 직접 fetch 성공)는 Gemini 기반 음성 전사의 적용 분야로 **콜센터/고객 상담(품질 보증·감정 분석), 미디어(자막), 의료(임상 기록), 법무(절차 기록), 기업 회의**를 명시한다. 단 이 글이 인용한 처리 용량 수치(Gemini 1.5 Pro 최대 22시간·1.5 Flash 최대 11시간 음성)는 **구세대 Gemini 1.5 기준**으로 보여, Gemini 3.5 Transcribe 자체의 스펙이 아니라 "Google이 음성 전사를 어느 업종에 팔고 있는가"라는 포지셔닝 참고 자료로만 읽어야 한다.

## 인상 깊은 문장

> "Google says Gemini 3.5 Transcribe has an average word error rate of 4.0% for streaming audio and 2.6% for non-streaming audio."
> (WebSearch로 재구성한 보도 인용 — 원문 blog.google 페이지 자체는 이 세션에서 열지 못해, Google의 정확한 표현이 아니라 이를 인용한 2차 보도의 문장이다.)

> "Removes filler words from transcribed speech too. If someone changes their mind halfway through a sentence, the model can tidy up the correction instead of leaving a messy transcript behind."
> — 이번 모델이 파는 것은 "받아쓰기 정확도"가 아니라 **"편집자가 정리한 것 같은 텍스트"**라는 포지셔닝을 가장 압축적으로 보여주는 문장.

## 댓글

- **hada 댓글 수·논지는 이 세션에서 전혀 확인 불가**(`news.hada.io` egress 차단). GeekNews 토픽 제목(id=32967)이 WebSearch 스니펫에 그대로 잡힌 것으로 실재는 확인했으나 댓글 내용은 못 읽었다.
- **HN 스레드(item id 49468818, "Gemini-3.5-Transcribe")가 존재한다는 것만 검색으로 확인**했고 검색 시점 기준 "약 11시간 전" 게시로 잡혀 최신 스레드로 보이지만, 포인트·댓글 수·논지는 페이지 자체가 차단돼 읽지 못했다 — 있다는 사실만 기록하고 내용은 공란으로 남긴다.
- **Lobsters 큐레이션은 검색에 잡히지 않았다** — 다만 이건 "없다"의 확인이 아니라 "이 세션 검색으로는 못 찾았다"는 정도로만 읽어야 한다.
- **관점상 유의점**: 이번 발표는 제작사 공식 블로그이고, WER이 제3자(Artificial Analysis)가 측정했다는 점에서 [[2026-08-14-gemini-3-7-flash]]가 지적했던 "벤치마크가 전부 자사 이전 버전 대비"라는 문제를 부분적으로 완화한다 — 그러나 완화될 뿐 사라지지는 않는다. **측정 주체가 제3자여도 비교 대상 모델 목록을 고르는 건 여전히 발표사**이고, 이번 발표에서 그 목록에 경쟁 STT는 하나도 없다.

## 내 생각 · 적용점

### 핵심 전이 1 — "제3자 측정"과 "제3자 비교"는 다른 것이고, 이번 발표는 앞의 것만 있다

[[2026-08-14-gemini-3-7-flash]]에서 짚었던 패턴은 "벤치마크가 전부 자사 이전 버전 대비"였다. 이번 Gemini 3.5 Transcribe는 그 문제를 절반만 고쳤다 — **WER 수치 자체는 Artificial Analysis라는 독립 기관이 쟀다**(측정 신뢰도 개선). 하지만 **그 수치를 무엇과 나란히 놓을지는 여전히 Google이 정한다**(비교 대상 선택권은 자사에 있음). 결과적으로 이번 발표에도 Chirp 3 하나만 비교 대상으로 등장하고 Whisper·Deepgram·AssemblyAI 같은 경쟁 STT는 어디에도 없다. "측정을 제3자가 했다"는 사실이 "비교가 공정하다"는 뜻으로 자동 번역되지는 않는다는 걸 이번 사례가 보여준다 — 벤치마크를 읽을 때 **"누가 쟀는가"와 "무엇과 비교했는가"를 따로 확인해야 한다**는 규칙을 하나 더 세울 만하다.

### 핵심 전이 2 — 같은 STT 파이프라인 단계를 정반대 철학으로 채우는 두 사례

[[2026-08-22-huggingface-speech-to-speech-local-voice-agent]]에서 다룬 오픈소스 음성 파이프라인은 STT 단계에 **로컬에서 도는 작은 모델(Parakeet TDT)을 기본값으로 골라 데이터가 기기 밖으로 나가지 않게 설계**했다. Gemini 3.5 Transcribe는 정확히 같은 파이프라인 자리(STT)를 **클라우드 정밀도로 채운다** — 85개 언어·화자 구분·맞춤 어휘 같은 기능은 로컬 소형 모델이 당장 따라가기 어려운 영역이다. 두 사례를 나란히 놓으면 STT 선택이 "정확도냐 프라이버시냐"의 트레이드오프로 정리된다 — 그 노트가 "온다는 로컬 음성 에이전트를 당장 쓸 자리가 없다"고 밝혔던 것과 대칭적으로, 이번 모델은 **정확도·기능이 필요하고 클라우드 처리가 허용되는 시나리오**(뒤 CRS 절 참고)에서만 후보가 된다는 것도 같은 트레이드오프의 다른 쪽 면이다.

### 핵심 전이 3 — Google의 3주 릴리스 사이클이 텍스트 모델 바깥으로 번지고 있다

[[2026-08-14-gemini-3-7-flash]]는 "3.6 Flash 출시 3주 만의 후속"이라는 릴리스 사이클을 지적했다. 이번 Gemini 3.5 Transcribe는 같은 회사가 **같은 속도의 반복 출시를 텍스트 생성 모델뿐 아니라 음성 전사라는 별도 제품 카테고리에도 적용**하고 있다는 걸 보여주는 데이터포인트다. 다만 이 전이는 릴리스 "빈도"의 유사성이지 같은 모델 계열의 후속작이라는 뜻은 아니다 — 이전 세대인 Chirp 3와도 브랜드명 자체가 다르다(Chirp → Gemini 계열로 브랜드 통합). 독립 평가가 릴리스 속도를 따라가기 어렵다는 그 노트의 결론이, 이번엔 STT 벤치마크 생태계(Artificial Analysis 같은 제3자 지수)에도 똑같이 적용될 것이다.

## 호스피탈리티 / CRS 적용 포인트

- **콜센터/예약 통화 QA에 비교적 직접적인 적용 후보다.** 온다는 B2B 호스피탈리티 CRS를 다루고, 예약 콜센터·게스트 응대 전화가 실제 업무 표면에 존재한다. Google 파트너 블로그가 명시한 "콜센터·고객 상담(품질 보증·감정 분석)" 용도, 화자 구분(에이전트/게스트 분리)과 단어 단위 타임스탬프, 맞춤 어휘(호텔·객실 타입·OTA 코드명 등 업계 고유명사 사전 등록)는 통화 녹음 QA·컴플라이언스 기록화·상담 품질 분석에 원칙적으로 들어맞는다.
- **다국어·코드 스위칭 지원(85개 언어, 발화 단위 자동 감지)**은 국제 게스트가 섞이는 리셉션·콜센터 시나리오에서 특히 눈에 띄는 특징이다 — 언어를 수동으로 지정하지 않아도 되는 게 실무 마찰을 줄인다.
- **다만 도입 판단을 내리기엔 이 노트의 정보가 부족하다**: (1) 한국어 WER이 평균 2.6%/4.0%에서 어느 위치인지 언어별 분해 수치를 확인 못 했고, (2) 게스트 통화 음성을 Google 클라우드로 보내는 데 따르는 데이터 거버넌스·잔존(retention) 정책·GDPR/개인정보보호법 적합성을 원문에서 확인하지 못했으며, (3) 현재 "공개 프리뷰" 상태로 GA(정식 출시) SLA가 없다. **"후보로 검토할 만하다"이지 "도입 가능하다"는 아니다.**

## 연관 자료
- [[2026-08-14-gemini-3-7-flash]] — 같은 Google/Gemini 브랜드의 "제작사 발표문·자사 이전 버전 대비 벤치마크" 패턴, 이번엔 측정 주체(제3자)만 다르고 비교 대상 선택권 문제는 그대로 남는다는 대조
- [[2026-08-22-huggingface-speech-to-speech-local-voice-agent]] — 같은 STT 파이프라인 단계를 정반대 철학(로컬·소형·프라이버시 vs 클라우드·정밀·기능)으로 채우는 대조 사례

## 한 달 뒤 회고
*(2026-09-28 즈음 — ①blog.google·news.hada.io 접속이 풀렸다면 원문·hada 댓글·HN 스레드(id 49468818)를 직접 읽어 이 노트의 "추정" 표시를 확정 사실로 교체, ②경쟁 STT(Whisper, Deepgram, AssemblyAI, ElevenLabs Scribe 등)와의 제3자 비교가 별도로 나왔는지, ③한국어 등 언어별 WER 분해 수치가 공개됐는지, ④"공개 프리뷰"에서 GA로 전환되며 가격·SLA·데이터 거버넌스 정책이 명시됐는지 확인.)*
