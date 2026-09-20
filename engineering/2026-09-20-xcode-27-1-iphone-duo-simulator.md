---
title: "Xcode 27.1 베타, iPhone Duo 시뮬레이터 지원 (Apple/MacRumors) — 실기기 없이 폴더블 화면·포즈를 미리 확인하지만, StandBy와 대부분의 확장 프로그램 디버깅은 아직 안 된다"
source_title: "Apple Releases Xcode 27.1 Beta With iPhone Duo Support"
source_url: "https://www.macrumors.com/2026/09/18/apple-releases-xcode-27-1-beta-iphone-duo-support/"
source_name: "MacRumors"
referrer_url: "https://news.hada.io/topic?id=33953"
published_at: "2026-09-18"
summarized_at: "2026-09-20"
category: "engineering"
tags: ["xcode", "iphone-duo", "simulator", "swift", "ios-sdk", "mac-catalyst", "foldable"]
---

# Xcode 27.1 베타, iPhone Duo 시뮬레이터 지원 (Apple/MacRumors)

> 출처: [Apple Releases Xcode 27.1 Beta With iPhone Duo Support](https://www.macrumors.com/2026/09/18/apple-releases-xcode-27-1-beta-iphone-duo-support/) (MacRumors) · GeekNews(id=33953) 경유 · 정리일 2026-09-20
>
> **출처 한계**: `news.hada.io`·`macrumors.com` 모두 egress 차단으로 원문을 직접 읽지 못했다. Slack GN⁺ 발췌(5개 불릿, 마지막 불릿이 "Duo 시뮬레이터는 아직 StandBy와 …"에서 잘림)와 WebSearch(9to5Mac·AppleInsider·MacObserver 등 다수 매체 교차 확인)를 종합해 재구성했다. hada·HN 댓글 논조는 확인하지 못했다.

## 한 줄 요약

**Apple이 Xcode 27.1 베타를 공개해 [[2026-09-10-apple-iphone-duo-foldable]]에서 다룬 폴더블 iPhone Duo용 앱 개발이 처음으로 가능해졌다 — Apple Silicon Mac에서 실기기 없이 접기·펼치기·회전 같은 포즈와 화면 전환을 시뮬레이터로 확인할 수 있지만, StandBy와 대부분의 앱 확장 프로그램 디버깅은 아직 지원하지 않는다.**

## 핵심 포인트

- **실기기 없이 새 화면·동작 확인** — iPhone Duo 시뮬레이터에서 앱을 실행·테스트할 수 있어, ***실기기 없이 새 기기에 맞는 화면과 동작***을 확인 가능. Apple Silicon Mac + macOS 26.6 이상에서 동작하며, 열기·닫기·회전·접기 컨트롤을 지원.
- **미리보기 캔버스에 Display 선택 추가** — 미리보기 캔버스에 ***Display 선택 항목***을 추가해, 기기의 다른 디스플레이(내부·외부)에서 콘텐츠가 어떻게 보이는지 확인할 수 있음.
- **Swift 6.4 + iOS 27.1 SDK** — Swift 6.4와 iOS 27.1 SDK를 포함하며, 실행에는 ***macOS Tahoe 26.6 이상***이 필요.
- **Mac Catalyst의 알려진 문제** — Mac Catalyst에서는 ***iOS 27.1 전용 API의 컴파일 오류와 실행 대상 누락 문제***가 있으며, 조건부 컴파일과 최소 배포 버전 설정으로 우회 가능하다고 안내.
- **아직 안 되는 것들** — Duo 시뮬레이터는 아직 ***StandBy와 대부분의 앱 확장 프로그램 디버깅***을 지원하지 않고, 초기 시뮬레이터 실행에 수 분이 걸릴 수 있다는 게 Apple의 릴리스 노트.

## 인상 깊은 문장

> "Available on Apple silicon Macs running macOS 26.6 or later, Xcode 27.1 includes updated SDKs for the iPhone Duo, and a simulator that supports the device's new poses and orientations."
> (WebSearch로 확보한 원문 취지의 재구성.)

## 댓글

**확인 불가.** hada 댓글 수는 대조하지 못했다. 개발자 커뮤니티 반응(MacRumors 포럼 등)이 있는 것으로 보이나 정확한 논조까지는 확인하지 못했다. **읽을 때 감안**: 개발 도구 릴리스 노트에 가까운 소식이라 정치적·논쟁적 요소는 적지만, "언제쯤 실제 앱들이 Duo 최적화 UI를 갖추게 될지"는 이 릴리스만으로는 예측할 수 없다.

## 내 생각 · 적용점

### 핵심 전이 — 발표 노트가 짚었던 "1.42 문제"의 실제 해소 시작점

[[2026-09-10-apple-iphone-duo-foldable]]의 핵심 전이 3은 발표 당일 "정식 SDK가 안 나오고 개발자 페이지만 먼저 풀렸다"며, ***같은 앱이 구버전 SDK로 빌드됐는지 iOS 27.1로 빌드됐는지에 따라 세 단계로 다르게 렌더링***된다는 위험을 짚었다. 이번 Xcode 27.1 베타가 바로 그 공백을 메우는 정식 SDK다 — 다만 Mac Catalyst의 컴파일 오류·실행 대상 누락 문제가 그대로 보고되는 걸 보면, "SDK가 나왔다"와 "렌더링 단계 혼란이 해소됐다"는 여전히 다른 단계라는 그 노트의 경고가 유효하다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 멀다 — 온다가 iPhone Duo 전용 UI를 당장 만들 계획은 없다. 다만 [[2026-09-10-apple-iphone-duo-foldable]]에서 이미 남긴 원칙(새 SDK 버전이 나왔을 때 구버전 호환 모드로 "겉보기엔 되는데 실제로는 제한된" 상태에 머물지 않는지 점검하는 습관)이 이번 릴리스로 실제 적용 시점을 맞이했다는 정도로만 참고.

## 연관 자료

- [[2026-09-10-apple-iphone-duo-foldable]] — 기기 자체의 발표 노트, 이 SDK 릴리스가 메우는 개발자 공백을 예고했던 선행편
- [[2026-09-19-gruber-iphone-18-pro-review]] — 같은 주 Apple 하드웨어 계열 소식, 폼팩터는 다르지만 같은 생태계

## 한 달 뒤 회고

*(2026-10-20 즈음 — Xcode 27.1이 정식 출시됐는지, Mac Catalyst 컴파일 문제가 해결됐는지, StandBy·확장 프로그램 디버깅 지원이 추가됐는지, 실제 앱들의 Duo 대응 UI 품질이 어떤지 확인.)*
