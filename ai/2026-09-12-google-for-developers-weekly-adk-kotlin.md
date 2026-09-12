---
title: "[구글디벨로퍼스] Kotlin용 ADK 1.0 발표 등 9월 둘째 주 Google for Developers 위클리 업데이트 (Google) — 에이전트를 짓는 언어(ADK for Kotlin)와 에이전트를 검증하는 방법론(하네스 엔지니어링)이 같은 주 같은 다이제스트에 나란히 실렸다"
source_title: "[구글디벨로퍼스] Kotlin용 ADK 1.0 발표 등 9월 둘째 주 Google for Developers 위클리 업데이트"
source_url: "http://developers-kr.googleblog.com/2026/09/weeklyupdate-week2.html"
source_name: "Google for Developers Korea 공식 블로그 · Slack #개발-뉴스-dev-news 경유(TechArticles 봇, GeekNews 아님)"
referrer_url: "http://developers-kr.googleblog.com/2026/09/weeklyupdate-week2.html"
summarized_at: "2026-09-12"
category: "ai"
tags: ["google-adk", "kotlin", "agent-development-kit", "harness-engineering", "android", "adb-wifi", "developer-tools", "on-device-ai"]
---

# [구글디벨로퍼스] Kotlin용 ADK 1.0 발표 등 9월 둘째 주 Google for Developers 위클리 업데이트 (Google)

