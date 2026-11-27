---
title: "롯데GRS의 캠페인 AI 에이전트 CamBot: Amazon Bedrock과 Strands Agents로 설계부터 운영, 모델 전환까지 (AWS) — 점포 사용자의 캠페인 설계 시간을 대화형 UX로 단축하면서, 모델을 교체해도 에이전트 로직은 유지되는 구조"
source_title: "롯데GRS의 캠페인 AI 에이전트 CamBot: Amazon Bedrock과 Strands Agents로 설계부터 운영, 모델 전환까지"
source_url: "https://aws.amazon.com/ko/blogs/tech/lotte-grs-cambot-campaign-ai-agent-bedrock-strands-agents/"
source_name: "AWS 기술 블로그"
referrer_url: "https://ondainc.slack.com/archives/C0AJL0096H4"
published_at: "확인 불가"
summarized_at: "2026-11-27"
category: "ai"
tags: ["amazon-bedrock", "strands-agents", "lotte-grs", "conversational-ux", "campaign-management"]
---

# 롯데GRS의 캠페인 AI 에이전트 CamBot (AWS)

> 출처: [롯데GRS의 캠페인 AI 에이전트 CamBot](https://aws.amazon.com/ko/blogs/tech/lotte-grs-cambot-campaign-ai-agent-bedrock-strands-agents/) (AWS 기술 블로그) · 정리일 2026-11-27

> **출처 한계**: `aws.amazon.com`이 egress 차단되어 원문을 직접 열람하지 못했다. WebSearch로 "롯데GRS"·"CamBot"을 직접 다룬 자료는 찾지 못했다 — 가장 가까운 사례는 롯데백화점이 Amazon ECS에서 Strands Agents SDK 기반 에이전트 서버를 운영하고 Bedrock Claude Haiku로 추론한다는 별도 사례였으나, CamBot과의 관계는 확인되지 않는다. 롯데GRS(롯데리아 등 외식 프랜차이즈 운영사)라는 회사 자체의 서비스 여부도 이 세션에서는 재확인하지 못했다.

## 한 줄 요약

**롯데GRS는 점포 사용자의 캠페인 설계 시간을 줄이기 위해 Amazon Bedrock과 Strands Agents 기반의 대화형 AI 에이전트 CamBot을 도입해, 복잡한 캠페인 생성 과정을 자동화하면서도 모델을 교체해도 에이전트 로직은 그대로 유지되는 구조로 설계했다.**

## 핵심 포인트

- **점포 사용자의 캠페인 설계 시간 단축이 목표** — 롯데GRS는 점포 사용자의 캠페인 설계 시간을 단축하기 위해 ***대화형 AI 에이전트 CamBot***을 도입했다.
- **디지털 리터러시를 고려한 직관적 UX** — 사용자 인터뷰와 워크숍을 통해 디지털 리터러시를 고려한 직관적인 대화형 UX를 설계했다는 서술 — 점포 운영자가 기술적 배경 없이도 쓸 수 있도록 설계했다는 의미로 읽힌다.
- **캠페인 생성 과정 자동화** — 복잡한 캠페인 생성 과정을 자동화해 점포 운영 효율성과 캠페인 완료율을 동시에 개선했다는 주장.
- **Strands Agents SDK로 모델-로직 분리** — AWS·Amazon Bedrock·Strands Agents를 결합해 ***설계부터 운영, 모델 전환까지***를 다룬다는 제목이 암시하듯, 기반 LLM을 교체하더라도 에이전트의 작업 로직(Strands Agents 레이어)은 그대로 유지할 수 있는 구조로 설계된 것으로 추정된다 — 다만 Slack 발췌에는 모델 전환의 구체적 사례가 담기지 않아 확인 불가.

## 인상 깊은 문장

> (원문 미열람으로 1차 인용 확보 못함. Slack 발췌: "점포 사용자의 캠페인 설계 시간을 단축하기 위해 대화형 AI 에이전트 CamBot을 도입함" / "사용자 인터뷰와 워크숍을 통해 디지털 리터러시를 고려한 직관적인 대화형 UX를 설계함")

## 댓글

AWS 기술 블로그 사례 공유 글이라 hada 댓글 생태계 밖. 벤더(AWS) 성공 사례 서술일 가능성에 유의 — 캠페인 완료율 개선의 구체 수치(%)는 Slack 발췌에 담기지 않아 확인 불가.

## 내 생각 · 적용점

### 핵심 전이 — "비전문가를 위한 대화형 UX" 설계 원칙의 반복

[[2026-11-26-samsung-tv-farm-ai-agent-interface-principles]](사람용 API와 에이전트용 인터페이스는 다른 설계가 필요하다)와 [[2026-11-26-naver-care-agent-mcp-agent-design-part2]](탐색-판단/검증-확정 역할분리)가 보여준 "에이전트 인터페이스 설계" 원칙이, 이번엔 ***비개발자 최종 사용자(점포 운영자)***를 대상으로 한 사례로 변주된다. 디지털 리터러시가 낮은 사용자를 위한 대화형 UX 설계라는 축은 [[2026-11-26-end-of-feature-discovery]](AI는 발견을 돕는 게 아니라 발견 자체를 없앤다)의 "복잡한 기능 발견을 대화로 대체한다"는 주장과도 연결된다 — 캠페인 설계라는 복잡한 다단계 작업을 메뉴 탐색이 아니라 대화로 완료하게 한 사례로 볼 수 있다.

### 적용점

"사용자 인터뷰와 워크숍으로 UX를 설계한다"는 과정 자체가, AI 에이전트 UX를 처음부터 엔지니어의 직관이 아니라 실제 사용자 조사로 설계해야 한다는 교훈을 준다.

## 호스피탈리티 / CRS 적용 포인트

**적용 가능성 높음.** CRS/PMS의 프런트 데스크·객실관리 직원처럼 디지털 리터러시가 다양한 비개발자 사용자를 대상으로, 복잡한 요금 규칙·프로모션 설정을 대화형 에이전트로 단축하는 구조는 거의 동일한 패턴으로 적용할 수 있다. 모델을 교체해도 로직이 유지되는 구조(Strands Agents 레이어 분리) 역시 벤더 종속을 줄이는 설계 원칙으로 바로 참고할 만하다.

## 연관 자료

- [[2026-11-26-samsung-tv-farm-ai-agent-interface-principles]] — 에이전트 인터페이스를 사람용과 다르게 설계해야 한다는 원칙
- [[2026-11-26-naver-care-agent-mcp-agent-design-part2]] — 역할 분리 기반 에이전트 설계의 다른 사례
- [[2026-11-26-end-of-feature-discovery]] — 복잡한 기능 발견을 대화로 대체한다는 같은 축

## 한 달 뒤 회고

2026-12-27 즈음 — 원문이 열리면 캠페인 완료율 개선의 구체 수치와 모델 전환 실제 사례를 확인한다.
