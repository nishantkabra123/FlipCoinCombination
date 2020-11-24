#!/bin/bash 

HEADS=1
TAILS=0
TTT=0;TTH=1;THT=2;HTT=3;THH=4;HTH=5;HHT=6;HHH=7

declare -A Singlet
declare -A Triplet
count=0
percentage=0
MaxCount=0

while [ $count -lt 50 ]
do 
    toss=$((RANDOM%8))
    if [ $toss -eq $TTT ]
    then
        ((Triplet["TTT"]++))
    elif [ $toss -eq $TTH ]
    then    
        ((Triplet["TTH"]++))
    elif [ $toss -eq $THT ]
    then    
        ((Triplet["THT"]++))
    elif [ $toss -eq $HTT ]
    then    
        ((Triplet["HTT"]++))  
    elif [ $toss -eq $THH ]
    then    
        ((Triplet["THH"]++))
    elif [ $toss -eq $HTH ]
    then    
        ((Triplet["HTH"]++))
    elif [ $toss -eq $HHT ]
    then    
        ((Triplet["HHT"]++))
    elif [ $toss -eq $HHH ]
    then    
        ((Triplet["HHH"]++))        
    fi
    ((count++))           
done  

function getPercentage(){
    percentage=$(( ${Triplet[$1]}*100/$count ))
    echo $percentage
}

function sortDictionary(){

for i in ${!Triplet[@]}
do 
    echo $i wins in Triplet is ${Triplet[$i]} and percentage is `getPercentage $i`
    if [ ${Triplet[$i]} -gt $MaxCount ]
    then
        MaxCount=${Triplet[$i]}
        MaxComb=$i
    fi
done

}

sortDictionary
echo Keys in Triplet is ${!Triplet[@]}
echo Values in Triplet is ${Triplet[@]}
echo winning combination is $MaxComb and percentage is `getPercentage $MaxComb`
