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
- [Amazon 직원들의 *토큰 태우기* — Goodhart's Law AI 시대 변형](ai/2026-05-17-amazon-token-burning-goodharts-law.md) — Fast Company 보도. Amazon이 *토큰 소비량*을 직원 KPI로 박자 *MeshClaw 등 내부 도구로 토큰만 태우는 가짜 작업* 만연. **가든의 *지표 왜곡 라인*에 첫 실증 케이스 도착** (가설→증거 단계 이동). [Code w/ Claude *Effort*](ai/2026-05-14-code-with-claude-recap-19-sessions.md)(낭비 줄이기) ↔ Amazon(낭비 인센티브화) *정반대 신호* — 제품 설계가 조직 인센티브보다 안전해질 수 없음. [Hashimoto 광기](ai/2026-05-16-hashimoto-ai-mass-psychosis.md) 지표 왜곡 진단의 *현장 실증* + [Anthropic 공식 매뉴얼](ai/2026-05-16-claude-code-large-codebases.md) 댓글의 *지시 불이행 90%*의 정밀한 *왜*(좋은 매뉴얼 따르면 토큰 적게 써서 KPI 손해). **메타 가설: AI-Goodhart 수퍼휴먼 가속** — KPI 게임 비용이 0에 가까워짐. CRS/MangoLove/BugSip KPI 설계에 *AI-Goodhart 시험*("이 KPI를 만족시키는 AI 에이전트가 30분에 만들어지는가") 1차 점검 + 가든 *한 달 뒤 회고 메타 점검* 후보
- [Claude Code 대규모 코드베이스 사용법](ai/2026-05-16-claude-code-large-codebases.md) — Anthropic 공식 매뉴얼. **운영 단위가 *프롬프트→대화→세션→하네스* 로 한 단계 더 위로 이동**. *색인 없는 라이브 코드 탐색* + *얇고 계층적 CLAUDE.md*(루트=큰 그림/하위=로컬) + *LSP 심볼 탐색* + *에이전트 매니저 직무*(3~6개월 의도적 검토). 댓글의 *지시 불이행 90%·하네스 작동 안함* 비판이 [Hashimoto 광기](ai/2026-05-16-hashimoto-ai-mass-psychosis.md)와 *같은 날 짝* — 매뉴얼은 *광기 방지 필요조건이지 충분조건 아님*. [Naur 이론](engineering/2026-05-14-naur-programming-as-theory-building.md)의 *얇은 문서* + [Anthropic Why 정렬](ai/2026-05-14-teaching-claude-why-alignment-training.md)의 *조직 차원 외부화* + [matklad Conway's Law](engineering/2026-05-13-learning-software-architecture.md)의 *조직-소프트웨어-하네스 3자 동형* 확장. CRS 하네스 인벤토리 + CLAUDE.md *한 화면 룰* + MangoLove 에이전트 매니저 직무 정의 + **가든 자체 하네스 7월 중순 검토** 후보
- [Mitchell Hashimoto: '많은 기업이 AI 집단 광기에 빠져 있다'](ai/2026-05-16-hashimoto-ai-mass-psychosis.md) — HashiCorp 공동창업자. **가든의 두 번째 *의도적 반대 명제 자산***. *MTTR 만능주의*("에이전트가 빠르게 고치니까 버그 출시해도 됨") → *기저 아키텍처 부식* + *지표 왜곡* + *대화 차단* + *이해 불가능한 복잡도*. [Agent-Default Posture](ai/2026-05-14-code-with-claude-recap-19-sessions.md)·[Ratchet](ai/2026-05-14-ai-coding-complexity-ratchet-garry-tan.md)·[Jay Gup 경험=세금](career/2026-05-14-experience-is-now-a-tax.md)의 *대각선 반대* (Jay Gup ↔ Hashimoto). Garry Tan과 *같은 관찰, 처방 정반대* — 거버넌스 품질에 따라 같은 도구가 *안전망 vs 광기 가속기*. [Naur 프로그램의 죽음](engineering/2026-05-14-naur-programming-as-theory-building.md)의 *조직 차원 사산(死産)* 형태. MangoLove `strict.md` *지표 반박 금지* + CRS MTTR 단독 사용 금지 + *이해 가능성 지표* 분기 의례 + **가든 본인의 *광기 자가 진단*(정리 건수 ≠ 이해 깊이)** 후보
- [10년 펀드의 소멸](career/2026-05-14-disappearance-of-the-ten-year-fund.md) — Bartlett & Ramella (Stanford Law) 논문 해석. VC의 *10년 펀드* 표준이 회계상 한 번도 지켜진 적 없음 — *2010~2014 빈티지조차 10년 차에 미실현 NAV가 약정 자본을 초과*. 시장 양극화: 메가펀드 *영구자본 전환*(Sequoia), 소규모 펀드 *10년 규율을 무기로 + 세컨더리 유동성*. **2025년 미국 벤처 투자금 33%가 상위 1% 기업에 집중**. 파킨슨의 법칙 — 펀드는 *운용 가능한 자본만큼 팽창*. [Ries 영구자본](career/2026-05-14-eric-ries-incorruptible-mission-protection.md)·[OnlyCFO 양극화](career/2026-05-14-2026-procurement-playbook-onlycfo.md)·[Jay Gup 시니어/주니어 비대칭](career/2026-05-14-experience-is-now-a-tax.md)이 *같은 시기 같은 방향*. *중간이 사라진다*는 메타 가설 + Anthropic LTBT의 *시장 진화적 정당화* 보강 + 개인 자산 *바닥/머리 양극화 분배* + MangoLove *소규모 펀드 규율 전략* + BugSip *제약 = 차별점* 마케팅 후보
- [2026 구매자 플레이북 — 판매자에겐 최악의 악몽](career/2026-05-14-2026-procurement-playbook-onlycfo.md) — OnlyCFO 뉴스레터. 가든의 *AI 가격/공급* 글 4개의 **수요 측 거울**. AI가 SaaS 효율성/부가 기능 버킷을 광범위 대체, CFO 5단계 갱신 의례(3개월 전 해지 통지·침묵·대체 검토 흘리기) + 4가지 비대칭 회복(다년 거부·POC 요구·자동갱신 삭제·AI 차별성 증명) + **MCP 커넥터가 2026 통과 의례**. [Claude 월간 크레딧](ai/2026-05-14-claude-programmatic-monthly-credits.md)·[Ptacek 30분 앱](ai/2026-05-14-emacsification-of-software-ptacek.md)·[Ratchet](ai/2026-05-14-ai-coding-complexity-ratchet-garry-tan.md)·[Ries Cloudflare](career/2026-05-14-eric-ries-incorruptible-mission-protection.md)의 *공급 측 가설이 수요 측에서 어떻게 보이는가*의 답. 우리가 *동시에 벤더이자 구매자*인 모순 인식 + SaaS 4 버킷 줄 세우기 의례 + MangoLove 영업 *우리가 먼저 1년 단위 제시* + BugSip 처음부터 *OnlyCFO 5단계 만족* 후보
- [Eric Ries 'Incorruptible' — 미션 보호 거버넌스](career/2026-05-14-eric-ries-incorruptible-mission-protection.md) — *Lean Startup* 15년 만의 후속작. 회사가 망가지는 진짜 원인은 *탐욕*이 아니라 *소유 구조·지배구조·문화 관행*의 점진적 부식. **시점 자체가 비용 변수** — 권리는 *초기에 박지 않으면 평생 못 박는다*. 공식 무기 라인업(PBC·Director's Oath·Mission Protective Provisions·Novo Nordisk industrial foundation·**Anthropic LTBT**)과 사례 3개(Cloudflare 성공, Groupon 미션 부식, Vectura 인수 상실). 가든의 *시간 축*을 조직 거버넌스로 확장 + [Naur 코드 죽음](engineering/2026-05-14-naur-programming-as-theory-building.md)과 *회사 죽음*의 동형 메커니즘 + Anthropic LTBT가 [Why 정렬](ai/2026-05-14-teaching-claude-why-alignment-training.md)을 구조적으로 가능케 한다는 거버넌스적 답. BugSip 법인 *PBC/정관 미션 조항* + MangoLove `strict.md` 미션 보호 절 + CRS *KPI 부식 점검* 분기 의례 후보
- [경험은 이제 세금이다](career/2026-05-14-experience-is-now-a-tax.md) — Jay Gup (X 스레드). **가든의 *반대 명제 자산***. AI가 시도/번복 비용을 0에 수렴시키면 *탐색-유지·보유-외부화·커밋-철회* 3개 결정 알고리듬이 모두 답이 바뀌고, *시니어의 기억*이 *명료한 사고의 필터*가 된다. [Tuhin Nair (시니어 옹호)](career/2026-05-14-why-senior-developers-fail-to-communicate-expertise.md)·[Naur (이론 보유자 중심)](engineering/2026-05-14-naur-programming-as-theory-building.md)에 정면 충돌 — *변동성*에 따라 적용 영역 분기 (CRS = Naur 영역, BugSip 기획 = Jay Gup 영역). [Ptacek 30분 앱](ai/2026-05-14-emacsification-of-software-ptacek.md)과 *서로의 empirical/theoretical leg*. MangoLove *기억-결정 분리* + AI 도입 결정에 *도구 사용자 발언 가중* + 시니어 *No의 결정/예측 갈라보기* 후보
- [소프트웨어의 Emacs화](ai/2026-05-14-emacsification-of-software-ptacek.md) — Thomas Ptacek (Fly.io 공동창업자). Claude로 *30분 만에 App Store의 어떤 마크다운 뷰어보다 우수한* macOS 네이티브 앱(MDV.app) 제작. **에이전트의 가장 큰 변화는 모델이 아니라 *네이티브 UI 진입장벽 0***. 1인용 도구 폭증 → *공유 단위가 소스 → 아이디어/프롬프트로 이동*. [Agent-Default Posture](ai/2026-05-14-code-with-claude-recap-19-sessions.md)의 *개인 사용자 층위* 보완, [Naur 이론](engineering/2026-05-14-naur-programming-as-theory-building.md)의 *적용 영역 경계 설정*, [Ratchet](ai/2026-05-14-ai-coding-complexity-ratchet-garry-tan.md)의 *4번째 축(개인 도구 수)*. BugSip 경쟁자 정의 = *기존 앱이 아니라 1인 빌더* + MangoLove "30분 룰" + 사내 *내가 30분 들여 만든 것* 공유 채널 후보
- [이론 형성으로서의 프로그래밍 (1985)](engineering/2026-05-14-naur-programming-as-theory-building.md) — Peter Naur 고전. *프로그램 = 머릿속 이론, 코드 = 부산물*. 이론 보유 팀이 흩어지면 프로그램은 죽었고 텍스트 재해석은 *원작보다 비쌈*. AI 코딩이 텍스트만 폭증시키는 시대에 *이론 보유자*가 더 비싸진다는 [Tuhin Nair](career/2026-05-14-why-senior-developers-fail-to-communicate-expertise.md)·[Garry Tan Ratchet](ai/2026-05-14-ai-coding-complexity-ratchet-garry-tan.md)·[Anthropic Why 정렬](ai/2026-05-14-teaching-claude-why-alignment-training.md)의 *근저 메커니즘*. 인수인계 KPI를 *문서 완성도 → 신입이 변경을 정당화하기까지의 시간*으로 재정의 + BugSip 가치 제안을 *코드 라인 → 이론 형성 보조*로 재정렬 후보
- [Claude, 프로그래밍 방식 사용을 '월간 크레딧' 구조로 변경](ai/2026-05-14-claude-programmatic-monthly-credits.md) — 2026-06-15부터 `claude -p`·Agent SDK·GitHub Actions가 일반 채팅 한도에서 분리, 플랜별 월간 크레딧(Pro $20·Max5x $100·Max20x $200, 이월 불가). **대화형 Claude Code는 영향 없음**. 같은 날 발표된 *Routines/Managed Agents 비전*과 *가격 측면 모순*. CRS 자동화 ROI 재계산 + 로컬 SLM 대안 + MangoLove 자문 항목 후보
- [Code w/ Claude에서 발표한 모든 것들 — 19개 세션 통합 정리](ai/2026-05-14-code-with-claude-recap-19-sessions.md) — Anthropic 공식 컨퍼런스. 차별화 축이 *"모델 호출 방식" → "어떤 도구·데이터·권한·문맥"*으로 공식 이동, 새 병목은 *검증·보안·권한·관찰가능성·평가*. 가든 11개 가설 중 10개가 제품 라인업으로 확인됨 (Auto Mode/Worktree/Auto Memory/Routines/Outcomes/Managed Agents/Effort/Computer Use). 새로 발견된 결: **Dreaming** (비동기 메모리 정리, Harvey 6배). CRS Auto Mode 분류·BugSip 첫날부터 깔 구조·MangoLove 자문 체크리스트 4개 후보
- [중국 AI 연구소 내부에서 얻은 교훈](ai/2026-05-14-notes-from-inside-chinas-ai-labs.md) — Nathan Lambert (Interconnects). Z.ai·Moonshot·Tsinghua·Meituan·Xiaomi·Alibaba·ByteDance·DeepSeek·Ant 직접 방문. *모델 품질 단일초점·자체 스택 본능·학생 중심·엔지니어 vs 변호사*. 가든 *서구 시각 편향 보정* + MangoLove "엔지니어 vs 변호사" 자가 진단 + CRS *금지→가드레일* 정책 후보
- [AI 코딩 시대의 복잡성 래칫 — 90% 테스트 커버리지가 필요한 이유](ai/2026-05-14-ai-coding-complexity-ratchet-garry-tan.md) — Garry Tan (YC CEO). 테스트·문서·평가 누적 = 후퇴 불가 래칫. **85~95% 커버리지가 결함 제거 92~97% knee point** (Capers Jones), AI가 *지루한 엣지 케이스* 비용 0으로. 가든 *Ratchet 시리즈 3축 완성* (세션·프로젝트·**조직**) + CRS 결제 idempotency AI 위임 PoC + BugSip 처음부터 래칫
- [Anthropic, Claude에게 '왜'를 가르치다 — 정렬 훈련 개선](ai/2026-05-14-teaching-claude-why-alignment-training.md) — Anthropic Research. 행동(what)이 아니라 이유(why)를 가르치니 협박률 22% → 3%, **28배 효율**. 헌법 문서+픽션 같은 OOD 데이터가 RL 후에도 살아남음. Opus 4 96% → Haiku 4.5+ 0%. MangoLove `strict.md` *원칙+이유* 짝 리팩토링 후보 + BugSip 콘텐츠에 "Why this design" 필드 추가 후보
- [시니어 개발자가 전문성을 전달하지 못하는 이유](career/2026-05-14-why-senior-developers-fail-to-communicate-expertise.md) — Tuhin Nair. 시니어의 "복잡성 관리" vs 비즈니스의 "불확실성 감소" 언어 충돌, "Can we try something quicker?" 프레임 전환, Speed/Scale 분리 처방. CRS 영업 응답 템플릿 + MangoLove 5번째 원칙 *언어 전환* 후보
- [소프트웨어 아키텍처 배우기](engineering/2026-05-13-learning-software-architecture.md) — matklad (rust-analyzer 핵심 개발자). 실무 책임이 학습, Conway's Law 최우선, 인센티브 우선. rust-analyzer 낮은 진입장벽+핵심 엄격 패턴 = CRS 공헌 영역 분류 정책 후보
- [Redis와 야망의 대가](engineering/2026-05-13-redis-and-cost-of-ambition.md) — antirez Redis Array 글의 **정확한 반론**. 기능 팽창 vs 단순성, "반쯤 익은 기능", Valkey 시장 평결. MangoLove *정체성 점검 자문* 후보 + CRS 기능 사용률 자가 진단
- [Interaction Models — 인간-AI 협업을 위한 확장 가능한 접근법](ai/2026-05-13-interaction-models-thinking-machines.md) — Thinking Machines Lab (Mira Murati) 첫 큰 발표. 200ms 마이크로턴 full-duplex 모델. OpenAI Realtime 인프라 차원과 *모델 차원* 짝 + Ferrari 라인 새 가능성
- [소프트웨어 엔지니어링은 더 이상 평생 직업이 아닐 수 있다](career/2026-05-12-software-engineering-may-no-longer-be-lifetime-career.md) — AI 비판 시리즈 11번째, *경력 수명* 각도. 전동공구·프로 운동선수 비유, ~15년 경력 수명 첫 세대 가능. 한국 IT 듀얼 트랙 부재와 결합 → 2중 위기 + 분기 *AI 없이* 슬롯 룰
- [코드 작성에 쓰는 AI 코딩 에이전트는 반드시 유지보수 비용을 줄여야 한다](engineering/2026-05-12-ai-must-reduce-maintenance-costs.md) — James Shore의 **2×2=4 부담 수학**. AI 비판 시리즈의 *수학적 보강*. 산출 N배 ↑ → 유지보수 1/N ↓ 필수 + MangoLove *유지보수 영향* 자문 후보
- [M4 24GB 메모리에서 로컬 모델 실행하기](ai/2026-05-12-running-local-models-on-m4-24gb.md) — *로컬 AI 3부작 완성* (이론·도구·실측). Qwen 3.5-9B Q4 + LM Studio, 40 tok/s + 128K. 가능/불가능 표 + MangoLove 태스크별 권장 라우팅 매트릭스
- [Rapid-MLX — Apple Silicon 전용 초고속 로컬 AI 엔진](ai/2026-05-12-rapid-mlx-apple-silicon-local-ai.md) — 어제 *로컬 AI 표준* 이론의 **실행 도구**. Ollama 4.2배, OpenAI API 호환 드롭인. 가든 *행동 후보 ★★★★* + MangoLove 로컬 우선 라우팅·CRS PoC 1개 후보
- [ClickHouse 입문 — 컬럼 지향 OLAP DB의 개념·SQL·사용 사례](backend/2026-05-11-clickhouse-overview.md) — 학습 노트. 컬럼 지향·MergeTree·표준 SQL·자체 분석 함수·OLTP와의 결정적 차이. 호스피탈리티/CRS 적용 후보 5개 + Spring Boot 연동 가이드 + 도입 체크리스트
- [로컬 AI가 표준이 되어야 한다](ai/2026-05-11-local-ai-needs-to-be-the-norm.md) — *AI 채택의 세 번째 방향: 클라우드를 줄이자*. Apple FoundationModels로 요약·분류·추출. 호스피탈리티 PII 보호와 로컬 AI 자연 결합 + MangoLove *외부 API 필요한가?* 자문 후보
- [요즘 노트북은 모두 내장 보안 토큰을 갖고 있다](backend/2026-05-11-builtin-security-tokens.md) — *backend 운영 위생 시리즈 5번째*. YubiKey 없이 Secure Enclave/TPM/Windows Hello 활용. SSH·git 서명·sudo 강화 + 회사 *서명된 커밋만 머지* 정책 후보
- [GeekNews Weekly #357 (2026-W19) — 확률적 창업자와 확률적 엔지니어링](weekly/2026-W19-geeknews-357.md) — 3주 연속 매칭 패턴 완성. 메인 특집 2개 = 가든 2개. 다이제스트 22개 가든. 다음 주 후보 Top 5 + 메타 정리 시작 시점
- [이름에 대한 프로그래머의 오해들 (2010)](backend/2026-05-10-falsehoods-programmers-believe-about-names.md) — *backend 운영 위생 시리즈 4번째*. Patrick McKenzie 클래식. 호스피탈리티는 글로벌 게스트 이름 처리의 최전선 — CRS Falsehoods 8개 점검 + Falsehoods 시리즈 인덱스 후보
- [클로드 코드 사용하기: HTML의 놀라운 효율성](ai/2026-05-10-claude-code-html-effectiveness.md) — 가든의 *구체 활용 팁* 결 첫 글. HTML이 Markdown보다 시각화·상호작용 풍부. 5가지 활용 + Markdown vs HTML 분리 기준 + 가든 분기 HTML export 시범
- [확률적 엔지니어링과 24/7 직원](engineering/2026-05-10-probabilistic-engineering-and-24-7-employee.md) — Tim Davis(Modular) 직접 글 — 가든 *확률적 창업자* 인용의 원전 보강. 역할 분화·생성-검증 비대칭·Jevons 역설·24/7 직원·훈련 위기. 호스피탈리티 24/7 직원 매핑 후보
- [AI가 두 취약점 공개 문화를 깨뜨리고 있다](backend/2026-05-09-ai-breaking-vulnerability-cultures.md) — *백엔드 보안 시리즈 3번째*. 9시간 패치 윈도우 시대. 조율된 공개·조용한 패치 둘 다 무너짐. 공격 표면 축소 5개 후보 + MangoLove Critical Security Hotfix 트랙 후보
- [Agents에는 더 많은 프롬프트가 아니라 제어 흐름이 필요하다](ai/2026-05-09-agents-need-control-flow.md) — *"MANDATORY 쓰면 한계 도달"* 진단. 결정적 스캐폴딩 + LLM 컴포넌트 + 결정적 도구 3층. MangoLove `strict.md`의 강제 표현을 코드로 이전할 후보 매핑
- [Lean Analytics, AI와 에이전트 시대에 맞춰 돌아보기](engineering/2026-05-08-lean-analytics-reconsidered.md) — 가든 *측정 메트릭* 결의 첫 글. 6+3 지표 변화, *가치 밀도*, *성공 태스크당 비용* + 호스피탈리티 KPI 재설계 매핑
- [다크 마켓플레이스 — AI 에이전트가 거래를 대행하는 커머스의 미래](engineering/2026-05-08-the-dark-marketplace.md) — Anthropic Project Deal 실험 + 4단계 여정 + *Memory가 해자*. 호스피탈리티 IT 직격 — *3세대 OTA = 다크 마켓플레이스* 시대, B2B Connectivity가 1번 적용 후보
- [소프트웨어를 만들어서 무료로 나눠주기](career/2026-05-08-write-software-give-it-away-for-free.md) — 가든 *왜 만드는가* 회귀. $600 만들고 월 $5로 수십만 사용자 운영. *취미 = 수익화 안 한 선택의 결과* + BugSip·가든·docs-ko 수익화 정책 명시 후보
- [SQLite는 미국 의회도서관 권장 저장 형식이다](backend/2026-05-08-sqlite-loc-recommended-storage-format.md) — 비판 시리즈 잠시 벗어난 *기술 자산* 글. 7가지 평가 기준, *데이터베이스가 아카이브 형식으로 인정* + 호스피탈리티 Cold Storage·정산 봉인·가든 분기 export 후보
- [프로그래밍은 여전히 형편없다 — AI는 희생양, 진짜 원인은 탐욕](career/2026-05-08-programming-still-sucks.md) — *AI 비판 시리즈 9번째, 메타 비판*. 도제식 성장 붕괴, Goodhart 함정, *Sara의 cron job* 우화(가든 4개 글의 메타포 압축), "주니어가 없다" + Sara 식별·Goodhart 자가 진단 액션
- [AI가 끌어올린 바닥, 우리의 천장은 어디인가](career/2026-05-07-ai-floor-and-our-ceiling.md) — 가든 *AI 비판 시리즈 한국어 첫 글*. 바닥/천장 메타포(=Camry/Ferrari 다른 표현), T형 인재, "실행 위임 가능, 책임 외주화 불가" + MangoLove 4번째 원칙 한국어 표현 후보
- [병목은 결코 코드가 아니었다](engineering/2026-05-07-bottleneck-was-never-the-code.md) — 진짜 병목은 *협상·공유 맥락·조직 일관성*. 제번스 역설(가속 = 더 만들기), "맥락은 침투할 수 없다", 다음 10년 우위는 일관성 유지 회사 + Spec 적대적 리뷰 격상 후보
- [Vibe coding과 agentic engineering이 내가 원하는 것보다 가까워지고 있다](ai/2026-05-07-vibe-coding-agentic-engineering-converging.md) — Simon Willison의 *자기 고백*. 책임 없는 신뢰, 외형 동일 = 평가 불가, 사용량 = 새 증거, 병목 이동 + PR 메타데이터 vibe/hybrid/agentic 3단계
- [직장에서 생산적으로 보이기 — 산출물과 역량의 분리](ai/2026-05-07-appearing-productive-in-the-workplace.md) — *신호 비판*. AI가 산출물-역량 연결 끊음, "느림이 진짜 일이었다", 동의 ≠ 근거, Cross-domain 위험, 신뢰가 새 차별 자산
- [Claude Code는 당신의 제품을 더 좋게 만들지 않는다](ai/2026-05-07-claude-code-not-making-your-product-better.md) — Ethan Ding의 *기능 비판*. K자형 곡선·복리 효과 부재·코드 줄 수 = 비용 + Camry vs Ferrari 라인 구분, 호스피탈리티 적용
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
