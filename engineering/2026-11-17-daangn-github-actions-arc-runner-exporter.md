---
title: "GitHub Actions 모니터링의 빈칸, Exporter로 ARC Runner 관측하기 (당근마켓) — 범용 컨트롤러가 주는 기본 메트릭과 운영이 실제로 필요한 메트릭 사이의 틈을 자체 Exporter로 메운다"
source_title: "GitHub Actions 모니터링의 빈칸: Exporter로 ARC Runner 관측하기 / Closing the GitHub Actions Monitoring Gap: Observing ARC Runners with an Exporter"
source_url: "https://medium.com/daangn/github-actions-%EB%AA%A8%EB%8B%88%ED%84%B0%EB%A7%81%EC%9D%98-%EB%B9%88%EC%B9%B8-exporter%EB%A1%9C-arc-runner-%EA%B4%80%EC%B8%A1%ED%95%98%EA%B8%B0-cbe1a46a9e71"
source_name: "당근마켓 기술 블로그 (Medium)"
referrer_url: "https://medium.com/daangn/closing-the-github-actions-monitoring-gap-observing-arc-runners-with-an-exporter-0a8f39c3b70b"
summarized_at: "2026-11-17"
category: "engineering"
tags: ["github-actions", "arc", "kubernetes", "observability", "prometheus", "ci-cd", "당근마켓"]
---
# GitHub Actions 모니터링의 빈칸, Exporter로 ARC Runner 관측하기 (당근마켓) — 범용 컨트롤러가 주는 기본 메트릭과 운영이 실제로 필요한 메트릭 사이의 틈을 자체 Exporter로 메운다

