#! /bin/bash
set -e

TMPRULES=1820-Rules.pdf-$$
lyx --export pdf2 ./1820-Rules.lyx
mv 1820-Rules.pdf $TMPRULES
gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=1820-Rules.pdf $TMPRULES --TEST 1820-TrackTileSheet.pdf
# pdfjam --outfile 1820-Rules-A4.pdf --paper a4paper 1820-Rules-letter.pdf
rm $TMPRULES

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
      mv $dir_build/*-${paper}.pdf ./ || true
      # cp ../../README.txt ./
      for type in outline nooutline
      do
        mkdir $type
        pushd $type
          dir_type=$dir_paper/$type
          cp $dir_paper/charter* ./ || true
          cp $dir_paper/market* ./ || true
          cp $dir_paper/token* ./ || true
          cp $dir_paper/*-${type}-* ./ || true
        popd
        name=1820_$type-$paper
        mv $type $name
        tar zcf $dir_build/$name.tar.gz $name
      done
    popd
  done
  rm -rf letter A4
  for f in Papers.xxp Rules.pdf TrackTileSheet.pdf TrackTiles.pdf
  do
    cp $dir_root/1820-${f} .
  done
  
  cp ${dir_root}/M20.ps 1820-Map-A1.ps
  for size in letter legal A4
  do
    fname="1820-Map-${size}.ps"
    poster -v -i 1450x1700p -s 1.0 -m ${size} -o ${fname} 1820-Map-A1.ps
    ps2pdf $fname 
    rm $fname
  done
  ps2pdf 1820-Map-A1.ps
  rm 1820-Map-A1.ps
  
popd
