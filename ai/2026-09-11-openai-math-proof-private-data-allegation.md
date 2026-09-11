---
title: "OpenAI의 비소식군 증명에 미공개 연구 대화 학습 의혹 제기 (Andreas Thom) — '직접 접근은 없었다'는 부인과 '학습 기여는 배제 못 한다'는 단서 사이의 간극"
source_title: "Andreas Thom's Mathstodon thread questioning OpenAI's non-sofic group proof"
source_url: "https://mathstodon.xyz/@andreasthom/117240535270608201"
source_name: "Mathstodon(Andreas Thom), officechai·Notebookcheck·QZ·Northeast Times 등 교차보도"
referrer_url: "https://news.hada.io/topic?id=33478"
published_at: "2026-09-10"
summarized_at: "2026-09-11"
category: "ai"
tags: ["openai", "research-ethics", "training-data", "andreas-thom", "sofic-groups", "ai-for-math", "user-privacy"]
---

# OpenAI의 비소식군 증명에 미공개 연구 대화 학습 의혹 제기 (Andreas Thom)

> 출처: [Andreas Thom's Mathstodon thread](https://mathstodon.xyz/@andreasthom/117240535270608201) (Andreas Thom, TU Dresden) · GeekNews(id=33478) 경유 · 정리일 2026-09-11

> **출처 한계**: `mathstodon.xyz`·`news.hada.io` 모두 이번 세션 egress 차단으로 원문을 직접 열람하지 못했다. officechai.com, Notebookcheck, QZ, Northeast Times, ai-tldr.dev, Wilson's Media 등 복수 매체의 WebSearch 스니펫을 교차 확인해 재구성했으며, 이 매체들 자체도 서로 다른 각도에서 같은 Mathstodon 스레드를 인용하고 있어 원 발언자(Thom)와 인용 매체 사이의 재인용 단계가 최소 1단계 존재한다. hada 댓글 수·논조, HN 큐레이션 여부는 확인하지 못했다. **발언자 확인**: TU Dresden 그룹이론학자 Andreas Thom 본인의 Mathstodon 게시물로 복수 매체가 일치해 보도하고 있어 발언 주체는 확실하다.

## 한 줄 요약

**OpenAI가 8월 발표한 "비소식군(non-sofic group)" 최초 구성 증명 — Gromov가 27년 전 제기한 미해결 문제를 푼 성과 — 이 Thom과 Gábor Kun의 2019년 논문(및 Kun의 2016년 결과)을 핵심 단계로 삼았는데, 정작 Thom 본인이 수개월간 ChatGPT와 나눈 미공개 연구 대화가 학습 데이터로 흘러들어 갔을 가능성을 OpenAI가 부정도 긍정도 명확히 하지 않고 있다는 게 이 사건의 핵심이다.**

## 핵심 포인트

- **증명의 뿌리** — OpenAI의 비소식군 증명은 Thom·Kun의 2019년 논문과 Kun의 2016년 선행 결과를 핵심 기술적 단계로 삼았다고 보도된다. 즉 OpenAI 모델이 "주류가 아니던" Thom 계열의 기법을 능숙하게 활용했다는 정황 자체는 양측이 공유하는 사실이다.
- **의심의 발단** — Thom은 드레스덴의 동료와 수개월간 "확장자 매칭 문제(expander matching problem)"와 자신·Kun 연구의 확장 방향을 ChatGPT 안에서 논의했다. 그 직후 OpenAI가 같은 계열의 문제를 자사 모델로 풀었다고 발표하자, ***"어떻게 주류가 아니던 내 기법을 이렇게 능숙히 썼을까"***라는 의문을 품었다.
- **두 개의 다른 질문, 하나의 뭉뚱그려진 답** — Thom은 OpenAI 연구자 Mark Sellke·Sébastien Bubeck에게 이메일로 (1) 자신의 대화가 학습 데이터로 쓰였는지, (2) 증명 과정에서 시스템이 그 대화에 직접 접근했는지를 **따로** 물었다. Sellke의 답변은 (2)에 대한 부인만 담았고, (1)에는 답하지 않았다고 Thom은 주장한다.
- **공개 반박과 그 안의 단서** — Bubeck은 이 의혹을 공개적으로 부인하며 "연구자도 에이전트도 그들이 공개하기 전까지 어떤 방식으로도 작업을 보지 못했다"고 밝혔다. 그런데 OpenAI는 동시에 ***"가능성은 낮지만, 그들의 제품 사용에서 파생된 비식별화 데이터가 모델 개선에 기여했을 가능성을 배제할 수 없다(while unlikely, we cannot rule out...)"***는 단서를 공식 입장에 포함시켰다 — "직접 접근 없음"이라는 강한 부인과 "학습 기여 가능성은 배제 못 함"이라는 약한 인정이 같은 발표 안에 공존한다.
- **Thom의 반론 — 비식별화가 곧 보호는 아니다** — Thom은 연구 대화에서 이름만 지운다고 해서 그 안의 수학적 아이디어 자체가 사라지는 건 아니라고 지적한다. 개인정보 보호 도구는 "누구인지"를 가리는 데 최적화돼 있지, "무엇을 연구 중인지"라는 미공개 지적 재산을 보호하도록 설계되지 않았다는 문제의식이다.
- **아직 "증명"은 아니다** — Thom 스스로도 이 시점에서 데이터 유용을 "입증했다"고 주장하지는 않는다. 대신 OpenAI에 부인의 근거를 공개하라고 요구하는 단계에 머물러 있다.

## 인상 깊은 문장

(WebSearch로 교차 확인된 매체 재인용, Mathstodon 원문 직접 열람은 못 함) OpenAI 공식 입장: "While unlikely, we cannot rule out that de-identified data derived from their usage of our products helped improve our models."

## 댓글

hada(GeekNews) 댓글 수·논조는 news.hada.io 접근 차단으로 확인하지 못했다. HN·Lobsters 큐레이션 여부도 확인하지 못했다. **출처 한계 및 이해관계**: Thom은 자신의 학술적 우선권·연구 프라이버시가 걸려 있는 당사자이고, OpenAI는 "차세대 모델이 27년 난제를 풀었다"는 홍보 서사가 걸려 있는 당사자다 — 양쪽 모두 이해관계가 뚜렷하므로 이 노트는 "누가 옳은가"를 판정하지 않고 각자의 주장과, 그 주장들 사이의 논리적 간극(직접 접근 부인 vs 학습 기여 배제 못 함)만 정리한다. 복수 매체(officechai, Notebookcheck, QZ, Northeast Times)가 거의 같은 사실관계를 보도하고 있어 사건 자체의 존재는 신뢰할 만하지만, 전부 같은 1차 소스(Thom의 Mastodon 스레드)에서 파생된 재인용이라 독립적 취재라기보다 동일 소스의 확산에 가깝다.

## 내 생각 · 적용점

### 핵심 전이 1 — "직접 접근 없음"과 "학습 기여 배제 못 함"의 이중 부인 구조가 나비에-스토크스 사건과 토씨 하나 다르지 않다

[[2026-09-09-navier-stokes-proof-controversy]]에서 OpenAI는 Buckmaster·Alpöge의 미공개 작업에 대해 "우리(연구자와 에이전트 모두)는 그들이 공개적으로 발표하기 전까지 어떤 경로로도 그들의 작업을 보지 못했다 — 특히 이 문제를 풀기 위해 특정 사용자 데이터에 접근한 적이 없다"고 밝혔다. 이번 Thom 사건에서도 정확히 같은 형태의 강한 부인("직접 접근 없음")이 등장하고, 거기에 "비식별화 데이터의 학습 기여는 배제 못 함"이라는 동일한 유형의 단서가 따라붙는다. **두 사건은 완전히 다른 수학 문제(나비에-스토크스 vs 비소식군)이자 다른 시점·다른 당사자이지만, OpenAI의 대응 문구 패턴이 반복된다는 점이 이 사건을 독립적으로 기록할 값어치를 만든다** — "특정 사용자 데이터 접근 없음"이라는 부인이 "학습 파이프라인 전체에 데이터가 흘러들어 갔을 가능성"까지 반박하지는 않는다는 논리적 간극이, 우연이 아니라 회사 차원의 일관된 답변 전략일 가능성을 시사한다.

### 핵심 전이 2 — Tao가 경고한 "채굴"의 또 다른 얼굴: 문제가 아니라 풀이 기법 자체가 채굴 대상이 될 수 있다

[[2026-09-09-tao-ai-mining-unsolved-math-problems]]는 "좋은 미해결 문제" 자체가 비재생 자원처럼 소진된다고 경고했다. 이번 사건은 그 경고를 한 겹 더 파고든다 — 채굴되는 게 "문제"가 아니라 한 연구자가 수개월에 걸쳐 다듬어온 ***"주류가 아닌 풀이 기법"*** 그 자체일 수 있다는 것이다. 문제는 공개된 상태로 존재하지만, 그 문제를 어떤 각도로 공략할지에 대한 통찰은 연구자 개인의 미공개 자산이다. AI 기업이 사용자와의 대화를 통해 그 통찰까지 흡수한다면, Tao가 말한 "난이도 지형의 평탄화"는 문제 선별 단계가 아니라 풀이 전략 단계에서도 일어날 수 있다는 뜻이 된다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 멀다 — CRS 팀이 학술 연구 대화의 학습 데이터 전용 여부를 다툴 일은 없다. 다만 전이 가능한 원칙 하나: ***"비식별화(anonymization)는 개인정보 보호이지 영업비밀·노하우 보호가 아니다"***라는 구분은 온다가 파트너사(호텔·채널사)와 AI 도구를 공유하거나, 고객 데이터를 활용해 자체 AI 기능을 개선할 때 그대로 적용된다 — 예약 데이터에서 고객 이름·연락처를 지웠다고 해서 특정 호텔의 가격 전략·재고 운용 노하우까지 "익명화"되는 것은 아니다. 이 사건이 주는 가장 정직한 교훈은, 데이터 활용 약관에서 "개인식별정보 비식별화"와 "고객사 고유의 비즈니스 로직·전략 데이터"를 같은 범주로 뭉뚱그리지 않아야 한다는 것이다.

## 연관 자료

- [[2026-09-09-navier-stokes-proof-controversy]] — 같은 "직접 접근 부인 + 학습 기여 배제 못 함"이라는 이중 부인 문구 패턴의 선행 사례
- [[2026-09-09-openai-navier-stokes-proof]] — 같은 시기 OpenAI의 또 다른 수학 증명 발표 본편(비소식군과는 별개 사건)
- [[2026-09-09-tao-ai-mining-unsolved-math-problems]] — "채굴" 대상이 문제뿐 아니라 풀이 기법 자체일 수 있다는 이 사건의 함의와 연결

## 한 달 뒤 회고

*(2026-10-11 즈음 — OpenAI가 Thom의 "부인의 근거 공개" 요구에 실제로 응했는지, 학습 데이터 사용 여부에 대한 제3자 검증(예: membership inference 분석)이 나왔는지, 이 패턴의 부인 문구가 이후 다른 논란에서도 반복되는지 점검.)*
