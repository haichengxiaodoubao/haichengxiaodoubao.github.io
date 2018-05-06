#!/bin/bash
set -ev
git clone https://${GH_REF} .deploy_git
cd .deploy_git
git checkout master
cd ../
mv .deploy_git/.git/ ./public/
cd ./public
git config user.name  "haichengxiaodoubao" # 这里改成自己的 Github 用户名
git config user.email "1711460132@qq.com" # 这里改成自己的 Github 邮箱
# add commit timestamp
git add .
git commit -m "Travis CI Auto Builder at `date +"%Y-%m-%d %H:%M"`"
git push --force --quiet "https://${first_token}@${GH_REF}" master:master # first_token 改成你在 Travis CI 中添加的环境变量名称