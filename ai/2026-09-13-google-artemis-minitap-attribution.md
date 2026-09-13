---
title: "Google에 더 나은 모습을 기대했다 (Minitap) — Artemis는 mobile-use의 버그까지 그대로 재현했지만, 저자 이름은 강제 푸시로 지웠다"
source_title: "I expected better from Google"
source_url: "https://www.minitap.ai/blog/i-expected-better-from-google"
source_name: "minitap.ai 블로그 (Nicolas Dehandschoewercker, Minitap 공동창업자·CEO)"
referrer_url: "https://news.hada.io/topic?id=33587"
summarized_at: "2026-09-13"
category: "ai"
tags: ["open-source", "attribution", "apache-license", "android-automation", "mobile-use", "google", "code-provenance"]
---

# Google에 더 나은 모습을 기대했다 - 코드는 가져가고 출처는 지운 Artemis

> 출처: [I expected better from Google](https://www.minitap.ai/blog/i-expected-better-from-google) (Nicolas Dehandschoewercker, Minitap 공동창업자·CEO) · GeekNews(id=33587) 경유 · 정리일 2026-09-13

> **출처 한계**: `news.hada.io`는 이번 세션 egress 전면 차단으로 열람하지 못했다(확인됨, 시도하지 않았음). 원문 `minitap.ai` 블로그도 이번 세션에서 `EGRESS_BLOCKED`로 직접 열람하지 못했다 — Slack 발췌와 WebSearch가 반환한 다수 매체(Neowin, Digital Citizen, dev.ua 등, 이들도 개별적으로는 직접 열람 실패)의 스니펫을 교차 검증했다. 다만 **1차 소스 두 가지는 직접 확인했다** — ① `github.com/google/artemis`의 실제 Issue #40, #61(문제 제기 원문)과 현재 README를 WebFetch로 직접 열람, ② 그 결과 Google 측이 실제로 추가한 출처 표기 문구("This project includes source code developed by Minitap, Inc.")를 저장소에서 직접 확인. HN에는 "Google stole open source code without crediting the authors (Artemis/Minitap)"라는 별도 스레드가 존재한다는 것은 WebSearch로 확인했으나, `news.ycombinator.com` 자체가 이번 세션에서 접근 차단되어 정확한 포인트·댓글 수·논조는 확인하지 못했다. 이 사건은 **폭로한 쪽(Minitap)의 1인칭 주장이 출발점**이라는 점을 감안해서 읽어야 한다 — 다만 아래에서 보듯 핵심 사실(저자명 교체, 사후 크레딧 추가)은 Google 저장소 자체의 커밋 히스토리로도 뒷받침된다.

## 한 줄 요약

**Minitap 팀은 자신들의 오픈소스 Android 자동화 프로젝트 mobile-use의 코드 — ADB 터널 구현, 에이전트 프롬프트, WhatsApp 예제, 심지어 구버전의 버그까지 — 가 Google의 Artemis에 그대로 들어가 있는 것을 발견했다. 문제는 코드를 가져간 것 자체가 아니라(Apache 2.0은 이를 허용한다), 초기 `pyproject.toml`에 남아 있던 mobile-use 원저자 3명의 이름이 8월의 한 강제 푸시(force push)로 다른 이름으로 교체됐고 — 나머지 228개 파일은 그대로 유지됐다는 점이다. 공개 이슈가 제기된 뒤에야 Google은 저장소에 "이 프로젝트는 Minitap, Inc.가 개발한 소스 코드를 포함한다"는 출처 표기를 추가했다.**

## 핵심 포인트

- **코드 일치 범위가 넓고 구체적이다** — ADB 터널 구현, 플래너(planner) 헬퍼, 앱-락 유틸리티, 에이전트 프롬프트, SDK 예제까지 겹친다. 특히 ***"Hopper" 에이전트 프롬프트는 단어 하나까지 동일***했고, WhatsApp 테스트 예제(Alice·Bob·Charlie에게 새해 메시지를 보내는 시나리오)도 그대로였다. mobile-use 구버전에만 있던 버그가 Artemis 코드에도 재현됐다는 점은, "독립적으로 비슷하게 구현했을 가능성"을 배제하는 가장 강한 증거다.
- **저자명이 조용히, 그리고 선택적으로 지워졌다** — 초기 `pyproject.toml`에는 mobile-use의 버전 번호(3.6.3)와 원저자 3명(Pierre-Louis Favreau, Jean-Pierre Lo, Nicolas Dehandschoewercker) 이름이 Google LLC 저작권 헤더 아래 남아 있었다. 8월의 한 강제 푸시로 이 파일만 다른 저자명으로 교체됐고, ***나머지 227개 이상의 파일은 그대로였다*** — 코드는 그대로 두고 "누가 만들었는가"라는 기록만 바꾼 셈이라, 단순 실수보다 의도가 있었다는 의심을 사는 지점이다.
- **문제 제기는 GitHub 이슈로 공개적으로 진행됐다** — Minitap 측이 이슈 #40("Missing attribution to mobile-use and its contributors")을 열었고, 별도로 제3자(MysteryPancake)가 이슈 #61("This project is stolen from minitap")을 열어 adb_tunnel·hopper.md·메시징 코드를 나란히 비교하는 증거를 제시했다. 이 노트 작성 시점 기준 **이슈 #61은 여전히 Open 상태**다.
- **Google의 대응은 "조용한 정정"에 그친다** — 공개 이슈 이후 후속 커밋(371aa6d)에서 코드 내 크레딧이 추가됐고, README의 License 섹션 바로 아래에 "This project includes source code developed by Minitap, Inc."라는 문구가 `minitap-ai/mobile-use` 저장소 링크와 함께 붙었다(저장소를 직접 열람해 확인). ***다만 Google 메인테이너나 공식 대변인의 공개 사과·해명 성명은 이번 세션에서 확인한 범위(이슈 #40·#61 본문, 여러 매체 스니펫) 안에서 찾지 못했다*** — 크레딧을 "추가"했을 뿐, 처음에 왜 지워졌는지에 대한 설명은 없는 것으로 보인다.
- **AndroidWorld 벤치마크 리더보드에는 여전히 반영되지 않았다** — 이슈 #61에 따르면 Artemis가 코드 상당 부분을 가져온 mobile-use는 여전히 공식 AndroidWorld 리더보드에서 빠져 있고, 이를 바로잡자는 PR(#64)이 별도로 제안된 상태다. Artemis가 자랑하는 "AndroidWorld 99%+ 성공률"이라는 성능 지표 자체가 상당 부분 mobile-use의 구현 위에서 나온 것이라면, 그 지표의 출처를 명확히 하지 않은 채 리더보드에 올린 것도 같은 문제의 연장선이다.

## 인상 깊은 문장

> (WebSearch로 재구성, minitap.ai 블로그 제목) **"I expected better from Google."**
> — 원문에 직접 접근하지 못해 정확한 인용은 아니지만, 여러 매체가 일치해서 재현하는 문장이며 이 사건 전체의 정서를 압축한다.

> "This project includes source code developed by Minitap, Inc." — Google이 공개 이슈 이후 `github.com/google/artemis` README에 실제로 추가한 문구 (GitHub 저장소 직접 열람으로 확인, 1차 소스)

## 댓글

- **hada 댓글 수·논조**: 이번 세션에서 `news.hada.io` 전면 차단으로 확인 불가(시도하지 않음, 정책상 확정).
- **HN 크레이션 존재는 확인, 세부는 미확인**: "Google stole open source code without crediting the authors (Artemis/Minitap)"라는 별도 HN 스레드가 존재한다는 것은 WebSearch로 확인했지만, `news.ycombinator.com` 자체가 이번 세션에서 접근 차단되어 정확한 포인트·댓글 수·다수 논조는 확인하지 못했다.
- **이해관계 정직하게 밝힌다**: 이 사건의 1차 서술은 피해를 주장하는 당사자(Minitap)의 블로그에서 나왔다 — Minitap은 Google과 경쟁하는 위치에 있는 스타트업이므로, 이 폭로가 여론전의 성격도 일부 갖는다는 점을 감안해야 한다. 다만 저자명 교체·크레딧 사후 추가라는 핵심 사실관계는 Google 저장소 자신의 커밋 히스토리·현재 README로도 뒷받침되므로, "일방적 주장이라 신뢰할 수 없다"고 보기는 어렵다.

## 내 생각 · 적용점

### 핵심 전이 1 — 같은 도구(Artemis)를 다룬 이전 노트의 "자사 벤치마크라 검증 주체가 불명확하다"는 의심이, 이번 사건으로 훨씬 구체적인 근거를 얻었다

[[2026-09-11-google-artemis-android-automation]]에서 이 노트는 ARTEMIS의 AndroidWorld 99%+ 성공률 주장을 두고 "자사(팀) 발표 성능 지표라는 점을 감안해야 한다"고 조심스럽게만 적어뒀다. 이번 사건은 그 조심스러움이 왜 필요했는지를 구체적으로 보여준다 — 그 성능이 상당 부분 mobile-use의 구현(에이전트 프롬프트·플래너 로직) 위에서 나온 것이라면, "Artemis가 99%+를 달성했다"는 문장은 정확히는 "Artemis가 흡수한 mobile-use의 구현이 99%+를 달성했다"에 더 가깝다. ***벤치마크 수치의 진짜 저자가 누구인지를 따지지 않고 그 수치만 인용하면, 성능 검증 이슈와 출처 표기 이슈가 사실은 같은 질문의 두 얼굴이라는 걸 놓치게 된다.***

### 핵심 전이 2 — [[2026-08-27-bambu-lab-agpl-violation]]과는 "무엇을 지웠는가"가 다르지만, "소스를 열어두는 것과 그 출처를 인정하는 것은 별개의 의무"라는 패턴은 같다

Bambu Lab 사건은 AGPLv3가 요구하는 **대응 소스(Corresponding Source) 자체를 숨긴** 사례였다 — 코드를 아예 안 보여준 쪽이다. 이 사건은 정반대로 코드는 공개된 채로 있고, **저자 이름이라는 메타데이터만 지워진** 사례다. 흥미로운 건 Artemis가 쓰는 Apache 2.0 라이선스는 애초에 AGPL보다 훨씬 관대해서 코드를 가져다 쓰는 것 자체는 허용하지만, ***저작권·특허·상표 고지(notice)를 보존해야 한다는 §4 조항은 여전히 존재한다*** — 즉 "관대한 라이선스라 마음대로 써도 된다"와 "출처 표기 의무가 없다"는 다른 이야기라는 걸 이 사건이 보여준다. 두 사건을 합치면, 오픈소스 라이선스가 지키려는 것은 결국 하나로 좁혀진다 — **누가 무엇을 만들었는지의 기록이 사라지지 않게 하는 것.** Bambu는 소스를, Google(Artemis)은 저자 이름을 지웠을 뿐 겨냥한 지점은 같다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 제한적이지만, 원칙은 전이 가능하다.** 온다가 오픈소스(Apache/MIT 등 관대한 라이선스) 코드를 가져다 CRS·연동 모듈에 통합할 때, "라이선스가 허용하는 재사용"과 "저자·프로젝트 표기 의무"를 별개로 체크리스트화해야 한다는 게 이 사건의 실무적 교훈이다 — Apache 2.0처럼 관대한 라이선스도 NOTICE·저작권 고지 보존 의무는 그대로 남기 때문에, "라이선스가 허용하니 문제없다"는 판단만으로 원저자 표기를 생략하면 이 사건과 같은 노출 위험을 그대로 안게 된다. 다만 온다가 실제로 이런 상황(경쟁사 오픈소스를 가져다 쓰는 위치)에 놓일 가능성 자체는 낮으므로, 이 노트의 가장 직접적인 적용점은 오히려 **반대 방향** — 온다가 내부 도구를 오픈소스로 낼 경우, 그 안에 포함된 서드파티 코드의 출처 표기를 CI 단계에서 자동 점검하는 습관을 갖는 쪽에 있다.

## 연관 자료

- [[2026-09-11-google-artemis-android-automation]] — 바로 이 논란의 대상인 Google Artemis를 도구 자체로 다룬 선행 노트, 이번 사건이 그 노트의 "자사 벤치마크 검증 주체 불명확" 의심에 구체적 근거를 더함
- [[2026-08-27-bambu-lab-agpl-violation]] — "오픈소스 출처를 지운다"는 같은 패턴의 다른 층위(대응 소스 자체를 숨김 vs 저자 메타데이터만 교체), 관대한 라이선스든 카피레프트든 출처 기록 보존 의무는 남는다는 공통점

## 한 달 뒤 회고

*(2026-10-13 즈음 — ①이슈 #61이 그 사이 종료됐는지, Google이 공식 해명·사과 성명을 냈는지 ②AndroidWorld 리더보드에 mobile-use/Minitap이 반영됐는지(PR #64 진행 여부) ③이 사건이 Artemis의 실제 채택률·평판에 영향을 줬는지 HN·GitHub 스타 추이로 확인.)*
