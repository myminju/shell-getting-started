#!/bin/bash
echo "====== Simple Calculator ======="
TOTAL=0
REGEX_NUMBER="^-?[0-9]+$"
REGEX_OPERATION="^[\+|\-|\*|\/|\%]$"

is_number()
{
  while true
  do
    read -p "Input Number : " num
    if [[ $num =~ $REGEX_NUMBER ]]
    then
      break
    fi
  done
  echo ${num}
}

is_operation()
{
  while true
  do
    read -p "Input Operation (+, -, *, /, %) : " op
    if [[ $op =~ $REGEX_OPERATION ]]
    then
      break
    fi
  done
  echo "$op"  # 중요
}

calculate() 
{
case $1 in
  "+") TOTAL=`expr $2 + $3` ;;
  "-") TOTAL=`expr $2 - $3` ;;
  "*") TOTAL=$(($2 * $3)) ;;
  "/") TOTAL=`expr $2 / $3` ;;
  "%") TOTAL=`expr $2 % $3` ;;
esac
}

is_answer()
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

# 피연산자1, 연산자, 피연산자2 받기
num1=$(is_number)
op=$(is_operation)
num2=$(is_number)

# 계산 함수에 받은 값 넘겨주기 
calculate "$op" $num1 $num2

while true
do
  answer=$(is_answer)
  # 연산을 그만하겠다고 하면
  if [ $answer = "YES" ]
  then
    break
  fi
  # 연산을 계속하겠다고 하면
  op=$(is_operation)
  num2=$(is_number)
  calculate "$op" $TOTAL $num2
done

echo "Result : $TOTAL"
