---
title: "LangChain은 유료 광고 운영 에이전트를 어떻게 만들었나 (LangChain) — 계산은 코드에, 해석과 판단은 모델에 맡겨 초기 보고서 비용을 40분의 1로 줄였다"
source_title: "How We Built LangChain's Paid Media Agent"
source_url: "https://www.langchain.com/blog/paid-media-agent"
source_name: "LangChain"
referrer_url: "https://news.hada.io/topic?id=34041"
published_at: "확인 불가"
summarized_at: "2026-09-21"
category: "ai"
tags: ["langchain", "deep-agents", "slack-agent", "marketing-agent", "agent-cost-optimization", "cpl"]
---

# LangChain은 유료 광고 운영 에이전트를 어떻게 만들었나 (LangChain)

> 출처: [How We Built LangChain's Paid Media Agent](https://www.langchain.com/blog/paid-media-agent) (LangChain) · GeekNews(id=34041) 경유 · 정리일 2026-09-21
>
> **출처 한계**: `news.hada.io`가 egress 차단으로 원문 접근 불가. Slack GN⁺ 발췌(4개 불릿, 마지막이 "플랫폼별 분석은 서브에이전…"에서 잘림)와 WebSearch로 확보한 LangChain 공식 블로그·AgentMaps·Neura Market 스니펫을 교차해 재구성했다.

## 한 줄 요약

**LangChain이 Slack에 상주하며 광고 플랫폼 데이터와 사내 파이프라인을 연결해 매주 성과 분석·캠페인 변경 제안·PDF 보고서까지 만드는 에이전트를 자체 구축했고, 계산은 코드로 옮기고 불필요한 모델 호출을 줄여 초기 보고서 생성 비용을 약 40배 낮추고 실행 시간을 18분에서 85초로 줄였다 — 실제 비즈니스 성과도 자격 있는 리드당 비용(CPL) 30% 하락으로 이어졌다.**

## 핵심 포인트

- **신입 분석가처럼 도구를 쥐여주는 설계** — 광고 플랫폼과 사내 데이터를 연결해 성과 분석, 캠페인 변경 제안, 사람의 승인과 실행 검증까지 이어지는 Slack 기반 에이전트를 구축했다. ***신입 분석가처럼 작업용 컴퓨터와 분석 도구, 업무 지침과 회사 위키를 제공***하고, 시스템 프롬프트에는 ***모든 지식 대신 필요한 정보를 찾는 방법을 담았다.***
- **계산은 코드, 판단은 모델 — 40배 비용 절감** — 계산과 고정 규칙은 코드, 해석과 판단은 모델에 맡겨 ***초기 보고서 생성 비용을 약 40분의 1로 줄이고, 실행 시간을 18분에서 85초로 단축***했다.
- **수백 개 도구 중 필요한 것만 탐색** — 수백 개 도구 중 필요한 것만 찾아 사용하고, 플랫폼별 분석은 서브에이전트로 분리한다(WebSearch로 보강 확인).
- **실제 비즈니스 성과 — CPL 30% 하락** — WebSearch로 확인한 결과: LangChain의 유료 광고 프로그램은 6개월 만에 유기적 성장에서 5개 유료 채널로 확장됐고, 6월~8월 사이 자격 있는 리드당 비용(CPL)이 30% 떨어졌으며 월 지출은 약 60% 늘었다. 가장 큰 채널인 LinkedIn에서는 CPL이 1월보다 40% 낮아졌다. 이 에이전트를 오픈소스로 공개했다(Managed Deep Agents로 명령 한 줄에 배포 가능).

## 인상 깊은 문장

> "We optimized the agent itself by moving calculations into code and removing unnecessary model calls, making an early reporting workflow about 40x cheaper and 13x faster."
> (WebSearch로 확보한 LangChain 블로그 취지의 재구성)

## 댓글

**확인 불가.** hada 댓글 수는 대조하지 못했다. **읽을 때 감안**: LangChain 자사 블로그이자 자사 프레임워크(Deep Agents)를 홍보하는 성격이 강해, "40배 절감"이라는 수치는 자사가 스스로 측정한 최적화 전후 비교이며 제3자 검증은 없다. CPL 하락도 에이전트 도입 외에 광고 지출 자체가 60% 늘어난 영향과 분리되지 않았을 가능성이 있다.

## 내 생각 · 적용점

### 핵심 전이 — "계산은 코드, 판단은 모델"이 이번 배치의 Jev 가이드 노트와 같은 결론에 도달

바로 하루 전 정리한 [[2026-09-21-jev-field-guide-system-one-model]]의 핵심 발견 중 하나가 "배수의 주인은 모델이 아니라 워크플로 분해"였다 — haiku 정확도가 프롬프트 한 번 호출(18.1%)에서 코드로 쪼개 물으면(53.6%) 극적으로 올랐다는 사례다. 이 LangChain 글의 "계산과 고정 규칙은 코드, 해석과 판단은 모델에 맡겨 40배 절감"이라는 결론은 **정확히 같은 원칙을 실제 프로덕션 에이전트에 적용한 사례**로 읽을 수 있다 — 모델을 더 좋은 걸로 바꾸는 대신, 모델이 하지 않아도 될 일을 코드로 옮기는 게 비용 절감의 진짜 레버라는 패턴이 두 노트에서 반복 확인된다.

## 호스피탈리티 / CRS 적용 포인트

CRS 운영 보고서(예: 채널별 예약 성과, 가격 최적화 제안)를 자동화하는 내부 에이전트를 만든다면, 이 글의 "계산은 코드, 판단은 모델" 원칙을 그대로 적용할 만하다. 반복되는 집계·비교는 코드로 미리 계산해두고 모델은 그 결과를 해석해 사람이 검토할 요약과 제안만 만들게 하면, 실행 비용과 시간을 크게 줄일 수 있다. Slack 기반 승인 워크플로 구조도 CRS 운영팀의 실행 검증 프로세스에 참고할 만하다.

## 연관 자료

- [[2026-09-21-jev-field-guide-system-one-model]] — "워크플로 분해가 모델보다 중요하다"는 같은 원칙을 다른 사례(평가 벤치마크)로 확인한 노트
- [[2026-09-02-uber-software-factory-pareto-model-selection]] — 비용 최적화를 다룬 인접 노트, 모델 선택 vs 워크플로 설계라는 다른 축

## 한 달 뒤 회고

*(2026-10-21 즈음 — 오픈소스로 공개된 이 에이전트의 실제 채택 사례가 나왔는지, CPL 하락이 지속됐는지 확인.)*
