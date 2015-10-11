#!/bin/bash

declare -i pNumber	 # Номер выбранного простого числа
declare -i dividerExist  # Найден ли делитель 0-false 1-true
declare -i pCount	 # Счетчик простых чисел
declare -i nCount        # Счетичик чисел

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

    #for i in primeNums
    while (( pCount < pNumber ))
    do
	(( nCount++ ))
	dividerExist=0
        
	if (( nCount > 5 )) 
	then 
	    if (( (nCount % 2) == 0 || (nCount % 10) == 5 ))
	    then continue
	    fi
        fi

	for i in ${pNums[@]}
	do

	    if (( i > (x = $(echo "sqrt($nCount)" | bc))))	
	    then break
	    fi 
	    if (( (nCount % i) == 0 ))
	    then 
		dividerExist=1
		break
	    fi
	done
        
	if (( dividerExist == 0 ))
	then
	    pNums[pCount]=$nCount
	    (( pCount++ ))
	fi
    done

    #for j in ${pNums[@]}
    #do 
	#echo -n "$j   "
    #done
    
    echo "${pNums[(( pCount - 1 ))]}"

done


exit 0

