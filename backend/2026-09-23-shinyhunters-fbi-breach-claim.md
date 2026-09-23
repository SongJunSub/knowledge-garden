---
title: "\"우리가 FBI를 해킹했다\", 해커 그룹 ShinyHunters의 전체 직원 정보 탈취 주장"
source_title: "'We Hacked the FBI': ShinyHunters Hands Over 5,000 Employee Records to Back Up Stunning Breach Claim"
source_url: "https://redstate.com/ben-smith/2026/09/22/hackers-claim-massive-fbi-breach-provide-sample-of-5000-employee-records-n2207243"
source_name: "RedState/복수 매체(404 Media 등), GeekNews(id=34143) 경유"
referrer_url: "https://news.hada.io/topic?id=34143"
published_at: "2026-09-22"
summarized_at: "2026-09-23"
category: "backend"
tags: ["shinyhunters", "fbi", "data-breach", "security", "peoplesoft"]
---

# "우리가 FBI를 해킹했다", 해커 그룹이 FBI 전체 직원의 정보 탈취 주장

> 출처: ["우리가 FBI를 해킹했다", 해커 그룹의 FBI 전체 직원 정보 탈취 주장](https://news.hada.io/topic?id=34143) (복수 매체, GeekNews 경유) · 정리일 2026-09-23
>
> **출처 한계**: `news.hada.io` egress 차단으로 원문 직접 열람 불가. GeekNews 발췌(3개 불릿)와 WebSearch(Washington Times, Axios, Nextgov/FCW, CNBC, RedState) 교차확인으로 재구성했다. 해커 그룹의 일방적 주장이 포함돼 있어 사실 확정 여부에 각별히 유의해야 한다.

## 한 줄 요약

**해킹 그룹 ShinyHunters가 FBI 관련 여러 서비스에 침입해 전체 직원·지원자의 이름·주소·전화번호·배우자 정보를 탈취했다고 주장하며 직원 5,000명 규모의 샘플을 공개했고, 일부 이름·전화번호가 실제와 일치하는 것으로 확인됐지만 전체 유출 범위와 정보의 진위는 아직 확인되지 않았다.**

## 핵심 포인트

- **모든 FBI 직원·지원자 정보 탈취 주장 + 5,000명 샘플 공개** — ShinyHunters가 여러 FBI 관련 서비스에 침입해 ***모든 직원과 지원자의 데이터***를 훔쳤다고 주장하며, 이름·집 주소·전화번호·배우자 정보가 포함된 ***직원 5,000명 규모의 샘플***을 공개했다.
- **일부 정보는 미 법무부 인력과 일치 확인, 전체 범위는 미확인** — 404 Media가 확보한 샘플에서 ***일부 이름과 전화번호가 일치***하고 미 법무부 인력과의 연관도 확인됐지만, ***전체 유출 범위와 정보의 진위는 확인되지 않았다*** — Reuters도 최소 9건에서 일치를 확인했으나 데이터 출처는 확정하지 못했다.
- **FBI 채용 웹사이트가 변조됨, 지원 포털 이용 불가 상태였음** — ***FBI 채용 웹사이트가 변조***됐으며, 기사 작성 시점에 지원 사이트와 특별요원 지원자 포털은 이용 불가 상태였다. FBI는 ***무단 활동 관련 주장을 인지하고 조사 중***이라고 밝혔다.
- **동기는 5월 FBI 경고문에 대한 보복, 수단은 PeopleSoft 제로데이** — WebSearch 확인으로는 ShinyHunters가 2026년 5월 FBI가 자신들의 수법을 상세히 설명하며 "몸값을 지불하지 말라"고 경고한 것에 대한 보복이라 주장했으며, Oracle PeopleSoft 플랫폼의 제로데이를 이용해 채용 페이지를 장악·변조했다고 밝혔다. 탈취 규모는 2~3테라바이트로 주장된다.

## 인상 깊은 문장

> "FBI는 무단 활동 관련 주장을 인지하고 있으며 현재 조사 중이라고 밝혔다."
> (WebSearch 교차확인, Axios/CNBC 보도 공통 내용)

## 댓글

**확인 불가.** hada 댓글 수를 확인하지 못했다(원문 egress 차단). ***이 사안은 해커 그룹의 일방적 주장이 상당 부분을 차지한다*** — "전체 직원 정보 탈취"는 주장이며, 제3자(Reuters, 404 Media)가 확인한 것은 "샘플 데이터 일부의 일치"까지다. 2~3테라바이트, "전체 직원" 같은 규모 수치는 해커 측 주장 그대로이므로 과장 가능성을 열어두고 읽어야 한다.

## 내 생각 · 적용점

### 핵심 전이 — 가든의 국내 데이터 유출 시리즈와 짝을 이루는 해외·정부기관 사례

가든에는 [[2026-09-07-tving-3954-account-data-breach]], [[2026-09-08-gangnamunni-220k-data-breach]], [[2026-09-10-gangnamunni-breach-followup-compensation]] 같은 국내 기업 데이터 유출 계열 기록이 있다. 이 사건은 대상이 정부기관(FBI)이라는 점에서 다르지만, 공통된 패턴이 있다 — ***"공식 확인 전 해커의 일방적 주장 → 부분 검증 → 조사 착수"***라는 유출 사건의 전형적 전개 단계다. [[2026-05-09-ai-breaking-vulnerability-cultures]]가 짚었던 "9시간 패치 윈도우 시대"의 연장선에서, 보복성 해킹(경고문에 대한 대응)이라는 동기 자체도 눈여겨볼 대목이다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 멀지만(정부기관 인사 시스템과 CRS는 다른 도메인), 두 가지 전이 가능한 경고가 있다. 첫째, PeopleSoft 같은 레거시 ERP/HR 플랫폼의 제로데이가 실제 침해 경로로 쓰였다는 점 — CRS가 연동하는 레거시 백오피스 시스템(HR, 회계)의 패치 상태를 재점검할 계기로 삼을 수 있다. 둘째, "우리 수법을 공개하고 경고했다"는 조치가 오히려 보복성 공격의 표적이 됐다는 점 — 보안 공지·경고문 발행 시 상대를 자극할 수 있다는 점도 고려 대상이다.

## 연관 자료

- [[2026-09-07-tving-3954-account-data-breach]], [[2026-09-08-gangnamunni-220k-data-breach]], [[2026-09-10-gangnamunni-breach-followup-compensation]] — 국내 데이터 유출 시리즈
- [[2026-05-09-ai-breaking-vulnerability-cultures]] — 취약점 공개 문화, 패치 윈도우 논의

## 한 달 뒤 회고

*(2026-10-23 즈음 — FBI 조사 결과, 유출 범위 확정 여부, ShinyHunters 관련 후속 기소·대응 확인.)*
