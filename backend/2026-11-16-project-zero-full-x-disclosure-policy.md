---
title: "Project Zero, 취약점 공개 기한을 90일에서 30일까지 단계적으로 단축 — 패치 여부와 무관하게 날짜가 되면 공개한다"
source_title: "Policy and Disclosure: 2026 Edition"
source_url: "https://projectzero.google/2026/11/disclosure-policy.html"
source_name: "Google Project Zero (공식 블로그, Help Net Security 등 복수 매체 교차확인)"
referrer_url: "https://news.hada.io/topic?id=37190"
published_at: "2026-11-13"
summarized_at: "2026-11-16"
category: "backend"
tags: ["vulnerability-disclosure", "project-zero", "security-policy", "patch-gap", "llm-exploit"]
---

# Project Zero, 취약점 공개 기한을 90일에서 30일까지 단계적으로 단축

> 출처: [Policy and Disclosure: 2026 Edition](https://projectzero.google/2026/11/disclosure-policy.html) (Google Project Zero) · 정리일 2026-11-16

## 한 줄 요약
**Project Zero가 "90+30" 유예 모델을 버리고, 신고일로부터 고정된 X일(90→60→30일로 단계적 단축)이 지나면 패치 여부와 관계없이 상세 정보를 공개하는 "Full X" 정책으로 전환한다.**

## 핵심 포인트
- 기존 정책(2021년부터)은 ***수정에 최대 90일 + 패치 출시 후 사용자 배포 유예 30일***을 더해 실질적으로 최대 120일을 보장했다.
- 새 정책은 ***신고일 기준 고정 기한이 지나면 패치 여부와 무관하게 상세 정보를 공개*** — 2026-11-13부터 90일, 2027-02-02부터 60일, 2028-01-03부터 30일로 단계적 단축. 각 취약점에는 **신고 당시 시행 중이던 정책**이 적용된다.
- 재직 중 발견된 ***실제 악용(in-the-wild) 취약점은 별도로 7일*** 고정 기한이 적용되며 이번 변경과 무관하게 유지된다.
- 변경 이유로 Project Zero는 ***LLM이 취약점 발견·악용·패치 역공학을 가속*** 하면서 "공개를 늦춰서 얻는 보호 효과" 자체가 줄어든다고 밝혔다 — 늦게 공개해도 공격자는 이미 LLM으로 더 빨리 알아낸다는 논리.
- 공급사 책임의 초점이 ***수정 속도에서 "패치 출시~사용자 설치" 격차(패치 갭)*** 로 옮겨간다 — 패치를 냈다고 끝이 아니라 실제 설치율까지 공급사 책임권으로 들어온다.

## 인상 깊은 문장
> "Vulnerabilities will be disclosed X days after they are reported to the vendor" — Project Zero, Policy and Disclosure: 2026 Edition

## 댓글
news.hada.io는 이 세션에서 egress 차단으로 직접 열람 불가, Help Net Security(helpnetsecurity.com)도 같은 사유로 접속 차단되었다. **projectzero.google 공식 블로그 본문도 WebFetch로 직접 열람은 실패**했으나, WebSearch 결과에 포함된 요약(복수 검색 스니펫)이 날짜·숫자(90/60/30일, 2026-11-13/2027-02-02/2028-01-03)를 상호 일치시켜 보여주므로 신뢰도는 높다고 판단했다 — 단, 1차 본문을 직접 읽지 못했다는 한계는 명시해야 공정하다. hada 쪽 댓글 수·커뮤니티 반응(찬반 논쟁 여부)은 확인 불가.

## 내 생각 · 적용점
이 변화는 [[2026-05-09-ai-breaking-vulnerability-cultures]]에서 다룬 "AI가 조율된 공개·조용한 패치 두 문화를 동시에 깨뜨린다"는 진단의 **정책 차원 후속편**이다. 그 글이 예측한 "9시간 패치 윈도우 시대"가 이제 공식 정책 숫자(90→30일)로 구체화된 셈. 또한 [[2026-11-03-ubuntu-cve-2026-98432-patch-delay]]에서 본 "배포판이 패치를 10일 넘게 방치"하는 사례는, Full 30 체제 아래선 **그 방치 기간이 곧 공개 시점과 거의 겹치는 상황**으로 바뀐다 — 패치 게으름의 비용이 비대칭적으로 커진다. [[2026-10-23-amazon-madpot-php2shell-pre-disclosure-attacks]]가 보여준 "공개 나흘 전부터 공격 시도"도 같은 흐름 — 공개 시점을 앞당기는 쪽이 방어자에게 유리한지 공격자에게 유리한지는 여전히 논쟁적이다(이 노트에서 결론 내리지 않음).

## 호스피탈리티 / CRS 적용 포인트
적용 가능성 있음. CRS/PMS 연동사(서드파티 벤더)에 공급하는 보안 패치의 **"출시 후 설치까지" 추적 체계**가 이제 더 중요해진다 — Project Zero 논리를 그대로 차용하면, 패치를 냈다는 사실만으로는 안전하지 않고 실제 설치율까지 운영 KPI로 관리해야 한다. 벤더사 계약에 "패치 출시 후 N일 내 적용" 같은 SLA 조항이 있는지 점검할 가치가 있다.

## 연관 자료
- [[2026-05-09-ai-breaking-vulnerability-cultures]] — 이 정책 변화를 예견한 진단 글, LLM이 공개 지연의 보호 효과를 줄인다는 논리의 원전
- [[2026-11-03-ubuntu-cve-2026-98432-patch-delay]] — 패치 지연 사례, Full X 체제에서 방치 비용이 커지는 구체 예
- [[2026-10-23-amazon-madpot-php2shell-pre-disclosure-attacks]] — 공개 직전 공격 시도 사례, 공개 시점 전략의 실전 함의

## 한 달 뒤 회고
- [ ] 2026-12-16: 2027-02-02 "Full 60" 전환을 앞두고 주요 공급사(마이크로소프트·Adobe 등)의 반발이나 정책 수정 뉴스가 나왔는지 확인.
