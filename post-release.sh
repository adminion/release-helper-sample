#!/bin/bash

echo "post-release params: $1 $2 $3"

releaseType=$1
release=$2
majorBranch=$3

npm --no-git-tag-version version patch 

readonly VERSION=`node -e "console.log(require('./package').version);"`

git commit -a -m "working on v${VERSION}"

