#!/bin/bash

set -x

rm -rf .dist
nue build --production
mkdir -p .dist/prod/.github/workflows
cp azure-static-web-apps-yellow-sand-0a85f5b00.yaml .dist/prod/.github/workflows/

cd .dist/prod/
git init
git remote add origin git@github.com:harlanwei/harlanwei.com.git
git add -A
git commit -m '🤖 Automated deployment'
git push -u origin main --force

cd -
git stage --all
git commit -m 'Update'
git push -f git@github.com:harlanwei/blog.git main
