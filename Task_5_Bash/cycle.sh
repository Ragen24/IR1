#!/bin/bash

index=0

echo; echo "Цикл for in"; echo

for planet in "Меркурий 36" "Венера 67" "Земля 93" "Марс 142" "Юпитер 483"
do
  set -- $planet # Разбиение на позиционные параметры
 
  echo "$1 в $2,000,000 миль от Солнца."
done

echo; echo "Цикл while"; echo 

while [ $index -lt 10 ]
do
  echo "Номер итерации: $index"
  (( index++ ))
done

index=0

echo; echo "Цикл until"; echo

until [ $index -eq 10 ]
do
  echo "Номер итерации: $index"
  (( index++ ))
done

exit 0
