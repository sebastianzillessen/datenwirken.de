#!/bin/bash

branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')

echo "$TRAVIS_BRANCH"
if [[ "$TRAVIS_BRANCH" = "master" ]]; then
    git config --global user.email "nobody@nobody.org"
    git config --global user.name "Travis CI"
    cd site
    git init
    git add .
    git commit -am "Automatic build"
    echo "We are on branch $TRAVIS_BRANCH at repo $TRAVIS_REPO_SLUG"
    if [[ ! -z $GITHUB_TOKEN ]]; then
        git push -q --force "https://${GITHUB_TOKEN}@github.com/${TRAVIS_REPO_SLUG}.git" master:gh-pages
        echo "Successfully deployed!"
        cd ..
        exit 0
    else
        echo "GITHUB_TOKEN variable not defined, we cannot push!"
        exit -1
    fi
else
    echo "No deployment"
    exit 0
fi