#!/bin/bash
# knowledge-writer sync script
# Usage:
#   sync.sh pull          - Clone or pull latest
#   sync.sh push "msg"    - Add, commit, push with message
#
# Environment:
#   GITHUB_TOKEN          - GitHub Personal Access Token (required for push)
#   KNOWLEDGE_BASE_PATH   - Custom local path (optional)

set -e

GITHUB_USER="SayGoodBey"
REPO_NAME="knowledge-base"
WORKSPACE="${KNOWLEDGE_BASE_PATH:-$HOME/.openclaw/workspace/knowledge-base}"

get_repo_url() {
  if [ -n "$GITHUB_TOKEN" ]; then
    echo "https://${GITHUB_USER}:${GITHUB_TOKEN}@github.com/${GITHUB_USER}/${REPO_NAME}.git"
  else
    echo "https://github.com/${GITHUB_USER}/${REPO_NAME}.git"
  fi
}

pull() {
  local url
  url=$(get_repo_url)
  
  if [ -d "$WORKSPACE/.git" ]; then
    cd "$WORKSPACE"
    git remote set-url origin "$url"
    git pull --rebase origin main 2>/dev/null || true
  else
    git clone "$url" "$WORKSPACE"
    cd "$WORKSPACE"
  fi
  echo "✅ Synced: $WORKSPACE"
}

push() {
  local msg="${1:-📝 update knowledge base}"
  
  if [ -z "$GITHUB_TOKEN" ]; then
    echo "❌ Error: GITHUB_TOKEN environment variable is required for push"
    echo "   Set it with: export GITHUB_TOKEN=ghp_xxxxx"
    exit 1
  fi
  
  cd "$WORKSPACE"
  
  # Update remote URL with token
  local url
  url=$(get_repo_url)
  git remote set-url origin "$url"
  
  # Pull first to avoid conflicts
  git pull --rebase origin main 2>/dev/null || true
  
  # Add and commit
  git add -A
  if git diff --cached --quiet; then
    echo "ℹ️  No changes to commit"
    exit 0
  fi
  
  git commit -m "$msg"
  git push origin main
  echo "✅ Pushed: $msg"
}

case "${1}" in
  pull)
    pull
    ;;
  push)
    shift
    push "$*"
    ;;
  *)
    echo "Usage: sync.sh [pull|push \"commit message\"]"
    echo ""
    echo "Environment variables:"
    echo "  GITHUB_TOKEN          - Required for push (GitHub PAT with repo scope)"
    echo "  KNOWLEDGE_BASE_PATH   - Custom local path (default: ~/.openclaw/workspace/knowledge-base)"
    exit 1
    ;;
esac
