#!/bin/bash
set -euo pipefail

# 커밋 author를 저장소 소유자 계정으로 고정한다.
# 컨테이너 기본 git 설정(Claude <noreply@anthropic.com>)을 쓰면
# 이 레포에서 만드는 커밋이 GitHub 프로필 컨트리뷰션 그래프에 반영되지 않는다.
git config user.name "JunSub_Dev"
git config user.email "song911130@gmail.com"
