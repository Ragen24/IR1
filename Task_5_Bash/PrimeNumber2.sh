#!/bin/bash


declare -i pNumber
declare -i pCount
declare -i nCount
declare dividers

while true 
do
    pCount=1
    nCount=2

    while true
    do
	echo
	echo -n "Введите номер простого числа, в диапазоне 0 < n < 105 (0 - для выхода): "
	read pNumber
	echo
	if [[ pNumber -gt -1 && pNumber -lt 105 ]]
	then break
	else echo "Число вне диапазона"
	fi
    done

    if [[ pNumber -eq 0 ]]
    then break
    fi

    declare -a pNums

    pNums[0]=2

    while (( pCount < pNumber ))
    do
	(( nCount++ ))

	dividers=$(factor $nCount)
	x=$(echo "$nCount: ")
        y=$(echo "${dividers#$x}")
	if [[ $y == $nCount ]]
	then
	    pNums[pCount]=$nCount
	    (( pCount++ ))
	fi	

    done

    #for j in ${pNums[@]} 
    #do
	#echo -n "$j "
    #done

    echo "${pNums[(( pCount - 1 ))]}"   

done

exit 0
