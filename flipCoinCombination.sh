#!/bin/bash 

HEADS=1
TAILS=0
TT=0;TH=1;HT=2;HH=3

declare -A Singlet
declare -A Doublet
count=0
percentage=0
MaxCount=0

while [ $count -lt 50 ]
do 
    toss=$((RANDOM%4))
    if [ $toss -eq $TT ]
    then
        ((Doublet["TT"]++))
        echo TT is winner
    elif [ $toss -eq $TH ]
    then    
        ((Doublet["TH"]++))
        echo TH is winner
    elif [ $toss -eq $HT ]
    then    
        ((Doublet["HT"]++))
        echo HT is winner
    elif [ $toss -eq $HH ]
    then    
        ((Doublet["HH"]++))
        echo HH is winner    
    fi
    ((count++))           
done  

function getPercentage(){
    percentage=$(( ${Doublet[$1]}*100/$count ))
    echo $percentage
}

function sortDictionary(){

for i in ${!Doublet[@]}
do 
    if [ ${Doublet[$i]} -gt $MaxCount ]
    then
        MaxCount=${Doublet[$i]}
        MaxComb=$i
    fi
done

}

sortDictionary
echo Keys in Doublet is ${!Doublet[@]}
echo Values in Doublet is ${Doublet[@]}
echo TT wins in Doublet is ${Doublet["TT"]} and percentage is `getPercentage TT`
echo TH wins in Doublet is ${Doublet["TH"]} and percentage is `getPercentage TH`
echo HT wins in Doublet is ${Doublet["HT"]} and percentage is `getPercentage HT`
echo HH wins in Doublet is ${Doublet["HH"]} and percentage is `getPercentage HH`
echo winning combination is $MaxComb and percentage is `getPercentage $MaxComb`
