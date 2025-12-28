#!/bin/bash
# push source to github
set -euo pipefail

DIR=/home/rskz/Public/git/venblog/
SRC=/home/rskz/Public/git/venblog/output/
DST=/home/rskz/Public/git/site-live/

rsync -av --delete --exclude='.*' --exclude='.*/*' "$SRC" "$DST"

cd $DIR
chmod 666 ./posts/*

git add .
git commit -m "nikola has rebuilt 2025 revival"
git push origin src

cd $DST
git add .
git commit -am "publish update 2025 revival"
git push srv master

cd $DIR
