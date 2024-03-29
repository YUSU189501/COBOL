#!/bin/bash

# カレントディレクトリを指定
cd /home/suzuki && pwd

# pro2004を実行。
./pro2004

# pro2005を実行。
./pro2005

# 人事ファイル1ファイル
INFILE1='/home/suzuki/DATA/JINJI2003-1'

# 人事ファイル2ファイル
INFILE2='/home/suzuki/DATA/JINJI2003-2'

# 人事ファイル1整形後ファイル
OUTFILE1='/home/suzuki/DATA/JINJI2003-1A'

# 人事ファイル2整形後ファイル
OUTFILE2='/home/suzuki/DATA/JINJI2003-2A'

# 併合ファイル
MERGE='/home/suzuki/DATA/MERGE2003'

# 結果ファイル
KEKKA='/home/suzuki/DATA/KEKKA2003'


# 人事ファイル1を改行させる。
# レコードの長さを指定する。
record_length=36

# レコード数算出する。
num_records=$(cat "${INFILE1}" | wc -c )

num_records=$((num_records/record_length))

# レコードごとの処理をする。
for ((i=0;i<num_records;i++)); do
	start=$((i * record_length + 1))
	end=$(((i + 1) * record_length))
	cut -c "${start}"-"${end}" "${INFILE1}" >> "${OUTFILE1}"
done

# 人事ファイル2を改行させる。
# レコードの長さを指定する。
record_length=36

# レコード数算出する。
num_records=$(cat "${INFILE2}" | wc -c )

num_records=$((num_records/record_length))

# レコードごとの処理をする。
for ((i=0;i<num_records;i++)); do
	start=$((i * record_length + 1))
	end=$(((i + 1) * record_length))
	cut -c "${start}"-"${end}" "${INFILE2}" >> "${OUTFILE2}"
done

# 人事ファイル1と人事ファイル2を併合して人事併合ファイルに書き込む
cat "${OUTFILE1}" "${OUTFILE2}" > "${MERGE}"

# 人事併合ファイルを所属コードを昇順、従業員コードを降順ソートしてKEKKA2003に書き込む。
sort -k 2,2 -k 1nr,1 -t "," "${MERGE}" | uniq  > "${KEKKA}"

# 一時ファイル削除
rm -f "${MERGE}"

# 結果ファイルを表示する。
echo '結果ファイルを表示する。'
cat "${KEKKA}"
