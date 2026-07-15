---
title: "소프트웨어가 세상을 먹었고, 이제 하드웨어가 소프트웨어를 먹는다 (Chris Zeoli) — 가치는 질량처럼 '쉽게 움직일 수 없는 곳'에 쌓이고, 얇은 애플리케이션 계층이 스택에서 최악의 마진을 짊어진다"
source_title: "Software Ate the World. Now Hardware Is Eating Software."
source_url: "https://www.wing.vc/content/software-ate-the-world-now-hardware-is-eating-software"
source_name: "wing.vc"
referrer_url: "https://news.hada.io/topic?id=31454"
published_at: "2026-06-24"
summarized_at: "2026-07-15"
category: "ai"
tags: ["value-migration", "moat", "commoditization", "gross-margin", "control-points", "open-weights", "thin-wrapper"]
---

# 소프트웨어가 세상을 먹었고, 이제 하드웨어가 소프트웨어를 먹는다 (Chris Zeoli) — 가치는 질량처럼 '쉽게 움직일 수 없는 곳'에 쌓이고, 얇은 애플리케이션 계층이 스택에서 최악의 마진을 짊어진다

> 출처: [Software Ate the World. Now Hardware Is Eating Software.](https://www.wing.vc/content/software-ate-the-world-now-hardware-is-eating-software) (Chris Zeoli, Wing VC) · 정리일 2026-07-15

## 한 줄 요약

**지난 20년의 투자 정설 "소프트웨어가 가장 큰 가치를 포착한다(Software eats the world)"를 AI가 뒤집는다. 가치가 위쪽 애플리케이션으로 올라가는 게 아니라, 자본 집약적이고 물리적으로 제약된 하위 계층(반도체·추론 플랫폼·데이터 인프라·프리미엄 모델)으로 내려가 응집한다. 추론이 가변 매출원가(COGS)가 되면서 애플리케이션 계층은 마진(SaaS 75~90% → AI 앱 50~60%)과 밸류에이션(SaaS 18.6배 → AI 래퍼 5~8배)이 동시에 압축되어 극적으로 얇아진다. 핵심 명제: "가치는 질량처럼, 쉽게 움직일 수 없는 곳에 쌓인다."**

> *저자는 며칠 전 정리한 [[2026-07-13-how-an-ai-token-travels-through-a-data-center]]의 저자와 동일인(Chris Zeoli)이다. 개별 기업 실적 수치(NVIDIA·Anthropic 등)는 금방 낡으므로 부차적으로 두고 보편 원칙만 추린다.*

## 핵심 포인트

- **가치 이동의 방향이 뒤집혔다** — SaaS는 한계비용 0이라 인터페이스·기록 시스템 소유가 고마진을 확보했으나, AI는 **추론이 가변 COGS**라 가치가 하위 계층으로 내려간다. 닷컴(반도체) → SaaS(자산 경량) → AI(다시 하드웨어)라는 자본의 진자 운동.
- **가치가 하위에 쌓이는 4가지 이유** — ① 자본 집약도가 해자 ② 물리적 병목(패키징·HBM·전력) ③ 데이터 전환 비용·관성 ④ 표면 계층의 대체 위험(범용 앱 로직은 모델이 직접 수행 가능).
- **"Linux는 Linux의 가치를 포착하지 못했고 Red Hat이 포착했다"** — 오픈웨이트 모델이 풍부해질수록(폐쇄-공개 격차 8%→1.7%) 모델 자체가 아니라 안정·저렴하게 서빙하는 추론 플랫폼이 가치를 흡수한다.
- **데이터 중력** — 모델은 수렴해도 독점 데이터·온톨로지·워크플로는 대체 불가. 데이터 플랫폼이 고착성 확보.
- **얇아지는 애플리케이션** — AI 네이티브 앱은 요청마다 모델을 재실행해 추론비가 매출의 ~23%(ICONIQ 2026), 극단적 래퍼는 마진 25%. **직전 회전의 목적지였던 자산 경량 앱 계층이 이제 스택에서 최악의 마진 구조를 짊어진다.**
- **가치가 다시 앱으로 오는 조건** — ① 앱이 상호작용 데이터를 축적해 자체 데이터 플랫폼화 ② 프리미엄 연구소가 수직 통합 ③ 추론비 급속 상품화(비용 연 ~200배 하락). 단, 비용이 0이 돼도 표면 계층의 대체 위험은 남는다.
- **처방** — "인터페이스가 아니라 통제 지점을 언더라이트하라." 창업자는 독점 데이터 루프를 소유하거나 기록 시스템이 되거나 성과 기반 가격을.

## 인상 깊은 문장

> "Value, like mass, accumulates where it cannot easily move."

> "The asset-light application layer—the destination of the last rotation—now carries the worst margin structure in the stack."

> "Linux did not capture the value of Linux; Red Hat did. The same pattern now applies."

> "Underwrite control points, not interfaces."

## 댓글

**댓글 0개.** GN⁺가 wing.vc(VC 블로그)를 직접 링크·요약한 신규 포스트로, HN·Lobste.rs 큐레이션이 없고 의견 클러스터도 0개다(DOM 직접 확인).

## 내 생각 · 적용점

### 핵심 전이 1 — 이번 며칠 "단위 경제·가치 포획" 축의 가장 큰 그림

이 글은 최근 정리한 여러 글을 위에서 묶는다. 같은 저자의 [[2026-07-13-how-an-ai-token-travels-through-a-data-center]]("추론은 매출원가")가 미시(한 토큰의 원가)를, 이 글이 거시(그 원가가 산업 가치 지형을 어떻게 재편하나)를 다룬다. [[2026-07-13-i-love-llms-i-hate-hype]]의 "가치 창출 ≠ 가치 포획", [[2026-07-13-new-saas-playbook-ai-agent-era]]의 "무엇을 소유하는가", [[2026-07-13-how-to-kill-churn]]의 "높은 이탈 × 낮은 총마진 = 급락"이 여기서 **"가치는 질량처럼 쉽게 움직일 수 없는 곳에 쌓인다"**는 하나의 물리 은유로 통합된다.

### 핵심 전이 2 — "Linux는 Red Hat이 가치를 가져갔다": 오픈소스 상품화 패턴의 재현

오픈웨이트 모델이 풍부해질수록 모델이 아니라 그것을 운영·서빙하는 플랫폼이 가치를 흡수한다는 통찰은, [[2026-07-06-ai-margin-collapse-glm-5-2]]("base URL만 바꾸면 즉시 전환")·[[2026-06-08-switching-to-open-models]]·[[2026-06-08-open-source-ai-must-win]]의 오픈모델 논의에 "그럼 누가 돈을 버나"라는 답을 준다. 오픈소스 상품화의 고전 패턴이 AI 모델에 재현된다는 것 — 오픈소스에 기여/의존하는 개발자·조직의 포지셔닝에 시사점이다.

### 핵심 전이 3 — "얇은 래퍼는 상품화된다" = 무엇을 만들어야 방어력을 갖나

"범용 애플리케이션 로직은 모델이 직접 수행할 수 있어 가장 쉽게 대체된다"는 경고는, 마침 같은 배치에서 정리한 [[2026-07-15-wrapping-the-unpredictable-genius]]("해자는 모델이 아니라 wrap")와 정확히 짝을 이룬다 — 둘 다 "모델 위에 프롬프트+연결 코드만 얹은 얇은 래퍼는 방어력이 없다"고 말한다. 소프트웨어 엔지니어가 앞으로 무엇을 만들어야 하는가(독점 데이터 루프, 기록 시스템, 규제 워크플로)라는 실무 방향. CRS 같은 예약 원장이 곧 "기록 시스템"이라는 점([[2026-07-13-new-saas-playbook-ai-agent-era]])이 여기서 다시 확인된다.

### 핵심 전이 4 — "역사적 회전"이라는 기술 사이클 렌즈

닷컴 → SaaS → AI라는 자본 이동의 진자 운동은 "이번엔 다르다"가 아니라 **"가치의 중력이 어디로 향하는가를 주기적으로 재평가하라"**는 메타 원칙이다. 이건 [[2026-07-13-i-love-llms-i-hate-hype]]의 "연속성 프레임"(AI는 컴퓨터 혁명의 연속선)과 같은 사고 규율 — 종말/구원 서사 대신 자본과 가치의 흐름을 냉정하게 추적하는 것.

## 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 별도 안내)

## 연관 자료
- [[2026-07-13-how-an-ai-token-travels-through-a-data-center]] — *같은 저자, 미시(토큰 원가) ↔ 거시(가치 지형)*
- [[2026-07-13-new-saas-playbook-ai-agent-era]] — *"무엇을 소유하는가", 기록 시스템·통제 지점*
- [[2026-07-15-wrapping-the-unpredictable-genius]] — *"얇은 래퍼는 상품화, 해자는 wrap"과 짝*
- [[2026-07-06-ai-margin-collapse-glm-5-2]] — *오픈모델 상품화, "누가 가치를 가져가나"*

## 한 달 뒤 회고
*(2026-08-15 즈음 — 온다/CRS의 방어력을 "인터페이스"가 아니라 "통제 지점(예약 원장·요금 데이터·독점 데이터 루프)"으로 재평가했는지, AI 기능을 붙일 때 "얇은 래퍼"에 머물지 않았는지, 기술·벤더 선택에서 "가치의 중력"을 추적했는지 기록.)*
