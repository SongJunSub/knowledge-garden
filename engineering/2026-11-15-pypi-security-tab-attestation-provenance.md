---
title: "PyPI, 프로젝트 페이지에 보안 탭 추가 (PyPI/PSF) — 증명의 존재가 아니라 '있다가 사라짐'을 추적하는 게 핵심"
source_title: "PyPI makes release attestations easier to find with new security tab / 2026-07-22 UI Updates"
source_url: "https://blog.pypi.org/posts/2026-07-22-ui-updates/"
source_name: "PyPI 공식 블로그(blog.pypi.org), Help Net Security·Python Discourse 교차확인 · GeekNews 경유"
referrer_url: "https://news.hada.io/topic?id=37178"
published_at: "2026-07-22 (블로그 공지 기준, 탭 자체의 정확한 출시일은 출처 간 불일치)"
summarized_at: "2026-11-15"
category: "engineering"
tags: ["pypi", "supply-chain-security", "attestation", "provenance", "sigstore", "trusted-publishing", "python"]
---
# PyPI, 프로젝트 페이지에 보안 탭 추가 (PyPI/PSF)

> 출처: [PyPI makes release attestations easier to find with new security tab](https://blog.pypi.org/posts/2026-07-22-ui-updates/) (PyPI/PSF · Help Net Security 보도 · Python Discourse 토론) · GeekNews 경유 · 정리일 2026-11-15
>
> **출처 한계**: news.hada.io가 이 세션에서 egress 차단되어 GeekNews 원문·댓글을 직접 열람하지 못했고, Slack 발췌 요약만으로 핵심 내용을 재구성했다. WebSearch로 PyPI 공식 블로그와 Help Net Security, Python Discourse를 교차확인했지만, **탭의 정확한 출시일이 출처마다 다르다** — PyPI 블로그(2026-07-22)는 보안 탭을 "다음 단계(Phase)"로 예고하는 톤이고, Help Net Security·Discourse 글(11월 기준)은 이미 라이브된 것처럼 서술한다. 실제 라이브 전환 날짜는 이 리서치로 확정하지 못했다.

## 한 줄 요약

**PyPI가 프로젝트 페이지에 보안 탭을 추가해, 릴리스 파일이 "누가(Trusted Publisher) 어떤 소스 커밋·빌드 환경(SLSA Build Provenance)에서" 만들어 올렸는지를 암호학적 증명으로 보여주기 시작했다 — 핵심은 증명의 유무 자체가 아니라, 이전 릴리스와 비교해 저장소·워크플로가 바뀌거나 증명이 사라지는 "변화"를 잡아내는 데 있다.**

## 핵심 포인트

- **두 종류의 증명** — *PyPI Publish attestation*은 어떤 Trusted Publisher(CI 워크플로)가 파일을 게시했는지, *SLSA Build Provenance attestation*은 어느 소스 커밋·빌드 플랫폼·빌드 지시어에서 만들어졌는지를 증명한다. 둘은 서로 다른 신뢰 축이다.
- **증명 없음 ≠ 악성** — ***출처 상태는 증명 보유 여부로만 계산되며, 증명이 없다는 사실 자체가 파일이 악성이라는 뜻은 아니다*** — 단지 출처를 암호학적으로 검증할 수 없다는 뜻. 여전히 많은 메인테이너가 Trusted Publishing을 설정하지 않은 상태라, "증명 없음"이 생태계 전반에서 매우 흔한 기본값이다.
- **"변화"를 경고로 표시** — 같은 릴리스 안에서 일부 파일에만 증명이 있거나, 파일들이 서로 다른 저장소·빌드 시스템에서 만들어졌다면 경고가 뜬다. ***이전 릴리스와 비교해 저장소나 워크플로가 바뀌거나 증명이 사라진 경우("Loss of Provenance")도 알려준다*** — 공급망 공격이 흔히 "조용히 빌드 경로를 바꿔치기"하는 패턴을 정조준한 설계다.
- **커뮤니티 반발 지점** — Python Discourse에서는 증명이 명목상 선택사항인데 UI가 사실상 필수처럼 보이게 만든다는 비판이 나왔다. 예컨대 GitHub Actions에서 Codeberg로 이전한 프로젝트는 PyPI가 아직 그 플랫폼을 지원하지 않아 불리한 "Loss of Provenance" 경고를 받을 수 있다 — ***선의의 플랫폼 이전도 보안 지표상으로는 퇴보처럼 보이는 역설***.
- **npm/GitHub 생태계와의 연결** — 이 기능은 npm provenance, GitHub Artifact Attestations, Sigstore 기반 서명 흐름과 같은 계열의 "빌드 투명성" 움직임이며, PyPI는 2024-11 Sigstore 기반 증명 GA 이후 이번 UI 단계로 가시성을 끌어올린 것으로 보인다(WebSearch 확인, 직접 원문 열람은 아님).

## 인상 깊은 문장

> (원문 미열람 — GeekNews/PyPI 블로그 직접 인용 생략. Slack 발췌와 WebSearch 요약을 재구성했다.)

## 댓글

GeekNews 댓글 수는 원문 차단으로 확인 불가. Python Discourse 스레드(11/6 공지 관련)는 **찬반이 섞인 실제 논쟁**이 확인됐다 — "증명 중심 UI가 사실상 강제처럼 작동한다"는 메인테이너 측 우려가 있었고, "PASS"로만 보고하지 않고 이 반론을 핵심 포인트에 그대로 남겼다.

## 내 생각 · 적용점

이 기능의 설계 철학은 **"정적인 신뢰 배지"가 아니라 "변화 탐지"**에 있다는 점이 흥미롭다. 단순히 증명이 있다/없다를 초록불·빨간불로 보여주는 게 아니라, 같은 프로젝트의 과거 릴리스와 비교해 빌드 경로가 바뀌었는지를 추적한다 — 이건 [[2026-10-22-litellm-pypi-backdoor-credential-theft]]에서 다룬 LiteLLM PyPI 백도어처럼 "정상적으로 보이는 패키지가 어느 순간 악성 빌드로 바뀌는" 공급망 공격의 전형적 패턴을 정확히 겨냥한다 — 그 사건 당시엔 이런 변화 추적 장치가 없었다면 탐지가 한 박자 늦었을 것이다. 또한 [[2026-06-08-aur-supply-chain-malware]]에서 본 "커밋 메타데이터 위조로 신뢰망이 깨지는" 문제와도 같은 축에 있다 — AUR은 공식 서명·빌드 증명 체계가 약해 메타데이터 위조가 먹혔지만, PyPI의 이 기능은 바로 그 위조(저장소·워크플로 변경)를 UI 차원에서 드러내려는 시도다. 다만 Discourse의 비판처럼, "증명 없음"이 압도적으로 흔한 현재 상태에서 이 UI가 실제로 메인테이너들의 Trusted Publishing 도입을 얼마나 끌어올릴지는 지켜봐야 한다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 멀다** — 온다의 CRS는 PyPI 패키지를 배포하는 입장이 아니라 소비하는 입장이다. 다만 전이 가능한 원칙 하나: ***내부 CI/CD 파이프라인에서 서드파티 패키지(PyPI, npm 등)를 핀 고정(pin)할 때, "버전이 바뀌었는가"만 보지 말고 "그 버전이 이전과 같은 빌드 경로(저장소·워크플로)에서 나왔는가"까지 확인하는 변화 탐지 관점을 CI 체크리스트에 추가할 만하다*** — 특히 호텔 PMS/CRS 연동처럼 외부 벤더 SDK를 다수 의존하는 구조에서는, 벤더가 조용히 빌드 주체를 바꾸는 상황이 가장 위험한 공급망 침투 지점이기 때문이다.

## 연관 자료

- [[2026-10-22-litellm-pypi-backdoor-credential-theft]] — 바로 이 보안 탭이 있었다면 더 빨리 드러났을 법한 PyPI 생태계 백도어 사례
- [[2026-06-08-aur-supply-chain-malware]] — 다른 패키지 저장소(AUR)지만 "메타데이터 위조로 빌드 출처 신뢰가 깨지는" 같은 구조의 선행 사례

## 한 달 뒤 회고

*(2026-12-15 즈음 — 보안 탭의 정확한 GA 날짜와, Discourse에서 지적된 "플랫폼 미지원으로 인한 억울한 Loss of Provenance 경고" 문제가 실제로 개선됐는지 확인. Trusted Publishing 도입률이 이 UI 공개 이후 실제로 올랐는지도 검색해볼 것.)*
