#!/bin/bash

echo "====== Simple Calculator ======="

total=
read -p "Input Number : " num1
read -p "Input Operation : " op
read -p "Input Number : " num2

case $op in
  '+') total=`expr $num1 + $num2` ;;
  '-') total=`expr $num1 - $num2` ;;
  '*') total=`expr $num1 \* $num2` ;;
  '/') total=`expr $num1 / $num2` ;;
esac

read -p "Will you stop? " answer

if [ $answer = "NO" ]
then
  while true
  do
    read -p "Input Operation : " op
    read -p "Input Number : " num2
    
    case $op in
      '+') total=`expr $num1 + $num2` ;;
      '-') total=`expr $num1 - $num2` ;;
      '*') total=`expr $num1 \* $num2` ;;
      '/') total=`expr $num1 / $num2` ;;
    esac
  
    read -p "Will you stop? " answer
  
    if [ $answer = "YES" ] 
    then 
      break 
    fi
  done
fi

echo "Result : $total"


