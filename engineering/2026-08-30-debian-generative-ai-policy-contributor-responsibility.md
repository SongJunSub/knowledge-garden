---
title: "Debian, '생성형 AI의 책임 있는 사용' 채택 — 8개 제안 중 이긴 건 금지가 아니라 '기존 기준 그대로, 책임은 기여자에게'"
source_title: "General Resolution: LLM usage in Debian"
source_url: "https://www.debian.org/vote/2026/vote_002"
source_name: "Debian 공식 투표 페이지 (debian.org)"
referrer_url: "https://news.hada.io/topic?id=33010"
published_at: "2026-08-29"
summarized_at: "2026-08-30"
category: "engineering"
tags: ["debian", "open-source-governance", "generative-ai-policy", "contributor-responsibility", "license", "condorcet-vote", "ai-code-policy"]
---

# Debian, '생성형 AI의 책임 있는 사용' 채택 — 8개 제안 중 이긴 건 금지가 아니라 '기존 기준 그대로, 책임은 기여자에게'

> 출처: [General Resolution: LLM usage in Debian](https://www.debian.org/vote/2026/vote_002) (Debian · 공식 투표 결과 페이지) · 정리일 2026-08-30

**출처 한계**: 이 세션에서 `news.hada.io`·`www.debian.org`·`lwn.net`·`www.phoronix.com`·`linuxiac.com`·`www.gamingonlinux.com`·`noise.getoto.net`가 전부 egress 차단됐다 — 최근 [[2026-08-28-sourcehut-bans-llm-generated-content]]에서 확인한 것과 같은 세션 패턴이다. hada 원문 페이지와 댓글은 직접 읽지 못했고, 본문은 WebSearch가 반환한 다수 매체(LWN.net 인용, Phoronix, Linuxiac, TechTimes, LinuxCompatible 등)의 교차 인용 스니펫으로 재구성했다. **핵심 조항 문구(비공개 정보 조항, "기존 기준 그대로 적용" 문구, 공개 권장·의무 아님)는 서로 다른 검색 결과가 거의 동일한 원문을 인용하며 일관되게 확인돼 신뢰도가 높다.** 다만 두 가지는 근사치로만 확보했다 — ①최종 표차는 "Choice 5가 Choice 2를 203표 대 148표(55표 차)로, 전체적으로는 약 64% 대 36% 구도"로 보도됐는데, 이는 콩도르세(Condorcet) 방식의 페어와이즈 비교 결과를 매체가 단순화해 전달한 수치라 **공식 페이지의 전체 득표 매트릭스 원문 대조는 못했다.** ②"8개 제안"이라는 표현은 실질 제안 8개 + 기본 선택지("추가 논의/현상 유지")를 합쳐 매체마다 "8개" 또는 "9개 선택지"로 다르게 세는데, 이 노트는 사용자 제공 프레이밍과 다수 매체가 쓰는 "8개 제안"을 따르되 이 차이를 밝혀둔다.

## 한 줄 요약

**Debian이 콩도르세 방식 일반결의(GR) 투표에서 8개 제안 중 Marc Haber의 "생성형 AI의 책임 있는 사용(Responsible Use of Generative AI)"을 최종 채택했다 — 골자는 ***"AI 사용을 금지도 승인도 하지 않되, 어떤 도구로 만들었든 모든 기여는 기존과 동일한 품질·정확성·유지보수성·법적 준수 기준을 통과해야 한다"***는 것. 즉 이번 결정의 실질은 "새 AI 규제"가 아니라 ***"결과물의 책임은 도구가 아니라 그걸 제출한 기여자에게 있다"***는 원칙의 재확인이다. 여기에 비공개 정보를 외부 AI 서비스로 보내지 말라는 조항 하나만 명시적으로 추가됐다.**

## 핵심 포인트

- **채택된 조항의 핵심** — ***"Debian은 소프트웨어·패키징·문서 등의 개발·유지보수·문서화에 생성형 AI 도구를 사용하는 것을 승인하지도 금지하지도 않는다."*** 대신 ***"제출되는 모든 기여는, 어떤 도구로 어떻게 만들어졌든 상관없이, 품질·정확성·유지보수성·법적 준수의 동일한 기준을 충족해야 한다"***는 원칙을 못박았다. 규제를 새로 만드는 대신 **기존 기준의 적용 범위를 AI 산출물까지 명시적으로 넓힌 것**에 가깝다.
- **책임 소재를 기여자에게 고정** — ***"기여자는 Debian에 반영하기 전에 AI가 지원한 결과물을 이해·검토·테스트하고, 필요하면 수정할 것으로 기대된다."*** 더 나아가 ***"적절한 인간 검토 없이 AI 생성물을 그대로 받아들이거나 업로드하는 것은 Debian의 기존 개발 관행과 맞지 않는다"***고 명시 — "몰랐다"는 변명을 원천 차단하는 문장이다.
- **공개(disclosure)는 권장이지 의무가 아님** — ***"Debian은 기여자가 AI 지원 여부를 공개하도록 권장하지만, 의무화하지는 않는다."*** 투명성보다 결과물 품질에 초점을 둔 실용적 절충.
- **비공개 정보 조항 — 이번에 새로 명문화된 유일한 실질 규제** — 기밀 정보, 엠바고된 보안 취약점 정보, 자격증명, 암호화 키, 비공개 커뮤니케이션 등 ***"Debian 프로젝트·인프라·커뮤니티와 관련된 비공개 자료가 명시적으로 승인되지 않은 채 제3자 AI 서비스로 유출되지 않도록"*** 요구한다. 사실상 이 조항이 이번 GR에서 "새로 생긴" 유일한 강행 규범이다.
- **투표 결과와 표차** — 콩도르세 방식으로 8개 제안 + 기본 선택지를 놓고 순위 투표를 진행, **채택안(Choice 5)이 차점 "AI 지원 기여 조건부 허용"안(Choice 2)을 203표 대 148표(55표 차)로 눌렀고**, 전체 성향은 대략 **찬성(허용) 64% : 금지·강한 억제 36%**로 갈렸다. 가장 강경한 전면 금지안(Matthias Geiger)은 정족수(quorum)조차 채우지 못하고 초반 탈락했다.
- **기각된 반대 극단 — 환경 근거 금지안** — Holger Levsen이 제안한, LLM의 환경 비용·윤리적 우려를 이유로 사용 자제를 권고하는 안(가장 많이 得票한 대안 중 하나, 최대 154표까지 선호됨)도 최종적으로는 채택안에 밀렸다.

## 인상 깊은 문장

> "Debian neither endorses nor prohibits the use of generative AI tools in the development, maintenance, or documentation of software, packaging, documentation, and other media published within the Debian Project."

> "The Debian Project nevertheless expects that all contributions submitted to Debian, regardless of how and with which tools they were produced, satisfy the same standards of quality, correctness, maintainability, and legal compliance."
> (이 GR의 실질적 핵심 — "AI 규제"가 아니라 "기존 기준을 도구 불문 원칙으로 재확인"한 문장.)

> "Blindly accepting or uploading AI-generated material without appropriate human review is inconsistent with Debian's established development practices."

> "...confidential information, private communications, security-sensitive information (such as embargoed information about security bugs that is not yet public), cryptographic keys, credentials, and other non-public material relating to the Debian Project, its infrastructure, or its community are not disclosed to third-party AI services unless such disclosure has been explicitly authorized..."
> (이번 GR에서 사실상 유일하게 "새로" 생긴 강행 규범.)

## 댓글

**hada 댓글 논조는 원문 페이지 접근 불가로 확인 못했다(위 출처 한계 참고).** 대신 확인 가능했던 큐레이션 신호:
- **LWN.net**이 투표 개시 시점부터 결과 발표까지 두 편의 기사로 추적 보도 — 리눅스/오픈소스 전문 매체의 지속적 관심을 보여준다(단, 기사 원문은 egress 차단으로 직접 못 읽음).
- **Hacker News에 최소 두 개 스레드** 확인 — 투표 개시 시점 스레드("Debian has begun voting on the future of AI/LLM contributions")는 검색 결과상 141개 댓글·158포인트로 상당한 논의가 있었던 것으로 보인다. 다만 이는 최종 결과가 아니라 **투표 시작 시점의 스레드**이고, `news.ycombinator.com` 자체가 egress 차단이라 **댓글 내용은 검증하지 못했다.**
- **Lobsters에도 결과 발표를 다룬 스레드**("LLM usage in Debian neither endorsed nor prohibited")가 존재함을 검색으로 확인했으나, `lobste.rs`가 차단돼 논조는 확인 불가.
- **읽을 때 감안** — ①검색 스니펫이 전한 "집행 메커니즘 논쟁"(HN 논의 중 "금지를 어떻게 집행할 것인가 — 결국 선의에 의존"이라는 지적)은 채택된 "허용" 안에도 그대로 적용된다: 책임을 기여자에게 지운다고 해서 **위반 여부를 누가 어떻게 판정할지**는 이 GR도 답하지 않는다. ②"64% 대 36%"라는 단순화된 비율은 콩도르세 페어와이즈 비교의 실제 표 구조(여러 선택지 간 순위 비교)를 손실 압축한 수치라는 점을 감안해야 한다.

## 내 생각 · 적용점

### 핵심 전이 1 — 이번 시즌 오픈소스 AI 코드 정책 계보에서, Debian은 처음으로 "허용" 쪽으로 기운 사례다

[[2026-08-28-sourcehut-bans-llm-generated-content]]에서 정리했듯 최근 오픈소스 진영의 AI 코드 정책은 저작권 임계값([[2026-08-02-gcc-ai-policy]], GCC의 "약 15줄" 기준), 소송 전략(Oracle/OpenJDK 금지), 정체성(Codeberg), 정치·윤리(SourceHut의 디스킬링·노동/환경 근거 전면 금지) 네 갈래로 모두 **금지 또는 제한** 방향이었다. Debian의 이번 결정은 같은 "AI 생성 코드를 오픈소스에 어떻게 다룰 것인가"라는 질문에 **정반대 방향의 답 — "막지 않되, 기존 기준을 그대로 통과시켜라"**를 내놓은 다섯 번째 사례다. 흥미로운 건 Debian도 SourceHut과 같은 우려(품질 저하·검토 부담)를 알고 있었지만, 결론은 "도구를 막는" 게 아니라 **"결과물 검증 책임을 기여자에게 명시적으로 고정하는"** 쪽으로 갔다는 점이다 — 같은 문제의식에서 규제의 방향이 갈리는 걸 이번 시즌 다섯 사례를 나란히 놓고 보니 확인할 수 있다.

### 핵심 전이 2 — "도구 불문 동일 기준"은 [[2026-04-29-who-owns-the-code-claude-wrote]]가 법적으로 던진 질문에 대한 프로젝트 거버넌스 차원의 실무적 답이다

그 노트가 분해한 세 축(저작권 성립 / 고용 관계 / 라이선스 오염) 중, Debian의 GR은 정확히 **"라이선스 오염"과 "meaningful human authorship"** 축을 정면으로 다룬다. Legal Layer 글의 결론 — *"의미 있는 수정 없이 받아들인 AI 출력 코드는 누구의 저작권으로도 보호되지 않을 수 있다"* — 을 Debian은 법정 다툼 이전에 **프로젝트 내부 규범으로 선제 흡수**했다: "AI가 만들었든 아니든 품질·법적 준수 기준은 동일"이라는 문장은 결국 **"기여자가 의미 있게 검토·수정하지 않은 산출물은 애초에 기여로 인정하지 않겠다"**는 뜻이고, 이건 그 노트가 권한 "PR 설명에 AI가 만든 부분/내가 의미 있는 결정을 한 부분을 명시하는 습관"과 정확히 같은 문제의식을 프로젝트 규모로 확장한 것이다.

### 핵심 전이 3 — 정직한 급소: 집행 메커니즘 부재는 GCC의 "파생 여부 판정 불가능" 문제와 같은 자리에서 반복된다

[[2026-08-02-gcc-ai-policy]] 노트에서 짚었듯 GCC 정책의 가장 약한 지점은 **"이 코드가 LLM에서 파생됐는가"를 검증할 방법이 없다**는 것이었다. Debian의 이번 GR도 동일한 구멍을 안고 있다 — "책임은 기여자에게 있다"고 선언은 했지만, **어떤 기여가 "적절한 인간 검토 없이" 제출됐는지를 사후에 어떻게 판정·집행할지는 GR 본문에 없다.** 공개(disclosure)조차 의무가 아니라 권장이라, 위반 사실이 드러나는 경로는 결국 "결과물이 나쁠 때 눈에 띄는 것"뿐이다. 좋은 원칙 선언과 실제 집행 가능성은 다른 난이도의 문제라는 게, 이번 시즌 오픈소스 AI 정책 다섯 사례 전부에서 반복되는 공통의 약점이다.

## 호스피탈리티 / CRS 적용 포인트

- **비공개 정보 조항은 그대로 옮겨 쓸 수 있는 문구다.** 온다는 오픈소스 프로젝트가 아니지만, "고객 데이터·계약 정보·엠바고된 보안 이슈·자격증명을 제3자 AI 서비스로 보내지 말라"는 Debian의 조항은 CRS/PMS가 다루는 고객 PII·예약 데이터에 그대로 적용 가능한 문장이다. 사내 AI 사용 정책 초안에 "명시적으로 승인되지 않은 비공개 자료는 외부 AI로 보내지 않는다"는 조항을 이 정도 구체성으로 넣을 근거로 인용할 만하다.
- **"도구 불문 동일 기준" 원칙도 실무적으로 유용하다.** AI가 짰든 사람이 짰든 코드 리뷰·QA 기준을 따로 두지 않고, "제출자가 검토·테스트했는지"만 확인하는 방식은 별도의 AI 전용 심사 프로세스를 새로 설계하는 것보다 가볍다 — 다만 전이 3에서 짚었듯 **집행(누가 어떻게 확인할지)은 이 원칙만으로는 해결되지 않는다는 한계도 같이 가져와야 한다.**
- **억지로 더 끌어올 접점은 없다.** Debian은 자원봉사자 중심의 비영리 오픈소스 프로젝트고, 온다는 영리 B2B SaaS라 조직 구조·책임 소재의 법적 성격(고용계약 vs 자원봉사)이 다르다 — [[2026-04-29-who-owns-the-code-claude-wrote]]가 짚은 "고용계약 IP 조항"의 무게는 Debian 사례엔 아예 없는 축이라, 그 차이를 인지한 채로만 이 사례를 참고해야 한다.

## 연관 자료
- [[2026-08-28-sourcehut-bans-llm-generated-content]] — 이번 시즌 AI 코드 정책 계보, Debian은 유일하게 "허용" 방향으로 기운 다섯 번째 사례
- [[2026-08-02-gcc-ai-policy]] — 저작권 임계값 기준 정책과의 대비, "집행 메커니즘 부재"라는 같은 약점의 반복
- [[2026-04-29-who-owns-the-code-claude-wrote]] — "meaningful human authorship"이라는 법적 질문에 대한 프로젝트 거버넌스 차원의 선제 대응

## 한 달 뒤 회고
*(2026-09-30 즈음 — ①채택된 GR이 Debian 개발자 가이드라인(Developer's Reference)에 실제로 반영됐는지, ②"적절한 검토 없는 AI 산출물" 위반 사례가 실제로 보고·제재된 첫 케이스가 있었는지, ③패키지 유지관리자들이 자체적으로 GCC식 추가 기준(예: 특정 패키지에서 LLM 기여 전면 금지)을 얹는 사례가 나왔는지, ④비공개 정보 조항이 실제 보안 사고(엠바고 정보의 외부 AI 유출)를 막는 데 언급된 적이 있는지 확인.)*
