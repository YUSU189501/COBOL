#!/bin/bash
# pro2002を実行して結果をlogファイルに書き込む。
./pro2002 > pro2002_logfile
# 西暦ファイルを表示する。
echo '西暦ファイルを表示する。'
cat /home/suzuki/DATA/SEIREKI2002
# 和暦ファイルを表示する。
echo '和暦ファイルを表示する。'
cat /home/suzuki/DATA/WAREKI2002