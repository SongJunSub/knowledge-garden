---
title: "Git 사용자를 위한 Jujutsu(jj) 워크숍(GeekNews) — 인덱스와 stash를 없애고 작업 디렉터리 자체를 커밋으로 만들었다"
source_title: "Git 사용자를 위한 Jujutsu(jj) 워크숍"
source_url: "https://news.hada.io/topic?id=36374"
source_name: "GeekNews"
referrer_url: "https://news.hada.io/topic?id=36374"
published_at: "2026-11-02"
summarized_at: "2026-11-02"
category: "engineering"
tags: ["jujutsu", "jj", "git", "version-control", "workshop"]
---

# Git 사용자를 위한 Jujutsu(jj) 워크숍(GeekNews)

> 출처: [Git 사용자를 위한 Jujutsu(jj) 워크숍](https://news.hada.io/topic?id=36374) (GeekNews) · 정리일 2026-11-02
>
> **출처 한계**: news.hada.io 접근 차단으로 원문·hada 댓글을 직접 열람하지 못했다. Slack 발췌(말줄임으로 끊김)만 근거로 한다. 워크숍 영상 자체는 확인하지 못했다.

## 한 줄 요약

**vim.kr 주최로 열린 약 3시간 반짜리 jj(Jujutsu) 실습 워크숍은 Git의 내부 객체 모델에서 출발해, jj가 인덱스와 stash라는 Git의 핵심 개념 두 가지를 아예 제거하고 "작업 디렉터리 자체가 하나의 커밋"이라는 더 단순한 모델로 재설계했다는 점을 짚는다.**

## 핵심 포인트

- **vim.kr 주최, 3부작 구성** — 2026년 10월 31일 열린 약 3시간 반 분량의 jj 실습 워크숍으로, Tangled 개발자 boltless가 진행했다. Git 내부 구조에서 출발해 jj 데이터 모델, 기본 명령, 고급 워크플로우, Tangled 연동까지 3부로 구성된다.
- **1부: Git 객체 모델과 jj의 차이** — Git의 객체 모델(blob, tree, commit, tag, ref, 인덱스)을 먼저 짚고 jj가 이를 어떻게 다르게 다루는지 비교한다.
- **인덱스와 stash가 없다** — ***"jj에는 인덱스와 stash가 없다"***는 것이 이 워크숍의 핵심 메시지로 보인다. ***"working copy 자체가 하나의 커밋이고, 명령 실행 시 자동 스냅샷된다"*** — Git에서는 "커밋하지 않은 변경사항"이라는 별도 상태가 존재하지만, jj는 그 상태 자체를 커밋으로 취급해 버린다는 뜻이다. "change ID와 commit I…"로 발췌가 끊겨, change ID와 commit ID의 구분(jj의 또 다른 핵심 개념)은 확인하지 못했다.

## 인상 깊은 문장

> "jj에는 인덱스와 stash가 없음: working copy 자체가 하나의 커밋이고, 명령 실행 시 자동 스냅샷됨"

## 댓글

hada 댓글 수·HN/Lobsters 큐레이션 여부는 접근 차단으로 확인하지 못했다. 발췌가 1부 초반(change ID 설명 직전)에서 끊겨, 2부(고급 워크플로우)와 3부(Tangled 연동)의 구체적 내용은 전혀 확인하지 못한 채 노트를 작성했다 — 3부작 중 가장 적은 정보만으로 요약된 노트임을 밝힌다.

## 내 생각 · 적용점

**핵심 전이 — "임시 상태를 없애고 하나의 일관된 모델로 통합한다"는 설계는 이 가든이 반복해서 본 패턴이다.** [[2026-09-21-worktrunk-git-worktree-cli]]가 다룬 git worktree 기반 도구들이 "여러 작업공간을 병렬로 격리"하는 방향이라면, jj는 반대로 "커밋 안/밖이라는 이분법 자체를 없앤다"는 더 근본적인 재설계다. [[2026-10-02-git-3-0-sha256-default-mistake]]가 "전환 비용이 구체적 위협보다 크면 안 된다"고 경고했던 것과 비교하면, jj는 애초에 Git과 호환되는 백엔드(같은 저장소를 jj/Git 양쪽에서 쓸 수 있음)를 유지하면서 사용자 경험만 바꾸는 더 저위험한 전환 전략을 택한 것으로 보인다 — 다만 이는 jj에 대한 일반적 지식이고, 이번 워크숍 발췌 자체에서 확인된 내용은 아니다.

## 호스피탈리티 / CRS 적용 포인트

**적용 멀다.** 버전관리 도구 선택은 개발팀 내부 도구 정책 문제로, CRS/호스피탈리티 비즈니스 로직과 직접 접점이 없다. 다만 개발팀이 jj 같은 Git 대체 워크플로우를 시범 도입할 때 "인덱스/stash 없이 모든 변경이 자동 스냅샷된다"는 모델이 실수로 되돌릴 수 없는 변경을 만들 위험을 줄이는지, 반대로 늘리는지는 실무 검증이 필요한 지점으로 참고할 수 있다.

## 연관 자료

- [[2026-09-21-worktrunk-git-worktree-cli]] — Git worktree를 활용한 병렬 작업공간 격리, jj와 다른 방향의 워크플로우 개선
- [[2026-10-02-git-3-0-sha256-default-mistake]] — Git 생태계 변화의 전환 비용을 다룬 선행 노트
- [[2026-07-15-git-history-command-deserves-attention]] — Git 내부 구조를 더 깊이 이해하자는 같은 결의 논의

## 한 달 뒤 회고

*(2026-12-02 즈음 — vim.kr 워크숍 영상이나 녹화본에 접근 가능해지면 2부·3부(고급 워크플로우, Tangled 연동)를 포함한 전체 내용을 확인해 보강.)*
