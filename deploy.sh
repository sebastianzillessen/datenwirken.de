#!/bin/bash
set -e # exit with nonzero exit code if anything fails

# run our compile script, discussed above
python build.py build

# go to the out directory and create a *new* Git repo
# inside this git repo we'll pretend to be a new user
git config user.name "Sebastian @ Travis CI"
git config user.email "sebastian@zillessen.info"

# The first and only commit to this new Git repo contains all the
# files present with the commit message "Deploy to GitHub Pages".
git add .
git commit -m "Automatically Deploy to GitHub Pages"
git push --force --quiet "https://${GH_TOKEN}@${GH_REF}" `git subtree split --prefix site master`:gh-pages > /dev/null 2>&1
