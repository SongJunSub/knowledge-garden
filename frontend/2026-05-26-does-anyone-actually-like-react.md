---
title: "React를 좋아하는 사람이 실제로 있긴 한가요? — 기본기 회귀 라인 7번째 자산 (프레임워크 영역)"
source_title: "Does anyone actually like React?"
source_url: "https://jsx.lol/"
source_name: "jsx.lol · GeekNews 경유"
referrer_url: "https://news.hada.io/topic?id=29900"
published_at: "2026-05-26"
summarized_at: "2026-05-26"
category: "frontend"
tags: ["react-criticism", "framework-fatigue", "vendor-lock-in", "vercel-nextjs", "hydration", "cve-2025-55182", "framework-flight", "fundamentals-return-line"]
---

# React를 좋아하는 사람이 실제로 있긴 한가요? — 기본기 회귀 라인 7번째 자산 (프레임워크 영역)

> 출처: jsx.lol (GeekNews 경유) · 정리일 2026-05-26

## 한 줄 요약
**React 비판 — *JS 중심 = 광고보다 느림* + *useEffect/useMemo API 복잡·논쟁 지속* + *하이드레이션 비효율 (서버·클라이언트 동일 JS 반복)* + *CVE-2025-55182 (CVSS 10.0 인증 없는 RCE)* + *Next.js = Vercel 락인* + *마지막 React 릴리스 후 1.5년 (이전 최장)* + *시니어 이탈로 생태계 품질 위기* + *관성의 승리 (네트워크 효과)*. 결론: *React는 거의 항상 잘못된 해법, 모든 것을 못으로 보이게 만드는 망치*.**

## 핵심 포인트

- **성능 = *광고보다 느림*** — JS 중심 프로젝트가 *시간 지날수록 악화*. **[[2026-05-21-susam-dont-roll-your-own-web-ui]] *브라우저 기본 동작 보존* 원칙 위배 직접 결과**.
- **복잡 API = useEffect/useMemo** — *개념 혼란 + 올바른 사용법 논쟁 지속*. **[[2026-05-25-claude-is-not-your-architect]] *맥락 부재 = 일반 모범 사례만*의 *프레임워크 차원 시연*** — *Vue·Svelte는 자동 최적화, React는 수동 판단* (댓글). **[[2026-05-16-hashimoto-ai-mass-psychosis]] *이해 불가능 복잡도*의 프론트엔드 차원**.
- **하이드레이션 비효율** — *서버·클라이언트 동일 JS 연산 반복*. *구조적 한계*.
- **CVE-2025-55182 CVSS 10.0 RCE** — *인증 없는 원격 코드 실행*. *최대 심각도*. **[[2026-05-21-axelk-ai-is-plagiarism-at-scale]] *비용 사회화* 명제의 *보안 차원 시연*** — 보안 비용을 *전체 React 사용 기업이 부담*.
- **Vercel = Next.js 벤더 락인** — *오픈소스 표방하며 사실상 Vercel 의존성 강화*. **[[2026-05-21-axelk-ai-is-plagiarism-at-scale]] *통제권 회복 라인*의 직접 사례** + **[[2026-05-14-eric-ries-incorruptible-mission-protection]] *Ries 미션 부식 + 시점 비용 변수*의 오픈소스 프로젝트 차원 변형**.
- **관성의 승리** — *기술 적합성보다 네트워크 효과*가 선택 결정. **[[2026-05-24-barnum-art-of-money-getting]] Barnum *재능·도구 일치보다 *모두가 쓰니까*가 결정 변수가 된 함정 = 1880년 원칙 위반***.
- **시니어 이탈** — *경험 많은 엔지니어가 복잡도에 지쳐 다른 스택으로 이직*. **[[2026-05-24-aws-four-years-and-out]] *AWS 4년 퇴사 패턴의 *프론트엔드 영역 변형*** — *5번째 라인업 노동·조직 부식 차원의 *프레임워크 영역 사례***.
- **릴리스 중단** — *마지막 React 릴리스 1.5년 경과·이전 어떤 주기보다 장기간*. *거버넌스 부실 신호*.
- **댓글 *Vue/Svelte 대안*** — *프레임워크가 자동 최적화*. **[[2026-05-17-jvns-moving-away-from-tailwind]] *Tailwind 졸업의 프레임워크 차원 짝*** — *기본기 회귀 라인의 *대안 라우팅* 시연*.

