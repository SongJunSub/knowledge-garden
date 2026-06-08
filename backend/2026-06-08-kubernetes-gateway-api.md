---
title: "Kubernetes Gateway API — Ingress의 후속, 관심사 분리·소유권 경계·표준화 (기술 노트 + 설계 철학)"
source_title: "Kubernetes Gateway API"
source_url: "https://www.romaglushko.com/blog/k8s-gateway-api/"
source_name: "romaglushko.com · GeekNews 경유"
referrer_url: "https://news.hada.io/topic?id=30262"
summarized_at: "2026-06-08"
category: "backend"
tags: ["kubernetes", "gateway-api", "ingress", "nginx-ingress-eol", "policy-attachment", "infra", "design-philosophy"]
---

# Kubernetes Gateway API — Ingress의 후속, 관심사 분리·소유권 경계·표준화 (기술 노트 + 설계 철학)

> 출처: [Kubernetes Gateway API](https://www.romaglushko.com/blog/k8s-gateway-api/) (Roman Glushko, GeekNews 경유) · 정리일 2026-06-08

## 한 줄 요약
**Kubernetes 인그레스 패턴이 진화한다 — *2026년 3월 NGINX Ingress Controller 지원 종료*에 따라 *Gateway API*가 후속으로 자리잡는다. 기존 *Ingress API*는 *제한된 범위·경직된 확장성·정책 강제 부재·모호한 소유권 경계·안전한 cross-namespace 미지원*이라 복잡 설정을 *custom annotation*으로 처리해 이식성이 떨어졌다. Gateway API는 *GatewayClass/Gateway/Route로 리소스를 분리*하고, *Policy attachment로 팀 간 관심사를 분리*하며, *ReferenceGrant로 보안*을 강화한다. NGINX 컨트롤러는 *5년간 20건 CVE·IngressNightmare(CVE-2025-1974) Critical RCE* 등 *구조적 설계 결함*으로 반복 취약점이 발생했다.**

## 핵심 포인트 (기술 + 전이 가능 설계 원칙)

- **Ingress의 한계 = custom annotation 이식성 저하** — *표준 API가 표현 못 하는 걸 vendor별 annotation으로* 우회 → 락인·이식성 저하. → *표준이 빈약하면 custom으로 새고, custom은 종속을 부른다*.
- **Gateway API = 관심사 분리·소유권 경계 명확화** — *GatewayClass(인프라)/Gateway(플랫폼)/Route(앱 팀)*로 *누가 무엇을 소유하는지* 분리. *Policy attachment*로 정책 강제. **[[2026-05-18-platform-engineering-end-to-end-luca-valli]] *내부 고객·소유권 경계* + [[2026-05-26-bottleneck-is-organization]] *가드레일·표준*의 네트워킹 구현**.
- **NGINX의 구조적 결함 = 반복 취약점** — *5년 20 CVE·Critical RCE*. *구조적 설계 결함이 반복 취약점을 낳는다*. **[[2026-06-01-how-anthropic-contains-claude]] *"커스텀이 가장 취약"* + [[2026-05-29-choose-boring-technology-2015]] *검증된 것은 실패 양상이 알려져 있다*의 보안판** — 구조가 취약하면 패치는 두더지 잡기.
- **마이그레이션 4 옵션** — *Ingress 유지·Fork·다른 컨트롤러 전환·Gateway API 이전*. EOL 앞두고 *혁신 토큰을 어디에 쓸지* 판단.
- **구현체 비교** — *Envoy Gateway(기능 풍부·간단)·Istio(메시 통합·학습 가파름)·kgateway(완벽 Conformance)·Traefik(간편·성능 우려)·NGINX Gateway Fabric(NGINX Plus 의존)*. 댓글: *NGF Authorization 헤더 인증 불가→Envoy 전환*, *"Envoy가 더 뜨겠다"*.

## 인상 깊은 문장

> *(요지)* Ingress API는 *제한된 범위·정책 강제 부재·모호한 소유권 경계* 때문에, 복잡한 설정을 *vendor별 custom annotation*으로 처리하게 만들어 이식성을 해쳤다.

> *(요지)* NGINX Ingress Controller는 *구조적 설계 결함*으로 5년간 20건의 CVE를 냈고, IngressNightmare는 *원격 코드 실행*이 가능한 Critical 등급이었다.

## 내 생각 · 적용점

기술 노트지만 *전이 가능한 설계 철학*이 또렷하다: **① 표준이 빈약하면 custom으로 새고 custom은 종속·취약성을 부른다([[2026-06-01-how-anthropic-contains-claude]] "커스텀이 가장 취약"·[[2026-05-29-choose-boring-technology-2015]] 검증된 것 우선). ② 좋은 API는 *관심사·소유권 경계를 명시*한다(Gateway API의 3계층 = 누가 무엇을 책임지나). ③ 구조적 결함은 패치로 못 메운다 — 신뢰성은 설계에서 온다([[2026-06-01-my-software-north-star]] 정확성·신뢰성).** **친·반 AI 균형 카운팅 무관한 기술 노트** (부채 +2 유지).

**CRS 직접 적용** (CRS는 k8s 파드 운영): *NGINX Ingress Controller 2026-03 EOL*은 실무 일정 이슈 — CRS/조선호텔 게이트웨이가 NGINX Ingress라면 *마이그레이션 4 옵션 평가 + Gateway API 이전 검토*가 필요. 특히 *IngressNightmare 같은 Critical RCE 노출 여부*를 보안 점검하고, 다중 팀(crs·crs-admin·crs-be)이 같은 클러스터를 쓰면 *Gateway API의 소유권 경계(GatewayClass/Gateway/Route)·Policy attachment*로 관심사를 분리.

## 연관 자료
- [Kubernetes Gateway API](https://www.romaglushko.com/blog/k8s-gateway-api/) (원문)
- [GeekNews — 30262](https://news.hada.io/topic?id=30262)
- [[2026-06-01-how-anthropic-contains-claude]] — "커스텀이 가장 취약" *(보안 설계)*
- [[2026-05-29-choose-boring-technology-2015]] — 검증된 것의 실패 양상이 알려져 있음
- [[2026-05-18-platform-engineering-end-to-end-luca-valli]]·[[2026-05-26-bottleneck-is-organization]] — 관심사 분리·소유권·가드레일
- [[2026-06-01-my-software-north-star]] — 신뢰성은 설계에서

## 한 달 뒤 회고
*(2026-07-08 즈음 — CRS/사내 클러스터의 Ingress Controller가 NGINX EOL·CVE에 노출됐는지, Gateway API 마이그레이션을 평가·계획했는지, 팀 간 소유권 경계를 Gateway API로 분리했는지 기록.)*
