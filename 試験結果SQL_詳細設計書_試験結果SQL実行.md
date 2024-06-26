## 試験結果SQL実行		
プログラムID:dbpro02		
		
## 環境部		
### 入出力節		
ファイル管理段落		
・試験結果ファイルを/home/suzuki/DATA/SIKENKEKKAとのファイルの対応を宣言する。		

・順ファイルの入出力状態(結果状態)を宣言する。		

・合格者結果ファイルを/home/suzuki/DATA/SIKENKEKKAFINALとのファイルの対応を宣言する。		

・順ファイルの入出力状態(合格状態)を宣言する。		
		
## データ部		
### ファイル節		
試験結果ファイルをファイル節に記述する。		
集団項目(レベル番号01)		

|項目名|設定値|
|---|---|
|試験結果レコード|-|
		
基本項目(レベル番号05)→コピー句:CP007		

|項目名|桁数|備考|
|---|---|---|
|受験日|8(Xタイプ)|-|
		
基本項目(レベル番号05)		

|項目名|桁数|備考|
|---|---|---|
|試験結果基本|-|-|
		
基本項目(レベル番号10)		

|項目名|桁数|備考|
|---|---|---|
|受験者ID|6(Xタイプ)|-|
|午前|4(9タイプCOMP)|-|
|午後1|4(9タイプCOMP)|-|
|午後2|4(9タイプCOMP)|-|
|論述|4(9タイプCOMP)|-|
|平均点|4(9タイプCOMP)|-|
		
合格者結果ファイルをファイル節に記述する。		
集団項目(レベル番号01)		

|項目名|設定値|
|---|---|
|合格者結果レコード|-|	
		
基本項目(レベル番号05)→コピー句:CP007		

|項目名|桁数|備考|
|---|---|---|
|受験日|8(Xタイプ)|-|
		
基本項目(レベル番号05)		

|項目名|桁数|備考|
|---|---|---|
|試験結果基本|-|-|
		
基本項目(レベル番号10)		

|項目名|桁数|備考|
|---|---|---|
|受験者ID|6(Xタイプ)|-|
|午前|4(9タイプ)|-|
|午後1|4(9タイプ)|-|
|午後2|4(9タイプ)|-|
|論述|4(9タイプ)|-|
|平均点|4(9タイプ)|-|
		
作業場所節		
集団項目(レベル番号01)		

|項目名|桁数|
|---|---|
|状態|-|
		
集団項目(レベル番号03)		

|項目名|桁数|
|---|---|
|結果状態|2(Xタイプ)|	
|合格状態|2(Xタイプ)|	
		
集団項目(レベル番号01)		

|項目名|桁数|	
|件数|-|	
		
集団項目(レベル番号03)		

|項目名|桁数|設定値|
|---|---|---|
|ロールバック件数|2(9タイプ)|ZERO|
|コミット件数|2(9タイプ)|ZERO|
|合格者件数|2(9タイプ)|ZERO|
		
### 1.ホスト変数の定義		

埋込SQL宣言節		
集団項目(レベル番号01)		

|項目名|桁数|設定値|
|---|---|---|
|DBNAME|10(Xタイプ)|mydb|
|USERNAME|10(Xタイプ)|suzuki|
|PASSWORD|10(Xタイプ)|yudai103|
		
集団項目(レベル番号01)		

|項目名|桁数|設定値|
|---|---|---|
|SW-AREA|-|-|
		
基本項目(レベル番号03)		

|項目名|桁数|設定値|
|---|---|---|
|SW-NOTFOUND|1(Xタイプ)|SPACE|
		
集団項目(レベル番号01)		

|項目名|桁数|設定値|
|---|---|---|
|CST-AREA|-|-|
		
基本項目(レベル番号03)		

|項目名|桁数|設定値|
|---|---|---|
|CST-1X|1(Xタイプ)|1|
|CST-SQL-NF|5(S9タイプ)|+100|
		
集団項目(レベル番号01)		
|項目名|設定値|
|---|---|
|WK-SIKENKEKKA|-|	
		
集団項目(レベル番号03)		

|項目名|桁数|設定値|
|---|---|---|
|JUKENBI|10(Xタイプ)|-|
		
集団項目(レベル番号03)		

|項目名|設定値|
|---|---|
|SIKENKEKKA1|-|	
		
集団項目(レベル番号05)		

|項目名|桁数|設定値|
|---|---|---|
|JUKENSHAID|6(Xタイプ)|-|
|GOZEN|4(9タイプCOMP)|-|
|GOGO1|4(9タイプCOMP)|-|
|GOGO2|4(9タイプCOMP)|-|
|RONJUTU|4(9タイプCOMP)|-|
|HEIKINTEN|4(9タイプCOMP)|-|
		
### 2.共通領域の定義		
SQLCAをイクードする。		
		
## 手続き部		
## KAISIセクション		
### main		
		