## 인상 깊은 문장

> "React is almost always the wrong solution — a hammer that makes everything look like a nail."  
> (React는 거의 항상 잘못된 해법이며, 모든 것을 못으로 보이게 만드는 망치가 되어버렸음)

> *(댓글 bichi)* "React is just a religion — borderline cult."  
> (리엑트는 그냥 신앙이에요 (사이비))

## 내 생각 · 적용점

### **기본기 회귀 + 정밀화 라인 *7번째 자산 도착* — 프레임워크 영역 추가**

가든의 *기본기 회귀 + 정밀화 라인*은 어제까지 *6 자산 = 5 영역* (어제 Susam에서 6번째 자산 명시 라벨링 완성). **이번 글이 7번째 자산 = 6번째 영역 = *프레임워크*** 추가:

| 자산 | 영역 | 패턴 |
|---|---|---|
| JVNS | CSS | Tailwind → CSS |
| Datatype | 차트 | 라이브러리 → 폰트 |
| Lasn | 마크업 | 부풀린 HTML → Semantic HTML |
| Raschka | 모델 | transformer 기본 유지 + 정밀화 |
| Wasp | 언어 | DSL → TypeScript + spec |
| Susam | 웹 UI 컨트롤 | 브라우저 기본 → augment |
| **이번 글 (jsx.lol)** | ***프레임워크*** | ***React → Vue/Svelte 또는 vanilla, 자동 최적화·기본기 회귀*** |

→ ***6 영역으로 확장*** (스타일·차트·마크업·모델·언어·UI 컨트롤·프레임워크). 라인이 *프론트엔드 풀스택 메타 패턴*으로 굳어짐.

**라인 운영 원칙 갱신** (Susam 6 자산 명시 라벨링에서 박은 4 원칙에 1 추가):
- 1~4 (기존): 기본기는 시작점 / augment 더하기·replace 빼지 않음 / 재발명 비용 4축 / 작업 종류별 분기
- ***5 (이번 추가): 네트워크 효과·관성으로 *기본기 위배 도구가 표준화*되면 *능동 졸업 의례* 박기*** (Barnum 1880 원칙: *모두가 쓰니까는 결정 변수 아님*)

### *5번째 라인업 axelk 측 *노동·조직 부식 차원의 프레임워크 영역 시연***

이 글의 *시니어 이탈 → 다른 스택 이직*은 **[[2026-05-24-aws-four-years-and-out]]·[[2026-05-25-claude-is-not-your-architect]] *5번째 차원 노동·조직 부식*의 *프론트엔드 영역 변형***:
- AWS = *전사 차원 우수 인력 이탈*
- Claude 아키텍트 = *판단력 격하 메커니즘*
- ***React 비판 = *프레임워크 차원 시니어 이탈 + 거버넌스 부실***

5번째 차원 자산이 *3 → 4번째 자산 후보*. 다만 *기본기 회귀 라인이 *주 분류*, 5번째 차원은 *부수 분류*. *명시 4번째 자산 추가는 *기본기 회귀 라인 분류 우선*으로 보류*.

### **균형 의례 부채 *0 유지*** — 기본기 회귀 라인은 친·반 카운팅 아님

- 어제 (Uber COO) 부채 0 (완전 상환 후)
- 이 글 *기본기 회귀 라인 자산* — *친-AI / 반-AI 어느 측도 아님*
- 부채 *0 유지*
- 비율: 25:14 ≈ 1.79:1 (변동 없음)

### [[2026-05-21-axelk-ai-is-plagiarism-at-scale]] *통제권 회복 라인의 *Vercel 락인 사례***

