---
title: "MicroLLM Lab - 브라우저에서 초소형 LLM 7개 체험하기 — 설치도 계정도 없이, GPU는 내 것을 쓴다"
source_title: "MicroLLM lab — tiny LLMs, Q4, in your browser"
source_url: "https://stateofutopia.com/experiments/microllmlab/"
source_name: "stateofutopia.com"
referrer_url: "https://news.hada.io/topic?id=34468"
published_at: "확인 불가"
summarized_at: "2026-09-30"
category: "ai"
tags: ["on-device-ai", "webgpu", "small-language-model", "local-inference", "browser-ai", "quantization"]
---

# MicroLLM Lab - 브라우저에서 초소형 LLM 7개 체험하기

> 출처: [MicroLLM lab](https://stateofutopia.com/experiments/microllmlab/) (stateofutopia.com) · GeekNews(id=34468) 경유 · 정리일 2026-09-30
>
> **출처 한계**: `news.hada.io`, `stateofutopia.com` 모두 이 세션에서 egress 차단돼 직접 열람하지 못했다. WebSearch로 GitHub 저장소 설명(robss2020/microllm-lab), dev.to 해설 글 제목, StartupHub.ai 기사 스니펫을 교차확인해 재구성했다. Slack 발췌가 전한 "모델 크기 15~216MB"는 다운로드(양자화 후) 파일 크기로 보이는데, WebSearch로 확인한 "25M~360M 파라미터"는 원 모델의 파라미터 수 표기라 **같은 대상을 다른 단위(용량 vs 파라미터 수)로 가리킬 가능성이 있고, 이 노트는 두 수치를 그대로 병기하되 서로 환산 검증은 하지 못했다.** "21개 테스트", "256토큰 연속 생성"이라는 Slack 발췌의 구체적 수치는 WebSearch로 독립 재확인하지 못했다 — 사이트에 "Benchmarks 탭에서 속도·정확도 객관식 테스트를 돌려 공유 가능한 성능 인증서를 만들 수 있다"는 취지의 설명만 확인됐고, 정확히 21개인지는 원문 미확인이다. 이 도구를 만든 사람·조직의 정체(stateofutopia.com 운영자)도 확인하지 못했다.

## 한 줄 요약

**MicroLLM Lab은 설치나 계정 없이 브라우저에서 PetitGPT, SmolLM2, MiniMind2, GPT-2 등 초소형 언어 모델(약 25M~360M 파라미터, 양자화 후 다운로드 크기 15~216MB로 언급)을 WebGPU로 직접 실행하고, 여러 모델에 같은 테스트를 돌려 정답률과 생성 속도를 비교할 수 있는 실험 도구다 — 프롬프트가 외부 서버로 전혀 나가지 않고 추론은 전부 사용자 기기의 GPU에서 이뤄진다.**

## 핵심 포인트

- **설치·계정 없이 브라우저에서 즉시 실행** — 웹페이지를 열면 바로 모델을 고르고 대화할 수 있고, 선택한 모델만 다운로드해 브라우저에 저장한다. Slack 발췌 기준 모델 크기는 약 15~216MB, WebSearch로 확인한 파라미터 규모는 약 25M~360M(Q4 양자화 적용)이다.
- **7개 모델 라인업** — PetitGPT(이 랩의 모태가 된 아키텍처·연구 체크포인트), SmolLM2(Hugging Face SmolLM2 계열의 360M instruct, 32레이어·960차원), MiniMind2(jingyaogong의 from-scratch 교육용 프로젝트를 Llama 스타일로 export, 16×768·GQA 8/2·6.4k 어휘), GPT-2 124M(openai-community/gpt2) 등을 제공한다고 확인된다.
- **WebGPU로 사용자 기기 GPU를 직접 활용** — Apple Silicon Metal, DirectX 12, Vulkan을 브라우저 안에서 구동하는 W3C 표준 WebGPU를 써서, 프롬프트나 응답이 서버로 전혀 전송되지 않는다. API 사용료도 없다.
- **속도 위주 벤치마크 — 21개 테스트로 정답률·속도 비교(Slack 발췌)** — 같은 테스트 세트를 여러 모델에 돌려 정답 통과율과 생성 속도를 비교하고, 256토큰 연속 생성으로 지속 처리 속도(sustained decode)도 측정한다고 Slack 발췌는 전한다. WebSearch로 확인된 사이트 설명은 "속도(tokens/s)·정확도 객관식 테스트를 돌려 공유 가능한 성능 인증서를 만든다"는 취지로, 벤치마크의 초점이 ***모델의 지능 자체보다 실행 속도***에 있다는 인상을 준다 — 예: "이 정도 크기 모델은 최신 Mac mini에서 초당 100토큰을 넘게 답하고, 10년 된 GTX 1060도 따라간다".
- **초저지연·완전 프라이버시를 내세움** — 사이트는 10ms 미만의 첫 토큰 응답시간, 클라이언트 GPU상의 무제한 동시성, 프롬프트가 기기를 벗어나지 않는 100% 프라이버시를 주장한다(벤더 자체 주장, 제3자 검증 없음).

## 인상 깊은 문장

> "Tiny LLMs, Q4, in the browser. WebGPU lab inspired by yangqi0/petitgpt." (GitHub 저장소 설명, WebSearch로 확인)

## 댓글

**hada 댓글 수, HN/Lobsters 큐레이션 유무 모두 확인하지 못했다**(news.hada.io 및 원 사이트 egress 차단). GitHub 저장소가 "yangqi0/petitgpt에서 영감을 받았다"고 명시한 것으로 보아 완전 독자 개발이 아니라 기존 오픈소스 프로젝트를 확장한 실험/데모 성격의 도구로 보인다. **정직하게 감안할 점**: (1) 제작 주체·조직을 특정하지 못해 이해관계·편향을 판단할 근거가 부족하다. (2) 벤치마크가 "정답률"이라는 이름을 쓰지만 애초에 25M~360M 파라미터급 초소형 모델은 절대적 지능 수준이 낮으므로, 이 도구의 가치는 "어느 모델이 똑똑한가"보다 "브라우저·WebGPU 환경에서 초소형 모델이 실용적 속도로 돌아가는가"를 보여주는 데 있다고 봐야 정직하다. (3) 15~216MB(Slack)와 25M~360M 파라미터(WebSearch)가 정확히 같은 모델 집합을 가리키는지 이 노트에서는 확정하지 못했다.

## 내 생각 · 적용점

### 핵심 전이 1 — "로컬 AI" 계열에 "브라우저 네이티브, 설치 장벽 제로"라는 극단값이 추가된다

이 가든은 [[2026-09-29-nobodywho-on-device-inference-engine]](게임·앱에 임베드되는 네이티브 추론 엔진), [[2026-09-23-dlab-frontier-ai-on-your-hardware]](로컬 GPU에서 125B~550B급 대형 모델 구동), [[2026-09-21-laya-mac-offline-realtime-decision-ai]](Mac에서 오프라인 실시간 판단)까지 "내 하드웨어에서 돌리는 AI" 계열을 계속 추적해왔다. MicroLLM Lab은 이 계열에서 가장 극단적인 지점에 있다 — dlab이 550B급 모델을 위해 128GB 메모리 워크스테이션을 전제한다면, MicroLLM Lab은 ***브라우저 탭 하나, 설치도 계정도 없이, 25M~360M급 모델***을 돌린다. "로컬 실행"의 스펙트럼이 "전문가용 대형 워크스테이션"부터 "누구나 링크 하나로 여는 브라우저 탭"까지 넓게 걸쳐 있다는 걸 이 배치가 보여준다.

### 핵심 전이 2 — "속도 위주 벤치마크"는 Jev 계열의 "0.4초가 상품"이라는 결론과 같은 축이다

이 도구가 정확도보다 tokens/s·sustained decode 같은 속도 지표를 전면에 내세우는 것은, [[2026-09-21-jev-field-guide-system-one-model]]이 Jev를 분석하며 내린 결론 — ***"Jev가 실제로 파는 것은 정확도가 아니라 0.4초"*** — 과 같은 문제의식이다. 초소형 모델(25M~360M)은 애초에 프런티어 모델급 지능을 낼 수 없으므로, 이 체급의 모델이 경쟁하는 축은 "얼마나 똑똑한가"가 아니라 "얼마나 빠르고 가볍게, 어디서나 돌아가는가"로 좁혀진다는 걸 이 도구의 설계 자체가 보여준다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 멀다 — 온다는 B2B SaaS이고, 이 도구가 겨냥하는 "브라우저 탭에서 즉석 체험"이라는 시나리오와는 맥락이 다르다. 다만 참고할 원칙 하나는 있다. 파트너사(호텔) 프런트 단말이나 게스트 대면 키오스크처럼 네트워크가 불안정하거나 외부 API 호출을 최소화해야 하는 환경에서, "서버 설치 없이 브라우저 하나로 로컬 추론"이라는 이 접근이 초경량 분류·간단 응답 생성(예: 자주 묻는 질문 1차 응대) 같은 저위험 기능에 한해 참고할 만한 설계 선택지가 될 수 있다 — 단 25M~360M급 모델의 지능 수준을 감안하면 정확성이 중요한 CRS 핵심 판단에는 적합하지 않다.

## 연관 자료

- [[2026-09-29-nobodywho-on-device-inference-engine]] — 게임·앱에 임베드되는 온디바이스 추론 엔진, 같은 로컬 AI 계열의 다른 배포 형태
- [[2026-09-23-dlab-frontier-ai-on-your-hardware]] — 스펙트럼 반대편, 전문가용 대형 워크스테이션에서 125B~550B급 모델 구동
- [[2026-09-21-laya-mac-offline-realtime-decision-ai]] — Mac 오프라인 실시간 판단, 같은 "내 하드웨어" 문제의식
- [[2026-09-21-jev-field-guide-system-one-model]] — "정확도가 아니라 속도가 상품"이라는 같은 결론

## 한 달 뒤 회고

*(2026-10-30 즈음 — 제작 주체를 확인할 수 있는지, 15~216MB와 25M~360M 파라미터가 실제로 같은 모델 집합인지 확인, 21개 테스트의 정확한 구성과 커뮤니티 반응이 있었는지 점검.)*
