#! /bin/bash
set -e

# lyx --export pdf2 ./1820-Rules.lyx
mkdir -p build
pushd build
  # mv ../1820-Rules.pdf ./
  xxpaper ../1820-Papers.xxp $*
  rm market_*-nooutline* || true
  cp ../1820-Papers.xxp ./
  # cp ../README.txt ./
  for file in *.ps
  do
    ps2pdf $file
  done
  rm *.ps
popd
