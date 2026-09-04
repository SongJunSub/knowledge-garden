---
title: "EC2 Nitro V6의 Connection Tracking 유휴 타임아웃 변경 대응하기 (AWS 기술 블로그) — 5일 버티던 유휴 연결이 350초 만에 끊긴다: 아무 코드도 안 바꿨는데 인스턴스 세대만 바뀌어도 조용히 깨지는 가정"
source_title: "Amazon EC2 Nitro V6의 Connection Tracking 유휴 타임아웃 변경 대응하기"
source_url: "https://aws.amazon.com/ko/blogs/tech/ec2-nitro-v6-connection-tracking/"
source_name: "aws.amazon.com (AWS 기술 블로그)"
referrer_url: "https://aws.amazon.com/ko/blogs/tech/ec2-nitro-v6-connection-tracking/"
published_at: "확인 불가 (Slack 공유일 2026-09-03 20:10 KST)"
summarized_at: "2026-09-04"
category: "backend"
tags: ["aws", "ec2", "nitro", "connection-tracking", "security-group", "tcp-keepalive", "networking-defaults"]
---

# EC2 Nitro V6의 Connection Tracking 유휴 타임아웃 변경 대응하기

> 출처: [Amazon EC2 Nitro V6의 Connection Tracking 유휴 타임아웃 변경 대응하기](https://aws.amazon.com/ko/blogs/tech/ec2-nitro-v6-connection-tracking/) (AWS 기술 블로그 · Slack #개발-뉴스-dev-news TechArticles 봇 직링크, GeekNews 경유 아님) · 정리일 2026-09-04

## 한 줄 요약

**6세대 Nitro(Nitro V6) 기반 EC2 인스턴스에서 보안 그룹의 TCP established 연결 유휴 타임아웃 기본값이 기존 5일(432,000초)에서 350초로 대폭 단축됐다. 데이터베이스 커넥션 풀·IoT 텔레메트리·장시간 유지되는 마이크로서비스 연결처럼 오래 유휴 상태로 두는 워크로드는 예고 없이 타임아웃 오류를 겪을 수 있어, 인스턴스 타입·Nitro 버전 확인과 TCP keepalive 설정이 필요하다는 대응 가이드다.**

## 핵심 포인트

- **기본값 변경의 실체** — Nitro V6 기반 인스턴스에서 보안 그룹의 TCP established 연결 ***유휴 타임아웃 기본값이 350초로 변경***됐다. 기존 세대는 5일(432,000초)이 기본값이었다 — 단축 폭이 1,200배가 넘는다.
- **변경 이유(WebSearch로 교차 확인)** — 350초라는 값은 자의적인 숫자가 아니라 ***Network Load Balancer, NAT Gateway, Gateway Load Balancer 등 AWS 네트워킹 서비스의 기존 타임아웃과 정렬***시킨 것이다. 인스턴스와 이 서비스들 사이의 타임아웃 불일치가 half-open 연결(한쪽은 끊겼는데 다른 쪽은 살아있다고 착각하는 상태)을 만드는 문제를 줄이려는 의도로 읽힌다.
- **영향받는 워크로드** — 장시간 유휴 상태인 연결에서 ***타임아웃 오류가 발생할 수 있다.*** 특히 커넥션 풀을 오래 열어두는 DB 클라이언트, 저빈도로만 통신하는 IoT 디바이스, 상시 연결을 전제하는 내부 마이크로서비스 간 통신이 직접 영향권이다.
- **대응 방법** — ***워크로드의 인스턴스 타입과 Nitro 버전을 확인***하고, ***TCP keepalive 설정을 통해 연결을 유지 관리***해야 한다. 타임아웃 범위는 최소 60초~최대 432,000초(5일)이며, ENI 수준에서 AWS CLI·Launch Template·콘솔·CloudFormation/Terraform으로 재설정 가능하다(WebSearch로 확인한 일반 스펙).

## 인상 깊은 문장

> "Nitro V6 기반 인스턴스에서 보안 그룹의 TCP established 유휴 타임아웃 기본값이 350초로 변경" (Slack 발췌 요약)

## 댓글

**출처 한계.** `aws.amazon.com`이 이 세션에서 egress 정책으로 차단돼 이 한국어 블로그 원문은 직접 읽지 못했다. 대신 WebSearch로 같은 변경 사항을 다루는 AWS 영문 블로그("Best Practices for TCP Connection Management on EC2")와 AWS 공식 What's New 발표(2023-11, 보안 그룹 connection tracking 타임아웃 설정 기능 자체의 도입 공지)를 교차 확인했고, ***"5일 → 350초"***, ***"NLB/NAT GW/GWLB와의 정렬"***, ***"DB 커넥션 풀·IoT·마이크로서비스 영향"*** 서술이 정확히 일치해 Slack 발췌 내용은 신뢰도가 높다고 판단한다. 다만 이 한국어 블로그 글 고유의 예시 코드·마이그레이션 절차·수치는 확인하지 못했다. hada 댓글이나 HN/Lobsters 큐레이션은 대상이 아니다(GeekNews 경유 글이 아님).

## 내 생각 · 적용점

### 핵심 전이 1 — "인프라 기본값이 조용히 바뀌면 코드 한 줄 안 건드려도 깨진다"는 패턴

이 글의 핵심 위험은 마이그레이션 버그가 아니라 ***인스턴스 세대 교체만으로 애플리케이션 코드는 그대로인데 동작이 바뀐다***는 점이다. [[2026-09-01-imweb-vpc-lattice-service-network-redesign]]이 다룬 ALB 타겟 그룹의 물리적 한계도 비슷한 결이다 — 처음엔 안 보이던 인프라 계층의 암묵적 가정(연결이 5일은 버틴다, 타겟 그룹 크기는 무한하다)이 스케일이나 세대가 바뀌는 순간 표면화된다. **"당연하다고 가정한 인프라 기본값을 명시적으로 확인하라"**는 원칙이 두 글에서 다른 층(로드밸런서 vs 연결 추적)으로 반복된다.

### 핵심 전이 2 — Atlassian의 "broker 네트워크가 진짜 제약"과 같은 결의 교훈: 네트워크 계층은 CPU만큼 눈에 띄지 않는다

[[2026-08-10-atlassian-streamhub-kinesis-to-kafka]]가 짚은 "CPU보다 broker 네트워크 처리량이 더 중요한 제약"이라는 발견과, 이 글의 "연결 추적 타임아웃"은 둘 다 **모니터링 대시보드에 잘 안 뜨는 네트워크 계층의 숨은 제약**이라는 공통점이 있다. CPU·메모리는 흔히 보는 지표지만, conntrack 테이블이나 타임아웃 정책은 장애가 나기 전까지 아무도 들여다보지 않는 경우가 많다.

## 호스피탈리티 / CRS 적용 포인트

CRS가 Nitro V6 세대 인스턴스로 마이그레이션(또는 신규 인스턴스 배포)할 계획이 있다면 이 글이 직접 적용된다. ① **PMS·채널 매니저·OTA 연동처럼 상시 연결을 전제하는 외부 API 클라이언트**가 커넥션 풀을 오래 유지하는 방식이라면, 인스턴스 세대 교체만으로 예고 없이 연결이 끊길 수 있다 — TCP keepalive를 애플리케이션 레벨에서 명시적으로 설정하거나, 필요한 워크로드에는 타임아웃을 늘려 재설정해야 한다. ② **DB 커넥션 풀 설정(idle timeout)이 350초보다 길게 잡혀 있는지 점검이 필요**하다 — 애플리케이션은 연결이 살아있다고 믿는데 보안 그룹이 먼저 끊어버리면, 다음 요청에서야 오류가 드러나는 디버깅하기 까다로운 실패 모드가 된다. ③ 이 변경은 조용히(에러 없이) 적용되는 인프라 기본값이므로, **Nitro V6로의 전환이 있을 때마다 이 항목을 체크리스트에 명시적으로 넣는 것**이 실무적으로 가장 값싼 대응이다.

## 연관 자료

- [[2026-09-01-imweb-vpc-lattice-service-network-redesign]] — 같은 AWS 네트워크 인프라의 암묵적 한계가 스케일 변화 시점에 드러난 자매 사례
- [[2026-08-10-atlassian-streamhub-kinesis-to-kafka]] — CPU가 아니라 네트워크 계층이 진짜 제약이었다는 같은 결의 교훈

## 한 달 뒤 회고

*(2026-10-04 즈음 — aws.amazon.com 접근이 가능해지면 원문의 구체 마이그레이션 절차·예시 코드를 확인해 이 노트를 보강했는지, CRS 인프라의 Nitro 버전·연결 유지 설정을 실제로 점검했는지 기록.)*