### 3.ファイルOPEN		
試験結果ファイルを入力ファイルで開く。		
合格者結果ファイルを出力ファイルで開く。		
・結果状態または合格状態が 00の場合		
処理しない		
・それ以外の場合		
試験結果ファイルを閉じる。		
合格者結果ファイルを閉じる。		
オープンエラー。		
プログラムを終了させる。		
		
### 4.データベースと接続		
USERNAMEとPASSWORDとDBNAMEで接続する。		
		
### 5.データベースアクセス		
全件削除		
sikenkekkaテーブルを全件削除する。		
SQLコードを表示する。		
goukakusyaテーブルを全件削除する。		
SQLコードを表示する。		
DB ALL DELETE ENDが表示される。		
		
追加		
結果状態が00でなくなるまでループ処理をする。		
試験結果ファイルを読み込む		
読み込み完了時		
READ ENDを表示する。		
		
読み込み時		
受験日(1:4) OF 試験結果レコードをJUKENBI(1:4)に設定する。		
-をJUKENBI(5:1)に転記		
受験日(5:2) OF 試験結果レコードをJUKENBI(6:2)に設定する。		
-をJUKENBI(8:1)に転記		
受験日(7:2) OF 試験結果レコードをJUKENBI(9:2)に設定する。		
		
試験結果基本 OF 試験結果レコードをSHIKENKEKKA1に設定する。		
		
シート：試験結果入力ファイル作成をそれぞれ試験結果テーブルに追加する。		
※シート:別紙、試験結果1		
SQLコードを表示する。		
		
JUKENSHAIDがSW1900の時		
ROLLBACKする		
ロールバック件数に１追加する。		
それ以外の時		
COMMITを実行する。		
コミット件数に１追加する。		
READを抜けて、ループ処理を抜ける。		
		
ロールバック件数を表示する。		
コミット件数を表示する。		
試験結果ファイルを一旦閉じる。		
		
DB INSERT ENDが表示される。		
		
更新		
※シート:別紙、試験結果1よりあてはまる点数を計算して登録する。		
SQLコードを表示する。		
		
DB UPDATE ENDが表示される。		
		
goukakusyaテーブルに以下の内容を追加する。		
shikenkekkaテーブルをすべての列に対してSELECT文を定義する。		
受験日、受験者IDで昇順に並べ替える。		
以下の条件を満たす必要がある。		
(1)午前の点数が60以上		
(2)午後1と午後2の合計した点数が120以上		
(3)論述の点数が全科目の合計点の3割以上		
合格者テーブル追加を表示する。		
		
コミット処理を表示する。		
COMMITを実行する。		
コミット完了を表示する。		
		
## 6.カーソルオープン処理(OPEN-RTN)		
カーソルオープン処理を表示する。		
カーソル名CSR01でshikenkekkaテーブルをすべての列に対してSELECT文を定義する。		
受験日、受験者IDで昇順に並べ替える。		
以下の条件を満たす必要がある。		
(1)午前の点数が60以上		
(2)午後1と午後2の合計した点数が120以上		
(3)論述の点数が全科目の合計点の3割以上		
		
カーソル名CSR01を開く。		
		
## 7.FETCH処理(FETCH-RTN)		
試験結果ファイルを入力ファイルで開く。		
・結果状態が 00の場合		
処理しない		
・それ以外の場合		
試験結果ファイルを閉じる。		
オープンエラー。		
プログラムを終了させる。		
		
FETCH-RTNに対して、SW-NOTFOUND = CST-1Xになるまでループ処理を繰り返す		
FETCH処理を表示する。		
JUKENBI、JUKENSHAIDに対してカーソル名CSR01でフェッチ文を実行する。		
SQLCODE = CST-SQL-NFの時		
CST-1XをSW-NOTFOUNDに設定する。		
SQLCODEを表示する。		
		
SQLCODE = CST-SQL-NF以外の時		
受験日:JUKENBI、合格者ID:JUKENSHAIDを表示する。		
結果状態が00でなくなるまでループ処理をする。		
試験結果ファイルを読み込む		
読み込み完了時		
READ ENDを表示する。		
		
読み込み時		
受験者ID＝JUKENSHAIDの時		
受験日 OF 試験結果レコードを受験日 OF 合格者結果レコードに設定する。		
それ以外の時、		
処理をやめる。		
		
SIKENNKEKKA1を試験結果基本 OF 合格者結果レコードに設定する。		
合格者結果レコードに書き込む。		
合格者結果ファイル出力を表示する。		
合格者件数に１追加する。		
試験結果ファイルを閉じる。		
		
合格者件数を表示する。		
		
## 8.カーソルクローズ処理(CLOSE-RTN)		
カーソルクローズ処理を表示する。		
カーソル名CSR01をクローズ処理する。		
試験結果ファイルを閉じる。		
合格者結果ファイルを閉じる。		
		
## 9.プログラム終了(PROEND)		
プログラムを終了する。		
