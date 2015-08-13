#!/bin/bash

echo "pre-release params: $1 $2 $3"

releaseType=$1
release=$2
majorBranch=$3

# if this is a minor release, bump the minor version 
if [ $releaseType == 'minor' ]
  then npm --no-git-tag-version version minor
fi

# add a major version branch header if this is a major release
if [ $releaseType == 'major' ] 
  then sed -i "4i # ${majorBranch}\n\n" CHANGES.md
fi

changes=`changelog-maker techjeffharris`

# add changes for this release to the changelog
# tried using sed, and it fails when trying to add strings with \n trying awk instead
newChangelog=`awk -W inplace -v insert="$changes" '{print} NR==5{print insert}' CHANGES.md`

echo "$newChangelog" > CHANGES.md
