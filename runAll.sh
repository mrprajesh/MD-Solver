#!/bin/bash
#INPDIR=tcSelected
INPDIR=inputs
#EXENAME=sciALL
#EXENAME=main-v1-1-randDFS
EXENAME=main
#~ EXENAME=$1
make
#~ g++ $EXENAME.cpp -o $EXENAME.out -std=c++14 -O3

OUTDIR=out$INPDIR$EXENAME`date +%d-%b-%Y-%H%M%S`
mkdir -p $OUTDIR

#scl enable devtoolset-7 bash
#g++ $EXENAME -o $EXENAME.out -O3 -std=c++14
#g++ $EXENAME.cpp -o $EXENAME.out -O3 -std=c++14

for file in `ls $INPDIR/*.vrp`  # ls -Sr [CXP0] # `ls -Sr $INPDIR/*.vrp`
do
  fileName=$(echo $file | awk -F[./] '{print $(NF-1)}')
  #./$EXENAME.out  $file > $OUTDIR/$fileName.sol
  #echo $file >> $OUTDIR/time.txt
  ./$EXENAME.out  $file > $OUTDIR/$fileName.sol 2>> $OUTDIR/time.txt
  echo $file - Done
  #cat $file rawSols2/$fileName.sol | ./$EXENAME.out
  #echo $fileName $(tail -1 $OUTDIR/time.txt) - $(cat $file $OUTDIR/$fileName.sol | ./vrp-validate.out)
done
#paste -d, - - - < $OUTDIR/time.txt > $OUTDIR/time2.txt
