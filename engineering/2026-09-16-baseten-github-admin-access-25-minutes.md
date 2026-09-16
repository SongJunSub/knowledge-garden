---
title: "Baseten을 쓰려다 25분 만에 GitHub 저장소 관리자 권한을 얻게 되었다 (Strix) — 2023년 3월 빌드 인자로 넘긴 GitHub 토큰이 Docker 이미지 히스토리에 남아, 2026년 7월까지 살아있었다"
source_title: "We wanted to use Baseten for inference. We ended up with admin access to their GitHub"
source_url: "https://www.strix.ai/blog/baseten-harbor-github-pat-takeover"
source_name: "Strix (strix.ai) — 오픈소스 AI 펜테스트 에이전트 스타트업"
referrer_url: "https://news.hada.io/topic?id=33756"
summarized_at: "2026-09-16"
category: "engineering"
tags: ["공급망보안", "Docker빌드", "토큰유출", "GeekNews"]
---

# Baseten을 쓰려다 25분 만에 GitHub 저장소 관리자 권한을 얻게 되었다

> 출처: [We wanted to use Baseten for inference. We ended up with admin access to their GitHub](https://www.strix.ai/blog/baseten-harbor-github-pat-takeover) (Strix · strix.ai) · 정리일 2026-09-16

## 한 줄 요약
**AI 추론 서비스 Baseten을 도입 검토하던 중 Strix의 AI 펜테스트 에이전트가 공개 Harbor 컨테이너 레지스트리에서 2023년 3월 빌드 이미지를 pull해, `docker history`만으로 25분 만에 `repo` 스코프 GitHub 관리자 토큰을 추출했다 — Docker가 빌드 인자를 이미지 메타데이터에 그대로 기록한다는, 흔하지만 치명적인 실수였다.**

## 핵심 포인트
- Strix의 AI 에이전트가 Baseten 인프라를 스캔하다 공개(비공개 아닌) ***Harbor 컨테이너 레지스트리***를 발견, 이미지를 pull해 `docker history` 명령으로 이미지 히스토리를 살펴봄
- 2023년 3월 3일 빌드에서 ***빌드 인자(build argument)로 전달된 GitHub Personal Access Token***이 이미지 메타데이터에 그대로 남아 있었고, ***2026년 7월 테스트 시점까지도 살아있는 토큰***이었음
- 토큰은 `basetenbot` 계정 소유로 `repo` 스코프를 가져 ***basetenlabs 조직의 프로덕션·배포·CLI 저장소에 admin 접근*** 가능했고, 고객사 이름별 서브디렉터리가 있는 private 저장소까지 노출됨
- 신고 타임라인: 7월 13일 밤 11시 10분 신고 → 7월 14일 오전 Harbor 프로젝트 비공개 전환 → 7월 14일 오후 4시 34분 Baseten 보안팀이 critical로 확인하고 토큰 회전(rotate) 완료 — ***약 17시간 내 조치***
- 근본 원인은 "private 의존성 fetch를 위해 빌드 인자로 토큰 전달"이라는 흔한 실수 — Docker가 빌드 인자를 이미지 히스토리에 기록한다는 점을 간과한 것
- Baseten은 대응 후 감사 굿즈를 보내는 등 우호적으로 대응했다는 후속 코멘트가 있었음

## 인상 깊은 문장
> "Docker can record that build argument in the image's metadata and history."

## 댓글
GeekNews 댓글 수는 hada.io 접근 차단으로 확인 불가. Hacker News에 크로스포스트됨(item id=49716476, "We got admin access to Baseten's production GitHub in 25 minutes", 게시 약 10시간 전)이나 정확한 포인트·댓글 수는 접근 차단으로 미확인. strix.ai 원문도 직접 fetch는 실패해 WebSearch 재구성 — 보안 벤더의 자사 블로그이므로 "우호적 공개 대응" 프레이밍에 제품 마케팅 요소가 섞였을 가능성을 감안해야 한다.

## 내 생각 · 적용점
**[[2026-07-25-hanwha-vision-github-token-firmware]]**와 사실상 같은 이야기다 — 해킹이 아니라 빌드 설정 한 줄, 그리고 그 실수가 몇 년간 그대로 방치된다는 패턴이 반복된다. 다른 점은 이번엔 ***3년 넘게 살아있던 토큰***이라는 것. CI/CD에서 빌드 인자(`--build-arg`)로 시크릿을 넘기는 방식 자체가 Docker의 레이어 히스토리 특성상 구조적으로 위험하다는 걸 재확인한다 — BuildKit의 `--secret` 마운트나 별도 시크릿 매니저를 쓰지 않는 한 재발 가능성이 크다.

## 호스피탈리티 / CRS 적용 포인트
온다의 CI/CD 파이프라인에서 Docker 이미지 빌드 시 `--build-arg`로 API 키·DB 크리덴셜을 전달하는 곳이 있는지, 그리고 컨테이너 레지스트리(Harbor·ECR 등)가 실수로 public 접근을 허용하고 있지 않은지 원칙적으로 점검할 가치가 있다. `docker history`로 과거 이미지까지 스캔해보는 건 저비용 자체 점검으로 바로 적용 가능하다.

## 연관 자료
- [[2026-07-25-hanwha-vision-github-token-firmware]] — 거의 동일한 사고 구조(빌드 시점 시크릿 유출), 한화비전은 Vite 번들링, Baseten은 Docker 이미지 히스토리라는 경로만 다름
- [[2026-08-26-key-amnesia-agent-secrets]] — 시크릿을 아예 에이전트/빌드 프로세스에 노출시키지 않는 반대 방향의 설계 해법

## 한 달 뒤 회고
2026-10-16 즈음, Baseten이 이 사고를 계기로 빌드 파이프라인 표준(BuildKit secret mount 강제 등)을 공개했는지, 유사 사고가 다른 AI 인프라 스타트업에서 재현됐는지 점검.
