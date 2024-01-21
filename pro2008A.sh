#!/bin/bash
#九九表を表示する。
sum=0
for ((i = 1; i <= 9; i++))
do
  for ((j = 1; j <= 9; j++))
  do
    ((sum = i * j))
     printf '%d×%d=%2d' "$i" "$j" "$sum"
     echo -n ' '
  done
  if ((j = 9))
    then
      echo # 改行する
    else
      continue
  fi
done
