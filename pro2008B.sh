#!/bin/sh
#九九表を表示する。
sum=0
for i in $(seq 1 9)
do
  for j in $(seq 1 9)
  do
    sum=$(expr "$i" \* "$j")
    printf '%d×%d=%2d' "$i" "$j" "$sum"
    echo -n ' '
  done
  if [ "$j" = 9 ]
    then
      echo # 改行する
    else
      continue
  fi
done
