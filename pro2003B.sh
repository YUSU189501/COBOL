#!/bin/bash
# pro2004を実行。
./pro2004

# pro2005を実行。
./pro2005

# 人事ファイル1を改行させる。
cd /home/suzuki/DATA/ && pwd ; cut -c 1-36 JINJI2003-1 > JINJI2003-1A | cut -c 37-72 JINJI2003-1 >> JINJI2003-1A | cut -c 73-108 JINJI2003-1 >> JINJI2003-1A | cut -c 109-144 JINJI2003-1 >> JINJI2003-1A

# 人事ファイル2を改行させる。
cut -c 1-36 JINJI2003-2 > JINJI2003-2A | cut -c 37-72 JINJI2003-2 >> JINJI2003-2A | cut -c 73-108 JINJI2003-2 >> JINJI2003-2A | cut -c 109-144 JINJI2003-2 >> JINJI2003-2A

# 人事ファイル1と人事ファイル2を併合して人事併合ファイルに書き込む
cat JINJI2003-1A JINJI2003-2A > MERGE2003

# 人事併合ファイルを所属コードを昇順、従業員コードを降順ソートしてKEKKA2003に書き込む。
sort -k 2,2 -k 1nr,1 -t "," MERGE2003 > KEKKA2003

# 一時ファイル削除
rm -f MERGE2003

# 結果ファイルを表示する。
echo '結果ファイルを表示する。'
cat KEKKA2003
