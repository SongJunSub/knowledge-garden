---
title: "오늘, 목표로 삼았던 iPhone을 해킹했다 (Calif) — 재부팅 후에도 살아남는 탈옥을, 공격 기법은 숨긴 채 '됐다'는 사실만 먼저 보여줬다"
source_title: "Calif demonstrates untethered iOS 27.0.1 jailbreak on iPhone 18 Pro at Hexacon"
source_url: "https://glitchwire.com/news/calif-demonstrates-untethered-ios-2701-jailbreak-at-hexacon-hints-at-signal-and/"
source_name: "glitchwire.com 외 복수 매체(WebSearch 교차확인, 직접 열람은 못함)"
referrer_url: "https://news.hada.io/topic?id=35877"
published_at: "2026-10-16"
summarized_at: "2026-10-24"
category: "engineering"
tags: ["jailbreak", "ios-security", "exploit", "hexacon", "untethered", "vulnerability-research"]
---

# 오늘, 목표로 삼았던 iPhone을 해킹했다 (Calif)

> 출처: [Calif demonstrates untethered iOS 27.0.1 jailbreak on iPhone 18 Pro at Hexacon](https://glitchwire.com/news/calif-demonstrates-untethered-ios-2701-jailbreak-at-hexacon-hints-at-signal-and/) (glitchwire.com, WebSearch로 kucoin·decrypt·iphonewired 등 복수 매체 교차확인) · GeekNews(id=35877) 경유 · 정리일 2026-10-24
>
> **출처 한계**: `news.hada.io`와 `glitchwire.com`, `decrypt.co` 모두 이번 세션에서 egress 차단(`ENOTFOUND`)으로 직접 열람하지 못했다. WebSearch로 복수의 독립 매체(kucoin, decrypt, iphonewired, ithinkdiff, pasqualepillitteri 등)가 같은 사건을 보도했다는 걸 확인해 사건 자체(Calif.io, Hexacon, 10월 16일, iPhone 18 Pro, iOS 27.0.1, 재부팅 후 루트 SSH 접속)는 교차확인됐다. 다만 ***Slack 발췌가 언급한 "Signal·iMessage에서 받은 PDF를 여는 동작이 공격 진입점"이라는 서술은 WebSearch 결과 어디에도 나오지 않는다*** — 대신 Calif가 CoreGraphics PDF-font 버그(CVE-2026-86950)의 크래시 PoC를 보여줬고 이를 코드 실행으로 바꾸는 작업은 별도라고 밝혔다는 보도만 확인됐다. 즉 "PDF 공격 벡터"와 "Signal/iMessage 데모"가 실제로 같은 공격 체인인지는 ***미확인***으로 남긴다. 공개된 영상이 정확히 4개인지, 그 각각의 내용도 ***Signal 원클릭 데모·iMessage 데모 2개만 WebSearch로 확인됐고 나머지 2개(재부팅 유지 시연 포함)의 독립 보도는 찾지 못했다*** — Slack 발췌를 참고하되 확정하지 않는다. "iOS 9 이후 최초의 untethered 탈옥"이라는 일부 주장에는 반론(2026년에 공개된 구형 32비트 기기의 iOS 9.3.5/9.3.6 untethered 탈옥 영상)도 있어, 이 노트는 그 최상급 표현을 그대로 쓰지 않는다. hada 댓글 수 확인 불가.

## 한 줄 요약

**보안 연구 그룹 Calif.io가 2026년 10월 16일 파리 Hexacon 컨퍼런스에서 iPhone 18 Pro(iOS 27.0.1)에 대한 untethered(재부팅 후에도 유지되는) 탈옥을 시연했지만, 실제 사용한 취약점과 도구는 공개하지 않은 채 "됐다"는 결과만 먼저 보여줬다.**

## 핵심 포인트

- **재부팅 후에도 살아남는 탈옥.** 컴퓨터를 연결하지 않은 상태에서 폰을 재부팅하고, 평소 쓰는 비밀번호로 잠금을 해제한 뒤 ***루트 권한 SSH 세션***을 열었다는 게 시연의 핵심이다. 터미널에 뜬 업타임이 약 2분이었다는 점에서, 이건 "탈옥에 걸린 시간"이 아니라 "재부팅 후 경과 시간"이라는 걸 분명히 해둘 필요가 있다(일부 바이럴 게시물이 이를 혼동했다는 지적이 있다).
- **취약점은 밝히지 않았다.** Calif는 어떤 버그를 썼는지 공개하지 않았고, 공개 가능한 도구도 없다. 다만 CoreGraphics의 PDF 폰트 처리 버그(CVE-2026-86950)에 대한 크래시 PoC를 별도로 보여줬고, 이를 코드 실행으로 발전시키는 작업은 또 다른 과정이라고 밝혔다 — ***이 버그가 실제 탈옥 체인에 쓰였는지는 명시되지 않았다.***
- **메시징 앱 공격 데모도 함께 공개.** 컨퍼런스 뉴스레터에 Signal 원클릭(사용자 조작 한 번 필요) 데모와 iMessage 데모가 포함돼 있다고 한다. 다만 둘 다 세부 메커니즘은 설명되지 않았고, "언제 공개할지는 적절한 시점에 하겠다"는 입장만 밝혔다.
- **AI가 익스플로잇 체인 탐색을 도왔다는 보도.** 독일 매체 heise가 AI가 익스플로잇 체인을 찾는 데 도움을 줬다고 보도했지만, ***AI가 정확히 얼마나 기여했는지는 보도에서도 특정되지 않았다*** — "AI가 발견했다"는 주장을 접할 때는 발견 자체인지, 발견 후 안정화 작업인지 구분해야 한다는 교훈이 여기서도 반복된다.
- **독립 검증은 아직 없다.** 보도 매체(glitchwire 등)도 "발표 시점에 독립적으로 검증할 수 없었다"고 밝힌다. 공개 도구가 없는 비공개 시연이라, 재현 가능성은 Calif의 추가 공개에 달려 있다.

## 인상 깊은 문장

> "everything will be released in due time" (적절한 시점에 모든 걸 공개하겠다, Calif, WebSearch 교차확인)

## 댓글

**hada 댓글 수 확인 불가**(`news.hada.io` 차단). HN/Lobsters 큐레이션 여부도 확인 못했다. 정직하게 짚을 점: ①이것은 "결과만 보여주고 방법은 숨기는" 전형적인 보안 컨퍼런스 시연 방식으로, 독립 검증이 불가능한 상태에서 보도된 모든 세부(4개 영상, PDF 공격 벡터 등)를 액면가로 받아들이면 안 된다. ②"iOS 9 이후 최초"라는 과장된 프레이밍에 반론이 있다는 점도 이 사건의 화제성을 부풀리는 요인일 수 있다. ③AI의 기여도를 둘러싼 heise 보도는 출처·근거가 약해, "AI가 탈옥을 찾았다"는 식의 헤드라인화된 서술을 그대로 믿기보다는 유보적으로 읽어야 한다.

## 내 생각 · 적용점

**핵심 전이 1 — [[2026-10-23-ns2jb-switch2-jailbreak-codex]]와 똑같은 패턴, "AI가 발견했다"는 서술의 검증 불가능성이 반복된다.** 그 노트에서도 "Codex가 SmileBASIC 정수 오버플로를 발견했다"는 주장이 원문 접근 차단으로 확인되지 않았고, [[2026-09-19-hacktron-openai-heif-sso-chain]]이 세운 "AI의 역할은 발견이 아니라 신뢰성(재현 안정화)이었다"는 구분을 적용하지 못한 채 남겨뒀다. 이번 Calif 사례도 heise의 "AI가 도왔다"는 보도가 똑같이 검증 불가능한 채로 남아 있다 — 두 사건을 나란히 두면, ***보안 리서치에서 "AI가 취약점을 찾았다"는 주장은 반복적으로 등장하지만 그 기여의 실체(발견 vs 안정화)를 독립적으로 검증할 수 있었던 사례는 드물다***는 패턴이 쌓인다.
**핵심 전이 2 — [[2026-08-30-vphone-cli-virtual-iphone-boot]]·[[2026-09-02-darling-macos-on-linux-revival]]이 다룬 "Apple 보안 경계를 다루는 방식의 스펙트럼"에서, 이 사건은 가장 전통적인 끝(제로데이 체인으로 실제 기기를 뚫는 것)에 해당한다.** vphone-cli는 Apple이 만든 가상화 경로를 역이용했고, HackiOS는 비-Apple 하드웨어에 커널을 포팅했다 — 둘 다 "제로데이 없이" Apple 보안 경계를 다루는 우회로였다. 이 사건은 반대로 ***실제 최신 iPhone 하드웨어·최신 iOS를, 공개되지 않은 취약점 체인으로 직접 뚫는*** 가장 오래된 방식의 탈옥이다. 세 사례를 나란히 두면, "진짜 iOS 환경을 다루는" 접근이 가상화 활용·커널 포팅·제로데이 체인이라는 세 갈래로 동시에 진행되고 있다는 걸 보여준다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 멀다 — 온다는 모바일 OS 제로데이를 다루지 않는다.** 다만 전이 가능한 원칙은 두 가지다.

- **"재부팅 후에도 살아남는다"는 사실 자체가 위협 모델을 바꾼다.** CRS·PMS가 모바일 앱(게스트용 체크인 앱 등)의 보안을 평가할 때, "기기를 재시작하면 안전해진다"는 가정에 의존하는 설계가 있다면, 이런 untethered 탈옥 사례는 그 가정이 항상 성립하지 않는다는 걸 상기시킨다 — 다만 이건 OS 레벨 위협이라 앱 레벨 대응으로 막을 수 있는 문제는 아니라는 한계도 함께 밝힌다.
- **"결과만 공개하고 방법은 숨긴다"는 책임 있는 공개(responsible disclosure) 패턴은, 온다가 외부에 취약점을 보고받거나 보고할 때 참고할 만한 절차다.** 발견 사실을 먼저 알리고 악용 가능한 세부는 패치가 나온 뒤 공개하는 순서는, 보안 리서치 커뮤니티의 표준 관행과 일치한다.

## 연관 자료

- [[2026-10-23-ns2jb-switch2-jailbreak-codex]] — "AI가 취약점을 발견했다"는 검증 불가능한 주장이 반복되는 같은 패턴, 콘솔 탈옥이라는 다른 무대
- [[2026-09-19-hacktron-openai-heif-sso-chain]] — "AI의 역할은 발견이 아니라 신뢰성"이라는 구분을 처음 세운 노트
- [[2026-08-30-vphone-cli-virtual-iphone-boot]] — Apple 보안 경계를 다루는 다른 축(가상화 역이용), 제로데이 체인이 아닌 접근

## 한 달 뒤 회고

2026-11-24 즈음, Calif가 실제로 취약점 세부를 공개했는지, 공개된 영상이 몇 개이고 각각 무엇을 시연했는지, PDF 공격 벡터가 실제 탈옥 체인의 일부였는지를 1차 자료로 확인.
