       IDENTIFICATION         DIVISION.
       PROGRAM-ID.            DBPRO02.
       ENVIRONMENT            DIVISION.
       INPUT-OUTPUT           SECTION.
       FILE-CONTROL.
           SELECT 試験結果ファイル ASSIGN TO
             "/home/suzuki/DATA/SHIKENKEKKA"
             FILE STATUS IS 結果状態.
           SELECT 合格者結果ファイル ASSIGN TO
             "/home/suzuki/DATA/SHIKENKEKKAFINAL"
             FILE STATUS IS 合格状態.
       DATA                   DIVISION.
       FILE                   SECTION.
       FD  試験結果ファイル.
       01  試験結果レコード.
           COPY CP008.
       FD  合格者結果ファイル.
       01  合格者結果レコード.
           COPY CP008.
       WORKING-STORAGE        SECTION.
       01  状態.
         03 結果状態          PIC X(2).
         03 合格状態          PIC X(2).
       01  件数.
         03 ロールバック件数  PIC 9(2) VALUE ZERO.
         03 コミット件数      PIC 9(2) VALUE ZERO.
         03 合格者件数        PIC 9(2) VALUE ZERO.
      ** 1.ホスト変数の定義
           EXEC SQL BEGIN DECLARE SECTION END-EXEC.
       01  DBNAME             PIC X(10) VALUE "mydb".
       01  USERNAME           PIC X(10) VALUE "suzuki".
       01  PASSWORD           PIC X(10) VALUE "yudai103".
       01  SW-AREA.
         03 SW-NOTFOUND       PIC X(1) VALUE SPACE.
       01  CST-AREA.
         03 CST-1X            PIC X(1) VALUE "1".
         03 CST-SQL-NF        PIC S9(5) VALUE +100.
       01  WK-SHIKENKEKKA.
         03 JUKENBI           PIC X(10).
         03 SHIKENKEKKA1.
           05 JUKENSHAID      PIC X(6).
           05 GOZEN           PIC 9(4).
           05 GOGO1           PIC 9(4).
           05 GOGO2           PIC 9(4).
           05 RONJUTU         PIC 9(4).
           05 HEIKINTEN       PIC 9(4).
           EXEC SQL END DECLARE SECTION END-EXEC.
      ** 2.共通領域の定義
           EXEC SQL INCLUDE SQLCA END-EXEC.
      *
       PROCEDURE              DIVISION.
       KAISHI                 SECTION.
       MAIN.
      *
           DISPLAY "*DBPRO02 START*".
      ** 3.ファイルOPEN
           OPEN INPUT 試験結果ファイル.
           OPEN OUTPUT 合格者結果ファイル.
           IF "00" = 結果状態 OR 合格状態
             THEN
               CONTINUE
             ELSE
               CLOSE 試験結果ファイル
               CLOSE 合格者結果ファイル
               DISPLAY "オープンエラー。"
               PERFORM PROEND
           END-IF.
      *
      ** 4.データベース接続
           EXEC SQL
             CONNECT :USERNAME IDENTIFIED BY
             :PASSWORD USING :DBNAME
           END-EXEC.
      ** 5.データベースアクセス
      ** 全件削除
           EXEC SQL
             DELETE FROM shikenkekka
           END-EXEC.
           DISPLAY "SQLコード" SQLCODE.
      *
           DISPLAY "DB ALL DELETE END".
      *
      ** 追加
           PERFORM UNTIL 結果状態 NOT = "00"
             READ 試験結果ファイル
               AT END
                 DISPLAY "READ END"
               NOT AT END
                 MOVE 受験日
                   OF 試験結果レコード(1:4)
                   TO JUKENBI(1:4)
                 MOVE "-" TO JUKENBI(5:1)
                 MOVE 受験日
                   OF 試験結果レコード(5:2)
                   TO JUKENBI(6:2)
                 MOVE "-" TO JUKENBI(8:1)
                 MOVE 受験日
                   OF 試験結果レコード(7:2)
                   TO JUKENBI(9:2)
                 MOVE 試験結果基本
                   OF 試験結果レコード
                   TO SHIKENKEKKA1
                 EXEC SQL
                   INSERT INTO shikenkekka
                   VALUES (:JUKENBI,:JUKENSHAID,:GOZEN,
                           :GOGO1,:GOGO2,:RONJUTU,
                           :HEIKINTEN)
                 END-EXEC
                 DISPLAY "SQLコード" SQLCODE
      *
                 IF JUKENSHAID = "SW1900"
                   THEN
                     EXEC SQL
                       ROLLBACK
                     END-EXEC
                     DISPLAY "受験者ID='SW1900'は"
                             "ロールバックされました。"
                     ADD 1 TO ロールバック件数
                   ELSE
                     EXEC SQL
                       COMMIT
                     END-EXEC
                     ADD 1 TO コミット件数
                 END-IF 
             END-READ
           END-PERFORM.
      *
      * 試験結果ファイルを一旦CLOSEさせる。
           CLOSE 試験結果ファイル.
      *
           DISPLAY "ロールバック件数"
                    ロールバック件数.
           DISPLAY "コミット件数"
                    コミット件数.
      *
           DISPLAY "DB INSERT END".
      *
      ** 更新
      *
      ** SW1046の更新
           EXEC SQL
             UPDATE shikenkekka
             SET gogo1 = (80 * 4) - 
                         (86 + 68 + 91)
             WHERE Jukenshaid = 'SW1046'
           END-EXEC.
           DISPLAY "SQLコード" SQLCODE.
      ** SW1350の更新
           EXEC SQL
             UPDATE shikenkekka
             SET ronjutu = (68 * 4) - 
                           (65 + 53 + 70)
             WHERE Jukenshaid = 'SW1350'
           END-EXEC.
           DISPLAY "SQLコード" SQLCODE.
      ** SW1877の更新
           EXEC SQL
             UPDATE shikenkekka
             SET gozen = (56 * 4) - 
                         (59 + 56 + 36)
             WHERE Jukenshaid = 'SW1046'
           END-EXEC.
           DISPLAY "SQLコード" SQLCODE.
      *
           DISPLAY "DB UPDATE END".
      *
      * コミット処理する。
           EXEC SQL
             COMMIT
           END-EXEC.
      *
      ** 6.カーソルオープン処理
           PERFORM OPEN-RTN.
      *
      ** 7.FETCH処理
           PERFORM FETCH-RTN 
             UNTIL SW-NOTFOUND = CST-1X.
      *
      ** 8.カーソルクローズ処理
           PERFORM CLOSE-RTN.
      *
      ** 9.プログラム終了
           PERFORM PROEND.
      *
       OPEN-RTN               SECTION.
           DISPLAY "カーソルオープン処理".
           EXEC SQL
             DECLARE CRS01 CURSOR FOR
             SELECT *
             FROM shikenkekka
             WHERE gozen >= 60
               AND gogo1 + gogo2 >= 120
               AND 0.3 * (gozen + gogo1 + gogo2 +
                   ronjutu) <= ronjutu
             ORDER BY jukenbi,jukenshaid
           END-EXEC.
      *
           EXEC SQL
             OPEN CRS01
           END-EXEC.
      *
       OPEN-RTN-EX.
       EXIT.
      *
       FETCH-RTN              SECTION.
      *
           DISPLAY "FETCH処理".
      *
      * 試験結果ファイル再OPEN
           OPEN INPUT 試験結果ファイル.
           IF "00" = 結果状態
             THEN
               CONTINUE
             ELSE
               CLOSE 試験結果ファイル
               CLOSE 合格者結果ファイル
               DISPLAY "オープンエラー。"
               PERFORM PROEND
           END-IF.
      *
           EXEC SQL
             FETCH CRS01
             INTO :WK-SHIKENKEKKA
           END-EXEC.
      *
           IF SQLCODE = CST-SQL-NF
             THEN
               MOVE CST-1X TO SW-NOTFOUND
               DISPLAY SQLCODE
             ELSE
               DISPLAY "受験日:" JUKENBI
                       "合格者ID:" JUKENSHAID
               PERFORM UNTIL 結果状態 NOT = "00"
                 READ 試験結果ファイル
                   AT END
                     CONTINUE
                   NOT AT END
                     IF 受験者ID
                        OF 試験結果レコード =
                        JUKENSHAID
                       THEN
                         MOVE 受験日
                           OF 試験結果レコード 
                           TO 受験日 
                           OF 合格者結果レコード
                       ELSE
                         CONTINUE
                     END-IF
                 END-READ
               END-PERFORM
               MOVE SHIKENKEKKA1
                 TO 試験結果基本
                 OF 合格者結果レコード
               WRITE 合格者結果レコード
               DISPLAY "合格者結果ファイル出力"
               ADD 1 TO 合格者件数
               CLOSE 試験結果ファイル
           END-IF.
           DISPLAY "合格者件数" 合格者件数.
      *
       FETCH-RTN-EX.
       EXIT.
      *
       CLOSE-RTN              SECTION.
      *
           DISPLAY "カーソルクローズ・"
                   "ファイルクローズ処理".
      * カーソルクローズ
           EXEC SQL
             CLOSE CRS01
           END-EXEC.
      * ファイルクローズ
           CLOSE 試験結果ファイル.
           CLOSE 合格者結果ファイル.
      *
       PROEND                 SECTION.
      *
           DISPLAY "*DBPRO02 END*".
      *
           STOP RUN.
      *
       PROEND-EX.
       EXIT.
      *
