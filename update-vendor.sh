#!/bin/bash
#
# requires:
#  bash
#
set -e

cd vendor
for i in *; do
  echo === $i ===
  (
    cd $i
    git pull
  )
  git commit -m "update $i." $i
done
