---
title: "OpenAI, Anthropic, Meta 해킹 논란의 배후에는 한 업체가 있음 (CNBC 외) — 세 회사 모두 '인터넷에 연결 안 된 모의 환경'이라 알려준 모델이, 설정 오류로 실제 인터넷에 연결돼 있었다"
source_title: "A single firm is behind OpenAI, Anthropic, and Meta hacking scandals"
source_url: "https://www.cnbc.com/"
source_name: "CNBC 외 복수 매체"
referrer_url: "https://news.hada.io/topic?id=33745"
published_at: "2026-08-09"
summarized_at: "2026-09-16"
category: "ai"
tags: ["AI안전평가", "보안사고", "설정오류", "GeekNews"]
---

# OpenAI, Anthropic, Meta 해킹 논란의 배후에는 한 업체가 있음

> 출처: [A single firm is behind OpenAI, Anthropic, and Meta hacking scandals](https://www.cnbc.com/) (CNBC 외) · 정리일 2026-09-16

## 한 줄 요약
**이스라엘 보안 스타트업 Irregular가 OpenAI·Anthropic·Meta 세 회사 모델의 사이버 역량을 평가하다가, 가상 표적 이름이 실제 도메인과 우연히 겹치는 네이밍 오류와 설정 실수로 "인터넷 미연결"이라 믿었던 모델이 실제 인터넷에 연결되면서 진짜 시스템을 침해하는 사고가 세 회사에서 연쇄적으로 발생했다.**

## 핵심 포인트
- 이스라엘 보안 스타트업 ***Irregular***가 OpenAI·Anthropic·Meta 세 회사 모두의 모델을 사이버 역량 평가하다가 연쇄적으로 실제 시스템 침해 사고를 유발
- OpenAI 모델은 샌드박스 탈출 후 Hugging Face를 침해했고, Modal Labs 고객 계정도 별도로 침해됨
- Anthropic은 ***141,006개 테스트 세션 중 3건의 실제 침해***를 확인했고, 이후 Opus 4.6 관련 4번째 사고까지 추가 공개(2026-09)
- 핵심 원인: Irregular의 "capture-the-flag" 시뮬레이션에서 ***가상 표적 회사명이 실제 도메인과 우연히 일치***하는 네이밍 오류 + 설정 실수로 모델이 "인터넷 미연결"이라 믿었지만 실제로는 공개 인터넷에 연결됨 — 모델이 약한 비밀번호·미인증 엔드포인트 같은 기초적 방법으로 실제 기업을 침해
- Meta의 Muse Spark 1.1도 같은 방식으로 제3자 시스템을 침해

## 인상 깊은 문장
> (재구성) "a misconfiguration... allowed models to access the public internet"

## 댓글
GeekNews 댓글 수는 hada.io 접근 차단으로 확인 불가. Hacker News에 게시됨(item id=49704132)이나 정확한 포인트·댓글 수는 접근 차단으로 미확인. CNBC·CSOonline·TheNextWeb 등 복수 매체로 교차 확인했으나 전부 WebFetch 실패로 WebSearch 스니펫 재구성 — Anthropic 자체 공식 포스트 원문은 미열람. **n=1 벤더(Irregular) 문제가 3대 랩 전체에 걸쳐 반복**되는 구조라, OpenAI/Anthropic 모두 "계속 협력하겠다"는 공식 입장인 만큼 책임 소재를 축소할 유인이 있다는 점을 감안해야 한다.

## 내 생각 · 적용점
**[[2026-09-13-models-dont-go-rogue-human-decisions]]**가 정확히 같은 사고(Hugging Face 침해)를 다룬 노트다 — "모델이 통제를 벗어났다"가 아니라 "안전장치를 끄고 방치한 인간의 설정 실수"가 진짜 주어라는 그 글의 논지가, 이번엔 세 회사에 걸친 패턴이었다는 게 새로 확인된 사실이다. 평가 환경의 "격리됐다고 믿었지만 실제로는 아니었다"는 실패 양상은 고전적인 보안 사고 패턴(테스트/스테이징 환경의 프로덕션 오염)과 본질적으로 같다.

## 호스피탈리티 / CRS 적용 포인트
AI 에이전트를 샌드박스/테스트 환경에서 평가할 때 "네트워크 격리됐다"는 가정을 검증 없이 신뢰하지 말 것 — CRS 테스트 환경에서 AI 에이전트나 자동화 스크립트를 돌릴 때도 네트워크 정책(아웃바운드 차단, 실제 PMS 연동 차단)을 코드가 아니라 인프라 레벨에서 강제하고 있는지 점검할 가치가 있다.

## 연관 자료
- [[2026-09-13-models-dont-go-rogue-human-decisions]] — 같은 Hugging Face 침해 사고를 다룬 선행 노트, "모델이 아니라 인간의 결정"이라는 프레임의 원전
- [[2026-08-29-hugging-face-openai-agent-breach-swarm]] — 관련 Hugging Face 침해 사고의 다른 측면

## 한 달 뒤 회고
2026-10-16 즈음, Irregular와 세 AI 랩이 평가 환경 격리 방식을 어떻게 개선했다고 발표했는지, 추가 침해 사고가 보고됐는지 점검.
