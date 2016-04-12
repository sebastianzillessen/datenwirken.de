#!/bin/bash
git config --global user.email "nobody@nobody.org"
git config --global user.name "Travis CI"
cd site
git init
git add .
git commit -am "Automatic build"
echo "We are on $TRAVIS_REPO_SLUG"
if [[ ! -z $GITHUB_TOKEN ]]; then
    git push -q --force "https://${GITHUB_TOKEN}@github.com/${TRAVIS_REPO_SLUG}.git" master:gh-pages
else
    echo "GITHUB_TOKEN variable not defined, we cannot push!"
    exit -1
fi
cd ..
