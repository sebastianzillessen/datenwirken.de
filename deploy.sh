#!/bin/bash
git config --global user.email "nobody@nobody.org"
git config --global user.name "Travis CI"
git add .
git commit --amend --no-edit
TOK=""
echo "We are on $TRAVIS_REPO_SLUG"
if [ "$TRAVIS_REPO_SLUG" == "sebastianzillessen/datenwirken.de" ]; then
    TOK=$GITHUB_TOKEN
fi

if [ "$TRAVIS_REPO_SLUG" == "okfde/datenwirken.de" ]; then
    TOK=$GITHUB_TOKEN_OKFDE
fi
if [[ ! -z $TOK ]]; then
    git push -q --force "https://${TOK}@github.com/${TRAVIS_REPO_SLUG}.git" `git subtree split --prefix site master`:gh-pages
else
    echo "Reposiory TOKEN could not was not set to any value"
    exit -1
fi
