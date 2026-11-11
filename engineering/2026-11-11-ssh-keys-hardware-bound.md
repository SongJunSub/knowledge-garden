---
title: "내 SSH 키를 모두 삭제했다(GeekNews, 원문 미확인) — 파일로 남는 개인키 자체를 없애 디스크 유출 경로를 지운다"
source_title: "내 SSH 키를 모두 삭제했다"
source_url: "https://news.hada.io/topic?id=36960"
source_name: "GeekNews (news.hada.io)"
referrer_url: "https://ondainc.slack.com/archives/C0AJL0096H4"
published_at: "확인 불가 (news.hada.io 차단으로 미확인)"
summarized_at: "2026-11-11"
category: "engineering"
tags: ["ssh", "yubikey", "tpm", "secure-enclave", "key-management", "hardware-security"]
---

# 내 SSH 키를 모두 삭제했다

> 출처: [내 SSH 키를 모두 삭제했다](https://news.hada.io/topic?id=36960) (GeekNews) · Slack `#개발-뉴스-dev-news` 경유 · 정리일 2026-11-11
>
> **출처 한계**: `news.hada.io` 차단으로 원문, hada 댓글 미확인. WebSearch로 저자, 매체를 특정하지 못했다. 다만 서술된 기술 디테일(resident key, ed25519-sk, Smart Card Auth)은 Yubico, OpenSSH 공식 자료와 교차확인했다.

## 한 줄 요약

**개인 환경에서 쓰던 파일형 SSH 개인키를 모두 삭제하고 YubiKey, TPM, Apple Secure Enclave에 묶인 키로 전환해, 보호되지 않은 평문 개인키가 디스크에 존재하는 상태 자체를 없앴다.**

## 핵심 포인트

- **자산을 더 안전하게 보관하는 게 아니라 경로 자체를 지운다**: 키를 암호화해 보관하는 수준이 아니라, 디스크에 평문 키 파일이 존재하는 상태 자체를 제거하는 접근.
- **세 하드웨어 바인딩 방식의 차이**: YubiKey, Secure Enclave는 하드웨어 안에서 개인키 연산을 수행해 키 자체가 추출 불가능하다. TPM 방식은 암호화된 키 파일을 디스크에 두되, 파일을 복사해도 원래 TPM 없이는 쓸 수 없다. 파일은 있어도 무의미와 파일 자체가 없음의 구분.
- **구체 구현**: YubiKey 5 이상은 OpenSSH만으로 ed25519-sk 키 사용 가능. macOS Sequoia부터는 OS의 Smart Card Auth 기능으로 Secure Enclave 기반 SSH 키를 별도 도구 없이 만들 수 있다.
- **교차확인된 사실**: YubiKey의 resident key는 디바이스에 완전히 저장되며, 로컬 핸들 파일을 지워도 복구할 수 있다. Yubico는 개인키가 디바이스에서 추출될 수 없다고 명시한다. 이 글의 핵심 주장과 기술적으로 부합한다.

## 인상 깊은 문장

> "YubiKey와 Secure Enclave는 하드웨어 안에서 개인키를 보호한다. TPM 방식은 암호화된 키 파일을 디스크에 두며, 파일을 복사해도 원래 TPM이 있어야 키를 쓸 수 있다." (Slack 발췌)

## 댓글

hada 댓글, HN/Lobsters 큐레이션 여부 미확인(차단). WebSearch로 저자, 매체를 특정하지 못해 n=1 개인 경험담인지 더 넓은 캠페인성 글인지 판단 불가. 다만 서술된 세부(ed25519-sk, Smart Card Auth)가 공식 문서와 정확히 일치해, 내용의 기술적 정확성 자체는 높아 보인다.

## 내 생각 · 적용점

### 핵심 전이 1 — "비밀이 평문으로 존재하는 경로 자체를 지운다"는 원칙을 사람 쪽에서 재현한 사례

[[2026-08-26-key-amnesia-agent-secrets]]는 AI 에이전트가 시크릿을 못 보게 만드는 도구였다. 이 글은 똑같은 원칙(비밀을 안전하게 저장하는 게 아니라 비밀이 평문으로 존재하는 경로 자체를 지운다)을 사람이 쓰는 SSH 키에 수동으로 적용한 사례다. 위협 대상은 다르지만 방어 구조는 동일하다.

### 핵심 전이 2 — 패스키 비판 글들의 반론이 이 SSH 전환에도 그대로 걸릴 수 있다

[[2026-10-12-passkeys-are-a-trap]], [[2026-07-23-passkeys-consumer-psychology]]는 키가 디바이스를 벗어날 수 없게 설계하는 생태계의 반대쪽 우려(원격 증명, 계정 복구 실패, 디바이스 분실 시 전체 잠김)를 다뤘다. 이 글의 하드웨어 바인딩 SSH 키도 YubiKey 분실, TPM 교체 시 서버 측 키 전체를 갈아치워야 하는 같은 복구 리스크를 안고 있을 것으로 보이는데, 발췌에는 그 대응책이 없다. 편의성만 강조된 반쪽 서사일 가능성.

## 호스피탈리티 / CRS 적용 포인트

**적용 가능성 있음.** 온다 엔지니어, 운영팀의 프로덕션 서버 접근키를 파일형 대신 YubiKey/TPM 바인딩으로 전환하면, 노트북 분실, 백업 유출로 인한 키 탈취 리스크를 구조적으로 제거할 수 있다. 다만 핵심 전이 2에서 짚은 하드웨어 분실 시 복구 절차를 팀 단위 인수인계 프로세스에 먼저 설계해야, 패스키 비판과 같은 함정을 피할 수 있다.

## 연관 자료

- [[2026-08-26-key-amnesia-agent-secrets]] — 비밀을 못 보게 만드는 같은 원칙의 에이전트 쪽 구현
- [[2026-10-12-passkeys-are-a-trap]] — 하드웨어 바인딩 인증의 반대쪽 우려
- [[2026-07-23-passkeys-consumer-psychology]] — 디바이스 바인딩 인증의 소비자 심리적 함정

## 한 달 뒤 회고

*(2026-12-11 즈음 — 온다 내부에서 YubiKey/TPM 기반 SSH 키 전환을 실제로 검토했는지, 복구 절차 설계가 진행됐는지 확인한다.)*
