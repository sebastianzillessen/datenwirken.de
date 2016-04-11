#!/bin/bash
set -e # exit with nonzero exit code if anything fails
# run our compile script, discussed above
echo "Running build.py build"
python build.py build

echo "Adding all changes and commiting"
# The first and only commit to this new Git repo contains all the
# files present with the commit message "Deploy to GitHub Pages".
git add .
git commit -am "Automatically Deploy to GitHub Pages"
git push "https://${GH_TOKEN}:x-oauth-basic@github.com/sebastianzillessen/datenwirken.de.git" master
git push --force --quiet "https://${GH_TOKEN}:x-oauth-basic@github.com/sebastianzillessen/datenwirken.de.git" `git subtree split --prefix site master`:gh-pages > /dev/null 2>&1
