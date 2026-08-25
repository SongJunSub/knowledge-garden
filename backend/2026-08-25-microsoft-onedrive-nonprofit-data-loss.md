---
title: "17만 비영리단체가 OneDrive 데이터를 잃었다 (Slate) — 무료 티어 고객에게 종료 통지가 실제로 닿았는지는 벤더가 증명할 책임이다"
source_title: "Microsoft made a quiet change to a popular software grant. Small nonprofits lost everything."
source_url: "https://slate.com/technology/2026/08/microsoft-software-nonprofit-data-delete.html"
source_name: "Slate (Technology, 저자명 미확인)"
referrer_url: "https://news.hada.io/topic?id=32843"
published_at: "2026-08"
summarized_at: "2026-08-25"
category: "backend"
tags: ["saas-lockin", "data-retention", "vendor-policy-change", "onedrive", "backup-strategy", "notification-design", "nonprofit-tech", "microsoft-365"]
---

# 17만 비영리단체가 OneDrive 데이터를 잃었다 (Slate)

> 출처: [Microsoft made a quiet change to a popular software grant. Small nonprofits lost everything.](https://slate.com/technology/2026/08/microsoft-software-nonprofit-data-delete.html) (Slate · Technology) · 정리일 2026-08-25
> **출처 한계**: `news.hada.io`가 이번 세션 네트워크 egress 정책상 차단돼 GeekNews 원문 페이지를 열지 못했다. Slate 원문도 동일하게 차단됐고, `cybernews.com`·`techradar.com`·`theregister.com`·`techcommunity.microsoft.com`·`it-connect.tech`·`mindcron.com`·`saasrise.com`·`news.ycombinator.com` 등 시도한 후속 매체·1차 커뮤니티 스레드도 전부 차단이었다. 아래 내용은 **WebSearch 스니펫을 여러 매체(Slate·cybernews·techradar·The Register)에서 교차 조회해 재구성**한 것이며, Slack 발췌가 사실상 가장 밀도 높은 확정 정보로 취급됐다. 인용부호로 옮긴 문장은 검색 스니펫에 그대로 나온 표현이지만 **전후 문맥·정확한 위치는 대조 검증하지 못했다.** Slate 기사 저자명은 검색으로 확인하지 못해 비워둔다.

## 한 줄 요약

**Microsoft가 2025년 5월 비영리단체 대상 무료 Microsoft 365 Business Premium·Office 365 E1 그랜트를 단계적으로 종료하겠다고 공지하고 2025년 7월 1일 이후 갱신 건부터 적용했는데, 그 갱신 확인 이메일 자체가 종료 사실을 언급하지 않았고 이후 별도 리마인더도 없었던 단체들이 있었다. 그 결과 최대 약 17만 1,000곳의 소규모 비영리단체가 대비 없이 OneDrive 데이터를 잃었다(Microsoft 미확인 수치). 기후테크 벤처 비영리 Canopy는 2025년 10월 갱신 시 "2026년 10월 4일까지 접근 유지"라는 확인 메일을 받았는데도 2026년 6월 11일 로그인하니 모든 파일이 사라져 있었다 — 확정 접근일보다 넉 달 가까이 이르게.**

## 핵심 포인트

- **타임라인** — 2025-05-14: Microsoft가 두 무료 그랜트(M365 Business Premium, Office 365 E1) 종료 공지. 2025-07-01 이후 갱신 건부터 단계적 종료 적용. 2026년 여름: 삭제 물결이 실제로 표면화.
- **통지 vs 수신의 간극** — Microsoft는 "갱신 전 다른 상품으로 전환하라고 강력히 권고했다(strongly advised)"는 입장이지만, 확인된 사례들에서 **갱신 확인 이메일 자체가 종료 언급 없이 발송**됐고 이후 리마인더도 없었다. 관리자 계정으로만 발송되는 관행, 스팸함으로 분류되는 사례 등이 "통지했다"와 "닿았다" 사이 간극의 원인으로 거론된다.
- **Canopy 사례(가장 구체적으로 확인된 케이스)** — 공동창업자 겸 IT 담당 Ronald Khosla가 2025년 10월 라이선스를 갱신했고 Microsoft로부터 **"2026-10-04까지 접근 유지"**를 확인하는 메일을 받음. 이후 별다른 경고 없이 지내다 **2026-06-11 로그인 시 전체 데이터 삭제 확인.** Microsoft는 처음엔 파일 복구가 가능하다고 했다가, 이후 **영구 소실**이라고 정정.
- **또 다른 사례** — 아동 대상 헬스케어 비영리단체가 **500GB 데이터와 앱 2개 접근권**을 통지 없이 잃었다는 인터뷰가 보도됨(스니펫 기준, 세부 대조 불가).
- **규모 논쟁** — "17만 1,000개 단체가 모든 것을 잃었다"는 수치는 Microsoft 내부 담당자발로 보도됐으나 **Microsoft가 공식 확인한 수치는 아니다.**
- **Microsoft의 공식 입장** — 그랜트를 "지원 프로그램을 단순화하기 위해 종료(retired to streamline our grant offerings and simplify our grant portfolio)"했으며, 갱신일 전 전환을 강력히 권고했다는 입장.
- **원 공지 시점 보도** — The Register가 2025-05-16에 이미 "Microsoft pulls MS365 Business Premium from nonprofits" 제목으로 정책 종료 자체를 보도했다(egress 차단으로 직접 대조는 못함) — 정책 변경 발표는 1년도 더 전부터 공개돼 있었다는 뜻이라, 논쟁의 핵심은 "발표했는지"가 아니라 **"발표가 실제로 영향받는 개별 단체에 도달·이해됐는지"**로 좁혀진다.

## 인상 깊은 문장

> "Microsoft's admin emails often end up in the spam folder, which may explain why organizations missed the warning messages."

> "The renewal message did not mention any information about the phased withdrawal of the offer, and no reminder would have been sent afterward."

> Microsoft 공식 입장: "retired to streamline our grant offerings and simplify our grant portfolio"

**세 문장 모두 WebSearch 스니펫에서 재구성 — Slate 원문 페이지를 직접 열지 못해 전후 문맥은 대조 검증하지 못했다.**

## 댓글

- **GeekNews**: `news.hada.io` 접근 차단으로 **댓글 수·논조 확인 불가.**
- **Hacker News**: "Over 170k Nonprofits Lost All Their Data. Is Microsoft to Blame?"(item id=49411395) 제출이 실재함을 검색으로 확인 — GeekNews 발췌 제목과 사실상 동일해 이 HN 스레드가 GeekNews 소개의 근거로 보인다. 다만 `news.ycombinator.com` 자체가 이번 세션 egress 차단이라 **포인트·댓글 수·상위 댓글 논조는 확인 불가.**
- **Lobsters**: 검색으로 개별 제출을 찾지 못했다. **큐레이션 여부 확인 불가.**
- **읽을 때 감안**: ①"17만 1,000곳" 수치는 Microsoft가 공식 확인한 게 아니라 내부 관계자발 보도이며 정정될 여지가 있다. ②이 요약에 인용된 구체 사례(Canopy, 헬스케어 비영리)는 소수의 인터뷰 사례이지 무작위 표본이 아니다 — "통지가 전혀 없었다"는 단체와 "받았지만 놓쳤다"는 단체가 실제로 어떤 비율인지는 이 요약의 근거만으로는 알 수 없다. ③이 노트 자체가 원문 매체(Slate) 한 글자도 직접 못 읽고 검색 스니펫만으로 재구성됐다는 한계를 다시 강조한다.

## 내 생각 · 적용점

### 핵심 전이 1: [[2026-08-10-planetscale-parallel-backups]]가 보여준 "정상"의 반대편에 이 사건이 있다

PlanetScale 노트의 핵심은 **"매 백업 주기마다 실제로 복원해봄으로써 복구 가능성이 저절로 검증된다"**는 설계였다. 그 노트가 좋다고 판단한 이유는 검증이 별도 절차가 아니라 파이프라인 자체에 내장돼 있다는 점이었다.

이 사건은 정확히 그 반대쪽 극단을 보여준다. 비영리단체들에게 OneDrive는 **유일한 원본이자 유일한 백업**이었다 — 클라우드 저장소가 곧 재해복구 계획이라는, 실무에서 흔한 암묵적 전제다. 그 전제가 벤더의 라이선스 정책 변경 한 번에 무너졌다. PlanetScale 노트를 이 사건 옆에 놓으면 원칙이 하나 더 선명해진다: **"복구 가능성을 스스로 검증하지 않는 저장소는, 그 저장소를 통제하는 주체의 비즈니스 의사결정에 종속된 저장소다."** 벤더가 기술적으로 안정적인 것과, 그 벤더가 언제까지나 지금 조건으로 내 데이터를 보관해줄 것이라는 가정은 별개다.

### 핵심 전이 2: [[2026-08-19-google-hotel-ads-third-party-rates-sunset]]와 구조가 완전히 같다 — "발표했다"와 "닿았다"의 간극

Google Hotel Ads 노트에서 다룬 사건은 벤더(Google)가 서드파티 요금 기능을 종료하며 **공식 문서로는 공지했지만, 그 공지가 영향받는 개별 파트너사에게 실제로 이해됐는지는 벤더 자료가 답하지 않는다**는 것이었다. 이번 Microsoft 사건은 그 구조를 데이터 손실이라는 훨씬 무거운 결과로 재현한다 — Microsoft도 "강력히 권고했다"는 입장이고 The Register 보도로 정책 자체는 1년 전에 이미 공개돼 있었지만, **갱신 확인 이메일에 정작 종료 사실이 빠져 있었다**는 구체 결함이 드러났다.

두 사건을 합치면 원칙이 하나 나온다: **"공지했다"는 벤더의 자기 서술이지 결과가 아니다. 검증 가능한 건 "그 공지가 갱신·결제 확인처럼 실제로 열어보는 채널에 실렸는가"뿐이다.** 이번 사건에서 그 채널(갱신 확인 메일)이 정확히 실패했다는 게 Google Hotel Ads 사건보다 한 단계 더 구체적인 반증 사례다.

### 핵심 전이 3: [[2026-08-02-session-portability-inference-api-lockin]]의 "삭제 테스트"가 이 사건에서 최악의 형태로 실현됐다

그 노트는 AI 추론 세션에 대해 다섯 가지 이식성 테스트 중 하나로 **"삭제(사용자가 서버 측 모든 사본을 식별·제거할 수 있는가)"**를 제시했다. 이 사건은 그 질문을 뒤집는다 — 문제는 사용자가 삭제를 통제하지 못하는 게 아니라, **벤더가 통지 없이 일방적으로 삭제를 실행했다**는 것이다. 도메인은 다르지만(AI 세션 vs 클라우드 스토리지) 근본 구조는 같다: **운영 상태(내 데이터, 내 세션)의 물리적 소재가 나에게 속하지 않은 인프라에 있으면, 그걸 언제 어떻게 없앨지 결정하는 권한도 내게 없다.** 이 사건은 그 추상적 경고가 실제로 발생했을 때 얼마나 파괴적인지를 보여주는 실증 사례다.

## 호스피탈리티 / CRS 적용 포인트

- **구조적으로 온다에게도 같은 리스크가 있다.** 이 사건의 핵심 구조는 "무료·프로모션 티어 고객이, 벤더의 상업적 판단에 따른 정책 변경으로, 대비 없이 데이터를 잃는다"이다. 온다가 파트너 호텔에게 트라이얼·프로모션 요금제를 제공하는 구조라면, **그 요금제가 만료되거나 등급이 바뀔 때 예약 데이터·재고 설정·요금 히스토리가 어떻게 되는지**를 이 사건 기준으로 다시 점검할 필요가 있다 — "우리는 공지했다"가 아니라 "그 파트너 담당자가 실제로 여는 채널(로그인 시 배너, 갱신 청구서, 대시보드 알림)에 실제로 실렸는가"를 기준으로.
- **갱신 확인 메일에 종료 정보를 빠뜨린 것이 이 사건의 가장 구체적인 실패 지점이다.** 온다 쪽에 적용하면: 계약·요금제 갱신 확인 트랜잭션 메일(가장 열람률이 높은 채널)에 상태 변경·만료 예정 기능·데이터 보존 기한을 **자동으로 포함시키는 설계 원칙**으로 옮길 수 있다. 별도 캠페인성 공지 메일에만 의존하면 이번 사건과 같은 실패가 재현된다.
- **무료/할인 티어 파트너의 데이터 보존 기한과 백업 책임 소재를 명시적으로 정의해야 한다.** CRS는 예약·재고·요금 데이터가 곧 파트너의 비즈니스 자산이다 — 티어 다운그레이드·계약 해지 시 데이터가 며칠간 접근 가능한지, 그 뒤엔 정말로 삭제되는지, 파트너가 스스로 내보내기(export)할 수 있는 경로가 있는지는 계약서 조항이 아니라 **실제 알림 UX**로 검증돼야 한다는 게 이 사건의 교훈이다.
- **한편 이 사건에서 CRS로 직접 옮기기 어려운 부분도 있다.** 이번 사건 규모(17만 곳)는 Microsoft가 전 세계 비영리단체에 무료로 제공한 대규모 그랜트 프로그램을 종료한 결과라, 온다처럼 B2B 유료 계약 중심 구조에서는 "무료 그랜트 대량 종료"와 정확히 같은 시나리오가 재현되진 않는다. 다만 **"프로모션 조건 만료 시 통지 도달 여부"**라는 원칙 자체는 유료 계약에도 그대로 적용된다.

## 연관 자료

- [[2026-08-10-planetscale-parallel-backups]] — 대조군: 복구 가능성을 파이프라인에 내장해 검증하는 설계 vs 그 검증이 전무한 상태에서 벤더 정책에 데이터 전체를 맡긴 결과
- [[2026-08-19-google-hotel-ads-third-party-rates-sunset]] — 같은 구조("벤더는 공지했다고 주장 vs 실제 도달은 별개")가 이번엔 예약 채널이 아니라 데이터 자체에 적용된 사례
- [[2026-08-02-session-portability-inference-api-lockin]] — "삭제를 누가 통제하는가"라는 추상적 경고가 실제로 벌어졌을 때의 실증판

## 한 달 뒤 회고
*(2026-09-25 즈음: ①egress 차단이 풀리면 Slate 원문·HN 스레드를 직접 열어 인용문과 댓글 논조를 대조 확인했는지 ②"17만 1,000곳" 수치에 대한 Microsoft의 공식 반응이나 정정이 나왔는지 ③온다의 트라이얼/프로모션 티어 갱신 확인 메일에 실제로 만료·데이터 보존 정보가 포함돼 있는지 점검했는지 기록.)*