axelk의 *오픈소스로 회귀 = 벤더 통제 → 사용자 손* 명제. **이 글의 *Next.js = Vercel 락인 비판은 그 명제의 *프론트엔드 차원 직접 사례***:
- *오픈소스 표방 + 실제 락인* 메커니즘
- *AI 학습 데이터*(axelk) ↔ *프론트엔드 프레임워크*(이번 글)
- *통제권 양도의 형태 변주*

→ axelk 측 자산에 *프론트엔드 차원 추가 사례* 단서. *통제권 회복 라인이 *AI 영역에 한정되지 않음*을 시연*.

### [[2026-05-25-constraint-decay-llm-agent-backend]]의 *프론트엔드 검증*

학술(어제어제): *명시적 (Flask) > 관례 중심 (Django·FastAPI)*. **이 글은 *프론트엔드 차원 검증***:
- *Vue·Svelte = 자동 최적화 (명시적·자동)*
- *React = 수동 useEffect·useMemo 판단 (관례 + 수동 부담)*
- → ***명시적 자동 > 수동 판단*** 결론 *프론트엔드 차원 확장*

### [[2026-05-24-barnum-art-of-money-getting]] *1880년 원칙 위반의 *프론트엔드 차원 시연***

Barnum 5 원칙 중 *재능-직업 일치 + 모두가 쓰니까는 결정 변수 아님*. **이 글의 *관성의 승리 = 네트워크 효과로 선택*은 그 원칙 위반의 *146년 시간 검증 부정 사례***:
- *모두가 쓰니까 React 선택* = Barnum 원칙 위반
- *재능-도구 적합도 판단 회피* = 1880년부터 경고된 함정
- → Barnum 1880년 *시간 검증* 강도가 *프론트엔드 차원에서도 확인*

### *오버 메타화 자기 견제 26 자산 연속*

26 자산 동안 새 자가 진단·매트릭스·라인업 *0건*. *기본기 회귀 라인 7번째 자산·라인 운영 원칙 1개 추가 (5번째 원칙)·5번째 차원 부수 시연*은 *기존 도구 활용*.

## 호스피탈리티 / CRS 적용 포인트

(아래 응답에서 2건씩 별도 안내)

## 연관 자료
- jsx.lol (원문)
- [GeekNews — 29900](https://news.hada.io/topic?id=29900)
- [[2026-05-21-susam-dont-roll-your-own-web-ui]]·[[2026-05-17-jvns-moving-away-from-tailwind]]·[[2026-05-18-datatype-variable-font-charts]]·[[2026-05-21-trevor-lasn-aeo-geo-ai-search]]·[[2026-05-20-sebastian-raschka-llm-architecture-trends]]·[[2026-05-20-wasp-five-years-five-million-dollars-lesson]] — 기본기 회귀 6 자산 *(이번 글이 7번째)*
- [[2026-05-21-axelk-ai-is-plagiarism-at-scale]] — axelk *(통제권 회복 라인의 프론트엔드 차원)*
- [[2026-05-14-eric-ries-incorruptible-mission-protection]] — Ries *(Vercel 락인 = 오픈소스 미션 부식)*
- [[2026-05-25-claude-is-not-your-architect]]·[[2026-05-24-aws-four-years-and-out]] — 5번째 차원 *(프레임워크 차원 시니어 이탈)*
- [[2026-05-25-constraint-decay-llm-agent-backend]] — Constraint Decay *(명시적 > 관례의 프론트엔드 검증)*
- [[2026-05-24-barnum-art-of-money-getting]] — Barnum *(모두가 쓰니까 위반의 시간 검증)*
- [[2026-05-16-hashimoto-ai-mass-psychosis]] — Hashimoto *(이해 불가능 복잡도)*

## 한 달 뒤 회고
*(2026-06-26 즈음 — React 마지막 릴리스가 2년에 도달했는지·새 메이저 발표되었는지, CVE-2025-55182 후속 보안 사고, *기본기 회귀 라인 8번째 자산*(다른 영역) 도착했는지, CRS의 crs-admin-web·crs-be-web React 의존도 점검이 한 번이라도 돌았는지 기록.)*
