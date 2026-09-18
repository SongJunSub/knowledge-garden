---
title: "HarnessTax: 코딩 에이전트에서 하네스는 얼마나 중요할까? (Pan, Yang, Arabzadeh, Chiang, Stoica, Zaharia) — 같은 모델이 하네스만 바꿔도 비용이 5배까지 벌어지는데, 성공률 차이는 통계적으로 입증되지 않는다"
source_title: "HarnessTax: How Much Does the Harness Matter for Coding Agents?"
source_url: "https://harnesstax.github.io/"
source_name: "Arena (구 LMSYS) 연구팀 — Melissa Z. Pan, Shuo Yang, Negar Arabzadeh, Wei-Lin Chiang, Ion Stoica, Matei Zaharia"
referrer_url: "https://news.hada.io/topic?id=33842"
published_at: "확인 불가 (2026년 9월 공개로 추정, GitHub Pages 형태라 정확한 게시일 메타데이터 없음)"
summarized_at: "2026-09-18"
category: "ai"
tags: ["coding-agents", "harness-design", "swe-bench", "terminal-bench", "token-economics", "claude-code", "codex-cli", "pi-harness", "benchmark-methodology"]
---

# HarnessTax: 코딩 에이전트에서 하네스는 얼마나 중요할까?

> 출처: [HarnessTax: How Much Does the Harness Matter for Coding Agents?](https://harnesstax.github.io/) (Arena 연구팀) · GeekNews 경유 [id=33842](https://news.hada.io/topic?id=33842) · 정리일 2026-09-18
>
> **출처 한계**: `news.hada.io`·`harnesstax.github.io`·`arena.ai`·`lobste.rs`·`portkey.ai` 전부 이번 세션 네트워크 egress 정책으로 직접 열람하지 못했다. 대신 WebSearch로 여러 2차 출처(Arena 공식 블로그 스니펫, Portkey.ai 분석 글 스니펫, HN 크로스포스트, GitHub `daily-hackernews` 미러)를 교차 확인해 재구성했다. 핵심 수치(5배 비용 격차, Claude Code 평균 2배, 초기 컨텍스트 10배 이상, 첫 호출 2,600 vs 27,000 토큰)는 두 개 이상의 독립 출처에서 일치해 신뢰도가 있지만, **원문의 정확한 문장 순서·전체 방법론 각주(통계적 유의성 검정의 세부)는 대조하지 못했다.** 저자진(Pan, Yang, Arabzadeh, Chiang, Stoica, Zaharia)은 UC Berkeley Sky Computing Lab·LMSYS/Arena 계열 연구자들로 확인되며, Wei-Lin Chiang·Ion Stoica는 Arena(前 Chatbot Arena/LMSYS)의 공동 설립자다 — 즉 이 연구는 **모델 비교 플랫폼을 운영하는 조직이 "하네스가 더 중요하다"는 결론을 낸 것**이라, 프런티어 모델사(Anthropic·OpenAI)의 자체 벤치마크와는 다른 이해관계 축에 있다는 점을 감안해서 읽어야 한다.

## 한 줄 요약

**7개 모델 × 3개 하네스(Claude Code, Codex CLI, Pi)를 SWE-bench Lite·Terminal-Bench 2.0에 붙여 21개 모델-하네스 조합을 비교했더니, ***같은 모델이 하네스만 바꿔도 비용이 최대 5배까지 벌어졌지만, 성공률 차이는 통계적으로 유의하게 입증되지 않았다.*** 읽기·쓰기·편집·bash 네 개 도구만 쥔 미니멀 하네스 Pi가 Claude Code·Codex CLI와 비슷한 성공률을 훨씬 낮은 비용으로 냈고, Claude Code는 SWE-bench Lite에서 공통 모델 기준 평균 약 2배 더 비쌌다. 원인의 상당 부분은 ***첫 호출부터 벌어지는 컨텍스트 크기 차이*** — Claude Code의 평균 초기 컨텍스트는 Pi의 10배 이상이며, 같은 작업의 첫 모델 호출에 Pi는 약 2,600토큰, Claude Code는 약 27,000토큰을 보냈다.**

## 핵심 포인트

- **방법론** — 7개 모델 × Claude Code·Codex CLI·Pi 3개 하네스로 21개 모델-하네스 쌍을 구성, SWE-bench Lite·Terminal-Bench 2.0에서 각각 30개 과제를 과제당 3회 시도. 비용은 2026년 9월 1일 기준 고정 가격표로 환산했다.
- **비용은 최대 5배, 성공률 차이는 통계적으로 불확실** — 같은 모델이 하네스만 바꿔도 비슷한 성공률에서 토큰 비용이 최대 5배 차이 났다. 42개 모델 내부 하네스 비교(within-model) 쌍 전체에 걸쳐 양측 Fisher 정확검정으로 p<0.05가 나온 건 1건뿐이었는데(우연만으로도 약 2건이 나올 확률), 이마저 Holm-Bonferroni 보정을 통과하지 못했다 — ***성능 차이가 "없다고 증명된 것"이 아니라 "이 표본 크기(셀당 90회 시도)로는 약 15포인트 이상의 스윙만 탐지 가능해, 증명되지 못한 상태"***라는 저자들의 신중한 한계 인정이 핵심이다.
- **Pi의 경쟁력** — 도구 4개(읽기·쓰기·편집·bash)만 제공하는 단순 하네스 Pi가 두 벤치마크 모두에서 비용-성공률 파레토 프론티어에 도달했다. 예시 하나: 한 모델이 SWE-bench Lite에서 Claude Code로 97.8%, Pi로 96.7% 정확도를 냈는데, 평균 비용은 Claude Code가 약 2배(예: $1.33 vs $0.67) 더 높았다.
- **Claude Code의 초기 컨텍스트 부담** — Claude Code의 평균 초기 컨텍스트는 Pi의 10배 이상이며, 동일 작업의 ***첫 모델 호출에 Pi는 약 2,600 입력 토큰, Claude Code는 약 27,000 토큰***을 보냈다. Pi의 시스템 프롬프트+도구 정의는 약 1,000토큰 수준인 반면, Claude Code는 도구 설명만으로 수천~1만 토큰대(재구성된 시스템 프롬프트 기준 약 14~17K)로 알려져 있다.
- **초기 컨텍스트가 전부는 아니다** — 저자들은 긴 지침·도구 설명이 비용을 늘리는 요인이 될 수 있지만, ***총비용에는 프롬프트 캐싱, 출력 토큰량, 후속 호출 수도 함께 작용***한다고 짚는다 — 즉 "하네스가 크다 = 무조건 비싸다"로 단순화할 수 없다는 걸 저자들 스스로 못 박는다.
- **산업 반응** — 여섯 개 Anthropic·OpenAI 모델 × 두 벤치마크 조합 중 9/12에서 대안 하네스(Pi 또는 Codex CLI)가 최고 성공률을 기록했다는 분석도 있어, "같은 회사 모델이니 그 회사 하네스가 최적"이라는 가정이 항상 성립하지는 않는다는 게 부가 시사점으로 따라온다.

## 인상 깊은 문장

> "Claude Code's mean initial context is over 10× Pi's, with longer instructions and larger tool schemas."

> "Pi sent ~2,600 input tokens while Claude Code sent ~27,000 for the same task."

*(WebSearch로 확인된 Portkey.ai 분석 글의 인용 — 원문 HarnessTax 페이지 자체의 워딩과 대조는 못했으나, 두 개 이상의 독립 2차 출처에서 같은 수치가 반복 확인됐다.)*

## 댓글

**hada 댓글 수는 확인 불가.** `news.hada.io`가 세션 전체에서 egress 차단이라 직접 확인할 방법이 없었다. GN⁺ 큐레이션 여부도 확인 불가. Hacker News 크로스포스트는 존재가 확인되며(WebSearch 단일 출처 기준 216포인트·87댓글), 커뮤니티 반응은 "엄격한 방법론"으로 평가받고 "모델 추격에서 하네스 엔지니어링으로 투자 방향을 전환한다"는 논의가 있었다고 하나, ***이 HN 수치는 단일 출처만 확인돼 교차검증에 실패했다*** — 앞선 노트들(예: [[2026-09-17-doing-everyone-elses-job]])에서 반복된 것과 같은 유형의 한계다.

**읽을 때 감안**
- ① **연구 주체의 위치성** — Arena(前 LMSYS)는 모델·하네스 비교 플랫폼을 운영하는 조직이라, "하네스가 결정적 변수"라는 결론이 곧 자사 플랫폼의 존재 이유를 강화하는 방향이라는 점을 감안해야 한다.
- ② **통계적 검정력 한계를 저자 스스로 인정** — 셀당 90회 시도로는 15포인트 미만의 성능 차이를 탐지할 수 없다는 걸 저자들이 명시했다는 점은 정직성 면에서 신뢰를 높이지만, 동시에 "Pi가 Claude Code와 동등하다"는 결론도 같은 이유로 확정된 사실이 아니라 "차이가 있어도 이 표본으로는 못 봤다"는 잠정 상태임을 뜻한다.
- ③ **비용 구조가 하네스 설계와 완전히 독립적이지 않다** — Anthropic·OpenAI가 자사 모델을 자사 하네스에서 가장 적은 비용으로 돌게끔 가격을 설계했을 가능성(프롬프트 캐싱 정책 등)까지는 이 연구가 분리해서 보여주지 않는다.

## 내 생각 · 적용점

### 핵심 전이 1 — Databricks의 사내 연구([[2026-08-06-pi-minimalism-coding-harness]])와 독립적으로 같은 결론에 도달했다

[[2026-08-06-pi-minimalism-coding-harness]]는 Databricks가 벤더 편향을 피하려 자체 구축한 벤치마크에서 "같은 모델·같은 추론강도에서도 하네스에 따라 비용이 2배 넘게 갈리고, Pi가 턴마다 약 3배 적은 컨텍스트로 품질을 유지한다"고 밝혔다. 이 HarnessTax는 학계/연구소 성격의 독립 연구로 **거의 같은 결론(Claude Code 평균 2배 비용, Pi의 경쟁력)에 다른 방법론으로 도달**했다 — 하나는 기업 내부 실전 벤치마크, 다른 하나는 SWE-bench Lite/Terminal-Bench 2.0이라는 공개 벤치마크 기반 통제 실험. 서로 다른 두 출처가 같은 방향을 가리킨다는 건 이 "하네스 세금" 현상이 특정 벤치마크의 우연이 아니라 실재하는 패턴일 가능성을 높인다.

### 핵심 전이 2 — Claude Code 실사용에 바로 참고할 각도

내가 Claude Code를 매일 쓰는 입장에서 이 연구가 주는 실질 시사점은 두 가지다. 첫째, ***첫 호출 27,000토큰 vs 2,600토큰***이라는 격차는 세션을 짧고 반복적으로 여는 작업(간단한 조회·수정)일수록 상대적으로 더 크게 느껴진다 — 도구 정의·시스템 프롬프트라는 고정비가 매 세션 반복 과금되기 때문이다. [[2026-07-13-harness-token-overhead-instrument-your-own-boundary]]가 이미 "Claude Code 33k vs OpenCode 7k" 격차를 직접 계측하며 낸 결론 — ***"벤더 숫자를 믿지 말고 내 경계에서 직접 계측하라"*** — 가 이 논문에도 그대로 적용된다. 둘째, 이 연구도 "총비용에는 캐싱·출력량·후속 호출도 영향을 준다"고 인정하므로, 단순히 "하네스가 가볍다 = 무조건 유리하다"로 결론 내리기보다는 **내 실제 워크플로(서브에이전트 사용 빈도, 세션 길이, 캐시 히트율)를 기준으로 판단**해야 한다는 게 더 정확한 교훈이다.

### 핵심 전이 3 — 측정 방법론 자체의 계보

[[2026-09-05-armature-coding-agent-tool-choice-study]]는 Claude Code·Codex·Cursor 16,893개 세션을 실측해 "같은 요구에도 세 에이전트가 같은 도구를 고르는 비율은 42%뿐"이라는 것을 보였다. 이 HarnessTax와 함께 놓으면, **"같은 모델이라도 하네스가 다르면 행동·비용·전략이 전부 달라진다"**는 명제가 이제 여러 독립 연구에서 각기 다른 각도(비용, 도구 선택, 검색 빈도)로 반복 확인되는 중이라는 패턴이 보인다 — 가든에 이 축의 노트가 쌓일수록 "모델 선택"보다 "하네스 선택·설계"가 더 큰 변수라는 결론의 근거가 두터워진다.

## 호스피탈리티 / CRS 적용 포인트

직접적인 CRS 기술 적용은 없다 — 이 연구는 코딩 에이전트 하네스 비교이지 호스피탈리티 도메인 에이전트가 아니다. 다만 원칙 수준에서:

- 온다가 내부적으로 Claude Code 외에 다른 코딩 에이전트/하네스를 실험한다면, ***"같은 모델이라도 하네스 차이로 비용이 5배까지 벌어질 수 있다"***는 사실은 비용 예산을 세울 때 "모델 등급"뿐 아니라 "하네스 선택"도 별도 변수로 다뤄야 한다는 근거가 된다.
- CRS/PMS 연동처럼 반복적이고 정형화된 작업에 에이전트를 붙인다면, Claude Code 같은 풍부한 기능의 하네스보다 Pi류의 미니멀 하네스가 비용 효율에서 유리할 수 있다는 가설을 세워볼 수 있다 — 단, 이 연구도 성공률 차이를 통계적으로 확정하지 못했으므로 "저비용=동등 품질"이라 단정하지 않고 우리 워크로드로 직접 검증해야 한다.

## 연관 자료

- [[2026-08-06-pi-minimalism-coding-harness]] — Databricks 사내 벤치마크가 독립적으로 낸 거의 동일한 결론(하네스에 따른 비용 2배 차, Pi의 컨텍스트 절제). 이 논문의 "5배 격차·통계적 유의성 미입증"이라는 더 엄밀한 버전.
- [[2026-07-13-harness-token-overhead-instrument-your-own-boundary]] — Claude Code vs OpenCode 직접 계측. "벤더 숫자 말고 내 경계에서 계측하라"는 실무 원칙이 이 논문의 발견에도 그대로 적용됨.
- [[2026-09-05-armature-coding-agent-tool-choice-study]] — 같은 세 에이전트(Claude Code·Codex·Cursor류) 비교라는 방법론 계보, 다른 축(도구 선택 행동)에서의 같은 결론.

## 한 달 뒤 회고

*(2026-10-18 즈음 — ① 이 세션에서 막혔던 `harnesstax.github.io` 원문에 접근할 수 있게 됐다면 통계 검정 세부·전체 21개 쌍의 원자료를 직접 대조할 것. ② 실제로 Claude Code 세션에서 첫 호출 토큰 수를 직접 계측해 이 논문의 27,000토큰 추정치와 내 워크플로가 얼마나 비슷한지 확인.)*
