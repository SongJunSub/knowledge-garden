---
title: "Claude, 양자 회로 설계 개선으로 타원곡선 연산 게이트 수 17분의 1로 (Anthropic) — 자연어 명세를 코드로 쓰고 자동평가기 피드백만으로 반복 개선하는 루프가 핵심, 기존 최고 설계를 8개 과제 중 7개에서 능가"
source_title: "Discovering state-of-the-art quantum circuits with large language models (arXiv 2610.22367)"
source_url: "https://arxiv.org/abs/2610.22367"
source_name: "Anthropic STEM Fellows Program (arXiv, 2026-10-15 게재 추정) + 복수 2차 매체(cryptobriefing.com, alphasignal.ai, interestingengineering.com, ai-tldr.dev) 교차확인"
referrer_url: "https://news.hada.io/topic?id=35530"
published_at: "2026-10-16"
summarized_at: "2026-10-18"
category: "ai"
tags: ["claude", "quantum-computing", "elliptic-curve", "circuit-design", "anthropic-research", "automated-evaluation", "cryptography"]
---

# Claude, 양자 회로 설계 개선으로 타원곡선 연산 게이트 수 17분의 1로

> 출처: [Discovering state-of-the-art quantum circuits with large language models](https://arxiv.org/abs/2610.22367) (arXiv 2610.22367, Anthropic STEM Fellows Program) · GeekNews 토픽 [id=35530](https://news.hada.io/topic?id=35530) · 정리일 2026-10-18
>
> **출처 한계**: `news.hada.io`는 이번에도 egress 차단으로 못 열었다. 다만 이 사건은 **WebSearch로 매우 두텁게 교차확인됐다** — cryptobriefing.com, alphasignal.ai, interestingengineering.com, ai-tldr.dev, unite.ai 등 복수 매체가 같은 핵심 수치(17배 게이트 절감, 12% 큐비트 증가, DQI 디코더 12배 절감, arXiv 2610.22367)를 독립적으로 보도해 Slack 발췌와 대체로 일치했다. 다만 ①원문 arXiv 페이지 자체는 열지 못해 저자 전원·정확한 수치 표는 2차 매체 인용에 의존했고 ②Slack 발췌의 "8종 기본 연산" 중 나머지 6종, "큐비트 수 × 게이트 수를 검사하는 자동 평가기"의 세부 채점 공식은 교차확인하지 못했다.

## 한 줄 요약

**Anthropic의 연구용 Claude(Mythos 5)가 자연어 명세를 받아 양자 회로를 코드로 작성하고, 정확성과 "큐비트 수 × 게이트 수"를 매기는 자동 평가기의 피드백만으로(사람 개입 없이) 반복 개선하는 루프를 돌려, 양자 계산 기본 연산 8종 중 7종에서 기존 발표된 최고 설계를 능가했다 — 타원곡선 점 연산에서는 큐비트를 12% 더 쓰는 대신 게이트 수를 17분의 1로, DQI 알고리즘의 디코딩 단계에서는 게이트 수를 12분의 1로 줄였다.**

## 핵심 포인트

- **방법론: 자연어 → 코드 → 자동평가 루프** — Claude에 자연어로 목표를 명세하면 회로를 코드로 작성하고, 정확성과 큐비트 수 × 게이트 수를 검사하는 자동 평가기가 점수를 매겨 피드백한다. 이 루프를 반복해 설계를 개선하며, ***라운드 사이에 사람이 개입하지 않는다.*** (WebSearch로 확인: 타원곡선 설계는 단 한 번의 **53시간짜리 자동화 실행**에서 나왔다고 보도됨.)
- **타원곡선 점 연산 — 게이트 수 17분의 1** — 기존 최소-큐비트 설계보다 큐비트를 **12% 더 쓰는 대신**, 필요한 게이트 수를 **17분의 1**로 절감한 설계를 찾아냈다. Slack 발췌는 "중간 분기 이력을 저장하지 않고 복원하는 방법"을 핵심 아이디어로 짚는데, 이는 ***분기 연산의 중간 상태를 전부 보관하는 대신, 필요할 때 다시 계산해 복원함으로써 큐비트·게이트 예산을 아끼는 기법***으로 읽힌다(정확한 메커니즘은 2차 매체에서 재확인하지 못함).
- **DQI 디코더 — 게이트 수 12분의 1** — 양자 최적화 알고리즘 DQI(Decoded Quantum Interferometry)에서 가장 비용이 큰 단계인 Reed-Solomon 디코더를 Google의 기존 구성 대비 **게이트 수 12배 절감**(메모리를 665큐비트에서 19큐비트로)했다고 보도됨. 확장 유클리드 알고리즘 대신 ***Berlekamp-Massey 디코딩***으로 바꾸고, 실제 디코딩 샘플을 대량으로 돌려 예외 상황(실패율 약 1/10,000)이 "허용 가능"하다고 판단해 메모리 예산을 실증적으로 깎았다는 설명.
- **연구 체계** — Anthropic STEM Fellows Program 소속 Andi Gu가 주도했고, Anthropic 양자물리학자 Alek Kemeny가 멘토링, 하버드·QuEra의 Susanne Yelin·Mikhail Lukin이 협업했다고 보도됨.
- **Anthropic의 자체 프레이밍 — "단일 돌파"가 아니라 "가속 신호"** — Anthropic은 이 결과를 FeMoco 분자 시뮬레이션 추정치가 2017년 약 50조 게이트에서 8년간 여러 연구팀의 노력으로 약 3억 4천만 게이트까지 떨어진 과거 사례와 비교하며, 자동화된 회로 설계가 그런 다년간의 점진적 개선을 가속할 수 있다는 신호로 제시했다고 보도됨 — 이번 한 번의 결과 자체를 "돌파"로 과장하지 않으려는 태도로 읽힌다.

## 인상 깊은 문장

> "Claude redesigns quantum circuits on its own — all eight beat the best published versions" (2차 매체 제목 번역, 원문 워딩 미확인)
> Slack 발췌의 "8종 중 7종을 능가"와 이 제목의 "all eight beat"가 어긋난다 — **정확히 몇 종에서 기존 설계를 능가했는지(7종 vs 8종)조차 매체마다 다르게 적혀 있어, 이 노트는 Slack 발췌의 "7종"을 채택하되 이 불일치를 그대로 남긴다.**

## 댓글

GeekNews 댓글 수는 hada 차단으로 확인 불가. HN·Lobsters 크로스포스트 여부도 이번 WebSearch 범위에서는 확인하지 못했다(검색에 걸린 건 전부 AI 뉴스 aggregator류 2차 매체였다). **정직하게 밝혀야 할 한계**: ①위에서 짚었듯 "8종 중 몇 종에서 능가했는가"가 매체마다 다르다. ②"17배", "12배" 같은 절감 배수는 모두 **특정 베이스라인(기존 발표된 최소 큐비트 설계, Google의 기존 구성) 대비** 수치라, 베이스라인 선택에 따라 체감 효과가 달라질 수 있다. ③Anthropic 자신의 연구 역량을 홍보하는 자체 발표 성격이 짙어, 독립 제3자의 재현·검증은 이번 교차확인 범위에 없었다.

## 내 생각 · 적용점

**핵심 전이 1: 어제 정리한 [[2026-10-17-claude-nist-curve-seed-origin]]과 "Claude + 타원곡선 암호"라는 소재는 같지만, 사건은 완전히 다르다.** 그 노트는 "25년 미제였던 NIST 곡선 시드의 출처를 역산했다"는 암호해석학적 패턴 매칭 주장(독립 검증 실패)이었고, 이 글은 "곡선 연산 자체를 수행하는 양자 회로의 효율을 높였다"는 설계 최적화 작업(이번엔 다수 매체로 두텁게 교차확인)이다. 두 사건의 공통점은 "Claude가 타원곡선 암호의 핵심 연산에 개입한다"는 표면적 유사성뿐이고, 검증 가능성의 격차가 크다는 점이 오히려 흥미롭다 — 같은 소재에 대해 가든이 다른 신뢰도 등급을 매긴 두 사례로 남는다.

**핵심 전이 2: "사람 개입 없는 자동평가 루프"가 이번 시즌 반복되는 패턴이다.** [[2026-10-16-why-mathematicians-cry-openai-math]]·[[2026-10-08-openai-math-moshkovitz-unique-games-conjecture]]가 "AI가 오래 묵은 난제를 돌파한다"는 성과 자체에 초점을 맞췄다면, 이 글은 **그 성과를 만들어내는 구체적 메커니즘(자연어 명세 → 코드 → 정량적 자동채점 → 반복)**을 보여준다는 점에서 한 단계 더 구체적이다. "정확성 + 자원 사용량을 동시에 매기는 객관적 채점 함수가 있고, 그 채점을 반복 피드백으로 쓸 수 있는 도메인"이라는 조건이 충족될 때 이런 자율 개선 루프가 작동한다는 가설을 세울 수 있다.

**핵심 전이 3: 베이스라인 의존성을 경계하는 습관.** "17배", "12배" 같은 인상적인 배수는 전부 특정 베이스라인과의 비교값이라는 걸 매번 확인해야 한다 — [[2026-10-17-ps5lm-ps5-llamacpp-home-model-server]]에서 "9B가 0.8B보다 빠르다"는 내부 모순을 발견했던 것과 같은 결의 습관(벤더 수치의 내부 일관성·비교 기준 확인)이 여기서도 유효하다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 매우 멀다 — 양자 회로 설계는 CRS 도메인과 무관하다. 전이 가능한 원칙만 남긴다면, ***"정확성과 자원 효율(여기서는 큐비트×게이트, CRS라면 응답시간×비용 같은 복합 지표)을 동시에 매기는 자동 채점 함수를 만들고, 그 채점으로 반복 개선 루프를 돌린다"***는 방법론은 CRS의 쿼리 최적화나 요금 룰 엔진 튜닝처럼 "정답은 명확하지만 자원 효율의 여지가 큰" 영역에 참고할 만한 패턴이다.

## 연관 자료

- [[2026-10-17-claude-nist-curve-seed-origin]] — 같은 "Claude + 타원곡선 암호" 소재의 다른 사건(시드 역산 vs 연산 회로 최적화), 신뢰도 등급이 크게 다른 대조 사례
- [[2026-10-16-why-mathematicians-cry-openai-math]] — "AI가 오래 묵은 난제를 단시간에 돌파한다"는 같은 계열의 성과, 이쪽은 순수 수학
- [[2026-10-08-openai-math-moshkovitz-unique-games-conjecture]] — 같은 계열의 또 다른 수학 난제 돌파 사례
- [[2026-10-17-ps5lm-ps5-llamacpp-home-model-server]] — 벤더 수치의 베이스라인·내부 일관성을 의심하는 같은 검증 습관

## 한 달 뒤 회고

2026-11-18 즈음, arXiv 2610.22367 원문을 직접 읽어 "8종 중 몇 종을 능가했는가"의 매체 간 불일치를 해소하고, 제3자(양자컴퓨팅 연구자·학계)의 독립 검증·재현 시도가 나왔는지 점검.
