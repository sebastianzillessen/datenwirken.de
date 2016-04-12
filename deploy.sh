#!/bin/bash
git config --global user.email "nobody@nobody.org"
git config --global user.name "Travis CI"
git add .
git commit -m "Deploy to Github Pages"
REP=""
TOK=""
echo "We are on $TRAVIS_REPO_SLUG"
if [ "$TRAVIS_REPO_SLUG" == "sebastianzillessen/datenwirken.de" ]; then
    REP=$GITHUB_REPO
    TOK=$GITHUB_TOKEN
fi

if [ "$TRAVIS_REPO_SLUG" == "okfde/datenwirken.de" ]; then
    REP=$GITHUB_REPO_OKFDE
    TOK=$GITHUB_TOKEN_OKFDE
fi


echo "Repository: '$REP'"
if [[ ! -z $REP ]]; then
    git push --force "https://${TOK}@github.com/${REP}.git" `git subtree split --prefix site master`:gh-pages
else
    echo "Reposiory was not set to any value"
    exit -1
fi
