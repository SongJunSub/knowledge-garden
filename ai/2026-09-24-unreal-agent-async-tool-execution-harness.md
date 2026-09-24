---
title: "Unreal Agent - 비동기 도구 실행으로 비용을 줄이는 에이전트 하네스 (Unreal Labs) — 모델이 도구 완료를 기다리며 폴링하는 대신, 실행 환경이 백그라운드 작업과 통지를 관리해 Codex+Astra 대비 비용 39% 절감"
source_title: "Unreal Agent"
source_url: "확인 불가 (unreallabs.ai egress 차단, WebSearch 2차 출처로만 확인)"
source_name: "Unreal Labs 공식 블로그, GeekNews(id=34163) 경유 · AlphaSignal·AI/TLDR 등 2차 출처로 교차확인"
referrer_url: "https://news.hada.io/topic?id=34163"
published_at: "확인 불가 (2026년 9월 공개로 추정)"
summarized_at: "2026-09-24"
category: "ai"
tags: ["coding-agent", "harness-design", "async-execution", "terminal-bench", "gpt-6-astra", "codex", "token-economics", "open-source"]
---

# Unreal Agent - 비동기 도구 실행으로 비용을 줄이는 에이전트 하네스 (Unreal Labs)

> 출처: [Unreal Agent](https://news.hada.io/topic?id=34163) (Unreal Labs, GeekNews 경유) · 정리일 2026-09-24
>
> **출처 한계**: `news.hada.io`·`unreallabs.ai` 모두 egress 차단으로 원문을 직접 열람하지 못했다. WebSearch로 [AlphaSignal](https://alphasignal.ai/news/unreal-labs-unreal-agent-cuts-ai-coding-costs-39-without-losing-performance), [AI/TLDR](https://ai-tldr.dev/releases/unreallabs-unreal-agent/), [supergok.com](https://supergok.com/unreal-agent-launches-as-open-source-ai-harness/) 등 복수의 2차 출처를 교차확인해 핵심 수치(비용 39% 절감, Terminal-Bench 4.0에서 57.9% 정확도에 $1,428 vs Codex $2,350, Go 언어·MIT 라이선스 오픈소스)를 재구성했다. Slack 발췌 마지막 문장("Codex 대비…")은 이 39% 절감 수치와 일치하는 것으로 보이나, hada 원문의 정확한 문장·전체 벤치마크 표는 대조하지 못했다.

## 한 줄 요약

**Unreal Labs가 오픈소스로 공개한 코딩 에이전트 하네스 Unreal Agent(Go, MIT 라이선스)는, 도구 실행이 끝났는지 모델이 반복해서 확인(폴링)하는 대신 실행 환경이 백그라운드 작업과 완료 통지를 직접 관리해 불필요한 모델 호출과 토큰 사용을 줄인다 — Terminal-Bench 4.0에서 GPT-6 Astra(xhigh)로 Codex+Astra 조합과 거의 같은 통과율(57.9%)을 내면서 비용은 39% 낮췄다($1,428 vs $2,350).**

## 핵심 포인트

- **비동기 도구 실행 — 모델이 폴링하지 않는다** — 도구 실행이 끝났는지 모델이 반복 확인하는 대신, ***실행 환경이 백그라운드 작업과 완료 통지를 관리***한다. 도구는 모델의 턴과 독립적으로 돌아가므로, 모델이 대기·폴링·하트비트에 토큰을 쓸 필요가 없어진다 — 한 턴에서 여러 개의 독립적인 도구 호출을 동시에 제출할 수 있다는 뜻이기도 하다.
- **셋업 중 병렬 탐색 + 실행 중 사용자 개입 가능** — 개발 환경을 설정하는 동안 ***코드 탐색과 웹 검색을 병렬로 진행***하고, 도구 실행 중에도 ***사용자의 추가 지시(mid-turn steering)***를 받을 수 있다.
- **작은 도구 표면 + 압축된 프롬프트로 비용 절감** — 간결한 프롬프트와 최적화한 도구 출력을 쓰며, 모델 호출 사이에 더 많은 작업을 처리해 ***더 적은 호출과 입력 토큰으로 같은 성과***를 내도록 설계했다 — 의도적으로 작은 도구 표면(tool surface)을 유지하는 설계 철학이 핵심이다.
- **벤치마크 — Codex+Astra 대비 39% 저렴, 통과율은 거의 동일** — GPT-6 Astra xhigh로 자체 평가한 결과, ***Terminal-Bench 4.0에서 Codex 조합과 비슷한 57.9% 통과율을 유지하며 비용은 $1,428 vs $2,350로 약 39% 절감***했다(2차 출처 기준). Codex 수치는 리더보드 기준선으로 인용됐다.

## 인상 깊은 문장

> "Unreal Labs attributes the reported savings to asynchronous tool execution, compact prompts, token-efficient outputs, and a deliberately small tool surface."
> (AlphaSignal 기사 재인용, 원문 직접 대조는 못했다)

## 댓글

**확인 불가.** hada 댓글 수는 원문 egress 차단으로 확인하지 못했다. 이 벤치마크는 ***Unreal Labs 자체 평가(self-reported)***이며 독립 재현이나 제3자 검증은 확인하지 못했다 — 하네스를 만든 회사가 자사 하네스의 비용 우위를 주장하는 구도라, [[2026-09-18-harnesstax-coding-agent-harness-cost-study]]가 지적한 "벤치마크를 만든 조직의 이해관계"와 같은 구조의 주의가 필요하다. HN·Lobsters 등 독립 커뮤니티의 반응 유무도 확인하지 못했다.

## 내 생각 · 적용점

### 핵심 전이 — 가든의 "하네스가 곧 비용이다" 계열에, 비동기 실행이라는 새로운 절감 축을 더한다

가든에는 이미 하네스 설계와 비용의 관계를 다룬 노트가 여럿 쌓여 있다 — [[2026-09-18-harnesstax-coding-agent-harness-cost-study]](같은 모델도 하네스만 바꾸면 비용이 5배 벌어지고, 초기 컨텍스트 크기가 그 상당 부분을 설명한다는 실증 연구), [[2026-09-19-harness-design-empirical-study-ablation]](컨텍스트 관리의 이득은 "똑똑해지는 것"이 아니라 "안 끊기는 것"이라는 절제 실험), [[2026-08-06-harness-engineering-for-self-improvement]](하네스 자체가 진화·개선의 단위라는 Lilian Weng의 틀). 이 세 연구가 공통으로 짚는 것은 ***"큰 초기 컨텍스트·불필요한 왕복 호출이 비용을 키운다"***는 것인데, Unreal Agent는 여기에 ***"모델이 도구 완료를 기다리며 폴링하는 데 쓰는 토큰"***이라는 또 다른 낭비 축을 짚는다 — HarnessTax의 "미니멀 하네스 Pi가 파레토 프론티어에 있다"는 결론과 궤를 같이하는, 하네스 최소주의 설계 사조의 연장선이다. [[2026-09-12-openai-agents-api-codex-harness]](OpenAI Agents API — Codex 하네스를 매니지드로 공개)와 비교하면 방향이 반대다 — OpenAI는 하네스를 벤더에 락인시키는 API로 팔았고, Unreal Agent는 하네스를 MIT 라이선스로 완전히 공개했다.

## 호스피탈리티 / CRS 적용 포인트

**부분적으로 적용 가능하다.** 온다가 내부적으로 Claude Code·Codex류 코딩 에이전트를 자체 개발 워크플로에 쓰고 있다면, 이 하네스가 짚는 절감 축(비동기 도구 실행, 작은 도구 표면, 압축 프롬프트)은 그대로 ***사내 에이전트 운영 비용을 줄이는 체크리스트***로 쓸 수 있다 — 특히 [[2026-09-18-harnesstax-coding-agent-harness-cost-study]]가 보여준 "초기 컨텍스트가 10배 차이 나면 비용도 그만큼 벌어진다"는 교훈과 함께 적용하면, 하네스 선택 하나로 같은 모델·같은 성능에서 비용을 크게 줄일 여지가 있다는 뜻이다. 다만 CRS 자체(예약·재고·요금 도메인)에 이 하네스를 직접 적용할 접점은 없다 — 이건 어디까지나 "AI 코딩 에이전트를 어떻게 운영할 것인가"라는 개발 생산성 도구 층위의 이야기다.

## 연관 자료

- [[2026-09-18-harnesstax-coding-agent-harness-cost-study]] — 같은 모델도 하네스만 바꾸면 비용이 최대 5배 벌어진다는 실증 연구, 이 글의 비교 기준점
- [[2026-09-19-harness-design-empirical-study-ablation]] — 컨텍스트 관리의 이득은 "완주"이지 "똑똑함"이 아니라는 절제 실험, 같은 최소주의 설계 사조
- [[2026-08-06-harness-engineering-for-self-improvement]] — 하네스 자체가 진화의 단위라는 틀, 이 글의 상위 개념
- [[2026-09-12-openai-agents-api-codex-harness]] — 하네스를 벤더 락인 API로 판 OpenAI의 반대 방향 선택

## 한 달 뒤 회고

*(2026-10-24 즈음 — Unreal Agent의 벤치마크가 제3자에 의해 재현·검증됐는지, HN·Lobsters 커뮤니티 반응이 나왔는지 확인. 온다 내부 에이전트 운영에 비동기 도구 실행 개념을 적용할 여지가 있는지 점검.)*
