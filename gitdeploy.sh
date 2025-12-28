#!/bin/bash
# sync live and push source to github
set -euo pipefail
WD="$HOME/Public/git/venblog/"
SRC="$HOME/Public/git/venblog/output/"
DST="$HOME/Public/git/site-live/"

echo "Running rsync for Nikola site output to live-site local repo"
rsync -av --delete \
  --exclude='.git/' \
  --exclude='.github/' \
  --exclude='.gitignore' \
  --exclude='.gitmodules' \
  "$SRC" "$DST"


echo "Running git push for venblog local repo."
cd $WD
# chmod 666 ./posts/*

git status
git add -A
if  git diff --cached --quiet; then
  echo "No changes to commit in venblog."
  exit 0
fi

git commit -m "Publish: $(date) nikola rebuild 2025 revival"
git push


echo "Running git push for site-live local repo."
cd $DST

git status
git add -A
if git diff --cached --quiet; then
  echo "No changes to commit in site-live."
  exit 0
fi

git commit -m "Publish: $(date) venblog 2025 revival"
git push
