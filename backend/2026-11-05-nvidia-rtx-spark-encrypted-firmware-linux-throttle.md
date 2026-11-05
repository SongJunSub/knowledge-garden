---
title: "Nvidia RTX Spark, 암호화된 펌웨어가 Linux 추론 속도를 묶는다 (GeekNews) — 전원을 뽑으면 성능이 돌아온다는 사실 자체가 벤더 락인의 증거다"
source_title: "Nvidia RTX Spark의 암호화된 펌웨어, Linux 추론 속도를 35% 수준으로 낮춤"
source_url: "https://news.hada.io/topic?id=36589"
source_name: "GeekNews"
referrer_url: "https://ondainc.slack.com/archives/C0AJL0096H4"
published_at: "확인 불가"
summarized_at: "2026-11-05"
category: "backend"
tags: ["nvidia", "rtx-spark", "firmware", "vendor-lockin", "linux", "gpu", "inference-hardware"]
---

# Nvidia RTX Spark, 암호화된 펌웨어가 Linux 추론 속도를 묶는다 (GeekNews)

> 출처: [Nvidia RTX Spark의 암호화된 펌웨어, Linux 추론 속도를 35% 수준으로 낮춤](https://news.hada.io/topic?id=36589) (GeekNews) · 정리일 2026-11-05

## 한 줄 요약

**RTX Spark 노트북에 네이티브 Linux를 설치하고 CUDA 가속까지 쓸 수 있지만, 전원을 연결한 순간 GPU 클럭이 약 780MHz로 제한되며 추론 성능이 큰 폭으로 떨어진다. 원인은 CPU-GPU 전력 배분을 담당하는 Nvidia Platform Controllers and Framework에 대응하는 기능이 Linux에는 없고, 펌웨어의 전력 설정 테이블 자체가 암호화되어 있어 Windows만 복호화 키를 갖고 있다는 점이다.**

## 핵심 포인트

- ***플러그를 꽂으면 GPU 클럭이 약 780MHz로 제한***된다. 배터리로 구동할 때는(또는 특정 조건에서는) Windows에 가까운 성능을 낸다는 보도도 있어, 전원 상태에 따라 거동이 달라지는 것으로 보인다.
- ***CPU/GPU 전력 배분을 담당하는 Nvidia Platform Controllers and Framework에 대응하는 기능이 Linux 드라이버에는 없음*** — Windows 전용 전력 관리 스택.
- ***펌웨어의 전력 설정 테이블이 암호화***되어 있고, Windows만 이를 복호화할 키를 쥐고 있어 Linux 쪽에서는 설정값을 읽거나 조정할 방법이 없다.
- 한 2차 소스(MindStudio 블로그)가 제시한 수치는 GPT-OSS-120B 테스트에서 ***Windows 65.4토큰/초, WSL 65.1토큰/초 대비 동일 노트북 네이티브 Linux는 13.9토큰/초*** — 이는 약 79% 하락으로, Slack 발췌의 "35% 수준으로 낮춤"과 수치가 일치하지 않는다. **매체 간 수치 불일치**를 그대로 밝힌다.
- 다른 소스는 "RTX Spark 노트북에 네이티브 Linux를 설치해 공개적으로 검증된 사례가 아직 없다"고도 보도해, 애초에 "네이티브 Linux 설치 자체가 가능한가"를 두고도 소스 간 상충이 있다.
- 전원을 뽑으면(배터리 모드) Linux에서도 Windows에 가까운 성능이 나온다는 보도가 있어, 문제의 본질은 "Linux가 느리다"가 아니라 "전력 관리 펌웨어가 OS를 차별한다"는 쪽에 가깝다.

## 인상 깊은 문장

> "The firmware hands this controller a table of power settings that is encrypted. Windows has the key to decrypt it." (WebSearch로 교차확인한 2차 보도 요약, 원문 1차 확인은 못함)

## 댓글

**출처 한계가 여러 겹이다.** (1) news.hada.io 원문은 이 세션에서 차단되어 hada 댓글 수·큐레이션 여부를 확인할 수 없었다. (2) WebSearch로 찾은 "35%"의 1차 근거를 찾지 못했고, 대신 찾은 2차 보도(MindStudio)의 수치는 약 79% 하락으로 Slack 발췌의 "35%"와 어긋난다 — 어느 쪽이 맞는지 이 노트에서는 판단하지 않고 불일치만 명시한다. (3) "네이티브 Linux RTX Spark가 실존하는지" 자체도 소스 간 상충이 있어, 이 글의 전제 자체가 아직 공개 검증이 부족한 상태일 수 있다.

## 내 생각 · 적용점

### 핵심 전이 1 — 하드웨어 성능 제한을 "소프트웨어 설정값"으로 암호화해 숨기는 패턴

전력 관리 테이블을 암호화해 특정 OS만 접근하게 하는 방식은, 이 가든에 이미 있는 [[2026-10-25-gpu-unlock-rtx-30-series-fp16-bf16]]의 "소비자용 GPU에 드라이버 바인딩 전 명령 발행 속도 제한을 걸어두는" 벤더 세그멘테이션 전략과 같은 계열이다. 차이는 수단 — 거기서는 드라이버 레벨 제한이었고 여기서는 펌웨어 암호화인데, 목적은 동일하게 **"하드웨어 자체 성능을 인위적으로 가둬 플랫폼(OS 또는 제품 등급)을 차별화"**하는 것이다.

### 핵심 전이 2 — "전원을 뽑으면 풀린다"는 현상이 락인의 증거

배터리 모드에서는 성능이 돌아온다는 보도가 있다면, 이는 하드웨어 자체의 물리적 한계가 아니라 **의도된 소프트웨어/펌웨어 정책**이라는 뜻이다. 성능 저하가 "불가피한 기술적 제약"인지 "인위적인 플랫폼 락인"인지를 구분하는 기준으로, 전원 상태 같은 외부 조건에 따라 거동이 바뀌는지를 보면 된다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 멀다. CRS/PMS는 온프레미스 GPU 추론 하드웨어에 의존하는 영역이 거의 없다. 다만 전이 가능한 원칙: **벤더가 제공하는 하드웨어/인프라를 특정 OS·플랫폼에 묶어 성능을 차별화하는 사례가 있는지, 벤더 선정 시 "공식 벤치마크"가 아니라 자사 환경에서 재현한 수치로 검증**해야 한다는 조달 원칙 정도.

## 연관 자료

- [[2026-10-25-gpu-unlock-rtx-30-series-fp16-bf16]] — 같은 벤더(Nvidia)의 소프트웨어/펌웨어 기반 성능 세그멘테이션, 거울상 사례

## 한 달 뒤 회고

*(2026-12-05 즈음 — "35%" vs "79% 하락" 수치 불일치가 1차 소스로 해소됐는지, 네이티브 Linux RTX Spark의 실존 여부가 공개적으로 확인됐는지 점검.)*
