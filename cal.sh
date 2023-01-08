#!/bin/bash
echo "====== Simple Calculator ======="
total=0
regexNumber="^-?[0-9]+$"
regexOp="^[\+|\-|\*|\/|\%]$"

isNumber()
{
  while true
  do
    read -p "Input Number : " num
    if [[ $num =~ $regexNumber ]]
    then
      break
    fi
  done
  echo ${num}
}

isOp()
{
  while true
  do
    read -p "Input Operation (+, -, *, /, %) : " op
    if [[ $op =~ $regexOp ]]
    then
      break
    fi
  done
  echo "$op"
}

cal() 
{
echo "op: $1 / num1: $2 / num2: $3"
case $1 in
  "+") total=`expr $2 + $3` ;;
  "-") total=`expr $2 - $3` ;;
  "*") total=$(($2 * $3)) ;;
  "/") total=`expr $2 / $3` ;;
  "%") total=`expr $2 % $3` ;;
esac
}

isAnswer()
{
  while true
  do
    read -p "Will you stop? (YES, NO) : " answer
    if [ $answer = "YES" -o $answer = "NO" ]
    then
      break
    fi
  done
  echo ${answer}
}  

#main
num1=$(isNumber)
op=$(isOp)
num2=$(isNumber)
cal "$op" $num1 $num2

while true
do
  answer=$(isAnswer)
  if [ $answer = "YES" ]
  then
    break
  fi
  op=$(isOp)
  num2=$(isNumber)
  cal "$op" $total $num2
done

echo "Result : $total"
