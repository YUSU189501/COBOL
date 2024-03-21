#!/bin/bash
#カレントディレクトリを設定する。
cd ~ && pwd

# Medを実行。
java MedIcine

# Javaファイルを指定する。
INFILE="/home/suzuki/DATA/Medicine1"

# 税率と税込額を算出する。
OUTFILE1="/home/suzuki/DATA/Medicine2"
cat "${INFILE}" | awk -v  OFS=, -F, '{tax = ($1<"20191001"||$2~"^*") ? 1.08 : 1.1; print $0,tax ;}' |
 awk -v OFS=, -F, '{print $0, int($3*$4)}{a+=int($3*$4)}END{print "合計額",a}' > "${OUTFILE1}"

# 税率・税込額ファイルを表示する。
echo "税率・税込額ファイル"
cat "${OUTFILE1}"

# セルフメディケーション税制額を算出する。
OUTFILE2="/home/suzuki/DATA/SELF-MED-1"
cat "${OUTFILE1}" | awk -v  OFS=, -F, '{tax = ($2~"^*") ? 1.08 : 1.1; print $0,tax}' | awk -v OFS=, -F, '$2 ~ /^◆/' |
 awk -v OFS=, -F, '{print int($3*$4)}' | numsum > "${OUTFILE2}"

# セルフメディケーション税制合計額ファイルを表示する。
echo 'セルフメディケーション税制合計額ファイル'
cat "${OUTFILE2}"

exit 0