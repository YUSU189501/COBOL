#!/bin/bash
#カレントディレクトリを設定する。
cd /home/suzuki && pwd

# pro2006を実行。
./pro2006

# dbpro02を実行。
./dbpro02

# 試験結果ファイル
echo '*試験結果ファイル*'

cat /home/suzuki/DATA/SHIKENKEKKA

# 合格者結果ファイル
echo '*合格者結果ファイル*'

cat /home/suzuki/DATA/SHIKENKEKKAFINAL
