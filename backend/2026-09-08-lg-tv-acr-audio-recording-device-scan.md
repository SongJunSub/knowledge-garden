---
title: "LG TV, 화면 꺼진 상태에서도 오디오 녹음·주변 기기 스캔 (Gamers Nexus) — ACR을 넘어 광고 부서로 흘러가는 홈 네트워크 지도"
source_title: "LG smart TVs caught logging audio with screen off and snooping on local devices"
source_url: "https://www.notebookcheck.net/LG-smart-TVs-caught-logging-audio-with-screen-off-and-snooping-on-local-devices.1391214.0.html"
source_name: "Notebookcheck 등 복수 매체 보도, 원조사는 Gamers Nexus(+Level1Techs, 독립 보안연구자) · GeekNews(id=33318) 경유"
referrer_url: "https://news.hada.io/topic?id=33318"
published_at: "2026-09-07 (정확한 게시일 미확인 — 관련 매체 동시 보도일 기준)"
summarized_at: "2026-09-08"
category: "backend"
tags: ["privacy", "acr", "smart-tv", "data-collection", "adtech", "security-research"]
---

# LG TV, 화면 꺼진 상태에서도 오디오 녹음·주변 기기 스캔

> 출처: [LG smart TVs caught logging audio with screen off and snooping on local devices](https://www.notebookcheck.net/LG-smart-TVs-caught-logging-audio-with-screen-off-and-snooping-on-local-devices.1391214.0.html) (Notebookcheck, 원조사 Gamers Nexus) · GeekNews(id=33318) 경유 · 정리일 2026-09-08

> **출처 한계(큼)**: hada.io 토픽 페이지와 원문 후보 매체(notebookcheck.net, tech.yahoo.com, decrypt.co, ynetnews.com 등) 전부 이번 세션 egress 차단으로 직접 열람하지 못했다. 이 노트는 WebSearch로 확보한 Notebookcheck·Yahoo Tech·TechRadar·ynetnews·atlas21 등 다수 매체의 교차 요약과 제공된 Slack 발췌로 재구성했다. 원 조사인 Gamers Nexus의 135분 분량 영상 자체는 시청하지 못했고, Wireshark 패킷 분석의 구체적 항목(어떤 패킷·어떤 엔드포인트인지)도 2차 보도 수준까지만 확인했다.

## 한 줄 요약

**Gamers Nexus가 Level1Techs·독립 보안연구자들과 함께 LG G5 등 OLED TV를 Wireshark로 분석한 결과, 화면이 꺼진 대기 상태에서도 마이크 오디오를 로컬에 저장했다가 인터넷 연결이 복구되면 서버로 전송하고, 동시에 가정 네트워크를 지속 스캔해 휴대폰·스마트워치 등 무관한 기기와 주변 Wi-Fi 정보·위치까지 수집해 LG의 광고 부문(LG Ad Solutions)으로 흘려보낸다는 사실이 드러났다.**

## 핵심 포인트

- **화면이 꺼져도 녹음은 계속됨** — 대기 상태에서도 내장 마이크가 오디오를 녹음해 로컬에 저장하며, 네트워크가 끊긴 동안에도 오디오·텍스트 파일이 계속 쌓이다가 ***인터넷 연결이 복구되는 즉시 암호화된 형태로 서버에 업로드***된다(WebSearch 교차 확인, notebookcheck·yahoo tech).
- **ACR을 넘어서는 네트워크 스캔** — 기존에 알려진 ACR(자동 콘텐츠 인식, 화면에 뭐가 나오는지 식별하는 기능)과 별개로, webOS가 가정 네트워크를 반복 스캔해 ***TV 동작과 무관한 휴대폰·스마트워치 등 기기를 매핑***하고 주변 Wi-Fi 이름·신호 세기·위치 정보까지 수집한다.
- **광고 부문으로의 데이터 흐름과 규모 주장** — 수집된 데이터는 LG의 타겟 광고 부문 LG Ad Solutions로 전송되며, 이 부문은 미국에서만 ***3억 6,300만 개의 "2차 광고 대상 기기(secondary addressable devices)"***에 접근 가능하다고 광고주들에게 주장한다. 이 수치는 LG의 전 세계 스마트TV 판매 대수(약 2억 1,600만 대로 보도됨)보다 커서, 기기 자체가 아니라 ***네트워크 단위의 기기 그래프***까지 광고 타겟팅에 쓰인다는 정황으로 읽힌다.
- **음성 명령의 평문 로그 전사** — 음성 명령을 텍스트로 전사해 평문 로그로 남긴다는 정황이 문서화됐다고 보도됐다(WebSearch, ynetnews). LG는 과거 자사 TV가 "주변 대화를 수집·녹음·보관하지 않는다"고 밝힌 바 있는데, 이번 조사 결과는 그 진술과 배치되는 방향이다.
- **webOS의 알려진/신규 취약점도 함께 언급** — 일부 보도(atlas21)는 webOS에 이미 알려진 원격코드실행(RCE) 취약점이 있고, 새로 발견된 제로데이가 책임공개(responsible disclosure) 절차 중이라고 전했다 — 데이터 수집 문제와는 별개 트랙이지만 같은 조사에서 함께 다뤄졌다.

## 인상 깊은 문장

원문(Gamers Nexus 영상·notebookcheck 기사) 미열람으로 직접 인용은 생략한다. WebSearch로 확인된 TechRadar 기사 제목의 표현("It's extremely creepy")만 참고로 남긴다 — 사용자 반응을 요약한 매체의 표현이지 조사팀의 1차 인용은 아니다.

## 댓글

hada 댓글 수·논조는 이번 세션에서 확인하지 못했다(hada.io 접근 차단). 다만 이 조사는 여러 IT/보안 매체(Notebookcheck, Yahoo Tech, TechRadar, ynetnews, Decrypt, Gadget Review 등)에 거의 동시에 인용 보도됐고 ResetEra 같은 포럼에도 스레드가 생길 만큼 화제가 됐다는 점에서, 단일 매체의 과장이 아니라 다수가 교차 확인한 사안으로 보인다. LG의 공식 대응은 확인된 보도 시점까지 나오지 않은 것으로 파악된다.

## 내 생각 · 적용점

### 핵심 전이 1 — "동의 없는 수집 범위"라는 축에서 티빙 사고와 같은 계열이지만 근본 원인은 정반대다

[[2026-09-07-tving-3954-account-data-breach]]는 ***외부 공격자***가 방치된 취약점(접속키 관리 미비)을 뚫어 사용자 데이터를 탈취한 사고였다. 이 LG TV 사례는 반대로 ***제조사가 설계 단계에서부터 의도적으로 구축한*** 수집 파이프라인(ACR을 넘어서는 네트워크 스캔 → 광고 부문 전송)이 사용자 인지·동의 범위를 벗어난다는 문제다. 두 사례를 나란히 놓으면 "사용자 데이터가 노출되는 두 가지 서로 다른 경로"가 보인다 — ***방치된 보안 허점을 통한 유출***과 ***애초에 과도하게 설계된 수집 자체***. 후자는 유출이 아니라 "정상 동작"이라서, 사고 대응이 아니라 제품 설계·약관·투명성 문제로 다뤄져야 한다는 점이 결정적으로 다르다.

### 핵심 전이 2 — "판매 대수보다 큰 광고 타겟 수"라는 숫자가 시사하는 것

3억 6,300만이라는 광고 타겟 기기 수가 LG의 실제 TV 판매 대수보다 크다는 사실은, ***TV 한 대가 그 집 안의 다른 기기들까지 광고 타겟팅 단위로 끌어들이는 승수 효과***를 만든다는 뜻이다. 이는 "제품 하나를 판 것"과 "그 제품이 수집할 수 있는 데이터 그래프를 판 것"이 완전히 다른 규모의 사업이 될 수 있다는, 하드웨어 제조사의 애드테크 겸업 모델 일반에 적용되는 교훈으로 남길 만하다.

## 호스피탈리티 / CRS 적용 포인트

**직접적인 경각심 포인트가 있다.** 이 사례를 CRS/PMS 관점의 체크리스트로 옮기면: ① ***"수집 목적으로 명시한 범위"와 "실제로 수집하는 범위"의 괴리를 정기 감사할 것*** — CRS도 예약·결제 처리에 필요한 데이터 외에 부가 기능(추천, 분석)을 이유로 수집 범위가 조용히 넓어질 위험이 있다. ② ***제3자(여기선 광고 부문)로의 데이터 전송 경로를 명시적으로 매핑하고 고객사에 투명하게 공개할 것*** — B2B CRS는 호텔 고객사가 최종 소비자에게 설명 책임을 지므로, CRS 벤더 단에서 데이터가 어디로 흘러가는지 불투명하면 그 부담이 고스란히 호텔로 전가된다. ③ ***"기기/시스템이 원래 기능과 무관한 정보까지 스캔·수집하고 있지 않은가"***를 주기적으로 점검하는 것 — ACR처럼 정당화된 기능 뒤에 목적 외 수집이 슬며시 얹히는 패턴은 CRS의 로깅·모니터링 기능에도 똑같이 적용될 수 있는 경고다.

## 연관 자료

- [[2026-09-07-tving-3954-account-data-breach]] — 같은 "사용자 동의 없는 데이터 노출" 축이지만, 외부 침해 대 설계된 수집이라는 정반대 원인 비교

## 한 달 뒤 회고

*(2026-10-08 즈음 — LG의 공식 대응이 나왔는지, 국내외 개인정보보호 당국의 조사·제재 움직임이 있었는지, Gamers Nexus 영상 원본을 직접 확인해 이 노트의 수치·인용이 정확했는지 점검.)*
