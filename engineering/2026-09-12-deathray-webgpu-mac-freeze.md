---
title: "Deathray, 링크 하나로 Mac을 멈추게 하는 WebGPU 버그 (Auberon López) — Apple은 재현까지 해놓고 '보안 문제 아니다'로 결론 냈다"
source_title: "The Deathray: A simple way for an untrusted site to freeze a Mac"
source_url: "https://auberon.xyz/blog/posts/deathray/"
source_name: "Auberon López, auberon.xyz"
referrer_url: "https://news.hada.io/topic?id=33527"
published_at: "2026-09"
summarized_at: "2026-09-12"
category: "engineering"
tags: ["webgpu", "macos", "browser-security", "denial-of-service", "gpu", "sandbox-escape-adjacent", "apple"]
---

# Deathray, 링크 하나로 Mac을 멈추게 하는 WebGPU 버그 (Auberon López)

> 출처: [The Deathray: A simple way for an untrusted site to freeze a Mac](https://auberon.xyz/blog/posts/deathray/) (Auberon López) · GeekNews(id=33527) 경유 · 정리일 2026-09-12

> **출처 한계**: `auberon.xyz`·`news.hada.io`·`news.ycombinator.com`·`cybernews.com` 모두 이번 세션 egress 정책으로 직접 열람하지 못했다. WebSearch로 Cybernews·SAGF 등 2차 매체의 인용·요약을 교차 확인해 재구성했다. 원문의 정확한 셰이더 코드, 발행 정확한 날짜, GeekNews·HN 댓글의 상세 논조는 확인하지 못했다.

## 한 줄 요약

**WebGPU를 배우던 중 실수로 무한루프에 빠진 컴퓨트 셰이더를 만든 연구자 Auberon López가, 그 셰이더를 로드하는 웹페이지 링크 하나만 클릭해도 macOS 전체가 멈추고 강제 재시작된다는 것을 발견했다.** Chrome·Firefox·Safari 등 브라우저 종류와 무관하게 macOS에서만 재현되는 이 버그를 Apple에 신고했으나, 처음엔 재현하고 수정 일정까지 잡았던 Apple이 태도를 바꿔 "보안적 함의를 발견하지 못했다"며 사실상 방치했다.

## 핵심 포인트

- **발견 경위** — 저자가 WebGPU를 학습하는 과정에서 실수로 만든 무한루프 컴퓨트 셰이더가, 의도치 않게 Mac을 안정적으로 멈추게 한다는 걸 우연히 알게 됐다.
- **기술적 원인** — 컴퓨트 셰이더가 무한루프로 GPU를 계속 점유하면 버텍스 셰이더가 진행하지 못하고, 이 정체가 GPU를 쓰려는 다른 프로세스, 특히 macOS의 화면 서버 프로세스인 ***WindowServer***로 번진다. WindowServer가 오래 응답하지 않으면 이를 감시하는 워치독이 커널 패닉을 유발해 컴퓨터가 강제 재시작된다.
- **범위** — 브라우저 종류(Chrome·Firefox·Safari)와 무관하게 macOS에서 크로스브라우저로 재현되지만, 다른 운영체제에서는 재현되지 않는다. 즉 취약점의 실체는 브라우저가 아니라 macOS의 WebGPU/GPU 드라이버 스택에 있다.
- **트리거 난이도가 낮다** — 악성 스크립트 설치나 권한 상승 없이, 신뢰하지 않는 사이트의 링크를 클릭하는 것만으로 트리거된다.
- **Apple의 대응 번복** — Apple은 신고를 받고 문제를 재현했고 처음엔 수정 일정까지 제시했지만, 이후 태도를 바꿔 ***"보안적 함의를 발견하지 못했다"***는 결론으로 마무리했다.
- **저자 본인의 심각도 평가** — López는 이 버그를 "낮은 심각도(low severity)"로 평가하면서도, 링크 하나로 쉽게 트리거된다는 점에서 실질적 성가심이 크다고 짚는다.

## 인상 깊은 문장

> "did not see any security implications" (Apple의 최종 답변, Cybernews 인용)

## 댓글

GeekNews(id=33527) hada 댓글 수는 이번 세션 접근 차단으로 확인하지 못했다. HN에 이 글을 다룬 스레드(news.ycombinator.com/item?id=49649124)가 존재하는 것은 검색으로 확인했지만, 실제 포인트·댓글 수·논조는 egress 차단으로 확인하지 못했다. Lobsters 큐레이션 여부도 미확인. 이 노트는 저자 1인의 자체 조사·Apple과의 비공개 커뮤니케이션 요약을 2차 매체가 재인용한 것이므로, Apple 측 반박이나 추가 해명이 별도로 존재하는지는 원문 접근 없이는 확인할 수 없는 **n=1 성격의 보고**다.

## 내 생각 · 적용점

### 핵심 전이 1 — [[2026-09-06-chrome-v8-cve-2026-85046]]와 겹쳐 보면 "브라우저발 사고"의 심각도 스펙트럼 양극단을 보여준다

Chrome V8 CVE 노트는 CVSS 8.8·CISA KEV 등재·실공격 악용까지 확인된 **원격 코드 실행**급 취약점이었다. 이번 Deathray는 코드 실행이나 데이터 유출 없이 **가용성만 해치는 DoS**이고 Apple도 "보안 함의 없음"으로 분류했다. 같은 "웹사이트 방문만으로 트리거되는 취약점" 계열이지만 심각도는 정반대 끝에 있다 — 그런데도 Apple의 대응 태도(재현 후 방치)는 오히려 그 CVE 노트가 보여준 신속 패치 사례보다 느슨하다는 점이 대비된다.

### 핵심 전이 2 — [[2026-08-02-google-ai-fixes-chrome-bugs]]가 짚은 "측정되는 것만 관리된다"는 원칙이 여기서도 반복된다

Chrome AI 버그 수정 노트의 급소는 "찾은 버그 수는 정밀 측정되지만 AI가 새로 만든 버그는 아무도 추적하지 않는다"는 비대칭이었다. Deathray는 그 비대칭의 또 다른 변주다 — Chrome이라는 단일 제품의 취약점 관리 체계는 정교해졌지만, **macOS GPU 드라이버 스택처럼 여러 브라우저를 관통하는 OS 레벨 실패 지점**은 어느 한 회사의 버그바운티·CVE 관리 파이프라인에도 깔끔하게 속하지 않는다. "브라우저 버그"로 집계되지 않는 크로스스택 취약점은 그만큼 방치되기 쉽다.

### 핵심 전이 3 — [[2026-09-04-browser-main-thread-is-expensive]]가 GPU/컴포지터 스레드를 "안전한 오프로드 대상"으로 그렸던 전제를 뒤집는다

메인 스레드 노트는 무거운 작업을 메인 스레드에서 빼내 컴포지터/GPU로 보내는 것을 성능 최적화의 정석으로 제시했다. Deathray는 그 GPU 파이프라인 자체가 무한루프에 걸리면 메인 스레드는커녕 OS의 화면 서버 전체를 멈춰버릴 수 있다는 걸 보여준다 — "GPU로 보내면 안전하다"는 성능 최적화 전제가, 신뢰할 수 없는 입력(임의 WebGPU 셰이더)이 개입하는 순간 보안적으로는 오히려 더 큰 단일 실패 지점이 될 수 있다는 긴장이다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 멀다 — CRS 제품이 macOS 클라이언트에 임의의 WebGPU 셰이더를 로드할 일은 없고, 이건 OS/브라우저 벤더가 풀어야 할 플랫폼 버그다. 다만 원칙 하나는 가볍게 전이할 수 있다: 온다가 사내 대시보드나 고객용 웹 화면에 서드파티 위젯·광고·임베드 스크립트를 허용한다면, "신뢰하지 않는 콘텐츠가 브라우저 탭 하나가 아니라 OS 전체를 멈출 수 있다"는 이 사례를 근거로 서드파티 스크립트 실행을 iframe sandbox나 별도 권한 격리로 제한하는 정책을 재점검할 근거로 참고할 만하다.

## 연관 자료

- [[2026-09-06-chrome-v8-cve-2026-85046]] — 같은 "웹사이트 방문만으로 트리거"되는 취약점 계열이지만 심각도가 정반대 극단(RCE vs DoS)인 대조 사례
- [[2026-08-02-google-ai-fixes-chrome-bugs]] — "측정되는 것만 관리된다"는 같은 원칙이 크로스스택 OS 버그에서 반복
- [[2026-09-04-browser-main-thread-is-expensive]] — GPU/컴포지터를 안전한 오프로드 대상으로 전제했던 성능 최적화 관점을 뒤집는 반증 사례

## 한 달 뒤 회고

*(2026-10-12 즈음 — Apple이 실제로 패치했는지, 이 버그가 CVE로 등록됐는지, macOS 업데이트로 재현이 안 되는지 확인.)*
