#!/usr/bin/env bash

set -euo pipefail

UPSTREAM_URL="https://github.com/Rosemoe/sora-editor.git"
UPSTREAM_REMOTE="upstream"
ORIGIN_REMOTE="origin"
BRANCH_NAME="sync-upstream-$(date +%Y%m%d-%H%M%S)"

if ! git remote get-url "$ORIGIN_REMOTE" >/dev/null 2>&1; then
    echo "Error: origin remote is not configured."
    echo "Please add your fork first, for example:"
    echo "  git remote add origin https://github.com/<your-user>/<your-fork>.git"
    exit 1
fi

echo "Origin remote: $(git remote get-url "$ORIGIN_REMOTE")"

echo "Creating feature branch: $BRANCH_NAME"
git checkout -b "$BRANCH_NAME"

if git remote get-url "$UPSTREAM_REMOTE" >/dev/null 2>&1; then
    CURRENT_URL=$(git remote get-url "$UPSTREAM_REMOTE")

    if [ "$CURRENT_URL" != "$UPSTREAM_URL" ]; then
        echo "Updating upstream remote URL..."
        git remote set-url "$UPSTREAM_REMOTE" "$UPSTREAM_URL"
    else
        echo "Upstream remote already configured correctly."
    fi
else
    echo "Adding upstream remote..."
    git remote add "$UPSTREAM_REMOTE" "$UPSTREAM_URL"
fi

echo "Fetching upstream..."
git fetch "$UPSTREAM_REMOTE"

echo "Merging upstream/main..."
git merge "$UPSTREAM_REMOTE/main"

echo "Pushing branch to origin..."
git push -u origin "$BRANCH_NAME"

echo
echo "Done."
echo "Create a PR from '$BRANCH_NAME' into your target branch on GitHub."