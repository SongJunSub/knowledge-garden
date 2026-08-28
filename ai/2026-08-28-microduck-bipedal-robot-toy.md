---
title: "Microduck — 새 동작을 직접 가르칠 수 있는 소형 이족보행 로봇 (Pollen Robotics · Hugging Face) — $399에 파는 건 완성된 로봇이 아니라 '시뮬레이션에서 훈련한 정책을 실기체에 이식하는 파이프라인 전체'다: 소스 코드 대신 RL 정책이 확장 시스템이 되는 사례"
source_title: "Microduck - A tiny biped robot you can teach new tricks"
source_url: "https://github.com/pollen-robotics/microduck"
source_name: "GitHub (pollen-robotics) · Pollen Robotics/Hugging Face 공식 발표"
referrer_url: "https://news.hada.io/topic?id=32950"
published_at: "2026-08-27"
summarized_at: "2026-08-28"
category: "ai"
tags: ["robotics", "reinforcement-learning", "sim-to-real", "mujoco", "open-source-hardware", "hugging-face", "physical-ai", "ppo"]
---

# Microduck — 새 동작을 직접 가르칠 수 있는 소형 이족보행 로봇

> 출처: [pollen-robotics/microduck](https://github.com/pollen-robotics/microduck) (GitHub · Pollen Robotics/Hugging Face 공식) · 레퍼러: [GeekNews 32950](https://news.hada.io/topic?id=32950) · 정리일 2026-08-28
> **출처 한계**: 이번 세션에서 `news.hada.io`·`pollen-robotics.com`·`huggingface.co`·`theregister.com`·`engadget.com`·`thenewstack.io`·`kingy.ai`·`news.ycombinator.com`·`cnx-software.com` 등 20여 개 도메인이 egress 프록시에 전부 차단됐다. **직접 열람에 성공한 건 GitHub 저장소 두 곳(`pollen-robotics/microduck`, `pollen-robotics/microduck_rl`)뿐**이며, 그 외 사양·가격·타임라인·보도 논조는 전부 WebSearch 스니펫(Engadget·The Register·Axios·TechCrunch·kingy.ai 등 다수 매체 교차 확인)으로 재구성했다. hada 원문 페이지 자체를 못 열어 GeekNews 요약 문구·댓글은 전혀 확인하지 못했다.

## 한 줄 요약

**Hugging Face 산하 Pollen Robotics가 2026-08-27 사전주문을 시작한 $399짜리 오리 모양 이족보행 로봇으로, 판매하는 실체는 "완성된 장난감"이 아니라 "MuJoCo 시뮬레이터에서 PPO로 정책을 훈련해 실기체에 그대로 이식하는 sim-to-real 파이프라인 전체"다.** 높이 25cm·무게 800g 미만, 서보모터 15개·카메라·소형 LiDAR·IMU 2개·마이크/스피커·물체를 집는 관절형 부리를 갖췄고, 걷기·낙상 복구·기립·앉기-서기 전환·바닥 물체 집기·공 차기·구르기 착지의 **7가지 RL 정책이 공장 출고 시점부터 탑재**된다. 소프트웨어(Rust 기반 온보드 스택)는 Apache 2.0으로 완전 공개, **정책 훈련 코드(`microduck_rl`)도 별도 저장소로 공개**돼 있어 사용자가 같은 파이프라인으로 새 동작을 직접 훈련해 온보드 정책을 교체할 수 있다.

## 핵심 포인트

- **하드웨어 사양** — 높이 약 25cm, 무게 800g 미만, **서보모터 15개**, 카메라, **소형 LiDAR**, **IMU 2개**, 마이크·스피커, 물체를 집을 수 있는 관절형 부리(그리퍼 역할), 온보드 프로세서는 **Rockchip RK3566**. Cream·Graphite·Lavender·Sky 4색 출시 예정.
- **온보드 소프트웨어 — 프레임워크 없는 순수 Rust** — README 표현으로 ***"Rust, no framework, one workspace"***. 데몬 6종으로 분리: `robotd`(제어 루프·모터 버스, **50Hz**), `updaterd`(서명된 릴리스 설치·롤백), `configd`(WiFi/네트워크), `btd`(블루투스), `padd`(게임패드 입력), `mediad`(WebRTC 카메라 스트리밍).
- **7가지 기본 RL 정책** — 공식 저장소(`microduck_rl`) 기준 정확한 태스크명은 `Velocity`(속도 명령 기반 보행)·`VelStand`(보행+낙상 복구를 하나의 정책으로 통합)·`StandUp`(누운 상태에서 기립)·`SitStand`(앉기-서기 전환)·`GroundPick`(웅크려 부리로 바닥 물체 집기)·`BallKick`(70mm/15g 공 차기)·`Roulade`(머리 위로 구르며 발로 착지). ***마케팅 자료가 대표 데모로 내세우는 "롤러스케이팅"은 이 7종 핵심 태스크 밖의 추가 변형 작업으로 보이며, 정확히 몇 개가 기본 탑재되는지는 매체마다 표현이 갈려 확정하지 못했다.***
- **sim-to-real 훈련 레시피가 그대로 공개돼 있다** — MuJoCo Warp 기반 프레임워크(mjlab) 위에서 **PPO**로 최대 **4,096개 병렬 시뮬레이션 환경**을 동시에 돌리고, 배터리 전압·커맨드 지연·마찰 계수를 흔드는 **도메인 랜덤화**, 실제 서보(Dynamixel XL330)의 전압 제어 법칙·역기전력·쿨롱/스트리벡 마찰까지 재현하는 **BAM 액추에이터 모델**, 관절당 ±1°(총 2°) 기어 유격을 인코더 피드백으로 흉내 내는 **백래시 시뮬레이션**을 거쳐 **ONNX로 내보내 실기체에 배포**한다.
- **모든 정책이 같은 관찰 구조(61차원)를 공유** — 런타임에서 정책을 자유롭게 핫스왑할 수 있게 설계돼, 보행 중 넘어지면 즉시 낙상 복구 정책으로, 다시 걷기로 매끄럽게 전환된다.
- **사용자가 직접 재훈련할 수 있는 경로가 문서화돼 있다** — `uv run train Mjlab-Velocity-Flat-MicroDuck --env.scene.num-envs 4096` 한 줄로 훈련 시작, GPU가 없으면 `--hf-jobs` 플래그로 Hugging Face Jobs에서 실행, 체크포인트 재개·백래시 변형 훈련도 지원. **완제품 로봇을 사는 사람이 공식 RL 훈련 파이프라인 사용자가 되는 구조.**
- **라이선스 이원화(확인 필요)** — 소프트웨어(온보드 스택·훈련 코드)는 **Apache 2.0**으로 완전 공개. 다만 WebSearch로 재구성한 한 매체 표현에 따르면 **하드웨어 설계 파일은 비상업적 라이선스**라는 언급이 있었는데, 원문 라이선스 파일을 직접 열람하지 못해 정확한 조건(상업적 재판매·양산 금지 범위 등)은 확인하지 못했다.
- **회사 맥락** — Hugging Face는 2024년 오픈 로보틱스 이니셔티브 LeRobot을 시작했고, 2025년 4월 연구용 로봇을 이미 만들던 팀 **Pollen Robotics를 인수**했다. Microduck은 그 인수 이후 첫 양산형 소비자 로봇으로 보인다. 사전주문은 2026-08-27 시작, 배송 목표는 2026년 크리스마스 이전.

## 인상 깊은 문장

> "Pollen Robotics is selling an assembled, mass-produced test rig for reinforcement learning — a machine whose seven shipped behaviours were all trained in simulation and transferred to real hardware, whose training code is published, and whose policies you are explicitly invited to retrain and replace."
> (The New Stack 기사 제목 페이지의 핵심 문장 — WebSearch 스니펫으로 확인. 이 노트 제목의 "정책이 확장 시스템"이라는 관점이 여기서 나왔다.)

> "Rust, no framework, one workspace."
> (GitHub README에서 직접 확인 — 온보드 소프트웨어 설계 철학을 한 줄로 압축한 표현.)

## 댓글

- **hada 댓글 확인 불가** — `news.hada.io` 자체가 이번 세션에서 egress 차단돼 원문 페이지를 열지 못했다. 댓글 수·논조 전혀 파악 못함.
- **HN 스레드 존재는 확인, 내용은 미확인** — WebSearch로 `Pollen Robotics (Hugging Face) Microduck` 제목의 HN 스레드(`item?id=49462763`)가 있다는 것까지는 찾았지만, `news.ycombinator.com` 도메인도 이 세션에서 차단돼 포인트 수·댓글 논조는 전혀 확인하지 못했다.
- **Lobsters 큐레이션 여부 미확인** — 검색으로 관련 스레드를 찾지 못했다(없다는 뜻은 아니고 단순 미확인).
- **읽을 때 감안** — ①발표 주체가 판매사 자신(Pollen Robotics/Hugging Face)이므로 "7가지 동작", "완전 자율" 같은 표현은 자사 마케팅 자료에서 나온 것이라는 점을 감안해야 한다. ②다만 이 글은 [[2026-08-02-gemini-robotics-2]]·[[2026-08-23-china-humanoid-robot-100m-record]]와 달리 **훈련 코드·정책·하드웨어 설계 상당 부분이 공개 저장소로 직접 검증 가능**하다는 점에서 검증 가능성의 층위가 다르다 — 실제로 이 노트의 사양·훈련 파이프라인 서술 대부분은 GitHub 원문을 직접 읽고 확인한 것이다.

## 내 생각 · 적용점

### 핵심 전이 1 — 프론티어 VLA와 정반대 축: "닫힌 200개 사례"가 아니라 "열린 훈련 파이프라인 전체"를 판다

[[2026-08-02-gemini-robotics-2]]를 정리하며 짚었던 문제는, DeepMind의 On-Device 2가 내세운 **"200개 미만 사례로 새 로봇에 적응"**이라는 인상적인 숫자가 **조기 접근 파트너에게만 열려 있어 외부 검증이 불가능**하다는 점이었다. Microduck은 정확히 반대 방향을 택한다 — 적응 사례 수 같은 인상적인 벤치마크를 자랑하는 대신, **훈련에 쓴 도메인 랜덤화 파라미터·액추에이터 물리 모델(BAM)·백래시 시뮬레이션 코드까지 통째로 공개**해서 누구나 같은 조건으로 재현·재훈련할 수 있게 했다. 하나는 "능력의 숫자"를 팔고, 하나는 "능력을 만드는 방법 자체"를 판다 — 로봇공학 발표를 읽을 때 이 두 축을 구분해야 한다는 걸 이 대비가 다시 확인시킨다.

### 핵심 전이 2 — 검증 가능성의 결이 China 100m 로봇 기록과도 정반대다

[[2026-08-23-china-humanoid-robot-100m-record]]에서 짚었듯, "단일 헤드라인 숫자"(9.32초, 2.88m)만 던지고 측정 조건은 검증 불가능한 발표는 홍보 스펙터클에 가깝다. Microduck은 그 반대 극단에 있다 — 화려한 단일 기록(예: "세계 최초 로봇 100m 신기록") 대신, **재현 가능한 저수준 디테일**(관절 유격 각도, 서보 모델명, 병렬 환경 개수, 관찰 벡터 차원수)을 공개한다. 두 로봇 발표를 나란히 놓으면, 로봇공학 뉴스를 읽는 기준이 하나 더 또렷해진다 — **"숫자가 얼마나 인상적인가"가 아니라 "그 숫자를 재현할 수 있는 코드가 딸려 오는가"**가 신뢰도를 가르는 진짜 축이다.

### 핵심 전이 3 — 소스 코드 대신 "RL 정책"이 확장 시스템이 되는 사례

[[2026-08-04-devtools-must-be-open-source]]가 소프트웨어 개발 도구를 두고 세운 논지는 ***"최종사용자 제품이 개인화 가능하려면 소스 코드가 필요하다"***는 것이었다. Microduck은 이 논지를 물리 세계로 그대로 옮긴 사례로 읽힌다 — 다만 여기서 "포크해서 고치는 대상"은 코드가 아니라 **시뮬레이션 환경과 RL 정책**이다. 로봇의 행동을 바꾸고 싶으면 온보드 바이너리를 리버스 엔지니어링할 필요 없이, 공개된 `microduck_rl` 저장소에서 같은 mjlab 환경으로 재훈련해 ONNX를 새로 굽고 배포하면 된다 — **"소스가 곧 확장 시스템"이라는 원칙이 임베디드 로봇 행동에도 그대로 적용되는, 체화된 AI(embodied AI) 버전의 오픈소스 확장성 사례**다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 없다.** 오리 모양 취미용 로봇은 온다의 B2B 호스피탈리티/CRS 사업과 접점이 사실상 없다. 억지로 끌어오지 않고, 전이 가능한 원칙 하나만 남기면:

- **핵심 전이 3의 원칙("소스/정책이 곧 확장 시스템")은 CRS 내부 도구에도 물어볼 만한 질문이다.** 온다가 내부적으로 요금 엔진·매칭 로직 같은 규칙 기반 시스템을 벤더 API 뒤에 완전히 감춰둘지, 아니면 (Microduck의 RL 정책 공개처럼) 파트너·내부 개발자가 직접 규칙을 들여다보고 재훈련·재구성할 수 있게 열어둘지는 제품 설계 철학의 문제로 남아있다 — 다만 이건 이 글에서 직접 도출된 CRS 적용이라기보다, 핵심 전이 3의 원칙을 우리 도메인에 옮겨본 사고 실험에 가깝다는 점을 밝혀둔다.

## 연관 자료

- [[2026-08-02-gemini-robotics-2]] — 같은 로봇공학 발표지만 "닫힌 인상적 숫자"(200개 사례) vs "열린 재현 가능 파이프라인"이라는 정반대 축
- [[2026-08-23-china-humanoid-robot-100m-record]] — 검증 불가능한 단일 스펙터클 기록과 대비되는, 저수준 디테일까지 공개한 사례
- [[2026-08-04-devtools-must-be-open-source]] — "소스가 곧 확장 시스템" 원칙이 코드에서 RL 정책으로, 소프트웨어에서 체화된 AI로 옮겨간 사례

## 한 달 뒤 회고

*(2026-09-28 즈음 — ①실제 사전주문 배송이 크리스마스 전 목표대로 이뤄졌는지 ②커뮤니티가 실제로 `microduck_rl`로 새 동작을 재훈련해 공유한 사례가 나왔는지(핫스왑 61차원 관찰 구조 주장의 실전 검증) ③하드웨어 설계 파일의 정확한 라이선스 조건(비상업적 범위)을 원문으로 확인했는지 ④이번엔 막혀서 못 본 hada·HN 반응을 나중에라도 확인했는지 기록.)*
