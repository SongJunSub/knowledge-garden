---
title: "Strata - 1250억 파라미터 Qwen3.8-Flash-Next를 평범한 PC에서 돌리는 오픈소스 추론 엔진 (Niko1221) — GPU·CPU·RAM·SSD로 쪼개 올리고, 작은 모델이 먼저 찍고 큰 모델이 검증해 1.6~1.8배 빠르게"
source_title: "Strata"
source_url: "https://github.com/Niko1221/Strata"
source_name: "GitHub(Niko1221/Strata) 공식 README"
referrer_url: "https://news.hada.io/topic?id=34761"
published_at: "2026-10-03 (v0.1.38 릴리스 기준, 추정)"
summarized_at: "2026-10-05"
category: "ai"
tags: ["strata", "qwen38-flash-next", "local-inference", "moe-offloading", "speculative-decoding", "consumer-gpu", "quantization", "open-source"]
---

# Strata - 1250억 파라미터 Qwen3.8-Flash-Next를 평범한 PC에서 돌리는 오픈소스 추론 엔진 (Niko1221)

> 출처: [Strata](https://github.com/Niko1221/Strata) (GitHub 공식 README) · GeekNews(id=34761) 경유 · 정리일 2026-10-05

> **출처 한계**: `news.hada.io`는 이 세션에서 egress 차단으로 열지 못했다. 대신 `github.com/Niko1221/Strata` 리포지토리의 README를 WebFetch로 **직접 확보**했다(1차 소스) — 이번 배치 5개 중 원문 확보율이 가장 좋다. Slack 발췌가 언급한 "RTX 5070 12GB·64GB RAM에서 초당 94토큰"이라는 수치는 README에 그대로 나오지 않고, README 자체 표는 ***같은 하드웨어 조합에서 양자화 단계별로 90(Q2_0)~52(IQ3_S) 토큰/초***로 더 세분화해 적는다 — Slack의 "94토큰"이 어느 양자화 단계를 가리키는지는 원문에서 정확히 특정하지 못했다(가장 가까운 값은 Q2_0의 90토큰/초다). 또한 Slack 발췌의 "Q2_0 입력 처리 속도 2,650토큰/초"는 README에 없는 수치라 대조하지 못했다(README는 "8,192 토큰/배치를 1,000+ 토큰/초로 읽는다"고만 적는다). GitHub(q8atnight/Strata)는 동일 프로젝트의 포크/미러로 보이며 본 노트는 원 저자 리포지토리(Niko1221)를 기준으로 삼았다. hada 댓글 수·논조는 확인하지 못했다.

## 한 줄 요약

**Strata는 Alibaba의 1250억 파라미터 MoE 모델 Qwen3.8-Flash-Next를 클라우드 없이 12GB VRAM급 소비자 GPU 한 장에서 돌리는 오픈소스(MIT) 추론 엔진이다. 모델 전체를 GPU에 올리는 대신 24,576개 전문가(expert)를 RAM에 두고 자주 쓰는 것만 GPU에 캐싱하며 CPU가 나머지 전문가 연산을 병렬로 처리하는 ***계층별 오프로딩***과, 작은 보조 모델이 다음 토큰을 먼저 예측하고 본 모델이 한 번에 검증하는 ***추측 디코딩(speculative decoding, 1.6~1.8배 가속)***을 결합해, RTX 5070(12GB)·64GB RAM 조합에서 양자화 단계에 따라 초당 52~90토큰을 낸다.**

## 핵심 포인트

- **계층별 오프로딩 — GPU는 캐시, RAM이 본체, CPU가 보조 연산** README가 명시하는 구조는 ***GPU가 핵심 추론과 자주 쓰는 전문가 캐싱을 맡고, RAM이 24,576개 전문가 전체를 들고 있으며, CPU가 GPU와 병렬로 전문가 연산을 처리하고, SSD는 토큰당 조회되는 룩업 테이블을 담는다***는 4단 계층이다. "모델 전체를 GPU 한 장에 욱여넣는다"가 아니라 "자주 쓰는 부분만 빠른 메모리에, 나머지는 느린 메모리에"라는 MoE 특화 캐싱 전략이다.
- **추측 디코딩으로 1.6~1.8배 가속** — 작은 헬퍼 모델이 여러 토큰을 먼저 예측하고 본 모델이 그 예측 배치를 한 번에 검증하는 방식으로, 동일한 출력을 더 빠르게 생성한다. 별도 GPU 업그레이드 없이 소프트웨어만으로 얻는 가속이다.
- **양자화 단계별 속도-품질 트레이드오프를 표로 공개** — Q2_0(37.6GB, 90토큰/초, "Good") 부터 IQ3_S(54.8GB, 52토큰/초, "Best")까지 4단계를 제공해, 사용자가 자기 하드웨어와 품질 요구에 맞춰 직접 고르게 한다. 8GB+ VRAM, 64GB RAM 권장, ~80GB 디스크가 최소 요구사항이다.
- **원클릭 설치 + OpenAI/Anthropic 호환 API** — Windows는 `START-HERE.bat`, Linux는 `./setup.sh` 하나로 모델 다운로드(~70GB)부터 초기화까지 끝내고, `localhost:8080`에서 브라우저 UI·터미널 챗·OpenAI 호환(`/v1`)·Anthropic 호환(`/v1/messages`) API를 동시에 제공한다. 이미지 입력(선택)과 reasoning 레벨(off/low/medium/high) 조절도 지원한다.
- **라이선스 — 엔진은 MIT, 모델은 별도** Strata 엔진 자체와 기반 GGML/llama.cpp는 MIT지만, 실제 구동되는 Qwen3.8-Flash-Next 모델은 Qwen Community License를 따로 적용받는다 — "오픈소스 추론 엔진"과 "오픈 라이선스 모델"이 분리된 두 축이라는 걸 명확히 밝힌다.

## 인상 깊은 문장

> (README 원문) "Measurements taken on RTX 5070 (12GB), Ryzen 5 7600, 64GB RAM. Performance varies by hardware configuration."

> (README 원문, 초기 구동 관련) "Initial launch may cause system sluggishness for 1-3 minutes while loading 35-55GB into RAM. This is normal and expected during the loading phase."

## 댓글

**hada 댓글 수는 egress 차단으로 확인하지 못했다.** 정직하게 감안할 점들을 남긴다. (1) README의 속도 수치는 프로젝트 저자 자신이 측정한 벤치마크이며, 제3자가 동일 하드웨어에서 재현했는지는 이 세션에서 확인하지 못했다. (2) Slack 발췌의 일부 수치(94토큰/초, 2,650토큰/초 입력 처리)가 README에 그대로 보이지 않는다는 점(위 출처 한계 참조)은, 2차 보도나 다른 버전의 README에서 가져온 수치일 가능성을 시사하지만 확정하지 못한다. (3) "클라우드 없이 처리"라는 홍보 문구와 별개로, 70GB 모델 다운로드와 54.8GB(IQ3_S) RAM 적재가 필요해 "평범한 PC"의 기준이 상당히 높다는 점은 README도 숨기지 않는다(권장 사양이 64GB RAM).

## 내 생각 · 적용점

### 핵심 전이 1 — [[2026-08-27-qwen38-flash-next-cost-efficient-architecture]]가 설계한 "활성 파라미터만 깨운다"는 MoE 구조를, Strata는 추론 시점의 메모리 계층 설계로 다시 써먹는다

Qwen3.8-Flash-Next는 애초에 125B 중 6B만 활성화하는 구조로 ***훈련 비용***을 1/9로 줄이려고 설계됐다. Strata는 같은 모델을 가져와 ***추론 비용***을 소비자 하드웨어 수준까지 낮추는 데 그 구조를 재활용한다 — "자주 쓰는 전문가만 빠른 메모리에 둔다"는 아이디어가, 모델을 설계한 Qwen 팀의 의도(훈련비 절감)와 이걸 로컬로 돌리려는 Strata 팀의 의도(소비자 GPU 구동) 양쪽에서 각각 다른 방식으로 유효했다는 걸 보여준다.

### 핵심 전이 2 — [[2026-08-26-qwen38-flash-next]]가 "차기 아키텍처 프리뷰"로 처음 소개했던 모델이, 한 달 반 만에 로컬 구동 생태계까지 확보했다

8월 26일 노트는 이 모델을 "차기 Qwen4 아키텍처를 미리 흘리는 경량 MoE 프리뷰"로 다뤘다. Strata의 등장은 그 프리뷰 모델이 ***실제로 커뮤니티가 가져다 쓸 만큼 안정적이고 매력적인 타겟이 됐다***는 신호다. 모델 공개와 로컬 구동 도구 생태계 형성 사이의 시차(약 40일)가, 오픈웨이트 모델이 실제로 "쓰이는" 모델이 되는 데 걸리는 현실적인 리드타임을 보여준다.

### 핵심 전이 3 — [[2026-09-22-m5-ultra-mac-studio-review-local-ai-agents]]와는 정반대의 하드웨어 전략으로 같은 목표(로컬 에이전트 구동)에 도달한다

M5 Ultra Mac Studio 리뷰는 "통합 메모리가 넉넉한 단일 고가 머신"으로 로컬 AI 에이전트를 돌리는 접근이었다. Strata는 반대로 ***저가 소비자 GPU + 일반 RAM + CPU 오프로딩***을 조합해 같은 목표에 도달한다. "로컬 실행"이라는 같은 깃발 아래, 하나는 고성능 통합 하드웨어에 베팅하고 다른 하나는 이종 하드웨어 조합의 소프트웨어 최적화에 베팅한다는 대비가 뚜렷하다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 멀다 — 온다가 125B급 모델을 온프레미스로 돌릴 상황은 아니다.** 다만 전이 가능한 설계 원칙은 하나 있다. ***"자주 쓰는 부분은 빠른 자원에, 드물게 쓰는 부분은 느린 자원에 계층적으로 캐싱한다"***는 Strata의 핵심 아이디어는, CRS가 다루는 데이터 접근 패턴에도 그대로 적용된다 — 예를 들어 임박 체크인·실시간 재고처럼 조회 빈도가 높은 데이터는 인메모리 캐시에, 과거 예약 이력처럼 드물게 조회되는 데이터는 콜드 스토리지에 두는 계층화는 이미 흔한 패턴이지만, "전문가 네트워크 캐싱"처럼 접근 빈도를 자동으로 측정해 캐시 계층을 동적으로 조정하는 설계는 CRS의 멀티테넌트 캐싱 전략에 참고할 만하다. [[2026-08-11-meta-muse-glimmer-30b-local-agentic]]에서 짚었던 "평가는 벤치마크가 아니라 우리 하네스 수렴 횟수로"라는 원칙도 여기 그대로 적용된다 — 이런 로컬 추론 엔진을 실제로 도입하기 전에는 자체 CRS 문의 데이터로 직접 재보는 게 공식 속도표보다 먼저다.

## 연관 자료

- [[2026-08-27-qwen38-flash-next-cost-efficient-architecture]] — Strata가 로컬 구동에 재활용하는 바로 그 MoE 아키텍처의 훈련 비용 절감 설계
- [[2026-08-26-qwen38-flash-next]] — 이 모델을 "차기 아키텍처 프리뷰"로 처음 소개한 노트, Strata는 그 프리뷰가 한 달 반 뒤 실제 로컬 구동 생태계로 이어진 사례
- [[2026-09-22-m5-ultra-mac-studio-review-local-ai-agents]] — "고성능 단일 머신" 대 "저가 이종 하드웨어 오프로딩"이라는 로컬 실행의 두 전략
- [[2026-08-11-meta-muse-glimmer-30b-local-agentic]] — 로컬 경량 모델 평가는 벤치마크가 아니라 자체 하네스 기준으로 해야 한다는 원칙
- [[2026-10-04-upstage-solar-mini-4]] — "활성 파라미터를 줄여 비용을 낮춘다"는 같은 MoE 트릭의 또 다른 상업적 적용(추론 서비스 축)

## 한 달 뒤 회고

*(2026-11-05 즈음 — (1) Slack 발췌의 "94토큰/초·2,650토큰/초" 수치가 어느 버전/소스에서 나온 것인지 추가 확인. (2) 제3자(사용자 커뮤니티)가 README의 속도 표를 재현했는지. (3) Strata 같은 소비자 하드웨어 오프로딩 엔진이 125B급 모델 로컬 구동의 표준 패턴으로 자리잡는지, 혹은 M5 Ultra류 통합 메모리 머신 쪽으로 수렴하는지.)*
