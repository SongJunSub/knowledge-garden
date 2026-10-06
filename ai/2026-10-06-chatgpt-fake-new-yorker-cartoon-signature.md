---
title: "ChatGPT, 가짜 뉴요커 만화에 실제 만화가 서명까지 넣음 (Nieman Lab) — 콘텐츠를 복제한 게 아니라 '누가 그렸는가'라는 신원 자체를 복제했다"
source_title: "ChatGPT is adding real cartoonists' signatures to fake New Yorker cartoons"
source_url: "https://www.niemanlab.org/2026/10/chatgpt-is-adding-real-cartoonists-signatures-to-fake-new-yorker-cartoons/"
source_name: "Nieman Lab (Nieman Foundation, Harvard)"
referrer_url: "https://news.hada.io/topic?id=34856"
published_at: "2026-10 초 (WebSearch 교차확인, 정확한 날짜 미확인)"
summarized_at: "2026-10-06"
category: "ai"
tags: ["chatgpt", "openai", "copyright", "new-yorker", "cartoonists", "attribution", "image-generation", "condé-nast"]
---

# ChatGPT, 가짜 뉴요커 만화에 실제 만화가의 서명까지 넣음

> 출처: [ChatGPT is adding real cartoonists' signatures to fake New Yorker cartoons](https://www.niemanlab.org/2026/10/chatgpt-is-adding-real-cartoonists-signatures-to-fake-new-yorker-cartoons/) (Nieman Lab) · GeekNews(id=34856) 경유 · 정리일 2026-10-06

> **출처 한계**: `news.hada.io`와 1차 소스 `niemanlab.org` 모두 이 세션에서 egress 차단으로 직접 열지 못했다. 대신 WebSearch로 **aiweekly.co, newsbytesapp.com, hyper.ai 등 3곳 이상의 독립 2차 매체가 Nieman Lab 기사를 거의 동일한 사실로 인용**하는 것을 교차확인했고, 핵심 사실(Brendan Loper 사례, 15명 이상의 만화가, Condé Nast 라이선스 계약 범위, OpenAI의 가드레일 추가)은 이 교차확인을 근거로 적었다. 다만 **원문의 정확한 워딩, 발행 정확한 날짜, 기사에 언급된 더 상세한 사례(있다면)는 대조하지 못했다.** hada 댓글 수, HN/Lobsters 큐레이션 여부도 전혀 확인할 수 없었다.

## 한 줄 요약

**ChatGPT가 "뉴요커 스타일 만화"를 생성할 때 실제 뉴요커 만화가들의 펜네임·서명을 ***허락도 보상도 없이*** 그림 구석에 붙여, 그 만화가들이 그리지도 않은 그림에 대해 낯선 사람들로부터 "이거 당신 작품이냐"는 문의를 받는 상황까지 벌어졌다 — AI 저작권 논쟁이 "스타일을 베꼈는가"에서 "신원을 사칭했는가"로 한 단계 더 들어간 사례다.**

## 핵심 포인트

- **Brendan Loper 사례** — 뉴요커 만화가 Brendan Loper의 펜네임 "BLOPER"가, 한 돌리 파튼 팬이 Facebook에 올린 ChatGPT 생성 만화 우측 하단에 그대로 등장했다. Loper는 이 그림을 그리지도 서명하지도 않았지만, ***낯선 사람들로부터 이게 당신 작품이 맞느냐는 이메일·DM을 받았다.***
- **최소 15명 이상의 피해 만화가** — Harry Bliss, Emily Flake, Joe Dator, Pat Byrnes, Peter Vey, Jason Adam Katzenstein 등 15명 이상의 뉴요커 만화가 서명이 동의·보상 없이 ChatGPT 출력물에 재현됐다.
- **라이선스 계약이 명시적으로 막았던 영역** — OpenAI가 2024년 Condé Nast(뉴요커 발행사)와 맺은 라이선싱 계약은 ***만화를 학습 데이터로 쓰는 것을 명시적으로 허용하지 않았다.*** 그런데도 모델은 "BLOPER" 같은 구체적 펜네임을 재현해낸다 — 계약 범위와 모델이 실제로 아는 것 사이의 간극을 보여준다.
- **지적받은 뒤에야 움직인 가드레일** — 문제가 제기된 뒤 ChatGPT는 "뉴요커 스타일" 만화를 요청하면 ***"이 요청은 제3자 콘텐츠와의 유사성에 관한 가드레일을 위반할 수 있습니다"*** 라는 경고를 띄우기 시작했다. 사전 설계가 아니라 사후 대응이다.

## 인상 깊은 문장

> "낯선 사람들이 내게 '이거 당신이 그린 거 맞아요?'라고 물어보기 시작했다." (Brendan Loper, WebSearch로 교차확인된 2차 인용 — Nieman Lab 원문의 정확한 인용 워딩은 대조하지 못했다.)

## 댓글

**hada 댓글 수는 egress 차단으로 확인 불가.** HN·Lobsters 별도 토론 스레드가 있었는지도 특정하지 못했다. 다만 AI 전문 뉴스레터(aiweekly.co 등)가 "signature scandal"이라는 표현을 써서 다룬 걸 보면, AI 업계 안에서는 가볍지 않게 받아들여진 것으로 보인다(정량적 근거는 없음, n=1 간접 증거).

## 내 생각 · 적용점

### 핵심 전이 1 — "표절"이 스타일 복제에서 신원 사칭으로 넘어간 구체적 증거

[[2026-05-21-axelk-ai-is-plagiarism-at-scale]]은 "AI는 그저 더 큰 규모의 무단 표절"이라고 주장했는데, 이번 사례는 그 주장이 추상적 비유가 아니라 ***말 그대로*** 작동한다는 걸 보여준다. 스타일을 흉내 내는 데서 멈추지 않고, 실존 인물의 서명(= 신원 표식)까지 복제해 "이게 그 사람이 그린 것"이라는 거짓 신뢰를 만들어낸다. 표절의 정의를 "텍스트·이미지의 유사성"에서 "귀속(attribution)의 사칭"으로 넓혀야 할 이유가 생긴 셈이다.

### 핵심 전이 2 — "여론에 알려지기 전까지는 조용히 넘긴다"는 동일 패턴

[[2026-09-28-openai-libgen-hacker-news-optics-authors-guild]]는 OpenAI 내부 메모가 "저작권 위법성보다 해커뉴스에 알려지는 걸 더 걱정했다"는 사실을 드러냈다. 이번 사례에서 ChatGPT가 가드레일을 추가한 시점도 "문제가 제기된 뒤"다 — 선제적 설계가 아니라 외부 지적이 행동을 바꾸는 동일한 함수관계가 반복된다. 이 레포에서 반복해서 관찰되는 "OpenAI 대응 함수는 여론 노출의 함수"라는 패턴에 또 하나의 데이터 포인트를 더한다.

### 핵심 전이 3 — Anthropic의 콘텐츠 표시와 정반대 사례

[[2026-08-12-claude-ai-content-marking]]은 Claude가 EU AI Act에 맞춰 ***AI 생성물에 보이지 않는 워터마크·C2PA 메타데이터를 넣어 "이건 AI가 만들었다"를 밝히는*** 쪽으로 움직인 사례였다. ChatGPT의 뉴요커 만화 서명 사건은 정확히 반대 방향이다 — "이건 AI가 만들었다"를 밝히는 게 아니라 "이건 특정 인간이 만들었다"는 거짓 신호를 적극적으로 생성한다. 같은 회사(OpenAI/Anthropic 경쟁 구도)가 콘텐츠 출처 투명성에 대해 정반대 결과를 내는 걸 보면, 워터마킹 정책만으론 이런 종류의 사칭을 막지 못한다는 게 드러난다.

## 호스피탈리티 / CRS 적용 포인트

**직접 적용은 멀지만, "AI 출력물에 실제 사람의 신원 표식이 자동으로 섞여 나올 수 있다"는 원칙은 CRS/호스피탈리티 SaaS 운영에도 옮겨볼 만하다.** 예를 들어 AI가 작성한 리뷰 응답·고객 커뮤니케이션 초안에 특정 호텔 GM이나 직원의 이름·서명 톤이 학습 데이터에서 새어 나와 자동으로 붙는다면, 받는 사람은 "그 사람이 직접 쓴 것"으로 오인할 수 있다. 사람이 쓴 것처럼 보이는 AI 출력물은 배포 전에 "누구 이름으로 나가는가"를 반드시 사람이 확인하는 단계가 있어야 한다는, 이번 사건의 가장 전이 가능한 교훈이다.

## 연관 자료

- [[2026-05-21-axelk-ai-is-plagiarism-at-scale]] — "AI는 더 큰 규모의 무단 표절"이라는 주장이 서명 복제로 구체화된 사례
- [[2026-09-28-openai-libgen-hacker-news-optics-authors-guild]] — "여론 노출을 걱정하는 내부 메모"와 동일한, 지적 후에야 움직이는 대응 패턴
- [[2026-08-12-claude-ai-content-marking]] — AI 생성물 출처 투명성 정책의 정반대 사례(대조)

## 한 달 뒤 회고

*(2026-11-06 즈음 — (1) 피해 만화가들이 실제로 법적 조치(소송·단체 항의)에 나섰는지 확인. (2) ChatGPT의 가드레일이 "뉴요커 스타일" 외 다른 유명 작가군에도 확장됐는지 점검. (3) Condé Nast가 라이선싱 계약을 재협상하거나 공개 대응을 냈는지 확인.)*
