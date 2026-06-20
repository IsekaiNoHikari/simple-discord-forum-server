#!/bin/sh

set -e

base_branch="${BASE_BRANCH:-origin/main}"

if ! git rev-parse --verify "$base_branch" >/dev/null 2>&1; then
  echo "Base branch '$base_branch' not found. Skipping commit range check."
  exit 0
fi

range="$base_branch..HEAD"

if [ -z "$(git rev-list "$range")" ]; then
  exit 0
fi

for commit in $(git rev-list "$range"); do
  message="$(git log -1 --pretty=%B "$commit")"
  echo "$message" | pnpm exec commitlint
done
