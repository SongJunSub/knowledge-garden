---
title: "SignuDoc (Nyllon Software) — DocuSign을 대체하는 오픈소스 전자서명 플랫폼, 핵심은 '내 계정에 직접 배포해 운영한다'는 소유권"
source_title: "SignuDoc"
source_url: "https://github.com/NYLLON-SOFTWARE/signudoc"
source_name: "GitHub (Nyllon Software)"
referrer_url: "https://news.hada.io/topic?id=37551"
summarized_at: "2026-11-21"
category: "engineering"
tags: ["e-signature", "open-source", "self-hosted", "docusign-alternative", "saas-ownership"]
---

# SignuDoc (Nyllon Software) — DocuSign을 대체하는 오픈소스 전자서명 플랫폼, 핵심은 '내 계정에 직접 배포해 운영한다'는 소유권

> 출처: [SignuDoc](https://github.com/NYLLON-SOFTWARE/signudoc) (Nyllon Software, GitHub) · 정리일 2026-11-21

## 한 줄 요약

**PDF에 서명·입력란을 배치하고 이메일로 서명을 요청하는 DocuSign류 SaaS를 통째로 오픈소스로 공개해, 가입 없이 서명하게 하면서도 PAdES 봉인과 해시체인 감사추적까지 갖춘, "직접 배포해 소유하는" 전자서명 플랫폼이다.**

## 핵심 포인트

- MIT 라이선스, "**Not affiliated with DocuSign**"을 README에 명시한 정면 대체재. 기술스택은 Next.js 16(Vercel Functions), Neon Postgres, Vercel Blob, Resend, Node.js 24 — 전형적인 서버리스 조합.
- 받는 사람은 **가입 없이 링크를 열어** 이름을 입력하거나 손으로 서명. 휴대폰에서도 바로 이용 가능.
- 최대 **25명의 서명 순서**를 지정하거나 여러 사람이 동시에 서명하게 설정 가능. 서명·이니셜·날짜·이름·텍스트·숫자·체크박스·선택 항목을 문서 위에 자유롭게 배치.
- 완료된 PDF는 **PAdES 봉인 + 해시체인 감사추적**으로 보호되고, 누구나 서명 유효성을 확인할 수 있는 공개 검증 페이지를 제공. 웹훅·API로 자체 사이트에도 임베드 가능.
- 대시보드에서 **누구의 서명을 기다리는지** 확인하고, 서명 기한·자동 알림을 설정. 자주 보내는 문서는 템플릿으로 저장해 입력란·서명 순서를 재사용.
- GitHub 스타 2.7k·포크 522(조사 시점 스냅샷) — 생성 시점이나 급성장 여부는 교차확인하지 못했으나 꽤 주목받는 규모.

## 인상 깊은 문장

> "Open-source document signature platform. Not affiliated with DocuSign."

## 댓글

GeekNews(news.hada.io)가 이 세션에서 네트워크 레벨로 전면 차단되어 **원문 페이지·댓글 수·HN/Lobsters 큐레이션 여부를 전혀 확인할 수 없다.** 이 노트는 Slack 발췌문과 GitHub README(1차 소스, 접근 가능)만으로 작성했다. Railway 배포 템플릿 페이지도 차단되어 배포 경로(Vercel vs Railway) 세부는 Slack 발췌에 의존했다.

## 내 생각 · 적용점

### 핵심 전이 1 — "오픈소스로 공개 = 벤더가 아니라 내가 데이터를 소유한다"

SignuDoc의 핵심 가치 제안은 기능이 아니라 **"내 계정에 배포해 운영한다"**는 배포 모델 자체다. 서명된 계약서·바우처 같은 법적 효력이 있는 문서를 제3자 SaaS 서버에 영구히 맡기는 대신, 직접 호스팅하면 데이터 소유권과 보존 정책을 스스로 통제할 수 있다. 이건 [[2026-11-12-atuin-threads-agent-session-search]]의 "세션 기록도 벤더가 아닌 내가 소유해야 포터블하다"와 같은 축이고, [[2026-11-05-openai-acquires-pierre-computer-company]]의 "빌려 쓰던 부품을 직접 소유로 바꾼다"는 소유권 전환 흐름과도 결이 같다 — **핵심 워크플로를 외부 SaaS에 통째로 위임할지, 오픈소스를 직접 운영해 소유권을 가져올지는 반복되는 선택지다.**

### 핵심 전이 2 — 버티컬 SaaS를 오픈소스가 정면으로 노리는 패턴

[[2026-09-07-incumbents-catching-up-vertical-ai-startups]]는 DocuSign·Salesforce 같은 기존 강자가 실행형 AI로 영역을 넓히는 쪽을 다뤘는데, SignuDoc은 정반대 방향에서 같은 DocuSign을 오픈소스로 직접 복제해 가격·소유권 경쟁을 건다. 버티컬 SaaS 시장은 "AI로 확장하는 기존 강자"와 "오픈소스로 대체하는 신흥 도전자" 양쪽에서 동시에 압박받는 구조다.

## 호스피탈리티 / CRS 적용 포인트

CRS/호텔 운영에서 전자서명이 필요한 지점(여행사 계약, 단체 예약 바우처, 직원 온보딩 서류)은 분명 존재한다. 다만 법적 효력이 걸린 문서에 자체 호스팅 오픈소스를 바로 도입하는 건 신중해야 한다 — PAdES 봉인·감사추적이 실제 법적 분쟁에서 DocuSign 수준의 증거력을 갖는지는 검증되지 않았다. **적용 가능성은 있음**: 사내 계약서·공급사 협약처럼 가벼운 서명 워크플로에 비용 절감 후보로 검토할 수 있지만, 고객 대면 법적 문서에는 아직 멀다.

## 연관 자료

- [[2026-09-07-incumbents-catching-up-vertical-ai-startups]] — *같은 DocuSign을 양쪽에서 압박하는 버티컬 SaaS 경쟁 구도*
- [[2026-11-12-atuin-threads-agent-session-search]] — *"벤더 아닌 내가 소유해야 포터블하다"는 같은 소유권 원칙*
- [[2026-11-05-openai-acquires-pierre-computer-company]] — *빌려 쓰던 부품을 직접 소유로 바꾸는 흐름*

## 한 달 뒤 회고

*(2026-12-21 즈음 — 사내 경비·공급사 계약 서명에 오픈소스 전자서명 도구 도입을 실제로 검토했는지, PAdES 봉인의 법적 증거력에 대한 추가 정보를 찾았는지 기록.)*
