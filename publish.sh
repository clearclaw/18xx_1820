#! /bin/bash

set -e

./build.sh $*
pushd build
  rsync -ra --delete * claw@kanga.nu:~/public_html/1820/
popd
