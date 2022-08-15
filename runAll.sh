#!/bin/bash
#~ INPDIR=tcSelected
#~ INPDIR=inputsSmall
#~ INPDIR=inputsLarge

INPDIR=inputs
 
EXENAME=main
 
make
 

OUTDIR=out$INPDIR$EXENAME`date +%d-%b-%Y-%H%M%S`
mkdir -p $OUTDIR

for file in `ls $INPDIR/*.vrp`  # ls -Sr [CXP0] # `ls -Sr $INPDIR/*.vrp`
do
  fileName=$(echo $file | awk -F[./] '{print $(NF-1)}')
  ./$EXENAME.out  $file > $OUTDIR/$fileName.sol 2>> $OUTDIR/time.txt
  echo $file - Done
done
 
#~ grep Cost $OUTDIR/*.sol

echo "Checkout the file $OUTDIR/time.txt for more details."
echo "Run 'grep Cost $OUTDIR/*.sol' to get Cost per instance"
