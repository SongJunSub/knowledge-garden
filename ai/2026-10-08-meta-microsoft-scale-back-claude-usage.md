---
title: "Meta·Microsoft, 사내 Claude 사용 줄이고 자체 AI 도구로 전환 (The Information 보도) - 비용 통제와 자사 제품 밀어주기가 겹친 내부 이탈"
source_title: "Meta, Microsoft Move to Curb Internal Use of Anthropic's Claude"
source_url: "https://www.theinformation.com/ (원문 페이월, WebSearch로 교차확인한 재구성)"
source_name: "The Information, 2차: 복수 매체(Fortune 계열, AI 뉴스레터, 증권 매체)"
referrer_url: "https://news.hada.io/topic?id=34964"
published_at: "2026-10-05"
summarized_at: "2026-10-08"
category: "ai"
tags: ["anthropic", "claude", "microsoft", "meta", "vendor-lock-in", "github-copilot", "ai-economics", "distillation"]
---

# Meta·Microsoft, 사내 Claude 사용 줄이고 자체 AI 도구로 전환 (The Information 보도)

> 출처: [Meta, Microsoft Move to Curb Internal Use of Anthropic's Claude](https://www.theinformation.com/) (The Information, 2026-10-05 · 페이월) · GeekNews 경유 · 정리일 2026-10-08

> **출처 한계**: `news.hada.io`와 The Information 원문 모두 이번 세션에서 접근하지 못했다(후자는 egress 차단이 아니라 페이월). WebSearch로 교차확인한 roic.ai, aiweekly.co, stocktwits, 알파시그널 계열 등 5곳 이상의 2차 보도가 핵심 수치(Microsoft 사내 Anthropic 지출 1/3 이상 축소, 1인당 월 지출 상한 10만 달러→약 1만 달러, Meta Claude Code 사용자 6만명→약 3만명)를 일치해서 전하고 있어 교차확인된 사실로 다루지만, The Information 원문 문장 단위 대조는 하지 못했다. Microsoft·Meta·Anthropic 모두 이 보도를 공식 확인하지 않았다는 점, 그리고 2차 매체 간에도 세부(감축 시작 시점이 5월인지, Claude Code 라이선스 종료 시점이 6월 30일인지)가 엇갈린다는 점을 그대로 밝혀둔다. hada 댓글 수는 확인 불가.

## 한 줄 요약

**Meta와 Microsoft가 직원들의 Claude 사용을 줄이고 자체 AI 도구 사용을 확대하고 있다는 보도다 - Microsoft는 연간 10억 달러 이상으로 예상했던 사내 Anthropic 지출을 3분의 1 이상 축소하고 GitHub Copilot으로 유도했으며, Meta는 Claude Code 사용 직원이 약 6만명에서 3만명으로 줄었다. 늘어난 내부 AI 비용을 통제하고 자사 제품을 밀어주려는 동기가 겹쳐 있지만, 고객이 Azure·Bedrock을 통해 Claude에 쓰는 돈과 양사의 Anthropic 투자·컴퓨트 계약 자체는 그대로 유지되고 있다.**

## 핵심 포인트

- **Microsoft - 지출 축소 + 자사 제품 전환** - 연간 10억 달러 이상으로 예상했던 사내 Anthropic 지출이 3분의 1 이상 줄었고, GitHub Copilot과 OpenAI 기반 도구 사용을 권장하고 있다. 토큰 기반 사용 비용이 예상보다 훨씬 빨리 예산을 소진한 것이 축소의 배경으로 지목된다.
- **1인당 월 AI 지출 한도 10분의 1로 축소** - Microsoft 클라우드·AI 부문의 직원 1인당 월 AI 지출 한도가 대부분 10만 달러에서 약 1만 달러로 줄었다. ***실제 사용액이 아니라 "허용된 지출 상한"***이라는 점이 중요하다 - 실사용이 그 한도까지 찼었다는 뜻은 아니다.
- **Meta - Claude Code 사용자 절반 감소** - Meta의 Claude Code 사용 직원은 연초 약 6만명에서 약 3만명으로 줄었다. 봄철 전체 인력의 약 10%를 줄인 레이오프가 일부 원인이지만, 그것만으로는 감소분 전체를 설명하지 못한다 - Meta 자체 코딩 도구로의 전환이 더 큰 비중을 차지한다.
- **"증류(distillation)" 우려로 인한 내부 지침** - Meta는 AI 모델 개발과 관련된 업무에 Claude·OpenAI Codex 사용을 제한하는 내부 지침도 내렸다. 외부 모델의 출력을 활용하는 과정에서 경쟁사의 역량이 Meta 내부 시스템으로 의도치 않게 전이될 수 있다는 우려가 근거다.
- **고객 매출과 투자 관계는 그대로** - Microsoft의 Anthropic에 대한 최대 50억 달러 투자와 Anthropic의 300억 달러 규모 Azure 컴퓨트 구매 약정은 이번 감축과 무관하게 유지되고 있다. Azure·Bedrock을 통한 ***고객 사용량 기준 Claude 매출은 계속 성장 중***이라는 점도 함께 보도됐다 - 즉 이번 변화는 "내부 직원 사용"에만 해당하는 축소다.

## 인상 깊은 문장

> "Microsoft's up-to-$5 billion investment in Anthropic is untouched, as is Anthropic's $30 billion commitment to buy Azure compute capacity, and customer spending on Claude via Azure and Bedrock continues to grow." (2차 보도 종합 재구성. The Information 원문 문장 대조는 못 함)

## 댓글

GeekNews(hada) 댓글 수는 원문 접근 차단으로 확인 불가. 다수 2차 매체가 같은 핵심 수치를 보도하지만, 감축이 "시작된 시점"(5월 vs 이후)과 "Claude Code 라이선스 종료 시점"(6월 30일이라는 보도도 있음)에서 매체 간 디테일이 엇갈린다 - 단일한 1차 발표문이 아니라 "사정을 아는 사람들"을 인용한 탐사 보도라는 성격상 세부 수치는 조심스럽게 다뤄야 한다. 한 한국어 매체는 "Meta가 최근 28일간 1억 500만 달러를 지출했다"는 수치를 보도했는데, 다른 매체에서는 교차확인하지 못했다.

## 내 생각 · 적용점

### 핵심 전이 1 - [[2026-05-24-microsoft-ai-more-expensive-than-employees]]가 5월에 이미 포착한 흐름의 5개월 뒤 확인판

그 노트는 2026년 5월 시점에 "Microsoft가 Claude Code 직접 라이선스 대부분을 취소하고 GitHub Copilot으로 전환했다"는 Fortune 보도를 다뤘고, 그 노트는 당시에도 "기사 제목이 'AI가 비싸다'고 몰아가지만 실제로는 자사 제품 전환이라는 전략적 선택이 더 크다"는 댓글 비판을 함께 기록했다. 이번 The Information 보도는 그 흐름이 ***5개월 뒤에도 계속되며 구체적 수치(1/3 축소, 월 한도 10분의 1)로 심화***됐음을 보여주는 후속 확인이다 - "비용 때문"과 "자사 제품 밀어주기 때문"이라는 두 가지 설명이 처음부터 지금까지 계속 함께 보도되고 있다는 점도 일관된다.

### 핵심 전이 2 - [[2026-09-26-microsoft-copilot-home-code-autopilot]]의 "Code"가 바로 이 전환이 유도하는 그 제품이다

그 노트는 Microsoft가 9월에 "Code"(GitHub Copilot과 동일 기술 기반의 자연어 앱 빌더)를 포함한 새 Copilot 개편을 발표하며 Satya Nadella가 "업무를 위한 새 OS"라고 선언했다고 정리했다. 이번 보도의 "Claude Code 라이선스를 줄이고 GitHub Copilot CLI로 유도한다"는 내용은, 그 발표가 비전 선언에 그치지 않고 ***실제 사내 정책(라이선스 종료, 지출 한도 축소)으로 강제되고 있다***는 걸 보여준다. 두 노트를 겹치면 "플랫폼을 통합한다"는 선언과 "경쟁사 도구 사용을 줄인다"는 정책이 같은 전략의 양면이라는 게 드러난다.

### 핵심 전이 3 - [[2026-07-06-anthropic-losing-developer-goodwill]]의 신뢰 위기와는 다른 축의 압박이 Anthropic에 겹친다

그 노트는 Anthropic이 이중 가격 구조·파일명 감지 같은 정책으로 ***개발자 커뮤니티의 신뢰***를 잃어가는 과정을 다뤘다. 이번 보도는 ***대형 고객사(Meta·Microsoft)가 비용·전략적 이유로 내부 사용을 줄이는 것***이라 발단은 다르지만, 결과적으로 Anthropic이 "고객이자 경쟁사"인 빅테크들로부터 동시에 거리를 두게 만드는 두 개의 독립된 압박이 겹친다는 점에서 같은 시기에 함께 읽을 가치가 있다. 다만 고객 매출(Azure·Bedrock 경유)은 계속 성장한다는 보도를 보면, 이번 건은 "제품에 대한 불신"이 아니라 "내부 직원 비용·경쟁 전략" 문제로 한정된다는 차이가 있다.

## 호스피탈리티 / CRS 적용 포인트

**이 글은 온다가 Claude를 업무에 쓰는 입장에서 실질적으로 참고할 만한 정보다.** ①**벤더 종속 리스크의 실물 사례** - 대형 고객사조차 비용이 예상보다 빠르게 소진되면 내부 정책으로 사용을 축소한다는 것은, 온다도 Claude Code 등 단일 벤더 의존도가 높다면 [[2026-08-02-session-portability-inference-api-lockin]]이 제안한 "세션 이식성 테스트"나 월 단위 지출 모니터링·동적 한도를 미리 갖춰야 한다는 경각심을 준다. ②**"지출 한도"와 "자체 도구 전환"을 같은 정책 안에 섞지 않기** - Microsoft 사례처럼 비용 통제(지출 한도 축소)와 자사 제품 밀어주기(Copilot 전환)가 한 정책 안에 묶이면, 실제 비용 문제인지 전략적 선택인지가 외부에서 구분되지 않는다. 온다 내부에서 AI 도구 정책을 조정할 때는 "비용 때문"과 "도구 선호 때문"이라는 이유를 분리해서 투명하게 공지하는 편이, 이번 사례들에 반복해서 따라붙는 "진짜 이유가 뭔가"라는 외부 의심을 피하는 데 도움이 된다. ③**Claude Code를 계속 쓸 거라면** - 자체 코딩 도구로 완전히 전환하는 것이 아니라, 단일 벤더 비용 폭증 리스크에 대한 대비(예산 모니터링, 필요시 대안 모델로의 전환 경로 확인)를 지금부터 갖춰두는 쪽이, 이번 보도가 보여주는 "예산이 예상보다 빨리 소진된 뒤 급하게 정책을 바꾸는" 상황을 피하는 방법이다.

## 연관 자료

- [[2026-05-24-microsoft-ai-more-expensive-than-employees]] - 5개월 전 이미 같은 흐름(Microsoft의 Claude Code 라이선스 취소·Copilot 전환)을 포착한 선행 노트, 이번 보도는 그 심화판
- [[2026-09-26-microsoft-copilot-home-code-autopilot]] - 이 전환이 실제로 유도하는 Microsoft 자체 제품("Code")의 공식 발표
- [[2026-07-06-anthropic-losing-developer-goodwill]] - Anthropic이 겪는 또 다른 축(개발자 커뮤니티 신뢰)의 압박, 발단은 다르지만 같은 시기에 겹침
- [[2026-08-02-session-portability-inference-api-lockin]] - 벤더 종속 리스크를 점검하는 체크리스트(검사·내보내기·재생·감사·삭제), 온다가 자체 점검에 쓸 수 있는 기준

## 한 달 뒤 회고

*(2026-11-08 즈음) Microsoft·Meta·Anthropic이 이 보도를 공식 확인하거나 반박했는지, Claude Code 라이선스 종료의 정확한 시점과 Meta의 월간 지출 수치(1억 500만 달러 보도의 교차확인 여부)를 다시 점검한다.*
