---
title: "Kiri, 경량 Docker Desktop 대체재 (GeekNews) — '무료 ngrok 대안'이라는 핵심 주장은 끝내 확인 못했다"
source_title: "Kiri"
source_url: "https://github.com/libracoder/kiri"
source_name: "GitHub (libracoder/kiri, GeekNews 경유)"
referrer_url: "https://news.hada.io/topic?id=37496"
published_at: "확인 불가"
summarized_at: "2026-11-20"
category: "engineering"
tags: ["docker", "container-runtime", "developer-tools", "rust", "tunneling"]
---

# Kiri, 경량 Docker Desktop 대체재 (GeekNews)

> 출처: [Kiri](https://github.com/libracoder/kiri) (GitHub, libracoder/kiri) · [GeekNews](https://news.hada.io/topic?id=37496) 경유 · 정리일 2026-11-20
>
> **출처 한계**: `news.hada.io`는 egress 차단 재확인했지만 GitHub 저장소 자체는 확인 가능했다. 다만 컨테이너 시작 속도 벤치마크가 소스마다 크게 엇갈리고, Slack 발췌의 핵심 주장인 "무료"라는 점은 어떤 소스로도 확인하지 못했다.

## 한 줄 요약

**Kiri는 기존 Docker 이미지와 명령을 그대로 쓰는 Rust 기반 경량 컨테이너 런타임으로 Docker Desktop 없이 docker CLI·Compose·buildx를 지원하지만, 성능 수치가 소스마다 두 배 이상 엇갈리고 터널링 기능의 "무료" 여부는 1차 확인이 안 된다.**

## 핵심 포인트

- Rust로 작성된 단일 데몬 컨테이너 런타임으로, macOS/Windows/Linux에서 ***기존 Docker 이미지와 명령을 그대로 사용***한다.
- `docker` CLI, Compose, buildx와 Docker Engine API를 지원해 ***기존 개발 도구와 연결 가능***하다 — Docker Desktop을 제거하지 않고도 "Kiri" Docker 컨텍스트로 전환할 수 있다.
- 컨테이너별 ***실시간 로그, 터미널, 파일과 리소스 사용량***을 앱에서 확인하고 Compose 프로젝트를 묶어서 관리한다.
- Apache-2.0 라이선스, 약 4.6k stars/215 forks로 초기 단계이며 기여자가 소수에 집중돼 있다.
- 컨테이너 시작 속도 벤치마크는 소스마다 22ms vs 178ms, 2.55ms vs 213ms로 ***크게 엇갈려 신뢰도가 낮다*** — 벤더/서드파티 우호적 수치로 취급해야 한다.
- `kiri share <container|port>`로 `runkiri.cloud` 서브도메인을 통한 HTTPS 공개 터널링을 제공하나, ***무료 여부·요율 제한은 어떤 소스에서도 확인하지 못했다*** — Slack 발췌의 "무료 ngrok 대안"이라는 핵심 주장 자체가 1차 확인이 안 된다.

## 인상 깊은 문장

> (GitHub README 수준의 기능 설명 외에, 저자의 별도 1차 표현은 확보하지 못했다.)

## 댓글

GeekNews 댓글 수는 확인하지 못했다. **"PASS" 아님을 명시**: 이 노트의 제목이 담은 "무료 ngrok 대안"이라는 핵심 주장이 검증되지 않았다는 사실을 그대로 남긴다. 초기 단계 프로젝트(기여자 소수 집중)라는 점도 명시한다.

## 내 생각 · 적용점

### 적용점

로컬 개발 환경에서 무거운 Docker Desktop을 경량 대체재로 바꾸려는 시도 자체는 합리적이지만, 벤치마크 수치가 두 배 이상 엇갈리는 초기 단계 도구는 운영 환경이 아니라 개인 로컬 환경에서 먼저 검증하는 게 안전하다.

## 호스피탈리티 / CRS 적용 포인트

**제한적.** 로컬 개발 환경 도구 교체 수준이라 직접적인 CRS 업무 적용점은 없다. 데모 공유나 웹훅 테스트용 터널링 용도로만 참고 가치가 있고, 그마저도 "무료" 여부가 확인되지 않아 신뢰하고 쓰기엔 이르다.

## 연관 자료

- [[2026-10-24-docker-is-weird-container-runtime-internals]] — 같은 컨테이너 런타임 내부 구조 계열

## 한 달 뒤 회고

2026-12-20 즈음 — Kiri Share의 실제 요율 제한을 확인했는지, 벤치마크 수치 불일치가 해소됐는지 점검.
