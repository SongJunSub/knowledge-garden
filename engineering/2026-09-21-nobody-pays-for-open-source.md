---
title: "아무도 오픈소스에 돈을 내지 않는다, 돈을 내게 만들 수는 있다 (Laurie Voss/Seldo) — 진짜 돈은 이미 레지스트리 계층(JFrog·Docker)에서 오가고 있다"
source_title: "Nobody pays for open source. We can force them to."
source_url: "https://seldo.com/posts/nobody-pays-for-open-source-we-can-force-them-to/"
source_name: "Seldo.com (Laurie Voss, 전 npm 직원)"
referrer_url: "https://news.hada.io/topic?id=34040"
published_at: "확인 불가"
summarized_at: "2026-09-21"
category: "engineering"
tags: ["open-source-funding", "npm", "jfrog", "docker", "maintainer-sustainability", "registry-royalty"]
---

# 아무도 오픈소스에 돈을 내지 않는다, 돈을 내게 만들 수는 있다 (Laurie Voss/Seldo)

> 출처: [Nobody pays for open source. We can force them to.](https://seldo.com/posts/nobody-pays-for-open-source-we-can-force-them-to/) (Seldo.com) · GeekNews(id=34040) 경유 · 정리일 2026-09-21
>
> **출처 한계**: `news.hada.io`가 egress 차단으로 원문 접근 불가. Slack GN⁺ 발췌(4개 불릿, 마지막이 "개인과 소규모 팀의 무료 이용, 기존…"에서 잘림)와 WebSearch로 확보한 Seldo.com 원문 스니펫(daily.dev 재게시 포함)을 교차해 재구성했다. 저자가 전 npm 직원이라는 점은 WebSearch 검색 결과 요약에서 확인했으나 원문 저자명(Laurie Voss로 추정)은 직접 대조하지 못했다.

## 한 줄 요약

**30년간의 자발적 후원(팁, 재단, 기업 서약, 라이선스 변경)이 오픈소스 유지보수자에게 돈을 못 가져다준 이유는 "부탁"이 확장되지 않기 때문이고, 진짜 돈은 이미 JFrog·Docker·Sonatype 같은 레지스트리 인접 업체로 흘러가고 있다 — npm 같은 저장소가 대기업에 사용료를 걷어 실제 사용 패키지의 유지보수자에게 자동으로 로열티를 분배하자는 게 이 글의 제안이다.**

## 핵심 포인트

- **기업은 이미 오픈소스에 돈을 내고 있다, 다만 유지보수자가 아니라 중개업체에** — 기업은 오픈소스를 안전하고 안정적으로 사용하려고 JFrog, Docker 같은 업체에 ***이미 돈을 내지만, 정작 코드를 만든 유지보수자에게는 그 돈이 돌아가지 않는다.*** WebSearch로 확인한 규모: JFrog 2025년 매출 5억 3,200만 달러(24% 성장), Snyk 약 3억 2,600만 달러, Docker 2억 700만 달러.
- **직접 사용료 부과는 포크로 회피되지만, 관리 서비스에는 지불 의사가 있음** — 코드에 사용료를 붙이면 무료 포크가 등장하지만, 기업은 직접 운영하는 번거로움을 피하려고 ***패키지 배포와 보안 관리 서비스에는 비용을 지불한다.*** 이게 JFrog·Docker·Sonatype·Snyk의 비즈니스 모델이 "믿을 수 있는 공급"을 판다는 뜻이다.
- **핵심 제안 — 레지스트리가 걷어서 자동 분배** — npm 같은 패키지 저장소와 미러 업체가 일정 규모 이상 기업에 구독료를 받고, ***실제로 사용하는 패키지의 유지보수자에게 수익 일부를 매달 자동 배분하자는 제안***이다. WebSearch로 보강: 신청 절차 없이 의존성 트리 내 패키지에 비례해(pro rata) 고정 로열티를 분배하는 방식.
- **개인·소규모 팀은 계속 무료(발췌 일부 확인)** — 개인과 소규모 팀의 무료 이용은 유지하고, 기존(대기업 대상)의 유료 구조만 바꾸자는 제안으로 이어지는 것으로 추정되나 정확한 문장은 확인하지 못했다.

## 인상 깊은 문장

> "Thirty years of voluntary funding schemes haven't paid open source maintainers because asking doesn't scale. The real money already flows — to JFrog, Docker, Sonatype — at the registry layer."
> (WebSearch로 확보한 원문 취지의 재구성)

## 댓글

**확인 불가.** hada 댓글 수는 대조하지 못했다. **읽을 때 감안**: 저자가 전 npm 직원으로 추정돼, "레지스트리가 돈을 걷어야 한다"는 제안이 npm이라는 특정 인프라의 역할을 확대하자는 이해관계와 겹칠 수 있다. 강제 사용료 부과가 실제로 대기업의 반발이나 우회(예: 사설 미러 운영)를 부르지 않을지에 대한 반론은 확인하지 못했다.

## 내 생각 · 적용점

### 핵심 전이 — 같은 배치의 "AI가 무너뜨리는 공유의 문화"와 대조되는 해법 지향 관점

[[2026-09-21-ai-destroying-culture-of-sharing]]이 오픈소스 위기를 문화적·규범적 붕괴로 진단했다면, 이 글은 같은 위기를 **경제적 메커니즘 설계 문제**로 진단하고 구체적 해법(레지스트리 로열티 자동 분배)까지 제시한다. 두 노트를 나란히 읽으면 오픈소스 지속가능성 문제가 "AI가 규범을 깼다"는 축과 "애초에 돈 흐름이 설계되지 않았다"는 축, 두 개의 독립적인 원인이 겹쳐 있다는 게 드러난다 — 문화적 해법(라이선스 강화)만으로는 경제적 문제(유지보수자 생계)가 풀리지 않고, 그 반대도 마찬가지라는 점이 흥미롭다. [[2026-08-04-devtools-must-be-open-source]]가 "개발자 도구는 오픈소스여야 한다"고 주장했던 전제 자체가, 이 글의 논지대로면 "그 오픈소스를 누가 먹여살리는가"라는 질문 없이는 불완전하다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 멀다. 다만 CRS가 의존하는 오픈소스 라이브러리들의 유지보수 지속가능성은 간접적으로 CRS의 공급망 리스크와 연결된다 — 이 글이 지적한 "기업은 관리 서비스에는 돈을 낸다"는 패턴대로, 온다가 핵심 의존성에 대해서는 (JFrog·Snyk 같은) 관리형 서비스 계약이나 직접 후원을 검토해 공급망 취약점(메인테이너 소진으로 인한 방치)을 줄이는 리스크 관리 관점으로 참고할 만하다.

## 연관 자료

- [[2026-09-21-ai-destroying-culture-of-sharing]] — 오픈소스 위기의 문화적 축, 이 글의 경제적 축과 상호 보완
- [[2026-08-04-devtools-must-be-open-source]] — 개발자 도구 오픈소스화 주장, 이 글은 그 지속가능성에 대한 질문을 던짐

## 한 달 뒤 회고

*(2026-10-21 즈음 — 이 제안(레지스트리 자동 분배)에 대한 실제 npm·PyPI 등의 반응이나 실험이 있었는지 확인.)*
