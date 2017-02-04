#! /bin/bash
set -e

# lyx --export pdf2 ./1820-Rules.lyx
mkdir -p build
pushd build
  xxpaper ../1820-Papers.xxp $*
  \rm market_*-nooutline* || true
  for file in *.ps
  do
    ps2pdf $file
    base="${file%%.*}.pdf"
    target="${base%%.*}[all,10].png"
    convert -density 300 ${base} -quality 90 "$target"
    convert -rotate 90 ${target} ${target}
    echo $target
  done
  rm *.ps 
  rm *size*
  rm *.pdf
popd
