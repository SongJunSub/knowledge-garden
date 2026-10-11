---
title: "Bitwarden, 앱 스토어 배포를 상용 라이선스 빌드로 전환 (Bitwarden) — GPLv3 코드는 GitHub에 그대로 두고, '배포 채널'만 상용 라이선스로 분리한다"
source_title: "Published version update in app stores"
source_url: "https://community.bitwarden.com/t/published-version-update-in-app-stores/102750"
source_name: "Bitwarden Community Forums (공식 공지) / dev.to·Privacy Guides·Lemmy 교차확인"
referrer_url: "https://news.hada.io/topic?id=35127"
published_at: "2026-10-09"
summarized_at: "2026-10-11"
category: "engineering"
tags: ["bitwarden", "open-source", "license", "gplv3", "commercial-license", "app-store", "dual-license"]
---

# Bitwarden, 앱 스토어 배포를 상용 라이선스 빌드로 전환

> 출처: [Published version update in app stores](https://community.bitwarden.com/t/published-version-update-in-app-stores/102750) (Bitwarden Community Forums 공식 공지, 2026-10-09) · dev.to·Privacy Guides·Lemmy 복수 커뮤니티 교차확인 · 정리일 2026-10-11

> **출처 한계**: 이번 세션에서 WebFetch가 전면 차단되어 `news.hada.io`·`community.bitwarden.com`·`bitwarden.com` 전부 직접 열람하지 못했다. 아래 내용은 WebSearch 스니펫 재구성이며, Bitwarden 공식 포럼 공지를 1차 소스로 보도한 dev.to("Bitwarden switches store apps to a commercial license")와 이를 재인용한 Privacy Guides·여러 Lemmy 인스턴스 게시물이 핵심 사실(전환 범위·날짜·GPLv3 유지)에서 일치해 골격은 신뢰할 만하다. 다만 공식 공지의 정확한 워딩 전문, hada 댓글 수, HN/Lobsters 큐레이션 여부는 확인하지 못했다. 이 사건을 2024년 10월에 있었던 "SDK 라이선스 조항" 논란(당시 SFC·Privacy Guides에서 떠들썩했던 건, 이 가든의 [[2026-09-09-mit-to-eupl-license-switch]] 노트에도 배경으로 언급)과 혼동하지 않도록 주의했다 — 이번은 별개의, 2년 뒤 벌어진 새 조치다.

## 한 줄 요약

**Bitwarden이 2026-10-09 공식 포럼을 통해, 다음 릴리스부터 앱 스토어(iOS/Android/브라우저 익스텐션 스토어)에 배포하는 빌드와 자사 웹사이트에서 직접 내려받는 빌드를 "상용 라이선스" 빌드로 전환한다고 발표했다. GPLv3 오픈소스 버전의 소스코드는 그대로 GitHub에 공개·갱신되며, 셀프호스팅은 영향받지 않는다. 이번 조치가 겨누는 대상은 명시적으로 "Bitwarden을 재패키징·재판매하는 제3자"다 — 다만 앞으로 상용 라이선스 전용으로만 나올 수 있는 "미래 기능"의 범위는 아직 밝혀지지 않았다.**

## 핵심 포인트

- **전환 범위** — ***앱 스토어 배포 빌드 + 웹사이트 직접 다운로드 빌드***가 상용 라이선스로 전환. 다음 릴리스부터 적용.
- **GPLv3 버전은 그대로** — GPLv3 오픈소스 코드는 ***GitHub에서 계속 공개·갱신***된다. "오픈소스를 접는 게 아니다"라는 점을 Bitwarden이 직접 강조.
- **셀프호스팅 무관** — 공지는 ***자체 호스팅 사용자는 영향 없음***을 명시. 또한 "포크해도 된다"고 재확인 — 완전한 비공개 전환(closed-source)은 아니다.
- **겨누는 대상은 재배포자** — 공지가 밝힌 전환 취지는 ***Bitwarden을 재패키징·재판매하는 제3자를 막는 것***. 일반 사용자에게는 "조치 불필요, 앱은 지금처럼 동작한다"고 안내.
- **현재 기능은 양쪽 동일** — 공지에 따르면 ***현재 존재하는 모든 기능은 GPLv3판과 상용 라이선스판 양쪽에서 동일하게 제공***된다.
- **불확실성의 핵심 — 미래 기능** — 앞으로 개발될 일부 기능은 ***상용 라이선스 빌드에만 존재할 수 있다***고 공지됐으나, 어떤 기능이 그 대상이 될지는 "케이스별 판단"이라며 구체적으로 밝히지 않았다. 커뮤니티 반응도 바로 이 지점을 겨눈다 — "지금은 같지만, 두 빌드가 실제로 갈라지기 시작하면 어떻게 되는가"라는 질문.

## 인상 깊은 문장

> "no action needed... the apps will work exactly as they do today" (Bitwarden 공식 공지 취지, WebSearch 재구성)

> "Bitwarden also says it is not going closed-source, and that you can still fork Bitwarden." (WebSearch 재구성)

## 댓글

**hada 댓글 수 확인 불가**(WebFetch 전면 차단). HN/Lobsters 큐레이션 여부도 확인하지 못했다. Lemmy·Privacy Guides 쪽 반응은 WebSearch로 일부 확인됐는데, 논조는 "지금 당장의 피해는 없다"는 데 동의하면서도 ***"상용 전용 기능의 범위를 밝히지 않은 채 분리를 먼저 발표한 순서"***에 의문을 제기하는 쪽이다. 한 코멘트는 "두 빌드가 실제로 갈라지기 시작하면(diverge) 그때는 어떻게 되는가"를 그대로 질문으로 남겼다. 2024년 SDK 라이선스 논란 때처럼 "오픈소스 커밋먼트 재확인"으로 일단 봉합되는 패턴이 반복되는 것으로 보이나, 이번 세션에서는 원문 댓글 스레드를 직접 읽지 못해 반응의 강도·분포는 추정에 머문다.

## 내 생각 · 적용점

### 핵심 전이 1 — [[2026-09-09-mit-to-eupl-license-switch]]와 정확히 반대 방향에서 같은 질문에 답한다

Henri Bergius는 "허용적 라이선스가 결국 대기업의 무상 개발비 지원으로 흘러갔다"는 결론으로 ***더 강한 카피레프트(EUPL)***로 이동했다. Bitwarden은 거꾸로, ***GPLv3라는 강한 카피레프트를 유지하면서도 배포 채널(앱 스토어·직접 다운로드)만 상용 라이선스로 분리***해 "재배포·재판매"라는 바로 그 문제(Bergius가 우려한 것과 같은 유형의 가치 유출)를 막으려 한다. 둘 다 "허용적 오픈소스는 무임승차를 허용한다"는 같은 문제를 보지만, 해법이 다르다 — Bergius는 ***라이선스 자체를 강하게 만드는 쪽***, Bitwarden은 ***배포 채널을 이원화해 상업적 재판매 경로만 따로 통제하는 쪽***이다. 오픈 코어(open-core) 전략의 변형이라고도 볼 수 있다.

### 핵심 전이 2 — [[2026-08-27-bambu-lab-agpl-violation]]과 나란히 두면 "투명성의 스펙트럼"이 보인다

Bambu Lab은 AGPLv3 코드를 가져다 쓰면서 ***4년 넘게 대응 소스를 숨기고, 권리를 행사한 개발자에게 DMCA로 위협***했다 — 라이선스 의무를 은폐로 회피한 사례였다. Bitwarden은 반대편 끝에 있다: 상용화 조치를 ***공개 공지로 먼저 발표***하고, GPLv3 코드는 계속 공개하며, 포크 권리도 재확인한다. 똑같이 "오픈소스와 상업적 이익이 충돌하는 지점"을 다루지만 ***투명성의 수준이 완전히 다르다*** — Bambu Lab이 보여준 "최악의 대응"을 기준점으로 두면, Bitwarden의 이번 조치가 왜 (아직은) 커뮤니티의 격렬한 반발을 사지 않는지가 더 선명해진다.

### 핵심 전이 3 — "지금은 같다"는 약속의 유효기간이 진짜 리스크다

이 사건에서 가장 정직하게 짚어야 할 부분은 "GPLv3와 상용판의 기능이 지금은 동일하다"는 현재 시점의 사실이, ***미래 기능의 라이선스 배정 기준을 밝히지 않은 상태에서 나온 약속***이라는 점이다. 이건 이번 조치 자체의 결함이 아니라 — 오픈 코어 모델을 쓰는 모든 회사(GitLab, Elastic, HashiCorp 등)가 공통으로 가진 구조적 긴장이다. "지금은 동일"은 스냅샷이고, 실제 리스크는 ***다음 몇 번의 릴리스에서 상용판에만 들어가는 기능의 목록이 얼마나 빠르게, 얼마나 핵심적으로 늘어나는가***에 있다.

## 호스피탈리티 / CRS 적용 포인트

온다가 Bitwarden을 비밀관리 도구로 조직 내에서 쓰고 있다면 이번 조치의 실질 영향은 제한적이다 — ***셀프호스팅은 무관하고, 현재 기능은 양쪽 동일하기 때문***이다. 전이 가능한 원칙은 오히려 "우리가 공급자일 때"의 교훈이다: 만약 온다가 CRS 기능 중 일부를 오픈소스/파트너 공개로 전환하는 걸 검토한다면, **"배포 채널"과 "코드 공개"를 분리하는 이 전략 — 코드는 공개하되 상업적 재배포·화이트라벨 채널만 별도 계약으로 통제하는 구조 — 은 참고할 만한 템플릿**이다. 다만 Bitwarden 사례가 보여주듯, 이 모델의 신뢰는 "미래 기능의 라이선스 배정 기준을 얼마나 일찍, 구체적으로 밝히는가"에 달려 있다 — 애매하게 남겨두면 장기적으로는 [[2026-09-09-mit-to-eupl-license-switch]]가 지적한 "관대함이 결국 누구의 이익이 되는가"라는 질문이 똑같이 되돌아온다.

## 연관 자료

- [[2026-09-09-mit-to-eupl-license-switch]] — 정반대 방향(배포 채널 이원화 vs 라이선스 자체 강화)에서 같은 "오픈소스 가치 유출" 문제를 다루는 거울상
- [[2026-08-27-bambu-lab-agpl-violation]] — 라이선스 의무를 은폐로 회피한 최악의 사례. 이번 Bitwarden의 투명한 공지와 대조하면 투명성 스펙트럼이 드러남

## 한 달 뒤 회고

*(2026-11-11 즈음 — ①상용 라이선스 전용으로 처음 출시되는 구체적 기능이 무엇인지 공개됐는지, ②Privacy Guides·HN 등에서 "diverge" 우려가 실제 사례로 현실화됐는지, ③GPLv3판 사용자 수·포크 활동이 이 조치 이후 체감할 만큼 줄었는지 추적.)*
