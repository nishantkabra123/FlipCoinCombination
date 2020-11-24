#!/bin/bash 

HEADS=1
TAILS=0

declare -A Singlet
count=0
percentage=0

while [ $count -lt 10 ]
do 
    toss=$((RANDOM%2))
    if [ $toss -eq $HEADS ]
    then
        ((Singlet["H"]++))
        echo Heads is winner
    elif [ $toss -eq $TAILS ]
    then    
        ((Singlet["T"]++))
        echo Tails is winner
    fi
    ((count++))           
done  

function getPercentage(){
    percentage=$(( ${Singlet[$1]}*100/$count ))
    echo $percentage
}

echo Keys in Singlet is ${!Singlet[@]}
echo head wins in Singlet is ${Singlet["H"]} and percentage is `getPercentage H`
echo tail wins in Singlet is ${Singlet["T"]} and percentage is `getPercentage T`