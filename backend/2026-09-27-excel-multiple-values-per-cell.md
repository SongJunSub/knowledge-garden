---
title: "Excel, 이제 하나의 셀에 여러 값 저장 지원 — 목록·배열·중첩 배열로 '셀 하나 = 값 하나' 규칙이 깨진다"
source_title: "Put multiple values in one cell with lists and arrays in Excel"
source_url: "https://techcommunity.microsoft.com/blog/microsoft365insiderblog/put-multiple-values-in-one-cell-with-lists-and-arrays-in-excel/4559395"
source_name: "Microsoft 365 Insider Blog / Excel Blog"
referrer_url: "https://news.hada.io/topic?id=34306"
published_at: "2026-09-24"
summarized_at: "2026-09-27"
category: "backend"
tags: ["excel", "spreadsheet", "data-modeling", "list", "nested-array"]
---

# Excel, 이제 하나의 셀에 여러 값 저장 지원 — 목록·배열·중첩 배열로 "셀 하나 = 값 하나" 규칙이 깨진다

> 출처: [Put multiple values in one cell with lists and arrays in Excel](https://techcommunity.microsoft.com/blog/microsoft365insiderblog/put-multiple-values-in-one-cell-with-lists-and-arrays-in-excel/4559395) (Excel Blog 팀) · GeekNews(id=34306) 경유 · 정리일 2026-09-27
>
> **출처 한계**: `techcommunity.microsoft.com`과 `news.hada.io` 모두 이 세션에서 egress 차단돼 직접 열람하지 못했다. 2차 보도(neowin, windowslatest 등)도 전부 동일하게 차단돼 WebSearch 스니펫만으로 재구성했다. 이 노트는 가볍게 다루는 리소스성 글로 처리한다.

## 한 줄 요약

**Excel이 목록(List)·셀 내부 배열·중첩 배열을 도입해 한 셀에 여러 값을 저장하고 개별 값으로 계산할 수 있게 하면서, "셀 하나 = 값 하나"라는 스프레드시트의 수십 년 된 전제를 깬다.**

## 핵심 포인트

- **목록(List)** — 한 셀에 여러 값을 콤마/세미콜론으로 구분해 입력. 겉보기엔 텍스트지만 내부적으로 개별 값으로 유지돼, "Carlos, Henrietta, Jacob"이 담긴 셀이 있어도 필터에서 Carlos만 개별 항목으로 필터링 가능.
- **셀 내부 배열(Arrays in cells)** — 배열을 값 또는 수식 결과로 셀 하나에 그대로 저장. 기존처럼 여러 셀에 스필(spill)시키지 않아도 됨.
- **중첩 배열(Nested arrays)** — 배열 안에 배열을 넣을 수 있고, 지원 수식은 중첩 구조 전체를 결과로 반환.
- **새 함수 4종** — ***FLATTEN***(중첩 배열의 레이어를 하나 이상 제거해 평탄화), ***HAS/HASANY/HASALL***(값 하나·여러 값 중 하나·모든 값이 배열에 있는지 확인).
- **실사용 예시** — 프로젝트 담당자를 한 셀에 여러 명(List)으로 유지하며 개별 담당자 기준 필터링, 설문 응답을 한 셀에 보관하면서 개별 선택지 기준 집계.
- **제약** — 조건부 서식·데이터 유효성 검사·차트·피벗테이블·Power Query·찾아바꾸기는 아직 완전히 지원하지 않음. 현재 Beta Channel 프리뷰로, MS 공식 권고는 "중요 문서에는 아직 쓰지 말라."

## 인상 깊은 문장

windowslatest 보도가 "Microsoft is breaking a decades-old Excel rule"이라 표현할 만큼, "셀 하나 = 값 하나"라는 스프레드시트의 근본 전제를 깨는 변화로 프레이밍됐다.

## 댓글

**확인 제한적.** hada 댓글 수는 원천 차단으로 확인 못 했다. HN 스레드 존재는 확인했으나(item id=49849832) 도메인 차단으로 실제 댓글 내용은 못 읽었다. WebSearch 요약은 "덜 숙련된 사용자에게 멘탈모델이 복잡해질 수 있다는 우려가 논의 중심"이라고 하나, 이는 검색엔진의 재구성이라 신뢰도가 낮다 — 구체적인 댓글 내용은 확인 불가로 남긴다.

## 내 생각 · 적용점

이 저장소에 Excel·스프레드시트 관련 기존 노트는 없다. 실용 기능 공지 글이라 가벼운 리소스성으로 처리하고, 억지로 연결고리를 만들지 않는다.

## 호스피탈리티 / CRS 적용 포인트

직접 적용은 멀다 — 이 기능은 엔드유저용 스프레드시트 UX/셀 데이터 모델 층위 얘기라, 온다의 실제 DB 스키마(정규화된 RDB, 요금 플랜 테이블, 부대서비스 조인 테이블 등)와 곧바로 맞닿지 않는다. 다만 "여러 개의 관련 값을 하나의 단위로 유지하면서도 개별 항목 단위로 질의 가능해야 한다"는 요구(List의 존재 이유) 자체는 CRS에서도 익숙한 문제의식이다 — 객실 하나가 여러 요금 플랜을 가지면서도 플랜별 필터·집계가 가능해야 하는 것, 예약 하나에 여러 부대서비스가 달리면서도 서비스별 매출 집계가 가능해야 하는 것과 같은 모양이다. Excel의 해법(List/배열)은 스프레드시트 셀 층위의 UX 트릭이고, CRS/RDB에서는 이미 정규화된 자식 테이블이나 Postgres 배열/JSONB 컬럼으로 풀어온 문제라, 새로운 통찰이라기보다 익숙한 문제의 다른 층위 재현 정도로 가볍게 참고한다.

## 연관 자료

없음 — 억지 연결 대신 정직하게 비워둔다.

## 한 달 뒤 회고

*(2026-10-27 즈음 — Beta 기능이 정식 롤아웃됐는지, 조건부 서식·피벗테이블 등 미지원 영역이 얼마나 채워졌는지 확인.)*
