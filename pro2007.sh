#!/bin/bash
#カレントディレクトリを設定する。
cd /home/suzuki && pwd

# pro2006を実行。
./pro2007

# dbpro02を実行。
./dbpro03

# 退職者ファイル
echo '*退職者ファイル*'

cat /home/suzuki/DATA/TAISYOKU2007
