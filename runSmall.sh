#!/bin/bash
#FOL=tcSelected #no / suffix
 
# for small instances
FOL=inputsSmall #no / suffix
EXE=hgsOnSmall
#~ EXE=hgsOnDefault

echo "Running HGS-CVRP(2).."
echo "Ensure HGS-CVRP is downloaded and built"
cp HGS-CVRP/build/hgs $EXE

# for large instances
#~ FOL=../inputsLarge #no / suffix
#~ EXE=hgsOnLarge

OUT=out$(basename $FOL)$EXE`date +%d-%b-%Y-%H%M%S`

mkdir -p $OUT
for f in `ls $FOL/*.vrp `; 
do 
    file=$(echo $f | awk -F[/.] '{print $(NF-1)}') 
    ./$EXE $f $OUT/$file.sol -seed 1 > $OUT/$file.log 2>> $OUT/anError.log
    echo $file - Done
done

# Reruning for CMT AND Golden with round 0 and replace files
for f in `ls $FOL/CMT*.vrp $FOL/Gol*.vrp`; 
do 
    file=$(echo $f | awk -F[/.] '{print $(NF-1)}') 
    ./$EXE $f $OUT/$file.sol -seed 1 -round 0 > $OUT/$file.log 2>> $OUT/anError.log
    echo $file - Done
done

echo "For TIME, run this command: grep TIME $OUT/*.log | awk -F[:] {'print $1,$NF'} "
