#!/bin/bash
set -e # exit with nonzero exit code if anything fails

# run our compile script, discussed above
python build.py build

# The first and only commit to this new Git repo contains all the
# files present with the commit message "Deploy to GitHub Pages".
git add .
git commit -am "Automatically Deploy to GitHub Pages"
git status
git push --force --quiet "https://${GH_TOKEN}@${GH_REF}" `git subtree split --prefix site master`:gh-pages > /dev/null 2>&1
