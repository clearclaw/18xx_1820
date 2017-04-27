#! /bin/bash
set -e

lyx --export pdf2 ./1820-Rules.lyx
dir_root=`pwd`
mkdir -p build
pushd build
  dir_build=$dir_root/build
  rm -rf * || true
  xxpaper $dir_root/1820-Papers.xxp $*
  \rm ./charter_*-nooutline-* || true
  \rm ./market_*-nooutline-* || true
  \rm ./token_*-outline-* || true
  for file in *.ps
  do
    ps2pdf $file
  done
  rm ./*.ps
  for paper in letter A4
  do
    mkdir $paper
    pushd $paper
      dir_paper=$dir_build/$paper
      mv $dir_build/*-${paper}.pdf ./
      # cp ../../README.txt ./
      for type in outline nooutline
      do
        mkdir $type
        pushd $type
          dir_type=$dir_paper/$type
          cp $dir_paper/charter* ./
          cp $dir_paper/market* ./
          cp $dir_paper/token* ./
          cp $dir_paper/*-${type}-* ./
        popd
        name=1820_$type-$paper
        mv $type $name
        tar zcf $dir_build/$name.tar.gz $name
      done
    popd
  done
  rm -rf letter A4
  cp $dir_root/1820-Papers.xxp ./
  cp $dir_root/1820-Rules.pdf ./
  for f in map tracktiles tilesheet
  do
    cp $dir_root/1820_${f}.pdf .
  done
popd
