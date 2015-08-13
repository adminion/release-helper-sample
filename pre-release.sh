#!/bin/bash

echo "pre-release params: $1 $2 $3"

releaseType=$1
release=$2
majorBranch=$3

# if this is a minor release, bump the minor version ()
if [ $releaseType == 'minor' ]
  then npm --no-git-tag-version version minor
fi

# add a major version branch header if this is a major release
if [ $releaseType == 'major' ] 
  then sed -i "4i # ${majorBranch}\n\n" CHANGES.md
fi

# add changes for this release to the changelog
sed -i "6i ## ${release}\n`changelog-maker`\n" CHANGES.md

