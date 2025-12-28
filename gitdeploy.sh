#!/bin/bash
# push source to github

VENDIR=/home/rskz/Public/git/venblog/
PUBDIR=/home/rskz/Public/git/venblog/output/
LIVDIR=/home/rskz/Public/git/site-live/

rsync -av --delete --exclude='.*' $PUBDIR $LIVDIR

cd $VENDIR
chmod 666 ./posts/*

git add .
git commit -m "nikola has rebuilt 2025 revival"
git push origin src

cd $LIVDIR
git add .
git commit -am "publish update 2025 revival"
git push srv master

cd $VENDIR
