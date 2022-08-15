#!/bin/bash
EXE=hgsOnLarge
FOL=inputsLarge #no / suffix
OUT=out$(basename $FOL)$EXE`date +%d-%b-%Y-%H%M%S`
mkdir -p $OUT

echo "Running HGS-CVRP(2).."
echo "Ensure HGS-CVRP is downloaded, edited and built"
cp HGS-CVRP/build/hgs $EXE

./$EXE $FOL/Antwerp1.vrp     $OUT/Antwerp1.sol     -seed 1 -t 7200 -it 1000 && echo Done - Antwerp1.vrp    
./$EXE $FOL/Brussels1.vrp    $OUT/Brussels1.sol    -seed 1 -t 7200 -it 1000 && echo Done - Brussels1.vrp   
./$EXE $FOL/Flanders1.vrp    $OUT/Flanders1.sol    -seed 1 -t 7200 -it 1000 && echo Done - Flanders1.vrp   
./$EXE $FOL/Ghent1.vrp       $OUT/Ghent1.sol       -seed 1 -t 7200 -it 1000 && echo Done - Ghent1.vrp      
./$EXE $FOL/Leuven2.vrp      $OUT/Leuven2.sol      -seed 1 -t 7200 -it 1000 && echo Done - Leuven2.vrp     
./$EXE $FOL/X-n1001-k43.vrp  $OUT/X-n1001-k43.sol  -seed 1 -t 7200 -it 1000 && echo Done - X-n1001-k43.vrp 
./$EXE $FOL/Antwerp2.vrp     $OUT/Antwerp2.sol     -seed 1 -t 7200 -it 1000 && echo Done - Antwerp2.vrp    
./$EXE $FOL/Brussels2.vrp    $OUT/Brussels2.sol    -seed 1 -t 7200 -it 1000 && echo Done - Brussels2.vrp   
./$EXE $FOL/Flanders2.vrp    $OUT/Flanders2.sol    -seed 1 -t 7200 -it 1000 && echo Done - Flanders2.vrp   
./$EXE $FOL/Ghent2.vrp       $OUT/Ghent2.sol       -seed 1 -t 7200 -it 1000 && echo Done - Ghent2.vrp      
./$EXE $FOL/Leuven1.vrp      $OUT/Leuven1.sol      -seed 1 -t 7200 -it 1000 && echo Done - Leuven1.vrp     

echo "For TIME, run this command: grep TIME $OUT/*.log | awk -F[:] {'print $1,$NF'} "
