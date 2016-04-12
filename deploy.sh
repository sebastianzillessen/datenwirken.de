#!/bin/bash
git config --global user.email "nobody@nobody.org"
git config --global user.name "Travis CI"
git add .
git commit -m "Deploy to Github Pages"
echo "Token ${GITHUB_TOKEN}"
echo "Repo ${GITHUB_REPO}"
git push --force "https://${GITHUB_TOKEN}@$github.com/${GITHUB_REPO}.git" `git subtree split --prefix site master`:gh-pages