> 출처: [GitHub Actions 모니터링의 빈칸: Exporter로 ARC Runner 관측하기](https://medium.com/daangn/github-actions-%EB%AA%A8%EB%8B%88%ED%84%B0%EB%A7%81%EC%9D%98-%EB%B9%88%EC%B9%B8-exporter%EB%A1%9C-arc-runner-%EA%B4%80%EC%B8%A1%ED%95%98%EA%B8%B0-cbe1a46a9e71) (당근마켓, 한글판/영문판 동시 게시) · 정리일 2026-11-17

## 한 줄 요약

**GitHub Actions Runner Controller(ARC)는 Kubernetes 위에서 self-hosted 러너를 자동확장해 주지만, 러너 하나하나의 상태·대기열·리소스 사용량 같은 "운영에 필요한" 가시성까지는 기본으로 주지 않는다. 당근마켓은 전용 Exporter를 직접 만들어 Prometheus·Grafana로 이 빈칸을 메웠다.**

## 핵심 포인트

- **범용 컨트롤러의 한계** — ARC는 GitHub 공식 러너 스케일셋 API의 레퍼런스 구현으로 자동확장은 보장하지만, "지금 몇 개의 잡이 대기 중인가" "어떤 러너가 멈춰 있는가" 같은 ***운영 질문에 바로 답하는 메트릭***은 별도로 만들어야 한다.
- **전용 Exporter 도입** — 쿠버네티스 기반 러너의 메트릭을 수집해 Prometheus·Grafana와 연동하는 아키텍처로, ARC 컨트롤러 자체의 메트릭 엔드포인트만으로는 부족했던 부분을 채운다.
- **목표는 가동률이 아니라 대응 시간** — 데이터 시각화의 목적은 "예뻐 보이는 대시보드"가 아니라 ***러너 가용성을 확보하고 장애 대응 시간을 단축***하는 것. 모니터링 투자를 운영 성과로 바로 연결한다.
- **사전 리소스 병목 파악** — 러너의 확장성과 성능 병목을 사전에 파악해 효율적인 CI/CD 운영 환경을 구축하는 쪽으로 이어진다.

## 인상 깊은 문장

> (Slack 다이제스트 발췌) "GitHub Actions의 ARC 러너 환경에서 발생하는 모니터링 공백을 메우기 위한 익스포터 도입의 필요성"

## 댓글

**댓글 수 확인 불가.** medium.com이 이 세션에서 egress 전면 차단(getaddrinfo ENOTFOUND)되어 한글판·영문판 원문 모두 직접 열람하지 못했다. WebSearch로도 당근마켓 고유 사례를 다룬 2차 보도는 찾지 못했고(ARC·Exporter 일반론만 확인), hada 큐레이션 경유가 아니라 TechArticles 봇의 RSS 직링크라 HN/Lobsters 큐레이션 유무 자체도 확인 대상이 아니다.

**출처 한계(중요)**: 같은 시각(2026-11-17 20:10 KST) Slack에 한글판·영문판 두 URL이 동시에 게시됐다. 당근 Medium 블로그가 평소 같은 포스트를 한글/영문 이중 게시하는 관례가 있어 "같은 글의 번역판"으로 추정했지만, 원문 접속이 막혀 **실제로 내용이 동일한지 직접 대조하지 못했다**. 이 노트는 그 추정 위에서 두 URL을 하나의 콘텐츠로 묶어 작성했다 — 추정이 틀렸다면(별개 심화 아티클이라면) 후속 정리가 필요하다.

## 내 생각 · 적용점

### 핵심 전이 1 — "컨트롤러가 주는 기본값"과 "운영이 실제로 묻는 질문"은 다른 차원이다

ARC는 확장이라는 한 가지 문제를 레퍼런스 수준으로 풀지만, "왜 느린가" "어디가 막혔는가"라는 운영 질문에는 침묵한다. 이건 [[2026-09-23-linear-ai-coding-ci-bottleneck]]에서 Linear가 러너 시간을 절반으로 줄인 과정과 같은 결 — **범용 인프라를 들여온 뒤에도 "우리 조직의 운영 질문"에 답하는 계측은 별도 투자**라는 원칙이다.

### 핵심 전이 2 — 같은 회사, 같은 패턴: 조용히 무너지는 것을 계측으로 잡는다

당근마켓은 이미 [[2026-10-21-daangn-llm-model-swap-triples-cost]]에서 "에러 없이 조용히" 캐시 히트율이 무너져 비용이 3배가 된 사례를 겪었다. 이번 ARC 모니터링 공백도 같은 구조다 — ***장애가 아니라 "조용한 저하"가 더 위험하고, 조용한 저하는 전용 계측 없이는 아예 보이지 않는다.*** 같은 회사가 인프라 레이어(LLM 게이트웨이, DB, 이제 CI 러너)마다 이 교훈을 반복해서 재확인하고 있는 셈.

## 호스피탈리티 / CRS 적용 포인트

온다는 당근마켓 규모의 자체 Kubernetes ARC 러너 클러스터를 운영하지 않아 Exporter 자체를 그대로 가져다 쓸 일은 없다(직접 적용은 멀다). 다만 전이 가능한 원칙은 있다: **벤더/오픈소스가 제공하는 기본 모니터링과 "우리 CRS 운영팀이 실제로 묻는 질문"(예: 특정 채널 연동 작업이 몇 분째 대기 중인가) 사이의 빈칸을 가정하지 말고 명시적으로 점검**하는 것. CI/CD 파이프라인이든 예약 동기화 큐든, "확장은 되는데 왜 느린지는 모른다"는 상태를 방치하지 않는 습관으로만 전이한다.

## 연관 자료
- [[2026-09-23-linear-ai-coding-ci-bottleneck]] — *같은 "CI 러너 시간" 문제를 계측·컴파일러 전환으로 해결한 선례*
- [[2026-10-21-daangn-llm-model-swap-triples-cost]] — *같은 회사, "조용히 무너지는 지표를 계측으로 잡는다"는 동일 패턴*
- [[2026-10-06-daangn-aurora-mysql-ddl-reader-buffer-pool]] — *같은 회사, 인프라 레이어의 숨은 부작용을 사후에 추론해야 했던 사례*

## 한 달 뒤 회고
*(2026-12-17 즈음 — 한글판/영문판이 실제로 같은 글이었는지 원문 접속이 풀리면 확인했는지, "기본 모니터링과 실제 운영 질문의 빈칸"을 온다 CI나 예약 파이프라인에서 점검해본 적이 있는지 기록.)*
