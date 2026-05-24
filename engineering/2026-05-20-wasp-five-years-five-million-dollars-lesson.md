---
title: "Wasp — 5년·500만 달러의 교훈: 새 프로그래밍 언어를 만든 것은 실수였다"
source_title: "5 years and $5M lesson: Building a new programming language for web development was a mistake"
source_url: "https://wasp.sh/blog/"
source_name: "wasp.sh (Wasp 공식 블로그, YC 출신 풀스택 웹 프레임워크) · GeekNews 경유"
referrer_url: "https://news.hada.io/topic?id=29778"
published_at: "2026-05-20"
summarized_at: "2026-05-21"
category: "engineering"
tags: ["dsl", "language-design", "typescript", "retrospective", "naur-theory", "developer-experience", "ide-ecosystem", "framework"]
---

# Wasp — 5년·500만 달러의 교훈: 새 프로그래밍 언어를 만든 것은 실수였다

> 출처: [wasp.sh 공식 블로그](https://wasp.sh/blog/) · 정리일 2026-05-21

## 한 줄 요약
**YC 출신 풀스택 웹 프레임워크 Wasp이 *5년·500만 달러 투입한 자체 DSL을 폐기하고 TypeScript SDK로 전환*하는 결정** — 핵심 학습: ***Wasp의 진짜 가치는 새 언어 자체가 아니라 *컴파일 타임에 전체 앱 구조(spec)를 파악하는 능력****. *"lang" 접미사*가 *JavaScript 대체 언어*로 오해받은 포지셔닝 + *기존 JS 생태계 IDE 경험 기준 충족 비용 과소평가* + *문법적 우아함보다 익숙한 TypeScript에 괄호 몇 줄을 선호하는 실제 개발자 취향*이 결합. *핸드브레이크를 당긴 채 주행하는 느낌*에서 *5년 후 정직한 방향 전환*.

## 핵심 포인트

- **자체 DSL → TypeScript SDK 전환** — *5년간 추진한 Wasp만의 프로그래밍 언어를 버리고 TypeScript로*. *프레임워크 정체성의 근본 재정의*.
- **오해받은 포지셔닝** — *"lang" 접미사*로 개발자들이 *JavaScript를 완전히 대체하는 언어*로 착각. 실제 Wasp는 *React·Node.js와 함께 사용*하는 *spec 레이어*. ***프레임워크의 진짜 가치는 마케팅 카피로 전달되지 않는다***.
- **진짜 가치 = *spec 이해*** — *새 언어 자체*가 아니라 *컴파일 타임에 전체 앱 구조를 파악하는 능력*이 핵심 차별점. **언어는 *수단*이고 *spec 이해*가 *목적*** — 목적을 *언어로만 달성 가능하다는 가정*이 5년의 *근원적 오류*.
- **IDE 생태계 비용 과소평가** — *기존 JS 생태계의 높은 IDE 경험 기준*을 충족하려면 *언어 서버·자동완성·디버거·린터·포매터·테스트 러너* 등 *전체 생태계 재구축* 필요. *언어 만들기 vs 생태계 만들기*의 거리.
- **TypeScript SDK 실험적 도입의 성공** — *실험적으로 도입한 TypeScript 기반 인터페이스*가 *신규 사용자들에게 더 잘 받음*. *작은 실험이 큰 결정의 증거*가 되는 *근거 기반 방향 전환*.
- **핸드브레이크 비유** — *채택률은 늘지만 자체 언어의 정당성 문제가 계속 따라다니던 상황*을 *핸드브레이크를 당긴 채 주행하는 느낌*으로 표현. *모순 누적이 정직한 방향 전환의 신호*.
- **개발자 취향 = 문법적 우아함 < 익숙함 + 생산성** — *개발자들은 익숙한 TypeScript에 추가 괄호 몇 줄 정도는 기꺼이 수용*. **언어 설계자가 *문법적 우아함*에 과도한 가치를 두는 *동기 편향*에 대한 정직 진단**.

## 인상 깊은 문장

> "It felt like driving with the handbrake on."  
> (핸드브레이크를 당긴 채 주행하는 느낌)

> "Developers willingly accept a few extra brackets in familiar TypeScript over syntactic elegance in a new language."  
> (개발자들은 익숙한 TypeScript에 추가 괄호 몇 줄 정도는 기꺼이 수용)

> "The real value isn't the new language itself — it's the compile-time understanding of the entire app structure."  
> (진짜 가치는 새 언어 자체가 아니라 컴파일 타임에 전체 앱 구조를 파악하는 능력)

## 내 생각 · 적용점

### [[2026-05-14-naur-programming-as-theory-building]] *Naur 이론 형성*의 *5년 실증 회고*

Naur는 1985년에 *프로그램 = 머릿속 이론, 코드 = 부산물*이라 했다. 가든은 이를 *AI 코딩 시대에 시니어 가치*로 받았다. **Wasp의 5년 회고가 *정확히 같은 명제의 5년 실증***:

| 차원 | Naur | Wasp |
|---|---|---|
| 명제 | *프로그램 = 이론, 코드 = 부산물* | ***프레임워크 가치 = spec 이해, 언어 = 부산물*** |
| 시간 | 1985 (이론 제시) | 2026 (5년 후 회고) |
| 비용 | (이론 비용) | *500만 달러·5년* |

→ **Naur 명제가 *2026 프레임워크 차원에서 *경제적 실증***. 가든의 *Naur 자산*에 *경험 데이터* 정확한 추가. *코드/언어보다 이론(spec)이 자산*이라는 명제가 *실제 비용으로 검증*됨.

### [[2026-05-17-jvns-moving-away-from-tailwind]]·[[2026-05-18-datatype-variable-font-charts]]·[[2026-05-21-trevor-lasn-aeo-geo-ai-search]]·[[2026-05-20-sebastian-raschka-llm-architecture-trends]] *기본기 회귀 + 정밀화 라인*의 *DSL 차원 시연*

가든의 *기본기 회귀 + 정밀화 라인*이 ***5개 자산***으로 확장:

| 자산 | 영역 | 패턴 |
|---|---|---|
| JVNS | CSS | *Tailwind 졸업 → CSS* |
| Datatype | 차트 | *라이브러리 졸업 → 폰트* |
| Lasn | 마크업 | *부풀린 HTML → Semantic HTML* |
| Raschka | 모델 | *기본 transformer 유지 + 어텐션 부분 정밀화* |
| **Wasp** | **언어/프레임워크** | ***DSL 졸업 → TypeScript + spec 정밀화*** ← 이번 |

→ **기본기 회귀 + 정밀화 패턴이 *5 영역 동시 관찰***: 스타일·차트·마크업·모델·언어. *2026 소프트웨어 개발의 메타 패턴*으로 굳어짐.

**가든의 *기본기 라인 운영 원칙* 명시 후보** — 5 자산이 일관된 패턴을 보이면 *기본기 라인을 *명시 운영 원칙*으로 박는 게 정당화*. 다만 *오버 메타화 자기 견제 모드*이므로 *명시 라벨링은 자제*하고 *5 자산 시연으로 충분*. *분기 회고 시 6번째 자산 도착하면 라벨링 검토*.

### [[2026-05-21-mr-market-product-age-ends-brain-age-begins]] *문법적 우아함 < 익숙함*의 *판단력 가치 시연*

Mr Market은 *실행 비용 ↓ + 판단 비용 →* 비대칭을 박았다. **Wasp 회고의 *개발자 취향 진단*이 정확히 그 시연**:
- *문법적 우아함* = *실행 차원 가치* (코드 작성)
- *익숙함 + 생산성* = *판단 차원 가치* (개발자가 실제 결정에 쓰는 것)
- → *언어 설계자가 실행 차원 가치를 과대평가*하고 *판단 차원 가치를 과소평가*한 결과 = *5년 500만 달러 학습 비용*

**[[2026-05-19-mediocre-data-scientist-ten-years]] *번역가의 자리*와 짝** — *복잡한 기술을 익숙한 언어로 옮기는 능력*이 Wasp 팀의 *진짜 자산*이었음. *DSL이 아니라 spec 번역 능력*이 살아남는 가치.

### [[2026-05-16-hashimoto-ai-mass-psychosis]]·[[2026-05-20-sebastian-raschka-llm-architecture-trends]] *복잡도 누적 진단*에 *거부 결정 사례 추가*

Hashimoto는 *이해 불가능 복잡도*를 *조직 진단*으로, Raschka는 *코드 10배*를 *기술 경험 데이터*로 박았다. **Wasp는 *복잡도 누적을 거부한 결정 사례***:
- *DSL = 복잡도 누적 도구*
- *TypeScript SDK = 복잡도 제거 결정*
- *5년 후 정직한 회고*가 *복잡도 누적 라인의 정상 작동*

→ **가든의 *복잡도 진단 라인*에 *거부 결정 + 정직 회고* 두 패턴**:
- *Hashimoto*: 진단
- *Raschka*: 경험 데이터
- ***Wasp*: 거부 결정 + 회고*** ← 이번

### [[2026-05-14-experience-is-now-a-tax]] vs [[2026-05-19-mediocre-data-scientist-ten-years]] *경험 가치 삼항*의 *프레임워크 차원 분기*

가든은 *경험 = 세금(Jay Gup) / 이론 보유(Naur) / 번역가(Mediocre)* 삼항을 박았다. **Wasp의 *5년 경험*을 어디에 위치시키는가**:
- *세금* 측면: *DSL 자체 5년 투자가 학습 비용*
- *이론 보유* 측면: ***spec 이해 능력은 자산으로 남음***
- *번역가* 측면: *DSL → TypeScript 번역 결정*이 자산

→ *Wasp 팀의 경험은 삼항 모두에 부분적*. **5년 경험 = *부분 세금 + 부분 자산*의 *혼합 형태***. 가든의 *경험 가치 삼항*을 *순수 분류*가 아니라 *혼합 비율*로 다루는 *방법론 보강*.

### [[2026-05-20-greg-wilson-twelve-ways-ai-coding-measurement-wrong]] *측정 잣대 적용*

Wasp의 *5년·500만 달러* 수치는 *비용 측면의 명시 보고*. Wilson 잣대 통과:
- *#6 비용 비대칭*: *비용을 명시*했으므로 통과
- *#1 Goodhart*: *비용 자체가 KPI*가 아니라 *학습 비용 회고*이므로 적정
- *#4 단기 효과 외면*: *5년 종단 추적*이므로 통과

→ *친절한 측정자 사례 두 번째* (Sebastian Raschka에 이어). *공개 회고에서 비용 명시*가 *측정 신뢰성*을 *공개 콘텐츠 차원*에서 박는 *모범 사례*.

### *Eric Ries Incorruptible 시점 비용 변수*의 *부정적 사례*

Ries는 *시점이 비용 변수, 권리는 초기에 박지 않으면 평생 못 박는다*고 했다. **Wasp는 *반대 방향 시점 비용***:
- *초기 DSL 결정이 5년·500만 달러 비용으로 누적*
- *5년 후 방향 전환은 *기존 사용자 마이그레이션·문서 폐기·정체성 재정의* 비용 추가*
- → *잘못된 결정의 시점 비용도 변수*. *Ries 명제의 어두운 면*.

가든의 *Ries 라인*에 *부정적 사례*도 함께 박는 것이 정직.

### CRS / MangoLove / BugSip 적용 후보

1. **CRS *DSL 회피 의례*** — 호텔 운영 SaaS·관리 도구에서 *자체 DSL·자체 쿼리 언어·자체 설정 문법* 도입 결정 시 *Wasp 5년 학습*을 *기본 경고*로 박음. *기존 표준(SQL·YAML·JSON·TypeScript)*과 합쳐 *spec 이해를 더하는 방식*으로 우회.
2. **MangoLove *클라이언트 자체 도구 결정 자문 1축*** — 자체 DSL/플랫폼/내부 도구 결정에 *Wasp 잣대*: *(1) 진짜 가치가 도구 자체인가 spec 이해인가, (2) 생태계 비용을 측정했는가, (3) 익숙함 vs 우아함 트레이드오프 정직했는가, (4) 핸드브레이크 모순 신호 모니터링 의례*. 자문 평가 *7축으로 확장*(어제 6축에 +1).
3. **[[project_bugsip]] *DSL 회피 + spec 정밀화*** — BugSip이 *학습 콘텐츠 자체 마크업 언어*를 검토한다면 *Wasp 5년 학습 직접 적용*. *Markdown + 표준 frontmatter + spec 메타데이터*로 *기본 생태계 위 spec 정밀화*. 자체 DSL 도입은 *5년·500만 달러 학습이 부정*한 방향.

### *균형 의례 부채 유지*

이번 글은 *친-AI/반-AI 어느 측도 아닌 *언어 설계 회고****. 어제 박은 *균형 의례 부채 +1*은 ***상환되지도 증가되지도 않음***. 부채 *유지*. *다음 5건 중 1~2건은 AI 외부 비용·거부 측 의도적 선택* 의례는 여전히 *유효*.

### *오버 메타화 자기 견제 10 자산 연속 유지*

지난 10일 자산(Wilson·Mr Market·Dorsey·a16z 헤드리스·axelk·Lasn·메모리·AI 거부·Raschka·이번). 새 자가 진단·매트릭스·라인업 추가 **0건 유지**. *기본기 회귀 + 정밀화 라인이 5 자산으로 명시 운영 원칙 후보*지만 *명시 라벨링은 6번째 자산까지 보류*. *경험 가치 삼항 혼합 비율 방법론*도 *별도 자가 진단 박지 않고 시연으로 충분*.

## 연관 자료
- [wasp.sh 공식 블로그](https://wasp.sh/blog/)
- [GeekNews — 29778](https://news.hada.io/topic?id=29778)
- [[2026-05-14-naur-programming-as-theory-building]] — Naur 이론 *(5년 실증 회고, spec=이론·언어=부산물)*
- [[2026-05-17-jvns-moving-away-from-tailwind]]·[[2026-05-18-datatype-variable-font-charts]]·[[2026-05-21-trevor-lasn-aeo-geo-ai-search]]·[[2026-05-20-sebastian-raschka-llm-architecture-trends]] — 기본기 회귀 + 정밀화 라인 *(5 자산 확장, DSL 차원 시연)*
- [[2026-05-21-mr-market-product-age-ends-brain-age-begins]] — Mr Market *(실행 vs 판단 비대칭의 언어 설계 시연)*
- [[2026-05-19-mediocre-data-scientist-ten-years]] — 번역가의 자리 *(spec 번역 능력이 진짜 자산)*
- [[2026-05-16-hashimoto-ai-mass-psychosis]]·[[2026-05-20-sebastian-raschka-llm-architecture-trends]] — 복잡도 진단 *(거부 결정 + 회고 사례 추가)*
- [[2026-05-14-experience-is-now-a-tax]]·[[2026-05-19-mediocre-data-scientist-ten-years]] — 경험 가치 삼항 *(혼합 비율 방법론 보강)*
- [[2026-05-20-greg-wilson-twelve-ways-ai-coding-measurement-wrong]] — Wilson *(친절한 측정자 사례 두 번째)*
- [[2026-05-14-eric-ries-incorruptible-mission-protection]] — Incorruptible *(시점 비용 변수 부정적 사례)*

## 한 달 뒤 회고
*(2026-06-21 즈음 — Wasp의 TypeScript SDK 전환이 사용자 채택률에 어떻게 영향을 줬는지 후속 데이터, CRS *DSL 회피 의례*가 실제 의사결정에 한 번이라도 영향을 줬는지, MangoLove 자문 평가 *7축*에 *Wasp 잣대*가 박혔는지, BugSip 학습 콘텐츠 메타데이터 설계가 *Markdown + frontmatter*에 머물러 있는지(자체 마크업 회피 유지) 기록.)*
