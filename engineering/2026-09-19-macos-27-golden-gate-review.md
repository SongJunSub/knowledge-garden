---
title: "macOS 27 Golden Gate 리뷰 (Ars Technica, Andrew Cunningham) — Tahoe가 망가뜨린 디자인을 되돌린 'Snow Leopard식' 다듬기인데, 정작 이번엔 Apple Intelligence를 끌 수가 없다"
source_title: "macOS 27 Golden Gate: The Ars Technica Review"
source_url: "https://machash.com/ars-infinite-loop/416855/macos-27-golden-gate-ars-technica-review/"
source_name: "Ars Technica (Andrew Cunningham), machash 미러 경유"
referrer_url: "https://news.hada.io/topic?id=33875"
published_at: "2026-09-16"
summarized_at: "2026-09-19"
category: "engineering"
tags: ["apple", "macos-27", "golden-gate", "liquid-glass", "apple-intelligence", "siri", "os-review", "storage"]
---

# macOS 27 Golden Gate 리뷰 (Ars Technica, Andrew Cunningham)

> 출처: [macOS 27 Golden Gate: The Ars Technica Review](https://machash.com/ars-infinite-loop/416855/macos-27-golden-gate-ars-technica-review/) (Ars Technica, Andrew Cunningham) · GeekNews(id=33875) 경유 · 정리일 2026-09-19
>
> **출처 한계**: `news.hada.io`·`arstechnica.com`·`macdailynews.com`·`sixcolors.com`·`neoteo.com` 전부 이 세션 egress 정책으로 차단됐다. `arstechnica.com`은 이 에이전트의 user agent 자체가 접근 불가 도메인이라 WebSearch의 도메인 지정 검색으로도 원문 URL을 특정하지 못했고, 위 source_url은 확인 가능한 machash 미러 링크다 ― **정식 arstechnica.com URL로 교체가 필요하다.** GeekNews가 가리킨 리뷰가 Ars 리뷰라는 판단도 확정이 아니라 추론이다: GN⁺ 요약의 특징적 항목 네 개(Apple Intelligence 전체 비활성화·모델 삭제 옵션 제거, AI 모델 자동 다운로드로 인한 저장 공간 부담, M1 MacBook Air 언급, 향상된 음성·받아쓰기의 M3 이상 + RAM 12GB 요구)가 Ars 리뷰 2차 요약과 정확히 일치하고 같은 시기 Six Colors(Jason Snell) 리뷰 요약에는 나타나지 않아 Ars로 특정했다. hada 댓글 수·HN 스레드는 확인하지 못했다.

## 한 줄 요약

**Cunningham의 프레이밍은 "이상하지만 쓸모 있는 조합"이다 ― 작년 Tahoe가 망가뜨린 디자인을 되돌리는 ***Snow Leopard식 절제된 다듬기***와, Apple Intelligence가 출시 이후 처음으로 제대로 한 단계 올라선 릴리스가 한 몸에 들어있다. 그런데 후자에는 대가가 붙었다 ― ***Apple Intelligence를 통째로 끄고 모델이 쓰던 디스크 공간을 되찾던 토글이 사라졌다.*** M1 MacBook Air 기준으로 AI를 켠 Golden Gate가 42.92GB를, AI 없는 Tahoe가 26.17GB를 썼다.**

## 핵심 포인트

- **Tahoe 되돌리기가 이번 릴리스의 절반** — Cunningham은 ***"macOS의 27번째 업데이트 중 어느 것보다도 디자인 변경이 많다는 사실 자체가 Tahoe의 디자인 결정이 얼마나 망가져 있었는지를 말해준다"***는 취지로 평가한다. 대표적으로 창 가장자리에서 떨어져 떠 있던 유리 사이드바가 사라지고 예전처럼 창 왼쪽 끝에 붙되 대비를 위해 더 어두운 배경을 갖게 됐다. 유리 효과 강도를 조절하는 슬라이더가 생겼고, 창 모서리·제목 표시줄·사이드바를 정리해 시각적 혼잡을 줄였다.
- **Apple Intelligence를 끌 수 없게 됐다** — 이번 릴리스에서 가장 눈에 띄는 변화이자 GN⁺ 요약의 첫 항목이다. ***이전까지 있던 "Apple Intelligence 끄기" 토글과 모델 삭제 옵션이 제거***됐고, 모델은 자동으로 내려받아진다. 기능 개선이 아니라 선택권의 제거라는 점에서 이번 세대의 성격을 규정한다.
- **그 대가는 숫자로 잡힌다** — 리뷰가 실측한 M1 MacBook Air 기준으로 ***AI를 활성화한 Golden Gate가 42.92GB, AI 없는 Tahoe가 26.17GB***를 차지했다. 차이 약 16.75GB가 순수하게 온디바이스 모델과 AI 스택 몫이다. 256GB 모델을 쓰는 사용자에게는 전체 용량의 6% 이상이 선택 불가능하게 잠기는 셈이다.
- **새 Siri는 Spotlight 안으로 들어왔지만 아직 베타** — 검색과 대화를 한곳에서 처리하도록 Spotlight에 통합됐는데, ***미국 영어 사용자 대상 베타***다. 향상된 음성과 받아쓰기는 ***M3 이상 + RAM 12GB 이상***을 요구해, M1·M2 기기에서는 OS는 돌아가도 간판 기능 일부는 못 쓴다.
- **인텔 Mac은 완전히 빠졌다** — Golden Gate는 M1 이상 Apple Silicon 전용이다. 이 가든이 [[2026-09-15-ios27-ipados27-macos27-golden-gate]]에서 출시 당일에 정리했던 단절점이 리뷰에서도 그대로 확인된다.
- **판정은 "대부분에게 노브레이너"** — AI가 여전히 최첨단은 아니고 예고했던 "바이브 코딩" 계열 기능 일부가 Shortcuts·확장 기능의 한계에 묶여 있지만, Cunningham은 Apple Silicon 사용자라면 준비되는 대로 올리는 게 당연한 선택이라고 본다. UI HDR, Notes의 Markdown, Photos 정리 개선, 외장 디스플레이 개선 같은 잔손질이 다수 얹혔다.

## 인상 깊은 문장

> "macOS 27 Golden Gate를 '작년 Tahoe 재설계에 대한 절제된 Snow Leopard식 다듬기'와 'Apple Intelligence가 출시 이후 처음 제대로 올라선 한 걸음'이 짝을 이룬, 이상하지만 쓸모 있는 조합으로 본다." (Ars 리뷰 취지의 2차 요약을 옮긴 재구성 인용 ― 원문 직접 대조 못함)

> "Apple Intelligence is no longer optional; the old toggle that let you turn it off and reclaim the models' disk space is gone." (2차 요약이 전한 리뷰의 핵심 문장, 원문 직접 인용 아님)

## 댓글

**hada 댓글 수 확인 불가** — `news.hada.io`가 차단돼 댓글 수·논조를 보지 못했다. HN/Lobsters 큐레이션 여부도 특정하지 못했다.

**정직하게 감안할 점.** 먼저 이 노트가 가장 약한 지점은 **출처 동일성 판단**이다. GeekNews가 어떤 "macOS 27 Golden Gate 리뷰"를 가리켰는지는 GN⁺ 요약 불릿과 2차 요약의 일치로 추론했을 뿐 원문 링크를 확인하지 못했다. 같은 시기에 Six Colors(Jason Snell)의 "Bridging the Tahoe gap" 리뷰도 나와 있어 혼동 가능성이 실재하며, 만약 그쪽이 맞다면 저장 공간 수치 부분의 출처 표기가 틀리게 된다. 두 번째로, 42.92GB/26.17GB는 리뷰어 한 명이 ***M1 MacBook Air 한 대***에서 잰 값이므로 n=1이고 기기·사용 이력에 따라 달라진다. 세 번째로, 이 가든은 나흘 전 [[2026-09-15-ios27-ipados27-macos27-golden-gate]]에서 같은 OS의 출시 소식을 이미 정리했다 ― **주제가 겹치는 것은 사실이고, 이 노트를 따로 남기는 이유는 그 노트가 Apple 발표와 매체 속보를 재구성한 "출시 정리"인 반면 이번은 실사용 리뷰라서 새로 생긴 정보(Apple Intelligence 토글 제거, 저장 공간 실측치, Liquid Glass 되돌리기의 구체적 항목, M3+12GB 요구, 총평)가 겹치지 않기 때문이다.** 반대로 겹치는 부분(인텔 지원 종료, Siri 대기열·베타 성격)은 이번 노트에서 짧게만 언급하고 앞 노트로 넘긴다.

## 내 생각 · 적용점

### 핵심 전이 1 — 나흘 전 노트가 "대기열"에서 본 것을, 이번 리뷰는 "토글 제거"에서 확인한다

[[2026-09-15-ios27-ipados27-macos27-golden-gate]]는 Siri AI 대기열을 두고 ***"대기열이라는 장치 자체가 곧 서비스 용량의 정직한 고백"***이라고 읽었다. 기능 완성과 인프라 준비는 다른 문제이고, Apple이 그 차이를 사용자 접근 통제로 관리한다는 해석이었다. 이번 리뷰는 같은 통제가 반대 방향으로도 작동한다는 걸 보여준다 ― **접근을 늦추는 장치(대기열)와 이탈을 막는 장치(토글 제거)가 한 릴리스에 같이 들어있다.** 사용자가 기능을 원할 때는 줄을 세우고, 원하지 않을 때는 끄지 못하게 한다. 이 둘을 같이 놓고 보면 "단계적 롤아웃"이라는 말이 반드시 사용자 편의를 위한 설계는 아니라는 게 드러난다.

### 핵심 전이 2 — "끄는 방법을 모아둔 문서가 필요하다"던 관찰의, 한 단계 더 나아간 버전

[[2026-08-19-how-to-turn-off-intrusive-ai]]는 제품별 AI 비활성화 경로를 모아둔 가이드를 다루며 ***"이런 문서가 필요하다는 사실 자체가 정보"***라고 정리했다. 그 글의 전제는 "새 AI 옵션은 기본 켜짐이지만 어딘가에 끄는 길은 있다"였다. 이번 macOS 27은 그 전제를 깬다 ― **끄는 길 자체가 없어졌다.** 가이드 문서로 대응 가능한 단계에서, OS 사업자가 선택지를 구조적으로 제거하는 단계로 넘어간 것이다. 저장 공간이라는 물리적 자원이 함께 묶여 있다는 점이 특히 뼈아프다. 싫어도 참는 정도가 아니라 ***내 SSD의 16GB가 협상 대상이 아니게 되는 것***이라, "AI 기능을 안 쓰면 그만"이라는 회피 전략이 더 이상 통하지 않는다.

### 핵심 전이 3 — 하드웨어 요구사항의 계단이 OS 안에서 더 잘게 쪼개지고 있다

"OS는 M1 이상, 향상된 음성·받아쓰기는 M3 이상 + RAM 12GB 이상, 새 Siri는 미국 영어 베타." 한 릴리스 안에 서로 다른 세 개의 자격 기준이 있다. [[2026-09-15-ios27-ipados27-macos27-golden-gate]]가 iOS 쪽에서 짚었던 "설치는 되는데 핵심 기능은 안 되는 기기가 다수 생긴다"는 문제가 macOS에서 더 세분화돼 나타난 셈이다. 이건 AI 기능이 OS에 들어오면서 생긴 구조적 결과다 ― 기존 OS 기능은 설치 가능 여부만 갈렸지만, 온디바이스 모델은 ***RAM 용량과 NPU 세대라는 연속적 자원에 직접 묶이기 때문에*** 기능별로 다른 하한선이 생길 수밖에 없다. 앞으로 OS 호환성 표가 점점 더 복잡해질 것이고, "이 기기에서 이 업데이트를 받으면 정확히 무엇이 되는가"를 사용자에게 설명하는 일이 갈수록 어려워진다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 멀다. 다만 이번 릴리스가 보여준 두 결정은 온다가 파트너 대상 기능을 설계할 때 그대로 반면교사가 된다. ①**"끌 수 없는 기본값"의 비용은 기능 호불호가 아니라 자원 점유에서 나온다.** CRS에 AI 기능(가격 추천, 리뷰 요약, CS 자동응답)을 붙일 때 파트너가 안 쓰겠다고 해도 계속 돌아가면서 API 쿼터·처리 시간·화면 면적을 차지한다면, 그건 "안 쓰면 그만인 기능"이 아니라 보이지 않는 과금이다. macOS의 16.75GB가 정확히 그 형태다. ②**자격 기준이 기능마다 다르면 공지가 거짓말이 된다.** "macOS 27 출시"라는 한 문장 뒤에 세 개의 서로 다른 하드웨어 요구사항이 숨어있는 것처럼, 온다가 "새 AI 기능 오픈"을 공지할 때도 파트너 등급·연동 PMS·데이터 축적량에 따라 실제로 되는 범위가 다르다면 공지 시점에 그 표를 같이 내놓아야 한다. [[2026-09-15-ios27-ipados27-macos27-golden-gate]]가 이미 같은 원칙을 적었는데, 이번 리뷰는 그 원칙을 지키지 않았을 때 리뷰어가 가장 먼저 지적한다는 실증을 더해준다.

## 연관 자료

- [[2026-09-15-ios27-ipados27-macos27-golden-gate]] — 같은 OS의 출시 당일 정리. 이번 노트는 그 노트가 다루지 못한 실사용 리뷰 정보(토글 제거, 저장 공간 실측, Liquid Glass 되돌리기 세부)만 다룬다
- [[2026-08-19-how-to-turn-off-intrusive-ai]] — "끄는 방법을 모아둔 문서"의 전제가 이번 릴리스에서 깨지는 지점
- [[2026-09-11-apple-watch-siri-recap-privacy]] — 같은 출시 사이클에서 Siri 계열 기능이 요구하는 권한·선택권 논쟁의 앞단
- [[2026-09-19-gruber-iphone-18-pro-review]] — 같은 날 정리한 Apple 2026년 가을의 다른 축(OS vs 하드웨어)

## 한 달 뒤 회고

*(2026-10-19 즈음 — ①Apple Intelligence 비활성화 토글 제거에 대한 사용자 반발이 실제로 형성됐는지, Apple이 후속 업데이트에서 되돌렸는지, ②저장 공간 부담(16GB대)이 256GB 기기 사용자들의 실제 불만·업그레이드 유도로 이어졌는지, ③"미국 영어 베타"인 새 Siri가 한국어를 포함한 다른 언어로 확대됐는지 확인. 아울러 이 노트의 출처가 정말 Ars 리뷰였는지도 원문 접근이 가능해지면 교차 확인.)*
