---
title: "Fast-Anything: 전체를 Rust로 재작성하지 말고, 느린 5%만 재작성하라 (GeekNews, 동명 프로젝트 특정 실패) — 재작성이 아니라 '검증 가능한 교체'가 핵심이다"
source_title: "Fast-Anything: 전체를 Rust로 재작성하지 말고, 느린 5%만 재작성하라"
source_url: "https://news.hada.io/topic?id=37645"
source_name: "GeekNews"
referrer_url: "https://news.hada.io/topic?id=37645"
published_at: "확인 불가"
summarized_at: "2026-11-23"
category: "engineering"
tags: ["rust", "performance", "coding-agent", "hot-path-rewrite", "regression-testing"]
---

# Fast-Anything: 전체를 Rust로 재작성하지 말고, 느린 5%만 재작성하라 (GeekNews)

> 출처: [Fast-Anything](https://news.hada.io/topic?id=37645) (GeekNews) · 정리일 2026-11-23

> **출처 한계**: `news.hada.io` 접근 차단으로 원문 미확인. "fast-anything"이라는 정확한 이름의 프로젝트는 찾지 못했다. 가장 근접한 대체재는 `rust-anything`(erKam Yaman, MIT, ~1.7k GitHub stars, `cargo install rust-anything`)으로, 설명(앱 전체가 아닌 느린 부분만 포팅, 실행 레코딩으로 결과 검증 후 교체)은 Slack 발췌와 거의 일치하지만 ***이름이 다르고 "5%" 수치도 확인하지 못했다*** — 동명 프로젝트가 아닐 가능성을 열어두고 "원문 특정 실패"로 처리한다.

## 한 줄 요약

**fast-anything(또는 그 근접 프로젝트 rust-anything)은 앱의 병목 함수를 코딩 에이전트가 찾아 Rust로만 이식하고, 실제 호출 기록으로 결과를 검증한 뒤에만 교체하는 도구다 — "전체 재작성"이 아니라 "검증된 부분 교체"가 핵심 설계다.**

## 핵심 포인트

- 앱의 병목 함수를 찾아 코딩 에이전트가 ***해당 함수만 Rust로 이식***하고, 실제 호출 기록으로 결과를 검증한 뒤 교체하는 도구다.
- 실행 시간과 이식 가능성을 기준으로 후보를 고르며, 작은 함수를 수백만 번 호출하는 대신 ***반복문 전체를 Rust로 옮겨*** 언어 사이를 오가는 비용(FFI 오버헤드)을 줄인다.
- 실제 호출과 추가 경계 사례에서 결과와 오류 동작이 일치해야 하며, ***정확하더라도 호출당 실행 시간이 더 느린 이식본은 활성화하지 않는다*** — 성능 회귀를 자동으로 막는 안전장치다.
- 참고 가능한 근접 프로젝트(rust-anything)는 crates.io + GitHub release 바이너리 + npm 패키지로 배포된다.

## 인상 깊은 문장

> (원문 특정 실패로 1차 인용은 확보하지 못했다. Slack 발췌를 넘어서는 인용은 지어내지 않는다.)

## 댓글

hada 댓글 확인 불가. 1차 원문 미특정으로 HN 논쟁 여부도 확인하지 못했다.

## 내 생각 · 적용점

### 핵심 전이 — "검증 가능한 영역에서만 에이전트를 믿는다"는 같은 원칙의 또 다른 사례

이 도구의 핵심은 "Rust로 재작성한다"는 기술 선택이 아니라, ***에이전트의 산출물을 실행 기록과 대조해 검증하지 않으면 교체하지 않는다***는 안전장치다. [[2026-11-22-vibe-coding-inference-chip-fpga]]에서 이미 "검증 가능한 영역에서 에이전트 반복이 통한다"는 원칙을 세웠는데, 이 도구는 그 원칙을 코드 레벨에서 구체적으로 구현한 사례로 읽힌다. [[2026-09-10-coding-agents-test-verification-techniques]]의 "실행 기반 검증" 기법과도 같은 축이다.

### 적용점

"호출당 더 빠르지 않으면 이식본을 비활성화한다"는 설계는, 성능 최적화 자동화 도구를 만들 때 "정확성만 보지 말고 실제 성능 개선 여부까지 자동으로 게이트를 건다"는 원칙으로 일반화할 수 있다.

## 호스피탈리티 / CRS 적용 포인트

**적용 가능성 있음.** CRS/채널매니저처럼 오래된 코드베이스를 통째로 재작성하는 대신, 프로파일링으로 실제 병목(예: 요금 계산 엔진의 특정 반복문)만 식별해 점진적으로 개선하고, 실행 기록 기반으로 전후 결과를 자동 대조하는 접근은 레거시 시스템 현대화 전략으로 참고할 가치가 있다.

## 연관 자료

- [[2026-11-22-vibe-coding-inference-chip-fpga]] — "검증 가능한 영역에서 에이전트 반복이 통한다"는 같은 원칙
- [[2026-09-10-coding-agents-test-verification-techniques]] — 같은 실행 기반 검증 축

## 한 달 뒤 회고

2026-12-23 즈음 — news.hada.io 차단이 풀려 fast-anything의 정확한 정체(rust-anything과 동일 프로젝트인지)를 확인했는지 점검.
