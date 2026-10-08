---
title: "WorldCrafter (Tencent ARC Lab · 베이징대) — 이미지 한 장에서 시작해 돌아보면 그대로 있는 세계를 만드는 비디오 월드 모델"
source_title: "WorldCrafter: Consistent Video World Model with Implicit 3D-aware Memory"
source_url: "https://github.com/TencentARC/WorldCrafter"
source_name: "GitHub (TencentARC/WorldCrafter), arXiv:2609.24984"
referrer_url: "https://news.hada.io/topic?id=34977"
published_at: "확인 불가 (arXiv 제출 기준 2026-09 하순 추정)"
summarized_at: "2026-10-08"
category: "ai"
tags: ["world-model", "video-generation", "3d-aware-memory", "camera-control", "tencent-arc", "image-to-video"]
---

# WorldCrafter (Tencent ARC Lab · 베이징대)

> 출처: [WorldCrafter: Consistent Video World Model with Implicit 3D-aware Memory](https://github.com/TencentARC/WorldCrafter) (GitHub README 직접 확보, arXiv:2609.24984) · 정리일 2026-10-08

> **출처 한계**: news.hada.io 원문은 egress 차단으로 접근하지 못했지만, GitHub 저장소 README는 직접 확보(1차 출처)했다. README에는 모델 파라미터 수와 3D 인식 메모리의 구체적 구현 방식이 명시돼 있지 않아(arXiv 논문 본문 참조로 안내), 이 노트의 수치·메커니즘 설명은 README가 밝힌 범위로 한정했다. hada 댓글 수·HN 큐레이션 유무도 확인 불가.

## 한 줄 요약

**WorldCrafter는 이미지 한 장이나 텍스트 설명에서 출발해 카메라를 움직이며 탐색하는 장면을 생성하는 비디오 월드 모델로, 카메라 시점으로 질의할 수 있는 암묵적 3D 인식 메모리를 둬서 시선을 돌렸다 돌아왔을 때도 앞서 본 사물과 공간을 그대로 복원한다.**

## 핵심 포인트

- ***Tencent ARC Lab + Tencent IEG + 베이징대학교*** 공동 연구. 이미지 한 장 또는 텍스트 프롬프트에서 시작해 카메라를 조작하며 장면을 탐색하는 영상을 생성한다(`--mode i2v` 또는 `t2v`).
- ***3D 인식 메모리 + 포즈 조건 판독(readout) 모듈***을 비디오 생성기와 함께 학습시켜, 과거 관찰들을 요청된 시점에 맞는 고정 개수의 토큰으로 압축해 디노이징 전에 끌어온다. 명시적인 깊이 기반 대응 관계 없이도, 시선을 돌렸다가 되돌아오는 분 단위 탐색에서 앞서 본 사물·공간을 복원한다는 게 핵심 주장이다.
- ***Base 모델과 Fast 모델(증류판)*** 두 종류를 공개 — Fast는 high-noise/low-noise 모델 세트로 구성된 추론 가속판이며, Base는 Fast와 구성요소를 공유해 두 폴더를 모두 받아야 한다. ***모델 파라미터 수는 README에 명시되지 않음*** (Slack 발췌는 "140억 매개변수"로 전했으나 README 원문에서는 직접 확인하지 못했다).
- 실행 환경은 Linux + Python 3.11 + NVIDIA GPU, `uv`(권장) 또는 conda+pip로 설치하며 `flash-attn-3`를 요구한다. 인터랙티브 데모(`python -m demo`)는 로컬 8080 포트에서 열리고, 입력 이미지에서 프롬프트를 자동 생성할 때만 선택적으로 Qwen3-VL-4B-Instruct를 받는다.
- README는 Helios, LagerNVS, DreamX-World, EVOKE, HY-WorldPlay, Lyra 2.0, Echo-WM, LingBot-World 2, Matrix-Game 3.5, SANA-WM 등을 관련 연구로 나열한다 — 비디오 기반 월드 모델이 2026년 하반기 들어 급격히 늘어난 경쟁 분야임을 보여주는 목록이다.

## 인상 깊은 문장

> "An implicit 3D-aware memory lets the camera query what it has already seen, preserving scene information across viewpoint changes and over long horizons." (GitHub README 요지, 원문 문장 재구성)

## 댓글

GeekNews(hada) 댓글 수는 원문 접근 차단으로 확인 불가. HN·Lobsters 등 별도 큐레이션 유무도 확인하지 못했다. 성능 주장(시점 일관성, 카메라 제어 정확도 향상)은 논문 저자 자신의 실험 결과이며, 이 노트에서는 README가 공개한 정보 범위로만 다뤘고 arXiv 논문 본문의 정량 수치까지는 대조하지 못했다 — 키보드 카메라 조작 방법 등 데모 세부도 README 본문에는 명시되지 않아 "확인 불가"로 남겨둔다.

## 내 생각 · 적용점

### 핵심 전이 1 — "코드로 지어진 세계"와 "영상으로 그려진 세계"는 월드 모델의 서로 다른 두 축이다

[[2026-09-04-claude-fable-5-1-world-modeling]]은 Claude 에이전트 군집이 실제 장소를 정찰 → Blender 자산 생성 → Three.js 조립 → 사진 대조 검증까지 거쳐 "코드로 지어진" 3D 세계를 만들었고, 그 핵심 주장은 "코드로 지어진 세계는 픽셀·잠재공간 생성물과 달리 검증 가능하고 조합 가능하고 편집 가능하다"는 것이었다. WorldCrafter는 정반대 축에 있다 — ***영상 생성 모델이 메모리로 일관성을 흉내 내는 방식***이라, 돌아봤을 때 "그 자리에 그대로 있는 것처럼 보이는" 것과 "실제로 측정 가능한 좌표로 그 자리에 있는 것"은 다르다. 두 노트를 겹쳐 보면, 지금 월드 모델 생태계가 "검증 가능성을 포기하고 그럴듯함을 사는" 접근과 "그럴듯함을 포기하고 검증 가능성을 사는" 접근으로 갈라져 있다는 게 드러난다. WorldCrafter의 "3D 인식"이라는 이름이 실제 3D 구조가 아니라 ***암묵적(implicit)*** 메모리라는 점이, 이 구분에서 어느 쪽에 더 가까운지를 보여준다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 멀다 — 연구 공개 직후 단계의 비디오 생성 모델이라 프로덕션에 바로 쓸 거리는 아니다. 다만 "이미지 한 장으로 둘러볼 수 있는 공간을 만든다"는 방향 자체는 숙소 투어 영상·가상 둘러보기 같은 호스피탈리티 콘텐츠와 접점이 있을 수 있다는 상상은 가능하다 — 단, 이 모델이 보여주는 일관성은 ***실제 공간을 측정해서 보장하는 것이 아니라 메모리로 그럴듯하게 복원하는 것***이라, 실제 객실 구조·치수를 정확히 반영해야 하는 용도(가상 투어 등)에는 검증 단계 없이 쓰기 어렵다는 한계를 분명히 해야 한다.

## 연관 자료

- [[2026-09-04-claude-fable-5-1-world-modeling]] — "코드로 지어진 세계"로 검증 가능성을 추구한 대조적 접근, 같은 "탐색 가능한 세계 생성"이라는 목표를 다른 수단으로 푼다.

## 한 달 뒤 회고

*(2026-11-08 즈음) arXiv 논문 2609.24984 본문에서 모델 파라미터 수와 3D 인식 메모리의 구체적 구현(토큰 수, 판독 모듈 구조)을 확인하고, 공개 후 한 달간 커뮤니티의 실측 품질 평가(특히 분 단위 탐색에서 실제로 일관성이 유지되는지)가 나왔는지 점검한다.*
