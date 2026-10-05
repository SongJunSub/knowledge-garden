---
title: "RemoveMacAI (omlahore) — macOS 27이 제거해버린 'Apple Intelligence 끄기' 토글을, 설정 프로필로 되돌리다"
source_title: "RemoveMacAI — Turn off Apple Intelligence on macOS 27 and get its disk space back"
source_url: "https://github.com/omlahore/RemoveMacAI"
source_name: "GitHub (omlahore/RemoveMacAI)"
referrer_url: "https://news.hada.io/topic?id=34779"
published_at: "2026-10-04 (WebSearch 복수매체 교차확인)"
summarized_at: "2026-10-05"
category: "engineering"
tags: ["apple-intelligence", "macos-27", "privacy-tooling", "configuration-profile", "sip", "opt-out", "developer-tools"]
---

# RemoveMacAI (omlahore)

> 출처: [RemoveMacAI](https://github.com/omlahore/RemoveMacAI) (GitHub, omlahore) · GeekNews(id=34779) 경유 · 정리일 2026-10-05

> **출처 한계**: `news.hada.io`는 egress 차단으로 직접 열지 못했다. 반면 **GitHub README는 `raw.githubusercontent.com`을 통해 WebFetch로 직접 확보**했다(1차 소스) — 비활성화 방식 세 가지(설정 프로필·모델 삭제·재다운로드 차단), SIP 유지, `/System` 미수정, `revert` 명령, 비활성화되는 기능 목록은 모두 그 1차 소스 기반이다. 다만 **MacRumors·hyper.ai 등이 보도한 "한 명령으로 설치", 디스크 회수량(약 12GB)**은 2차 매체 종합이라 수치의 정확한 근거(어떤 기기·용량 기준인지)는 대조하지 못했다. 동일 저자명으로 `tully-8888/RemoveMacAI` 포크도 검색에 나와, 어느 쪽이 "원본"인지 완전히 확정하지는 못했다(omlahore 쪽을 1차로 택한 건 검색 결과 상단 노출 기준이다). hada 댓글 수, HN/Lobsters 큐레이션 여부는 확인하지 못했다.

## 한 줄 요약

**macOS 27이 "Apple Intelligence 전체 끄기" 토글과 모델 삭제 옵션을 치워버리자, RemoveMacAI는 설정 프로필(Configuration Profile)로 같은 효과를 되살리는 오픈소스 도구다 — System Integrity Protection은 그대로 두고 `/System` 파일을 직접 건드리지 않으면서, Siri·Writing Tools·이미지 생성·Xcode 코드 완성까지 묶어 끄고, 모델 재다운로드 차단과 `revert` 명령으로 전부 되돌릴 수 있게 했다.**

## 핵심 포인트

- **문제의 발단 — Apple이 토글 자체를 없앴다** — 이전 macOS에는 있던 "Apple Intelligence 끄기" 전체 토글과 모델 삭제 옵션이 macOS 27(Golden Gate)에서 사라졌다. 개별 기능은 하나씩 끌 수 있어도, 그걸로는 ***디스크에 깔린 모델 자체는 지워지지 않는다*** — 이 간극이 RemoveMacAI가 메우는 지점이다.
- **세 가지 메커니즘** — ①설정 프로필로 Apple의 제한 키를 적용해 기능을 강제로 끄고, ②Apple의 자산(asset) 서비스를 통해 다운로드된 모델을 삭제하며, ③제거된 각 모델의 다운로드 요청을 닫힌 로컬 포트로 리다이렉트해 ***재설치 자체를 차단***한다.
- **시스템 무결성은 그대로 — SIP 비활성화 없음** — README가 명시하는 핵심 안전장치다: System Integrity Protection은 계속 켜져 있고 `/System` 하위 파일은 직접 수정되지 않는다. OS 수준의 보호를 깨지 않고도 작동한다는 뜻.
- **완전히 되돌릴 수 있다 — `removemacai revert`** — 상태 확인, 특정 기능만 선택적으로 보존, 변경 사항 시뮬레이션(dry-run), 전체 되돌리기까지 터미널 명령으로 관리한다. 변경은 macOS 업데이트 후에도 유지된다고 설명한다.
- **영향받는 기능 — 상당히 넓다** — Siri(Hey Siri 포함), Writing Tools, Genmoji, Image Playground, ChatGPT 확장, Mail·Messages·Safari·Notes의 AI 요약과 스마트 답장, 인라인 텍스트 예측, Spatial Photos 렌더링, Photos 자동 정리, 그리고 ***Xcode의 예측 코드 완성***까지 꺼진다. 다만 받아쓰기(Dictation)는 영향받지 않고 계속 쓸 수 있다고 README가 밝힌다.

## 인상 깊은 문장

> "System Integrity Protection stays enabled and no files under `/System` are modified directly."
> (GitHub README 원문 — WebFetch로 직접 확보)

## 댓글

**hada 댓글 수, HN·Lobsters 등 타 커뮤니티 큐레이션 여부 전혀 확인하지 못했다.** [[2026-09-19-macos-27-golden-gate-review]]에서 이미 확인했듯 "Apple Intelligence를 끌 수 없게 된 것"은 macOS 27 릴리스 자체의 리뷰에서도 가장 먼저 지적된 변화였다 — 즉 RemoveMacAI는 호사가의 트윗이 아니라 ***리뷰어들이 공통으로 비판한 결함을 실제로 되돌리는*** 도구라, 수요가 꾸며진 게 아니라 실재한다고 볼 근거는 있다. 다만 "Apple의 자산 서비스"를 건드리는 방식이 향후 macOS 업데이트로 막힐 가능성, 혹은 Apple이 이를 지원 중단 사유로 삼을 가능성에 대한 논의는 이 세션에서 확인하지 못했다 — 서드파티가 벤더의 숨은 API를 우회하는 도구 특유의 수명 리스크를 감안해야 한다.

## 내 생각 · 적용점

### 핵심 전이 1 — macOS 27 리뷰가 지적한 결함을, 커뮤니티가 직접 메운 사례

[[2026-09-19-macos-27-golden-gate-review]]는 Ars Technica 리뷰를 빌려 "AI를 켠 Golden Gate가 42.92GB, AI 없는 Tahoe가 26.17GB — 약 16.75GB가 순수하게 AI 스택 몫"이라는 실측 수치와 함께 "기능 개선이 아니라 선택권의 제거"라고 비판했다. RemoveMacAI는 바로 그 비판이 가리킨 간극(선택권 제거)을 서드파티 도구로 되살린 사례다 — 벤더가 치운 옵트아웃을, 그 옵트아웃을 원하는 사용자 커뮤니티가 직접 복원하는 패턴이 반복되고 있다는 걸 보여준다.

### 핵심 전이 2 — "원치 않는 AI 끄기" 가이드 계열의 실행판

[[2026-08-19-how-to-turn-off-intrusive-ai]]는 제품별 AI 비활성화 경로를 모아두며 ***"AI 옵션이 기본으로 켜지므로 끈 뒤에도 다시 확인해야 한다"***는 걸 가장 값진 통찰로 짚었다. RemoveMacAI는 그 가이드가 다루는 "안내서" 층위를 넘어 ***실행 가능한 도구*** 층위로 간 사례다 — 다만 그 가이드가 경고한 "선택이 상태가 아니라 반복 노동이 된다"는 문제는 RemoveMacAI에도 그대로 적용된다. macOS 업데이트마다 Apple이 이 경로를 막을 수 있고, 그러면 또 새 버전의 RemoveMacAI나 유사 도구가 필요해지는 추격전이 계속될 가능성이 높다.

**이 글이 "Claude를 더 잘 쓰는 데" 주는 함의는 간접적이지만 하나 있다.** RemoveMacAI가 끄는 기능 목록에 ***Xcode의 예측 코드 완성***이 포함된다는 점은, 온디바이스 Apple Intelligence 코드 완성과 Claude Code 같은 별도 AI 코딩 도구를 같은 머신에서 같이 쓰는 개발자에게는 "둘이 서로 간섭하거나 리소스를 다투지 않는지" 점검할 신호가 될 수 있다 — 다만 이건 이 글이 직접 다루는 내용은 아니고 추론이다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 멀다 — 이건 개인 macOS 환경설정 도구고, CRS 제품·인프라와는 접점이 거의 없다.** 전이 가능한 원칙만 가볍게 남기면, "벤더가 기본값을 바꾸고 선택권을 없앨 때, 그 선택권을 되살리는 수요가 실제로 존재한다"는 사실 자체는 참고할 만하다 — 온다가 CRS에 AI 기반 자동화 기능(자동 가격 조정, 자동 메시지 응답 등)을 출시할 때, ***끄는 토글을 처음부터 없애지 않는 것***, 혹은 적어도 고객이 "이전 방식으로 되돌리기"를 쉽게 할 수 있게 설계하는 게 RemoveMacAI 같은 서드파티 우회 도구의 수요 자체를 막는 더 저렴한 방법이라는 교훈 정도로 읽을 수 있다.

## 연관 자료

- [[2026-09-19-macos-27-golden-gate-review]] — "AI를 끌 수 없게 된 것"이 macOS 27 릴리스 자체의 핵심 비판이었다는 선행 기록, RemoveMacAI가 메우는 바로 그 간극
- [[2026-08-19-how-to-turn-off-intrusive-ai]] — "원치 않는 AI 끄기"라는 같은 장르의 안내서, RemoveMacAI는 그 장르의 실행 도구판

## 한 달 뒤 회고

*(2026-11-05 즈음 — (1) macOS 다음 업데이트에서 Apple이 이 우회 경로를 막았는지 확인. (2) `omlahore`/`tully-8888` 중 어느 쪽이 활발히 유지되는 저장소인지, 스타 수·이슈 트래커로 점검. (3) hada·HN 댓글이 egress 해제 후 확인되면 실제 채택 규모와 우려(예: Apple 서비스 약관 위반 여부 논쟁)를 보강.)*
