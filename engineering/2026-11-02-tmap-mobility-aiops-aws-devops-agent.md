---
title: "티맵모빌리티의 기존 운영 워크플로우와 AWS DevOps Agent를 연계한 AIOps 구축 사례(AWS 기술 블로그) — 반복 업무는 기존 에이전트에, 원인 분석은 새 에이전트에 맡겼다"
source_title: "티맵모빌리티의 기존 운영 워크플로우와 AWS DevOps Agent를 연계한 AIOps 구축 사례"
source_url: "https://aws.amazon.com/ko/blogs/tech/tmap-mobility-aiops-with-aws-devops-agent/"
source_name: "AWS 기술 블로그"
referrer_url: "https://aws.amazon.com/ko/blogs/tech/tmap-mobility-aiops-with-aws-devops-agent/"
published_at: "2026-11-02"
summarized_at: "2026-11-02"
category: "engineering"
tags: ["tmap-mobility", "aiops", "aws-devops-agent", "incident-response", "sre"]
---

# 티맵모빌리티의 기존 운영 워크플로우와 AWS DevOps Agent를 연계한 AIOps 구축 사례(AWS 기술 블로그)

> 출처: [티맵모빌리티의 기존 운영 워크플로우와 AWS DevOps Agent를 연계한 AIOps 구축 사례](https://aws.amazon.com/ko/blogs/tech/tmap-mobility-aiops-with-aws-devops-agent/) (AWS 기술 블로그) · Slack `#개발-뉴스-dev-news` 채널(TechArticles 봇) 경유 · 정리일 2026-11-02
>
> **출처 한계**: aws.amazon.com 전면 차단으로 원문을 직접 열람하지 못했다. Slack 본문 발췌(말줄임으로 끊김)만을 근거로 한다. TechArticles 봇이 공식 블로그를 직접 올린 글로, GeekNews 경유가 아니라 hada 댓글은 존재하지 않는다.

## 한 줄 요약

**티맵모빌리티는 기존 운영 자동화 에이전트를 교체하는 대신 AWS DevOps Agent를 추가로 연결해, 단순 반복 업무는 사내 에이전트가, 장애 원인 분석은 클라우드 토폴로지를 스스로 파악하는 AWS DevOps Agent가 전담하는 역할 분리형 AIOps 구조를 구축했다.**

## 핵심 포인트

- **기존 자동화와 새 에이전트의 결합** — ***"티맵모빌리티는 기존 운영 자동화 에이전트와 AWS DevOps Agent를 결합해 장애 대응 효율을 높인다"***. 처음부터 새로 만든 것이 아니라, 이미 있던 운영 자동화 체계에 AWS DevOps Agent를 더하는 방식을 택했다.
- **역할 분리: 반복 업무 vs 원인 분석** — ***"단순 반복 업무는 사내 에이전트가 처리하고, 장애 원인 분석은 AWS DevOps Agent가 전담하는 구조"***다. 두 종류의 작업(이미 정형화된 반복 작업과, 판단이 필요한 원인 분석)을 서로 다른 에이전트에 맡기는 명확한 분업이다.
- **클라우드 토폴로지 자율 파악** — ***"AWS DevOps Agent는 클라우드 토폴로지를 스스로 파악해 서비스 간 의존 관계를 실시간으로 분석한다"***. 즉 서비스 간 의존 관계를 사람이 사전에 문서화·입력해두지 않아도, 에이전트가 클라우드 환경을 스스로 탐색해 의존 관계 그래프를 구성한다는 뜻이다.
- **기존 워크플로우를 깨지 않고 개선** — ***"기존 워크플로우를 유지하면서도 장애 분석의 정확도와 근본 원인 규명 속도를 크게 개선"***했다고 발췌가 이어지다 끊긴다. 구체적인 개선 수치(몇 퍼센트, 몇 분)는 발췌에 없어 확인하지 못했다.

## 인상 깊은 문장

*(Slack 발췌가 개선 효과 서술 중 말줄임으로 끊겨, 완결된 인용문이나 구체적 수치가 남아 있지 않다.)*

## 댓글

GeekNews를 거치지 않아 hada 댓글은 없다(Slack TechArticles 봇의 공식 블로그 직링크). HN/Lobsters 큐레이션 여부는 확인하지 못했다. **이해관계**: AWS 자사 서비스(DevOps Agent) 도입 사례 홍보이자 고객사(티맵모빌리티) 공동 작성 콘텐츠 성격이 강해, 실제 도입 과정의 어려움이나 오탐 사례는 원문에도 비중 있게 다뤄지지 않았을 가능성이 있다. "기존 워크플로우를 유지하면서도" 개선했다는 서술은 구체적 수치 없이는 홍보성 과장일 가능성도 감안해야 한다.

## 내 생각 · 적용점

**핵심 전이 — "반복 업무는 기존 자동화에, 판단이 필요한 분석은 새 에이전트에"라는 분업은 이 가든이 여러 차례 본 저risk 전환 전략과 같은 결이다.** [[2026-09-04-samsung-agentcore-aiops-01]]·[[2026-09-04-samsung-agentcore-aiops-02]]가 다룬 "로직은 그대로 두고 실행 환경만 바꾼다"는 원칙과 비교하면, 이 사례는 한 걸음 더 나가 "로직 자체를 두 종류로 나눠 각각 다른 에이전트에 맡긴다"는 구조다. [[2026-10-31-ai-erodes-sre-skill-not-replacing]]이 경고한 "흔한 장애가 사라지면 그걸로 쌓던 직관도 사라진다"는 위험을 고려하면, 원인 분석까지 AWS DevOps Agent에 완전히 넘기기보다 신입 온콜이 그 분석 과정을 함께 지켜보고 배우는 장치가 병행돼야 한다는 점도 참고할 만하다.

## 호스피탈리티 / CRS 적용 포인트

**부분 적용 가능.** CRS/PMS 운영에서도 반복적인 알림 대응(동일 패턴의 경고)은 기존 자동화에 맡기고, 복잡한 장애(여러 서비스에 걸친 의존 관계 분석)만 별도 AI 에이전트에 위임하는 분업 구조를 설계할 수 있다. 다만 [[2026-09-04-sre-observer-alert-root-cause]]가 강조한 "알리는 권한과 조회 권한의 분리" 같은 세부 보안 설계는 이 글에서 확인하지 못해, 실제 도입 시 별도로 검토가 필요하다.

## 연관 자료

- [[2026-09-04-samsung-agentcore-aiops-01]], [[2026-09-04-samsung-agentcore-aiops-02]] — "로직은 그대로 두고 실행 환경만 바꾼다"는 같은 저risk 전환 전략의 다른 한국 기업 사례
- [[2026-10-31-ai-erodes-sre-skill-not-replacing]] — AI가 장애 대응을 넘겨받을 때 신입의 직관 형성이 사라지는 위험을 경고한 선행 노트
- [[2026-09-04-sre-observer-alert-root-cause]] — 인시던트 자동 조사의 권한 분리 설계를 다룬 관련 노트

## 한 달 뒤 회고

*(2026-12-02 즈음 — aws.amazon.com 접근이 풀리면 "장애 분석 정확도·속도 개선"의 구체적 수치와 오탐률을 원문으로 확인해 보강.)*
