#!/bin/bash
git config --global user.email "nobody@nobody.org"
git config --global user.name "Travis CI"
git add .
git commit --amend --no-edit
echo "We are on $TRAVIS_REPO_SLUG"
if [[ ! -z $GITHUB_TOKEN]]; then
    git push -q --force "https://${GITHUB_TOKEN}@github.com/${TRAVIS_REPO_SLUG}.git" `git subtree split --prefix site master`:gh-pages
else
    echo "GITHUB_TOKEN variable not defined, we cannot push!"
    exit -1
fi
