#!/bin/bash
#カレントディレクトリを設定する。
cd ~ && pwd

# pro2010を実行。
./pro2010

# COBOLファイルをレコードごとに分割する。
# COBOLファイルを指定する。
INFILE="/home/suzuki/DATA/RYOSYUSHO1"

# 整形後ファイルを指定する。
OUTFILE1="/home/suzuki/DATA/RYOSYUSHO2"

# レコードの長さを指定する。
record_length=60

# レコード数算出する。
num_records=$(cat "${INFILE}" | wc -c )

num_records=$((num_records/record_length))

# レコードごとの処理をする。
for ((i=0;i<num_records;i++)); do
	start=$((i * record_length + 1))
	end=$(((i + 1) * record_length))
	cut -c "${start}"-"${end}" "${INFILE}" | awk -v  OFS=, -F, '{print $1,$2,$3+0}' |
	 awk '{gsub(/ /, ""); print}' >> "${OUTFILE1}"
done

# 整形後ファイルを表示する。
echo "整形後ファイル"
cat "${OUTFILE1}"

# 税率と税込額を算出する。
OUTFILE2="/home/suzuki/DATA/RYOSYUSHO3"
cat "${OUTFILE1}" | awk -v  OFS=, -F, '{tax = ($1<"20191001"||$2~"^*") ? 1.08 : 1.1; print $0,tax ;}' |
 awk -v OFS=, -F, '{print $0, int($3*$4)}{a+=int($3*$4)}END{print "合計額",a}' > "${OUTFILE2}"

# 税率・税込額ファイルを表示する。
echo "税率・税込額ファイル"
cat "${OUTFILE2}"

# セルフメディケーション税制額を算出する。
OUTFILE3="/home/suzuki/DATA/SELF-MED"
cat "${OUTFILE1}" | awk -v  OFS=, -F, '{tax = ($2~"^*") ? 1.08 : 1.1; print $0,tax}' |
 awk -v OFS=, -F, '$2 ~ /^◆/' | awk -v OFS=, -F, '{print int($3*$4)}' | numsum > "${OUTFILE3}"

# セルフメディケーション税制合計額ファイルを表示する。
echo 'セルフメディケーション税制合計額ファイル'
cat "${OUTFILE3}"

exit 0