> 출처: [9월 둘째 주 Google for Developers 위클리 업데이트](http://developers-kr.googleblog.com/2026/09/weeklyupdate-week2.html) (Google for Developers Korea 공식 블로그) · Slack #개발-뉴스-dev-news 채널(TechArticles 봇) 경유 · 정리일 2026-09-12

## 한 줄 요약

**Google for Developers Korea의 9월 둘째 주 위클리 다이제스트는 세 갈래 소식을 묶었다 — ①Kotlin Multiplatform 기반으로 서버·안드로이드·온디바이스를 아우르는 에이전트 프레임워크 ADK for Kotlin이 1.0(정식 버전)에 도달했고, ②같은 시기 Google 자체 블로그가 "모델을 블랙박스 취급하지 말고 하네스를 표준 소프트웨어처럼 단위·통합 테스트하라"는 하네스 엔지니어링 방법론을 공식 정리했으며, ③ADB Wi-Fi 2.0으로 무선 디버깅 연결 성공률과 속도를 개선했다 — 에이전트를 "짓는 도구"와 "검증하는 방법론"이 같은 생태계 안에서 동시에 성숙해지고 있음을 보여준다.**

## 핵심 포인트

- **ADK for Kotlin 1.0 — 서버부터 온디바이스까지 하나의 프레임워크.** 2026년 5월 0.1.0으로 시작한 ADK for Kotlin이 9월 9일 1.0 정식판(GA)에 도달해 ADK 1.0 Core와 기능 동등성(feature parity)을 갖췄다. Kotlin Multiplatform 위에 구축돼 서버(JVM)와 Android 양쪽에서 같은 프레임워크로 에이전트를 만들 수 있다.
- **온디바이스·하이브리드·영속성까지 안드로이드 전용 확장.** ***LiteRT-LM과 ML Kit(베타)***로 빠르고 프라이버시를 지키는 온디바이스 에이전트를 돌리거나, ***Firebase AI Logic***으로 클라우드와 결합한 하이브리드 워크플로를 짤 수 있고, ***Room***(세션 지속성)·***AppSearch***(온디바이스 메모리)로 프로세스 재시작 후에도 에이전트 상태를 유지한다.
- **컴파일타임 함수 호출로 런타임 리플렉션 제거.** ***KSP(Kotlin Symbol Processing) 기반 컴파일타임 함수 호출***을 지원해 런타임 리플렉션 없이 도구 호출을 처리하고, 점진적 공개(progressive disclosure)로 절차적 지식을 전달하는 스킬 툴셋도 포함됐다.
- **"하네스 엔지니어링" 방법론 — 모델이 아니라 검증 체계를 테스트하라.** Slack 발췌가 언급한 "하네스 엔지니어링 방법론"은 같은 시기 Google Developers Blog가 올린 "The Anatomy of Harness Engineering" 글을 가리키는 것으로 확인된다. 핵심 문장은 ***"에이전트에는 그것을 정직하게 유지해주는 평가 하네스가 필요하다"*** — 모델을 "최종 시험을 통과하는 블랙박스"로 다루지 말고, 하네스 자체를 단위·통합 테스트가 필요한 표준 소프트웨어처럼 다루라는 것이다. 구체적으로는 ①단발성 평가 대신 더 많은 데이터를 배치로 돌려 안정성을 모니터링하는 배치 평가, ②최종 결과가 아니라 "불명확한 프롬프트에 명확화 질문을 하는지", "완료 전 로컬 검증기를 돌리는지" 같은 관찰 가능한 개별 행동을 재는 행동 평가(behavioral evaluation) 두 축을 제시한다.
- **ADB Wi-Fi 2.0 — 안드로이드 개발자용 무선 디버깅 안정화.** adb 서버·adbd 데몬·Android Studio 세 구성요소를 모두 손봐, Bonjour와 레거시 mDNS를 대체하는 새 mDNS 스택을 도입하고 신뢰되지 않은 네트워크를 감지하면 자동으로 ADB Wi-Fi를 껐다 켜는 로직을 추가했다. 그 결과 ***자동 연결 성공률 32% 개선, 전체 연결의 90%에서 66% 더 빠른 연결***을 보고했다(Android 17·SDK Platform-Tools 37.0.0·Android Studio Quail 3 이상 필요).

## 인상 깊은 문장

> "It needs an evaluation harness that keeps it honest." (에이전트에는 그것을 정직하게 유지해주는 평가 하네스가 필요하다 — Google Developers Blog, "The Anatomy of Harness Engineering")

## 댓글

GeekNews를 거치지 않아 hada 댓글은 없다. **출처 한계**: 이번 세션에서 `developers-kr.googleblog.com`(다이제스트 원문), `developers.googleblog.com`(ADK 1.0·하네스 엔지니어링 영문 원문), `android-developers.googleblog.com`(ADB Wi-Fi 2.0 원문), `daily.dev`·`9to5google.com` 등 주요 미러·매체가 모두 egress 정책상 차단돼 **어느 원문도 1차 소스로 직접 열람하지 못했다.** 아래 내용은 Slack 발췌(세 항목의 뼈대만 제공)를 바탕으로, WebSearch가 여러 매체(dev.to, androidengineers.substack.com, GSMArena, fonearena.com, daily.dev 검색 스니펫 등)에 걸쳐 일관되게 반환한 수치·문구를 교차 확인해 재구성한 것이다 — 특히 ADB Wi-Fi 2.0의 "32%·66%" 수치와 하네스 엔지니어링의 인용문은 여러 독립 매체에서 동일하게 재현됐으나, 원문 페이지를 직접 열어 토씨까지 대조하지는 못했다. HN/Lobsters 큐레이션 여부도 확인하지 못했다. **이해관계**: Google 자사 공식 블로그의 자사 제품(ADK, ADB) 홍보성 다이제스트이므로, 경쟁 프레임워크(예: LangChain, AutoGen) 대비 객관적 비교나 ADK for Kotlin의 실제 프로덕션 도입 사례·한계는 원문에도 기대하기 어렵다.

## 내 생각 · 적용점

### 핵심 전이 1 — 이 가든이 4월부터 추적해온 "하네스 엔지니어링" 계보에 이제 Google 자체 공식 방법론이 합류했다

[[2026-04-28-agent-harness-engineering]](Addy Osmani)가 "Agent = Model + Harness"라는 프레임을 처음 들여왔고, [[2026-06-08-harness-engineering-jaehong]]이 이를 "모델을 탓하기 전에 하네스를 점검하라"는 처방으로 종합했으며, [[2026-08-06-harness-engineering-for-self-improvement]](Lilian Weng)는 "평가기·권한 제어는 루프 바깥에 있어야 한다"는 더 정교한 경계까지 그었다. 이번 Google 블로그의 ***"모델을 블랙박스로 보지 말고 하네스를 표준 소프트웨어처럼 테스트하라"***는 주장은 이 계보의 결론과 완전히 같은 방향이다 — 다만 이번엔 개인 블로거·전 OpenAI 세이프티 리더가 아니라 **Google이라는 벤더 자신**이 공식적으로 같은 결론을 냈다는 점이 다르다. "하네스가 모델보다 중요하다"는 명제가 이제 일부 실천가의 통찰을 넘어 대형 플랫폼의 공식 개발 지침으로 자리잡는 신호로 읽을 수 있다.

### 핵심 전이 2 — "하네스를 테스트하라"는 처방과 [[2026-08-06-pi-minimalism-coding-harness]]가 실측한 "하네스에 따라 비용이 2배 갈린다"는 증거가 같은 결론을 다른 방향에서 뒷받침한다

Databricks의 벤치마크는 같은 모델·같은 추론 강도로도 하네스 설계(도구 개수·컨텍스트 절제)에 따라 작업당 비용이 2배 넘게 벌어진다는 걸 보여줬다. 이번 Google 글의 "행동 평가(behavioral evaluation)로 하네스 자체를 회귀 테스트하라"는 처방은 정확히 그 격차를 사전에 잡아내기 위한 방법론이다 — Pi 사례가 "하네스 차이가 실제로 큰 비용 차이를 만든다"는 결과를, 이번 글이 "그러니 그 하네스를 어떻게 검증할지"라는 절차를 제공하는 셈이라 두 노트가 문제와 해법의 짝을 이룬다.

### 핵심 전이 3 — 같은 Google이 같은 시기에 낸 [[2026-09-11-google-artemis-android-automation]]과 안드로이드 에이전트 생태계 조각을 나눠 갖는다

ARTEMIS가 "이미 만들어진 안드로이드 앱을 자연어로 조작·테스트하는" 도구였다면, ADK for Kotlin은 "안드로이드 위에서 새로운 에이전트를 직접 만드는" 프레임워크다 — 둘 다 Google이 같은 시기에 안드로이드를 AI 에이전트의 1급 실행 환경으로 밀어붙이는 움직임의 다른 층위(만들기 vs 테스트하기)로 읽을 수 있다. 다만 두 프로젝트가 조직적으로 연계됐다는 근거는 이 다이제스트에도, ARTEMIS 원문에도 없어 "같은 방향의 개별 팀 움직임"이라는 정도로만 짚어둔다.

## 호스피탈리티 / CRS 적용 포인트

**하네스 엔지니어링 처방은 직접 적용 가능하지만, ADK for Kotlin·ADB Wi-Fi 2.0은 온다 CRS 스택과 거리가 있다.** 온다는 안드로이드 네이티브 앱이나 Kotlin 백엔드를 핵심 CRS 제품으로 쓰고 있지 않아, ADK for Kotlin·ADB Wi-Fi 2.0 자체를 도입할 근거는 약하다 — 다만 두 발표 모두 CRS 자체 도구가 아니라 "만드는 도구"라는 점에서 도입 여부는 각 팀의 기술 스택 선택 문제일 뿐이다. 반면 하네스 엔지니어링 방법론(행동 평가 + 배치 평가로 AI 코딩 에이전트를 회귀 테스트)은 온다가 사내 Claude Code 워크플로에 그대로 옮길 수 있다 — 예를 들어 "예약 상태 전이 코드를 수정하기 전 로컬 검증기를 실행하는지", "모호한 요구사항에 명확화 질문을 던지는지" 같은 행동 지표를 정의하고, 프롬프트·모델을 바꿀 때마다 배치로 돌려 회귀를 감지하는 절차를 CI에 박아둘 수 있다.

## 연관 자료

- [[2026-04-28-agent-harness-engineering]] — "Agent = Model + Harness" 프레임을 이 가든에 처음 들여온 원 노트, 이번 Google 공식 방법론의 출발점과 같은 명제
- [[2026-06-08-harness-engineering-jaehong]] — "모델을 탓하기 전에 하네스를 점검하라"는 종합, 이번 글의 "모델을 블랙박스로 보지 말라"와 같은 결론
- [[2026-08-06-harness-engineering-for-self-improvement]] — "평가기는 루프 바깥에 있어야 한다"는 더 정교한 경계, 이번 글의 "평가 하네스가 정직함을 지킨다"는 주장과 같은 축
- [[2026-08-06-pi-minimalism-coding-harness]] — "같은 모델도 하네스에 따라 비용이 2배 갈린다"는 실측, 이번 글의 회귀 테스트 처방이 잡으려는 바로 그 격차
- [[2026-09-11-google-artemis-android-automation]] — 같은 시기 Google이 낸 안드로이드 에이전트 자동화 도구, "만들기(ADK) vs 테스트하기(ARTEMIS)"로 층위가 다름
- [[2026-06-08-java-to-kotlin-woowahan]] — 국내 산업계가 Kotlin을 백엔드 대체 언어로 다루는 사례, Google이 Kotlin을 에이전트 프레임워크 언어로 미는 이번 발표와 "Kotlin의 용도 확장"이라는 결이 겹침(단 도메인은 다름)

## 한 달 뒤 회고

*(2026-10-12 즈음: ①`developers-kr.googleblog.com`·`developers.googleblog.com` 접근이 풀리면 ADK for Kotlin 1.0과 하네스 엔지니어링 원문을 직접 대조해 이번 정리의 수치·인용이 정확했는지 확인 ②ADK for Kotlin이 실제 프로덕션 안드로이드 앱에 채택된 사례가 나왔는지 ③온다 사내 워크플로에 "행동 평가 + 배치 평가" 방식의 하네스 회귀 테스트를 실제로 검토해봤는지.)*
