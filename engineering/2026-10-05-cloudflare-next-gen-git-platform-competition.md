---
title: "Cloudflare, 에이전트 시대의 Git 플랫폼 개발 대회 개최 — 리뷰·병합이 아니라 '여러 에이전트가 동시에 같은 코드를 건드릴 때 조율·보존을 어떻게 설계할까'를 묻는다"
source_title: "We want you to build the next Git platform on Cloudflare"
source_url: "https://blog.cloudflare.com/next-git-platform-on-cloudflare/"
source_name: "Cloudflare Blog"
referrer_url: "https://news.hada.io/topic?id=34749"
published_at: "2026-10-01"
summarized_at: "2026-10-05"
category: "engineering"
tags: ["cloudflare", "cloudflare-workers", "cloudflare-artifacts", "git", "coding-agents", "multi-agent-orchestration", "devtools", "forge"]
---

# Cloudflare, 에이전트 시대의 Git 플랫폼 개발 대회 개최

> 출처: [We want you to build the next Git platform on Cloudflare](https://blog.cloudflare.com/next-git-platform-on-cloudflare/) (Cloudflare Blog) · GeekNews(id=34749) 경유 · 정리일 2026-10-05

> **출처 한계**: `news.hada.io`와 `blog.cloudflare.com`, `developers.cloudflare.com`, `www.cloudflare.com`(공식 대회 약관 PDF) 모두 이번 세션 egress 차단으로 직접 열지 못했다. 이 노트는 Slack 발췌 5줄과, WebSearch가 반환한 복수의 독립 소스(completeaitraining.com·huggingnews.com의 보도 요약 — 둘 다 egress 차단으로 WebSearch 엔진의 종합 답변만 확보, Cloudflare 공식 대회 약관 PDF의 WebSearch 요약, 그리고 대회에 실제로 제출된 참가작 2개 — `Butch78/ficus`, `arjunkshah12345-hash/locus` — 의 GitHub README를 직접 WebFetch)를 교차확인해 재구성했다. 대회 일정·상금 규모는 여러 독립 소스가 일치해 신뢰도가 높다고 판단하지만, Cloudflare 공식 발표문의 정확한 문장·전체 요건 목록은 대조하지 못했다. hada 댓글 수, HN/Lobsters 큐레이션 여부도 확인 불가.

## 한 줄 요약

**Cloudflare가 Workers와 신규 서비스 Artifacts를 이용해 "에이전트 시대의 Git 플랫폼"을 만드는 대회를 열었다. 기존 GitHub에 에이전트 기능을 덧붙이는 수준을 넘어, 수백·수천 개의 에이전트가 같은 코드베이스에서 동시에 변경 작업을 할 때 — 저장소·브랜치·PR·워크트리·코드 리뷰·병합 충돌을 어떻게 다시 설계할지, 또는 에이전트의 작업 맥락을 보존하고 여러 변경을 동시에 비교해 어느 것을 채택할지 결정하는 완전히 새로운 방식을 요구한다. 기반 서비스인 Artifacts는 Git을 지원하고 수백만 개 저장소로 확장 가능한 버전 관리 파일시스템으로, 저장소 생성·포크·코드와 에이전트 컨텍스트 저장을 프로그래밍 방식으로 처리한다. 참가자는 2026년 10월 14일까지 시연 영상과 소스코드를 제출해야 하고, 1위 팀은 Cloudflare 크레딧 $25,000와 10월 21일 샌프란시스코 Cloudflare Connect 무대 발표 기회를 받는다.**

## 핵심 포인트

- **대회의 질문 — "GitHub + 에이전트"가 아니라 "에이전트 네이티브 Git"** — 참가자들에게 저장소·브랜치·PR·워크트리·코드 리뷰·병합 충돌 개념 자체를 다시 생각하거나, 에이전트 맥락을 보존하고 여러 변경을 동시에 비교해 어느 것을 채택할지 정하는 새로운 방식을 만들라고 요청한다. 핵심 전제는 ***"수백~수천 개의 에이전트가 같은 코드베이스에서 동시에 변경 작업을 한다"***는 미래 시나리오다.
- **Artifacts — Git을 지원하는 버전 관리 파일시스템** — 참가자가 반드시 써야 하는 기반 서비스. ***수백만 개 저장소로 확장 가능***하며, 저장소 생성·포크·코드와 에이전트 컨텍스트 저장을 프로그래밍 방식(API)으로 처리한다. 2026-10-01 공개 베타로 전환됐다(`developers.cloudflare.com` 체인지로그 기준, WebSearch 요약).
- **일정과 제출 요건** — 대회는 2026-10-01 09:00 EDT부터 2026-10-14 23:59 PDT까지. 제출물은 5~10분 길이의 시연 영상, 소스코드가 담긴 저장소, 실행 안내서다.
- **상금과 무대** — 1위 팀은 ***12개월간 유효한 Cloudflare 크레딧 $25,000***와 Cloudflare Connect VIP Speaker Dinner 초청을 받는다. 결선 진출팀은 사전 통지를 받고 2026-10-21 샌프란시스코 Cloudflare Connect 현장에서 10분씩 직접 발표한다.
- **실제 제출작 두 개로 본 방향성** — ***Ficus***(Rust)는 "작업이 수용된 커밋에서 바깥으로 뻗어나가고, 여러 에이전트가 같은 작업을 별도 저장소에서 경쟁적으로 시도한 뒤 샌드박스에서 자동 채점해 승자만 반영하고 나머지는 자동 리베이스로 가지치기"하는 모델을 택했다. ***Locus***(TypeScript)는 "개발자(에이전트)가 표면(surface)을 점유하고 자신의 포크에서 작업하며 승리한 변경만 반영"하는, 파일 단위 점유·충돌 관리에 집중한 모델이다 — 둘 다 "여러 에이전트의 경쟁적 시도 중 승자를 골라 반영한다"는 공통 패턴을 서로 다른 메타포(가지치기 vs 영토 점유)로 구현했다.
- **Cloudflare Workers Paid 플랜 전제** — Locus README 기준으로 Artifacts는 Workers 유료 플랜 기능으로 확인됐다(WebFetch로 직접 확인) — 대회 참가 자체에 비용 장벽이 있다는 뜻이다.

## 인상 깊은 문장

> "Rethink repositories, branches, pull requests, worktrees, code review, and merge conflicts — or build new ways to preserve agent context, compare multiple changes at the same time, and decide which one should ship."
> (WebSearch 종합 요약 재구성 — Cloudflare 공식 대회 안내 페이지의 취지를 여러 독립 보도가 거의 동일하게 전달해 원문 취지에 가깝다고 판단했으나, 공식 블로그 원문 문장을 직접 대조하지는 못했다.)

## 댓글

**hada 댓글 수, HN/Lobsters 큐레이션 여부 모두 확인하지 못했다**(`news.hada.io` 전면 차단). 정직하게 감안할 점 — (1) 이건 Cloudflare가 주최하는 마케팅 성격의 대회라, "에이전트 네이티브 Git"이라는 문제 설정 자체가 Cloudflare Workers·Artifacts 플랫폼을 더 쓰게 만들려는 벤더 유인과 분리되지 않는다. 실제로 "다음 Git 플랫폼이 필요하다"는 수요가 시장에 얼마나 있는지는 이 대회 자체로는 검증되지 않는다. (2) 제출작(Ficus, Locus)들을 살펴본 결과는 ***대회 마감 전 진행 중인 프로젝트***들이라 — 완성도·실제 동작 여부·심사 결과는 2026-10-14 마감 이후에나 알 수 있다. 지금 시점의 정보로 "이 대회가 실제로 쓸모 있는 결과물을 낳았는지"를 평가할 수는 없다. (3) 비슷한 이름("Atlas" 등)의 무관한 프로젝트들이 검색에 섞여 있던 것처럼, 이 대회 역시 "Git competition"이라는 일반적인 검색어로는 무관한 결과가 많이 섞여 들어와 — 참가작 전체 목록을 이 노트에서 완전하게 확보했다고는 말할 수 없다.

## 내 생각 · 적용점

### 핵심 전이 1 — [[2026-05-04-if-i-could-make-my-own-github]]가 블로그에서 던진 wishlist가, 벤더 주최 대회의 공식 요건으로 승격된 모양새다

Mat Duggan의 글은 "forge ≠ git"이라는 진단에서, LLM이 저위험 커밋으로 판정하면 자동 승인하는 유연한 PR 규칙, stacked PR 일급 지원 같은 9가지 wishlist를 제시했다 — 개인 블로거의 희망 목록이었다. 이 Cloudflare 대회는 그 wishlist 중 "LLM 통합 forge가 다음 표준"이라는 항목을 ***실제로 상금을 걸고 참가자들에게 구현해보라고 요청하는 형태로 구체화***했다. 흥미로운 차이는, Duggan의 글이 "사람 리뷰어를 LLM으로 보강"하는 정도의 변화를 상상했다면, 이 대회는 "리뷰할 사람 자체가 소수이고 변경을 만드는 쪽이 압도적으로 에이전트"라는 더 급진적인 전제에서 출발한다는 것 — 같은 문제의식이 18개월 사이에 전제의 급진성 면에서 한 단계 더 나갔다.

### 핵심 전이 2 — [[2026-09-27-atlas-source-control-for-coding-agents]]와는 "동시성"이라는 축에서 정확히 다음 단계의 문제를 다룬다

Atlas는 "한 명의 개발자가 여러 에이전트(Claude Code, Codex 등)를 번갈아 쓰며 커밋에 세션 맥락을 영구히 링크"하는 문제를 풀었다 — 순차적·단일 사용자 시나리오다. 이 Cloudflare 대회가 요구하는 건 그 다음 단계 — ***수백~수천 개의 에이전트가 동시에*** 같은 코드베이스를 건드릴 때의 조율·검토·병합이다. Atlas의 "체크포인트에 질의해 맥락을 복원한다"는 해법은 에이전트가 하나씩 순서대로 일할 때는 통하지만, 동시에 여러 에이전트가 경쟁적으로 변경을 시도하는 시나리오에서는 "누구의 변경을 채택할지"라는 전혀 다른 문제(Ficus의 가지치기, Locus의 영토 점유 모델이 각자 답하려는 문제)가 추가된다. 두 노트를 나란히 보면 "에이전트와 함께 일하는 소스 관리"라는 니치가 ***단일 에이전트의 맥락 보존 → 다중 에이전트의 동시 조율***로 문제의 복잡도 자체가 빠르게 올라가고 있다는 흐름이 보인다.

### 핵심 전이 3 — [[2026-10-02-cloudflare-k2-serverless-event-streams]]와는 같은 벤더·같은 시기의 반복되는 패턴

이번 주 Cloudflare는 K2(R2 위에 쌓는 서버리스 이벤트 스트림)도 발표했다. 두 발표를 나란히 두면 ***"Workers라는 컴퓨트 레이어 위에, 전에는 전용 인프라(메시지 브로커, Git 서버)가 필요했던 1차 서비스를 서버리스 프리미티브로 다시 얹는다"***는 Cloudflare의 반복되는 플랫폼 전략이 보인다 — K2는 Kafka급 이벤트 스트리밍을, Artifacts는 GitHub급 버전관리를 같은 패턴(에지 서버리스 + R2/객체스토리지급 내구성 저장)으로 재구현하려 한다. 가볍게만 묶을 연결이지만, "Cloudflare가 자기 생태계 위에 점점 더 많은 전통적 인프라 카테고리를 끌어들이고 있다"는 흐름을 보여주는 사례로는 유의미하다.

## 호스피탈리티 / CRS 적용 포인트

**온다가 지금 자체 Git 플랫폼을 Artifacts 기반으로 새로 짤 상황은 전혀 아니다 — 이건 아직 대회 단계의 실험적 시도들이고, 실무 채택을 논하기엔 너무 이르다.** 다만 전이 가능한 문제의식 하나는 분명히 남는다. 온다 개발팀이 Claude Code 같은 코딩 에이전트를 여러 명이 동시에 쓰는 비중이 늘어날수록, "에이전트 A가 작업 중인 브랜치와 에이전트 B가 작업 중인 브랜치가 같은 모듈을 건드릴 때 누가 먼저 머지되고 나머지는 어떻게 재적용되는가"라는 질문이 실제로 발생하기 시작한다. 지금 당장은 ***"한 모듈·한 레포에는 한 번에 하나의 에이전트 세션만 작업하게 한다"*** 같은 단순한 운영 규칙으로 충분히 피해갈 수 있는 문제지만, 에이전트 활용 규모가 커지면 이 대회가 다루는 "동시 다중 에이전트 조율"이 CRS 레포에서도 실제 운영 이슈가 될 수 있다는 걸 미리 인지해두는 정도가 지금 시점에서 할 수 있는 가장 현실적인 준비다.

**Claude 활용 관점에서 직접적인 팁을 주는 글은 아니다.** 이건 "Claude Code를 어떻게 쓸까"가 아니라 "Claude Code 같은 에이전트들이 동시에 많아진 미래의 Git 인프라를 누가 어떻게 다시 지을까"를 다루는, 한 단계 위의 인프라·플랫폼 이야기다.

## 연관 자료

- [[2026-05-04-if-i-could-make-my-own-github]] — 같은 "forge를 다시 짠다면" 문제의식의 개인 블로거 wishlist 버전, 이 대회는 그중 "LLM 통합 forge" 항목을 상금 걸고 구체화한 모양
- [[2026-09-27-atlas-source-control-for-coding-agents]] — 단일 사용자·순차적 에이전트 맥락 보존이라는 앞 단계 문제, 이 대회는 다중 에이전트 동시 조율이라는 다음 단계 문제를 다룬다
- [[2026-10-02-cloudflare-k2-serverless-event-streams]] — 같은 벤더가 같은 시기에 반복하는 "Workers 위에 전통 인프라 카테고리를 서버리스로 재구현"하는 패턴

## 한 달 뒤 회고

*(2026-11-05 즈음 — ①대회 마감(10-14)과 결선 발표(10-21) 이후 실제 우승작·심사평이 공개됐는지. ②Artifacts가 공개 베타를 넘어 일반 가용 단계로 넘어갔는지, 실사용 채택 사례가 나왔는지. ③"다중 에이전트 동시 조율" 문제가 온다 내부에서 실제로 운영 이슈로 제기된 적이 있는지 점검.)*
