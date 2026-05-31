---
title: "컨테이너 레지스트리는 어떻게 동작하는가 — 콘텐츠 주소 지정 blob 저장소 (digest·manifest·OCI)"
source_title: "Container registry from scratch"
source_url: "https://labs.iximiuz.com/tutorials/container-registry-from-scratch"
source_name: "labs.iximiuz.com · GeekNews 경유"
referrer_url: "https://news.hada.io/topic?id=30004"
summarized_at: "2026-05-29"
category: "backend"
tags: ["container-registry", "oci-distribution", "docker", "content-addressable", "manifest", "blob", "infra"]
---

# 컨테이너 레지스트리는 어떻게 동작하는가 — 콘텐츠 주소 지정 blob 저장소 (digest·manifest·OCI)

> 출처: [Container registry from scratch](https://labs.iximiuz.com/tutorials/container-registry-from-scratch) (iximiuz Labs, GeekNews 경유) · 정리일 2026-05-29

## 한 줄 요약
**컨테이너 레지스트리는 결국 *digest로 식별하는 콘텐츠 주소 지정(content-addressable) blob 저장소* — 이미지는 *레이어 blob들 + 설정 blob + 이들을 묶는 manifest*로 구성되고, push/pull은 그 blob과 manifest를 HTTP로 주고받는 단순한 절차다. 대부분 *OCI Distribution Spec*을 따르고 HTTP Basic 인증을 쓴다.**

## 핵심 포인트

- **콘텐츠 주소 지정 blob 저장소** — 모든 아티팩트(레이어·설정·manifest)를 *내용 해시(digest)*로 식별·중복 제거. 같은 레이어는 한 번만 저장되고 여러 이미지가 공유.
- **Push 절차** — *레이어 blob 업로드 → 설정(config) blob 업로드 → 이들을 참조하는 manifest 생성*. manifest가 이미지의 "목차".
- **Pull 절차** — *manifest 조회 → 참조된 모든 blob 다운로드* (push의 정확한 역순).
- **삭제의 함정** — *단순 untag만으로는 디스크가 비지 않음*. 여러 이미지가 *공유하는 레이어*를 고려해 *선택적 blob 삭제(GC)*가 필요.
- **멀티 플랫폼** — *image index(manifest list)*라는 한 계층을 더 둬서 플랫폼별 manifest를 묶음. 기존 API 엔드포인트는 그대로 유지.
- **표준** — *OCI Distribution Specification* + HTTP Basic 인증. 레지스트리 구현이 달라도 같은 프로토콜.

## 내 생각 · 적용점

레지스트리를 "마법 상자"가 아니라 *blob + manifest의 HTTP 저장소*로 이해하면 *이미지 크기 최적화(레이어 공유·순서)·캐시·GC·프라이빗 레지스트리 운영*의 의사결정이 명확해진다. CRS/백엔드 배포에서 *이미지 크기와 레이어 캐시*가 빌드·배포 속도를 좌우하므로, *자주 바뀌는 레이어를 뒤에 두는* Dockerfile 순서와 *주기적 GC(untag ≠ 삭제)*가 실무 포인트. 사내 레지스트리 용량 관리 시 *공유 레이어 때문에 단순 태그 삭제로는 공간이 안 빈다*는 점을 운영 룰에 명시.

## 연관 자료
- [Container registry from scratch](https://labs.iximiuz.com/tutorials/container-registry-from-scratch) (원문)
- [GeekNews — 30004](https://news.hada.io/topic?id=30004)
- OCI Distribution Specification

## 한 달 뒤 회고
*(2026-06-29 즈음 — 사내/CRS 레지스트리의 이미지 크기·레이어 캐시·GC 정책을 이 모델로 점검했는지 기록.)*
