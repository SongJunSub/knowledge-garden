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

### 2026-04
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
