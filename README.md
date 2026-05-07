# 🌱 knowledge-garden

읽은 좋은 글을 요약하고, 내 생각을 덧붙이며, 시간이 흐르면서 점점 다듬어 나가는 디지털 가든.

단순한 링크 모음이 아니라 **왜 좋았고 어디에 쓸 수 있을지**까지 남겨두는 걸 목표로 한다.

---

## 📚 카테고리

- [engineering/](engineering/) — 엔지니어링 원칙, 방법론, 소프트웨어 철학
- [architecture/](architecture/) — 시스템 설계, 아키텍처 패턴, 분산 시스템
- [backend/](backend/) — 백엔드, DB, API, 성능
- [frontend/](frontend/) — 프론트엔드, UX, 웹 플랫폼
- [ai/](ai/) — LLM, 프롬프트, AI 제품/도구
- [career/](career/) — 커리어, 협업, 시니어십, 성장
- [weekly/](weekly/) — 주간 다이제스트 큐레이션 (GeekNews Weekly 등)
- [templates/](templates/) — 글 작성 템플릿

---

## 🗂 인덱스 (최신순)

### 2026-05
- [AI의 세 가지 역법칙](ai/2026-05-07-inverse-laws-of-robotics.md) — 의인화/맹목적 신뢰/책임 포기 금지 3원칙. 가든 *Agent-Default Posture 시리즈*의 *원칙 층위* + MangoLove 4번째 원칙 추가 후보
- [LLM-from-Scratch — 1시간짜리 GPT 학습 워크숍](ai/2026-05-07-llm-from-scratch-workshop.md) — 가든 내 *주말 프로젝트 후보*로 기록. 3 제약 만족 평가 + 우선순위 ★★★ (이번 분기 후순위, Q3 실험 슬롯 후보)
- [모두가 AI를 가져도 회사는 여전히 아무것도 배우지 못할 때](engineering/2026-05-07-when-everyone-has-ai-but-company-learns-nothing.md) — *조직 차원 AI 학습*의 빠진 층 채움. Agent Operations / Loop Intelligence / Agent Capabilities 3축 + 회사 자가 진단 + Token-to-Learning 메트릭
- [AI가 당신의 DB를 삭제한 게 아니라, 당신이 삭제한 것이다](ai/2026-05-07-ai-didnt-delete-your-database-you-did.md) — 9초 사고의 *책임 귀속* 짝. *"왜 그런 API가 존재하는가?"* 한 문장 진단 + CRS·Connectivity·PickMe destructive 엔드포인트 감사 액션
- [최고의 직원이 최악의 관리자가 되는 이유](career/2026-05-07-best-employee-becomes-worst-manager.md) — Peter Principle, *관리직은 새 직업*, 3축 평가(사회 지능/비즈니스 감각/개인 인성), 행동 기반 인터뷰, 150% 규칙. **채용·관리 4부작 완성** + 진단 매트릭스
- [생산적 미루기 — 왜 해야 할 일 대신 다른 생산적인 일을 하게 되는가](career/2026-05-07-productive-procrastination.md) — 신경과학으로 본 분주함의 함정. *70% 실험* vs *생산적 미루기* 자가 진단 질문 + 가든 큐레이션 자기 점검
- [확률적 창업자의 부상 — AI 네이티브 시대 리더십](career/2026-05-05-rise-of-the-probabilistic-founder.md) — antirez 글의 *조직 레벨 버전*. 70/30 실험-로드맵, **Agent-Default Posture**, 가든 6점 입장 스펙트럼 정리
- [Redis Array — antirez의 4개월 AI 협업 시스템 개발기](engineering/2026-05-05-redis-array-antirez-4-months-with-ai.md) — *Agentic Coding Trap*의 정확한 대척점. AI = "난이도 천장 상승기" 사례. 4단계 협업 패턴 + 가든 입장 스펙트럼 *현실적 채택 모델* 위치
- [OpenAI의 대규모 저지연 음성 AI 인프라 — Relay + Transceiver 분리](architecture/2026-05-05-openai-low-latency-voice-ai-at-scale.md) — `architecture/` 첫 글. ICE ufrag를 라우팅 힌트로 재활용한 stateless/stateful 분리 패턴 + CRS Connectivity 적용 후보
- [Agentic Coding은 함정이다 — 비판적 관점](ai/2026-05-05-agentic-coding-is-a-trap.md) — 감독의 역설·디버깅 47% 감소·벤더 종속에 대한 회의론. **가든의 균형 실험 — 채택 옹호 6 vs 회의론 1 비율 보정**
- [장기 실행 에이전트 — 며칠 동안 실행되면 무엇이 달라지는가](ai/2026-05-04-long-running-agents.md) — Addy Osmani의 하네스 엔지니어링 후속작. Brain/Hands/Session 3분리, Ralph Loop, Checkpoint-and-Resume, done-condition 우선 원칙
- [나만의 GitHub를 만든다면 — Forge에 대한 9가지 wishlist](engineering/2026-05-04-if-i-could-make-my-own-github.md) — Mat Duggan의 forge 비판 + push 전 hook·비이분법 승인·stacked PR·LLM 자동 승인·서명된 Actions
- [이메일 주소 심층 분석 — RFC와 현실, 검증 함정, 두 발신자](backend/2026-05-04-email-addresses-deep-dive.md) — Gmail 점 정규화·envelope vs From·검증기 버그 8가지 + 호스피탈리티/CRS 5가지 즉시 적용 액션
- [Amazon에서 1,000번 면접하며 얻은 교훈](career/2026-05-04-learnings-from-1000-interviews-at-amazon.md) — Amazon Bar Raiser의 4축 레벨 매트릭스 + 빨간 신호 + Jason Cohen 채용 글과 거울 짝
- [Mercury의 200만 줄 Haskell 프로덕션 엔지니어링](engineering/2026-05-04-mercury-couple-million-lines-of-haskell.md) — 언어 무관 6가지 운영 패턴(순수성=경계, 안전한 경로=쉬운 경로, Temporal, 도메인 에러, 타입 인코딩 균형, Records of Functions) + Kotlin/CRS 적용
- [GeekNews Weekly #356 (2026-W18) — 자신보다 나은 사람 뽑는 법](weekly/2026-W18-geeknews-356.md) — 이번 주 7개가 이미 가든에 있음 + 다음 주 정리 후보 5개 + 백엔드 보안 시리즈 묶음 후보
- [신용카드는 브루트포스 유형 공격에 취약함](backend/2026-05-03-credit-cards-vulnerable-to-brute-force.md) — PG 응답 정밀도가 공격 신호로 작동, 3DS의 한계, 호스피탈리티/CRS 결제 시스템 5가지 즉시 점검 액션

### 2026-04
- [UX의 법칙들](frontend/2026-04-30-laws-of-ux.md) — 30개 UX 원칙을 7개 의미 그룹으로 재분류 + 호스피탈리티/B2C(PickMe·CRS Admin) 적용 후보, `/ux-review` 스킬 후보
- [YC RFS Summer 2026 — 호스피탈리티 IT 관점 분석](engineering/2026-04-29-yc-rfs-summer-2026-hospitality-it.md) — 15개 RFS 매핑 + 호스피탈리티 IT 직접 기회·위협 7개 + 지금 해야 할 5가지 액션
- [Claude Code가 작성한 코드의 소유자는 누구인가?](ai/2026-04-29-who-owns-the-code-claude-wrote.md) — Sena Evren이 분해하는 저작권/고용/라이선스 3축, 4가지 즉시 실무 행동, M&A 실사에서 폭발하는 이유
- [Claude for Creative Work — Anthropic의 창작 도구 커넥터 발표](ai/2026-04-29-claude-for-creative-work.md) — Blender·Adobe·Ableton 등 8개 통합. MCP가 코딩 너머 전문 도메인까지 확산되는 첫 큰 신호
- [mattpocock/skills vs MangoLove — 내 워크플로우와의 비교·합칠 후보](ai/2026-04-29-mattpocock-skills-vs-mangolove.md) — 22개 스킬을 내 `/strict` 워크플로우와 매핑하고, 4가지 공백(grill·CONTEXT.md·diagnose·write-a-skill)에 우선순위 매김
- [하네스 엔지니어링: 모델보다 중요한 작업 환경 설계의 시대](ai/2026-04-28-agent-harness-engineering.md) — Addy Osmani의 Agent = Model + Harness 공식, Ratchet 원칙, 하네스 6영역, AGENTS.md 설계 가이드
- [만들기 전에 고려해야 할 3가지 제약](engineering/2026-04-28-three-constraints-before-i-build-anything.md) — Jordan Lord의 one-pager / core tech 분리 / defining constraint 3-차원 빌드 거절 체크리스트
- [AI는 사고를 대체하지 말고 끌어올려야 한다](ai/2026-04-28-ai-should-elevate-your-thinking-not-replace-it.md) — 레버리지 vs 모방의 갈림길, 경력 초반에 더 위험한 이유, 30분 룰 같은 적용 규칙 도출
- [AI 에이전트가 프로덕션 데이터베이스를 삭제했다 — 9초의 사고](ai/2026-04-27-ai-agent-deleted-production-database.md) — Cursor + Railway 사례로 본 토큰 권한·백업 격리·destructive op 가드의 5겹 실패와 적용 체크리스트
- [GeekNews Weekly #355 (2026-W17) — 잃어버린 기본기를 찾아서](weekly/2026-W17-geeknews-355.md) — 이번 주 메인 테마와 사이드 트랙 큐레이션 + 다음 주 정리 후보 4개
- [자신보다 뛰어난 사람을 채용하는 법](career/2026-04-27-how-to-hire-someone-better-than-yourself.md) — Jason Cohen이 제시하는, 도메인을 몰라도 작동하는 6가지 채용 평가 휴리스틱과 레퍼런스 체크 재설계
- [과도한 고민, 범위 확장, 구조적 diff로 프로젝트를 망치는 법](engineering/2026-04-27-overthinking-scope-creep-structural-diffs.md) — Kevin Lynagh가 자기 사이드 프로젝트들을 해부하며 풀어내는 YAGNI·성공 기준 내면화 이야기
- [기술 부채, 인지 부채, 의도 부채](engineering/2026-04-24-technical-cognitive-intent-debt.md) — 마틴 파울러가 짚는 LLM 시대 세 층위의 부채와 검증 중심 엔지니어링으로의 이동
- [시니어 엔지니어로서 배운 것들](career/2026-04-23-things-ive-learned-as-a-senior-engineer.md) — 10년+ 경력 개발자가 풀어놓은 커리어·코드·협업·돈에 대한 솔직한 교훈
- [소프트웨어 공학의 법칙들](engineering/2026-04-23-laws-of-software-engineering.md) — 56가지 원칙을 훑으며 정리한 엔지니어링 사고의 지도

---

## ✍️ 글 작성 방법

1. 분류에 맞는 폴더로 이동 (`engineering/`, `ai/` 등)
2. `templates/article.md` 를 복사
3. 파일명: `YYYY-MM-DD-kebab-case-title.md`
4. 작성 후 이 README의 **인덱스**에 한 줄 추가

## 🏷 태그 사용

글 frontmatter의 `tags` 필드를 활용한다. 자주 쓰는 태그:
`#원칙` `#아키텍처` `#백엔드` `#프론트엔드` `#AI` `#생산성` `#커리어` `#회고`
