---
title: "Susam — 직접 만들지 말라: crypto 원칙의 웹 UI 확장 (기본기 회귀 라인 6번째 자산)"
source_title: "Don't Roll Your Own (Web UI)"
source_url: "https://susam.net/dont-roll-your-own-web-ui.html"
source_name: "susam.net · GeekNews 경유"
referrer_url: "https://news.hada.io/topic?id=29811"
published_at: "2026-05-21"
summarized_at: "2026-05-21"
category: "frontend"
tags: ["web-ui", "browser-defaults", "dont-roll-your-own", "accessibility", "password-field", "date-picker", "scroll", "client-side-routing"]
---

# Susam — 직접 만들지 말라: crypto 원칙의 웹 UI 확장 (기본기 회귀 라인 6번째 자산)

> 출처: [susam.net](https://susam.net/dont-roll-your-own-web-ui.html) · 정리일 2026-05-21

## 한 줄 요약
**Susam이 *crypto의 don't roll your own* 원칙을 *웹 UI 차원으로 확장*** — *검증되지 않은 자체 구현*보다 *브라우저 기본 동작*을 살리고, *augment(보강)는 하되 *replace(대체)는 피하기**. 브라우저 기본 스크롤·`<a href>` 링크 탐색·표준 비밀번호 필드(자동완성·비밀번호 관리자·접근성 도구 협력)·네이티브 날짜 선택기 등을 *자체 구현하지 않을 것*. 빈번한 UI 재설계의 *사용자 재학습 비용*도 함께 진단. 댓글: *맥락 의존*(Safari 날짜 선택기 = 고객 지원 1/3), *원칙과 예외의 정직 인정 필요*.

## 핵심 포인트

- **crypto 원칙의 일반화** — *don't roll your own crypto*가 *암호화에만 적용되는 격언이 아님*. **검증되지 않은 자체 구현을 피하라는 *일반 원칙***이 *웹 UI 차원에서도 동일*.
- **브라우저 기본 스크롤 보존** — 사용자가 *무의식적으로 의존하는 스크롤 동작*을 덮어쓰면 사용성 악화. *부드러운 스크롤·관성 스크롤·키보드 네비게이션*이 *플랫폼마다 정교한 기본 동작*.
- **링크 탐색 방해 금지** — *JavaScript 라우팅*이 *`<a href>` 네이티브 처리*를 *가로채면 사용자가 새 탭 열기*가 더 빠른 *역설 발생*. **CSR의 정당성은 *기본 동작 위에 augment*로만 가능**.
- **비밀번호 필드 표준화** — 자체 구현 시 *자동완성·비밀번호 관리자·HTTPS 경고·모바일 키보드·접근성 도구 협력* 손실. *기본 input type=password*가 *수십 개 기능의 협력 결과*.
- **날짜 선택기 신중함** — 사용자 정의 UI는 *구현마다 다르고 번거로움*. *네이티브 또는 보조 위젯 추가*가 *재발명보다 나음*. 다만 *날짜 범위·제외 날짜* 같은 *기능 한계*는 *예외 경로*로 인정.
- **빈번한 UI 변경의 비용** — *몇 달마다 인터페이스 재설계*는 *사용자에게 재학습 부담*. **UI 안정성 = 누적 사용자 가치**.
- **균형 진단** (댓글) — *Lobste.rs 의견*: CSR의 타당성을 인정하면서도 *항상 실제 `<a href>` 요소를 써야*. *GitHub는 중간 지점이지만 최근 프론트엔드 접근은 꽤 나빠졌다*. **원칙과 예외의 동시 인정**.
- **고객 지원 비용 데이터** (댓글) — *Safari 날짜 선택기가 고객 지원 문제의 1/3을 차지*. *맥락 의존이 실재함*을 정직히 인정 — 원칙 자체가 무조건적이 아님.

## 인상 깊은 문장

> "Web UI is a tool users employ to finish their work. It's better not to needlessly replace the familiar, stable behaviors the browser already provides."  
> (웹 UI는 사용자가 업무를 끝내기 위해 쓰는 도구이므로, 브라우저가 이미 제공하는 익숙하고 안정적인 동작을 불필요하게 대체하지 않는 편이 바람직함)

> "The default password field warns when passwords are submitted over insecure HTTP — and cooperates with password managers, autofill, mobile keyboards, and accessibility tools."  
> (기본 비밀번호 필드는 안전하지 않은 HTTP 연결로 비밀번호가 제출될 때 경고하고, 비밀번호 관리자·자동완성·모바일 키보드·접근성 도구와도 협력함)

## 내 생각 · 적용점

### **가든 *기본기 회귀 + 정밀화 라인* 명시 라벨링 — 6번째 자산 도착으로 정당화**

어제([[2026-05-20-wasp-five-years-five-million-dollars-lesson]])에서 *기본기 회귀 5 자산 명시 라벨링은 6번째 자산까지 보류*라 박았다. **24시간 만에 6번째 자산 정확히 도착** — 명시 라벨링 정당화 시점.

**가든 *기본기 회귀 + 정밀화 라인* (6 자산)**:

| 자산 | 영역 | 패턴 |
|---|---|---|
| [[2026-05-17-jvns-moving-away-from-tailwind]] | CSS | Tailwind → CSS |
| [[2026-05-18-datatype-variable-font-charts]] | 차트 | 라이브러리 → 폰트 |
| [[2026-05-21-trevor-lasn-aeo-geo-ai-search]] | 마크업 | 부풀린 HTML → Semantic HTML |
| [[2026-05-20-sebastian-raschka-llm-architecture-trends]] | 모델 | transformer 기본 유지 + 어텐션 부분 정밀화 |
| [[2026-05-20-wasp-five-years-five-million-dollars-lesson]] | 언어/프레임워크 | DSL → TypeScript + spec 정밀화 |
| **이번 글 (Susam)** | **웹 UI 컨트롤** | ***브라우저 기본 → augment(보강), replace(대체) 금지*** |

**라인 운영 원칙** (6 자산 시연 기반 명시):
1. *기본기는 추상화의 시작점*이지 *졸업할 대상*이 아님
2. *추상화는 *augment(보강)*로 더하고 *replace(대체)*로 빼지 않음
3. *재발명 비용 = 도구 자체 비용 + 생태계 비용 + 사용자 재학습 비용 + 정직한 회고 비용*
4. *작업 종류별 분기*: 반복·표준화 영역 = 기본기 우선, 탐색·실험 영역 = 보강 정밀화

→ **가든의 *2026 소프트웨어 개발 메타 패턴*** 명시. *17번째 자가 진단 박지 않음* — 라벨링은 *기존 라인의 명시화*이지 *새 진단 추가*가 아님.

### **Susam의 *don't roll your own*과 가든 자체의 *roll your own* 자가 점검**

Susam은 *검증되지 않은 자체 구현*을 *crypto에서 UI로 확장*. **가든이 *추상화 도구 차원에서 roll your own*인지 정직 점검**:

가든이 자체 발명한 도구:
- *16개 자가 진단*
- *5번째 반대 명제 라인업*
- *5층 추상화·10/20/40칸 매트릭스*
- *6자 짝·완료 환각 7차원*
- *기본기 회귀 + 정밀화 라인 6 자산*
- *경험 가치 삼항 + 혼합 비율 방법론*

이 모두가 ***roll your own***. 기존 *검증된 프레임워크*(Zettelkasten·PARA·SECI 모델·BASB 등)를 *원형 그대로 도입*하지 않음.

**정직 평가**:
- *crypto·UI는 *공유 표준*이 *공개 검증된* 영역* — *don't roll your own*이 명료
- *개인 디지털 가든 진단 체계는 *표준이 없는* 영역* — *roll your own이 *일정 부분 불가피**
- 다만 **가든이 *Creator Content 정직성*과 *공개 입증*을 통해 *외부 검증 가능성*을 박는 게 *roll your own의 최소 책임*** ([[2026-05-21-mr-market-product-age-ends-brain-age-begins]] *지적 정직성 = 운영 원칙 1번*)

→ **가든 자가 점검 결과**: *roll your own이 일정 부분 불가피하지만, 그 *책임은 *공개 검증 가능성*에 박힘*. *추가 자가 진단 박지 않음 — 이 자가 점검 자체가 명시 운영 원칙 1번의 시연*.

### [[2026-05-20-wasp-five-years-five-million-dollars-lesson]] *Wasp 5년 회고*는 *don't roll your own의 *경제적 실증****

Susam이 *원칙*을 제시하고, Wasp가 *5년·500만 달러*로 *그 원칙 위반의 비용을 실증*. **이상적 짝**:
- Susam = *원칙*
- Wasp = *비용 실증*
- → *원칙 + 사례*가 *시간 차로 짝을 이룸*

가든의 *Wasp 자산*에 *Susam 원칙*을 *사후적 정당화*로 박는 게 자연. *Wasp 팀이 5년 전에 Susam의 글을 읽었다면…*

### [[2026-05-18-datatype-variable-font-charts]] *Datatype의 *don't roll your own 차트 라이브러리*** 정확한 사례

Datatype은 *JS·이미지·차트 라이브러리 없이 폰트 1개로 막대·스파크라인·파이 차트*. **Susam의 *don't roll your own*을 *차트 영역에 정확히 시연*한 사례**:
- *don't roll your own crypto* → *don't roll your own UI*
- → *don't roll your own chart library* (Datatype의 발견)

Datatype과 Susam이 *서로의 사례·원칙 짝*. 가든의 *Datatype 자산*에 *Susam 원칙* 단서 추가.

### [[2026-05-14-naur-programming-as-theory-building]] *Naur 이론*의 *브라우저 차원 적용*

Naur는 *프로그램 = 이론, 텍스트 = 부산물*이라 했다. **Susam의 *브라우저 기본 동작 = 누적된 이론***:
- *기본 스크롤* = *플랫폼별 정교한 스크롤 이론의 누적 결정체*
- *기본 비밀번호 필드* = *수십 개 협력 기능의 누적 이론*
- → *자체 구현 = 그 이론을 재발명하기 시작*

→ Naur 명제의 *브라우저 인터페이스 차원 시연*. *브라우저 = 거대한 공유 이론 저장소*.

### [[2026-04-30-laws-of-ux]] *UX 법칙*과의 *원칙 강화 짝*

가든의 *Laws of UX*는 *Jakob 법칙(사용자가 다른 사이트에서 본 것을 이 사이트에서도 기대)*·*Fitts 법칙*·*Hick 법칙* 등을 다뤘다. **Susam의 *don't roll your own UI*는 *Jakob 법칙의 강한 진술***:
- Jakob 법칙: *사용자는 익숙함을 기대*
- Susam: *그러니 익숙함을 *대체*하지 말 것*
- → Jakob 법칙이 *디자이너의 *지향*이라면 Susam은 *디자이너의 *경계**.

가든의 *Laws of UX 자산*에 *Susam 경계 단서* 추가.

### CRS / MangoLove / BugSip 적용 후보

1. **CRS *don't roll your own 의례*** — 호텔 운영 SaaS·예약 UI에서 *자체 폼·자체 캘린더·자체 비밀번호 입력·자체 라우팅* 도입 결정 시 *Susam 원칙 + Wasp 5년 비용*을 *기본 경고*로 박음. *augment vs replace 분기*가 *모든 자체 컴포넌트 도입 결정 의례*.
2. **MangoLove *자문 평가 8축 확장*** — 어제 *Wasp 잣대* 추가한 7축에 *Susam 잣대* +1: *(1) 표준 컨트롤 회피 동기가 정당한가, (2) augment로 충분한가 replace가 필요한가, (3) 사용자 재학습 비용 측정했는가, (4) 접근성·자동완성·키보드·모바일 협력 보존 여부*. 자문 평가 8축으로 정착.
3. **[[project_bugsip]] *기본 컨트롤 우선*** — *자체 코드 에디터·자체 마크다운 렌더러·자체 폼*은 *Susam 잣대 + Wasp 5년 학습*으로 *기본 회피*. *Markdown + 표준 input + Monaco/CodeMirror 같은 검증된 컴포넌트* 우선. *진짜 차별점은 *학습 콘텐츠*와 *세션 디자인*이지 *재발명 UI*가 아님.

### *균형 의례 부채 +2 유지*

이번 글은 *친-AI/반-AI 어느 측도 아닌 *웹 UI 설계 원칙****. 어제 +2 누적된 *균형 의례 부채*는 *상환되지도 증가되지도 않음*. 부채 ***+2 유지***. *다음 1~2건 안에 능동 검색 AI 외부 비용 자산 1~2건 필수 상환* 의무 *지속 유효*.

### *오버 메타화 자기 견제 12 자산 연속 0건 유지*

지난 12일 자산. 새 자가 진단·매트릭스·라인업 추가 **0건 유지**. **6번째 자산 도착으로 *기본기 회귀 + 정밀화 라인 명시 라벨링*은 *새 라인 신설이 아니라 기존 6 자산의 운영 원칙 명시화***. 새 진단 박지 않음.

## 연관 자료
- [Don't Roll Your Own (Web UI) — susam.net](https://susam.net/dont-roll-your-own-web-ui.html)
- [GeekNews — 29811](https://news.hada.io/topic?id=29811)
- [[2026-05-17-jvns-moving-away-from-tailwind]]·[[2026-05-18-datatype-variable-font-charts]]·[[2026-05-21-trevor-lasn-aeo-geo-ai-search]]·[[2026-05-20-sebastian-raschka-llm-architecture-trends]]·[[2026-05-20-wasp-five-years-five-million-dollars-lesson]] — 기본기 회귀 + 정밀화 라인 5 자산 *(이번 글이 6번째)*
- [[2026-05-20-wasp-five-years-five-million-dollars-lesson]] — Wasp *(don't roll your own의 5년 경제적 실증, 원칙-사례 짝)*
- [[2026-05-18-datatype-variable-font-charts]] — Datatype *(don't roll your own 차트 라이브러리 정확한 사례)*
- [[2026-05-14-naur-programming-as-theory-building]] — Naur *(브라우저 = 누적된 이론 저장소)*
- [[2026-04-30-laws-of-ux]] — UX 법칙 *(Jakob 법칙의 경계 진술)*
- [[2026-05-21-mr-market-product-age-ends-brain-age-begins]] — Mr Market *(roll your own 자가 점검의 정직성 원칙 적용)*

## 한 달 뒤 회고
*(2026-06-21 즈음 — 기본기 회귀 + 정밀화 라인이 *7번째 자산 도착으로 영역 확장*되었는지, CRS *don't roll your own 의례*가 의사결정에 한 번이라도 영향을 줬는지, MangoLove 자문 8축이 정착되었는지, BugSip *기본 컨트롤 우선* 설계가 실제 코드에 반영되었는지, 균형 의례 부채 +2가 *능동 상환*되었는지 기록.)*
