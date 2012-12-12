#!/bin/bash

git checkout master
git branch -D linaro-tracking
git branch linaro-tracking
git checkout linaro-tracking

branches=(`git branch | grep linaro-tracking-`)

for branch in "${branches[@]}" ; do
	echo "----------------------------------------"
	echo "Merging branch $branch"
	echo "----------------------------------------"
	git merge $branch
done

# create the armlt-tracking branch
#   the CI job depends on this branch, so we need it
#   in this case, it's just a clone of linaro-tracking
git branch -D armlt-tracking
git branch armlt-tracking
