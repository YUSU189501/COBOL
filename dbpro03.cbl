       IDENTIFICATION         DIVISION.
       PROGRAM-ID.            dbpro03.
       ENVIRONMENT            DIVISION.
       INPUT-OUTPUT           SECTION.
       FILE-CONTROL.
           SELECT 人事部ファイル ASSIGN TO
             "/home/suzuki/DATA/JINJI2007"
             FILE STATUS IS 人事状態.
           SELECT 総務部ファイル ASSIGN TO
             "/home/suzuki/DATA/SOUMU2007"
             FILE STATUS IS 総務状態.
           SELECT 退職者ファイル ASSIGN TO
             "/home/suzuki/DATA/TAISYOKU2007"
             FILE STATUS IS 退職状態.
       DATA                   DIVISION.
       FILE                   SECTION.
       FD  人事部ファイル.
       01  人事部レコード.
         03 氏名              PIC X(40).
         03 年齢              PIC 9(2).
       FD  総務部ファイル.
       01  総務部レコード.
         03 氏名              PIC X(40).
         03 年齢              PIC 9(2).
       FD  退職者ファイル.
       01  退職者レコード     PIC X(51).
       WORKING-STORAGE        SECTION.
       01  状態.
         03 人事状態          PIC X(2).
         03 総務状態          PIC X(2).
         03 退職状態          PIC X(2).
       01  カウンタ.
         03 人事カウンタ      PIC 9(2).
         03 総務カウンタ      PIC 9(2).
       01  社員情報.
         03 部署 OCCURS 2 INDEXED BY K.
           05 従業員 OCCURS 30 INDEXED BY L.
             10 氏名          PIC X(40).
             10 年齢          PIC 9(2).
       01  タイトル           PIC X(30)
                        VALUE "本年度退職者一覧表".
       01  表示データ.
         03 退職者 OCCURS 60 INDEXED BY A1 A2.
           05 部              PIC 9(1).
           05 社員ナンバー    PIC 9(2).
           05 名前            PIC X(40).
         03 部表示            PIC X(7).
       01  件数               PIC 9(2).
           88 印刷実行        VALUE ZERO.
           88 改ページ        VALUE 10.
       01  退避レコード.
         03 部署              PIC X(7).
         03 カンマ１          PIC X(1).
         03 社員番号          PIC 9(2).
         03 カンマ２          PIC X(1).
         03 氏名              PIC X(40).
      *
      *** ホスト変数の定義
           EXEC SQL BEGIN DECLARE SECTION END-EXEC.
       01  DBNAME         PIC X(10) VALUE "mydb".
       01  USERNAME       PIC X(10) VALUE "suzuki".
       01  PASSWORD       PIC X(10) VALUE "yudai103".
       01  SW-AREA.
         03 SW-NOTFOUND   PIC X(1) VALUE SPACE.
       01  CST-AREA.
         03 CST-1X        PIC X(1) VALUE "1".
         03 CST-SQL-NF    PIC S9(5) VALUE +100.
       01  SYAININFO.
         03 BUSYO         PIC X(7).
         03 SYAINBANGOU   PIC 9(2).
         03 NAME          PIC X(40).
           EXEC SQL END DECLARE SECTION END-EXEC.
      *** 共通領域の定義
           EXEC SQL INCLUDE SQLCA END-EXEC.
      *
       PROCEDURE              DIVISION.
      ************************************************
       開始                   SECTION.
      ************************************************
      *
           PERFORM 初期処理.
      *
           PERFORM 主処理.
      *
           PERFORM 終了処理.
      *
           STOP RUN.
      *
      ************************************************
       初期処理               SECTION.
      ************************************************
      *
           DISPLAY "***dbpro03 START***".
      *
      * ワーク初期化
           INITIALIZE カウンタ.
           INITIALIZE 社員情報.
           INITIALIZE 表示データ.
      * ファイルオープン
           OPEN INPUT 人事部ファイル.
           OPEN INPUT 総務部ファイル.
           OPEN OUTPUT 退職者ファイル.
           IF "00" = 人事状態 OR 総務状態 OR 退職状態
             THEN
               CONTINUE
             ELSE
               CLOSE 人事部ファイル
               CLOSE 総務部ファイル
               CLOSE 退職者ファイル
               DISPLAY "オープンエラー。"
               STOP RUN
           END-IF.
      * データベースと接続
           EXEC SQL
             CONNECT :USERNAME IDENTIFIED BY
             :PASSWORD USING :DBNAME
           END-EXEC.
      *
      * 全件削除
           EXEC SQL
             DELETE FROM taisyokusya
           END-EXEC.
      *
           DISPLAY "SQLコード" SQLCODE
      *
           EXEC SQL
             COMMIT
           END-EXEC.
      *
       初期処理－ＥＸ.
       EXIT.
      *
      ************************************************
       主処理                 SECTION.
      ************************************************
      *
           PERFORM 人事部ファイル読み込み.
      *
           PERFORM 総務部ファイル読み込み.
      *
           PERFORM 初期化・検索.
      *
           PERFORM 退職者表示.
      *
           PERFORM オープンリターン.
      *
           PERFORM フェッチリターン
             UNTIL SW-NOTFOUND = CST-1X.
      *
           PERFORM クローズリターン.
      *
       主処理－ＥＸ.
       EXIT.
      *
      ************************************************
       人事部ファイル読み込み SECTION.
      ************************************************
      *
      * 人事部ファイル読み込み
           MOVE 1  TO 人事カウンタ.
           PERFORM UNTIL 人事状態 NOT = "00"
             READ 人事部ファイル
               AT END
                 CONTINUE
               NOT AT END
                 MOVE 氏名 OF 人事部レコード
                   TO 氏名 OF 社員情報(1,人事カウンタ)
                 MOVE 年齢 OF 人事部レコード
                   TO 年齢 OF 社員情報(1,人事カウンタ)
                   ADD 1 TO 人事カウンタ
             END-READ
           END-PERFORM.
      *
       人事部ファイル読み込み－ＥＸ.
       EXIT.
      *
      ************************************************
       総務部ファイル読み込み SECTION.
      ************************************************
      *
      * 総務部ファイル読み込み
           MOVE 1  TO 総務カウンタ.
           PERFORM UNTIL 総務状態 NOT = "00"
             READ 総務部ファイル
               AT END
                 CONTINUE
               NOT AT END
                 MOVE 氏名 OF 総務部レコード
                   TO 氏名 OF 社員情報(2,総務カウンタ)
                 MOVE 年齢 OF 総務部レコード
                   TO 年齢 OF 社員情報(2,総務カウンタ)
                 ADD 1 TO 総務カウンタ
             END-READ
           END-PERFORM.
      *
       人事部ファイル読み込み－ＥＸ.
       EXIT.
      *
      ************************************************
       初期化・検索           SECTION.
      ************************************************
      *
      * 初期化
           SET A1 TO ZERO.
      * 検索
           SET K TO 1.
           PERFORM UNTIL K > 2
             SET L TO 1
             PERFORM UNTIL L > 30
               SEARCH 従業員
                 AT END
                   CONTINUE
                 WHEN 年齢 OF 
                      社員情報(K,L) = 60
                   SET A1 UP BY 1
                   SET 部(A1) TO K
                   SET 社員ナンバー(A1) TO L
                   MOVE 氏名 
                     OF 社員情報(K,L) TO 名前(A1)
                   SET L UP BY 1
               END-SEARCH
             END-PERFORM
             SET K UP BY 1
           END-PERFORM.
           SET 改ページ TO TRUE.
      *
       初期化・検索－ＥＸ.
       EXIT.
      *
      ************************************************
       退職者表示             SECTION.
      ************************************************
      *
      *退職者表示
           IF A1 = ZERO
             THEN
               DISPLAY "該当者なし"
             ELSE
               DISPLAY タイトル
               PERFORM VARYING A2 FROM 1 BY 1
                 UNTIL A2 > A1
                 IF 部(A2) = 1
                   THEN
                     MOVE "JINJIBU" TO 部表示
                   ELSE
                     MOVE "SOUMUBU" TO 部表示
                 END-IF
                 DISPLAY 部表示 "," 
                         社員ナンバー(A2) ","
                         名前(A2)
                 IF 改ページ
                   THEN
                     WRITE 退職者レコード
                       FROM タイトル
                       AFTER PAGE
                     END-WRITE
                     SET 印刷実行 TO TRUE
                   ELSE
                     CONTINUE
                 END-IF
                 INITIALIZE 退避レコード
                 MOVE 部表示
                   TO 部署     OF 退避レコード
                 MOVE ","
                   TO カンマ１ OF 退避レコード
                 MOVE 社員ナンバー(A2)
                   TO 社員番号 OF 退避レコード
                 MOVE ","
                   TO カンマ２ OF 退避レコード
                 MOVE 名前(A2)
                   TO 氏名     OF 退避レコード
                 WRITE 退職者レコード
                   FROM 退避レコード
                   AFTER 2 LINE
                 END-WRITE
                 ADD 1 TO 件数
                 MOVE 部表示           TO BUSYO
                 MOVE 社員ナンバー(A2) TO SYAINBANGOU
                 MOVE 名前(A2)         TO NAME
                 EXEC SQL
                   INSERT INTO taisyokusya
                   VALUES
                   (:BUSYO,:SYAINBANGOU,:NAME)
                 END-EXEC
                 DISPLAY "SQLコード" SQLCODE
                 EXEC SQL
                   COMMIT
                 END-EXEC
               END-PERFORM
           END-IF.
      *
       退職者表示－ＥＸ.
       EXIT.
      *
      ************************************************
       オープンリターン       SECTION.
      ************************************************
      *
           DISPLAY "カーソルオープン処理"
           EXEC SQL
             DECLARE CSR01 CURSOR FOR
               SELECT busyo,syainbangou,name
               FROM taisyokusya
           END-EXEC.
      *
           EXEC SQL
             OPEN CSR01
           END-EXEC.
      *
       オープンリターン－ＥＸ.
       EXIT.
      *
      ************************************************
       フェッチリターン       SECTION.
      ************************************************
      *
           DISPLAY "FETCH処理".
           EXEC SQL
             FETCH CSR01
             INTO :BUSYO,:SYAINBANGOU,:NAME
           END-EXEC.
      *
           IF SQLCODE = CST-SQL-NF
             THEN
               MOVE CST-1X TO SW-NOTFOUND
               DISPLAY "SQLコード" SQLCODE
             ELSE
               DISPLAY "部署:" BUSYO
                       "社員番号:" SYAINBANGOU
                       "名前:" NAME
           END-IF.
      *
       フェッチリターン－ＥＸ.
       EXIT.
      *
      ************************************************
       クローズリターン       SECTION.
      ************************************************
      *
           DISPLAY "カーソルクローズ処理".
      *
           EXEC SQL
             CLOSE CSR01
           END-EXEC.
      *
       クローズリターン－ＥＸ.
       EXIT.
      *
      ************************************************
       終了処理               SECTION.
      ************************************************
      *
           DISPLAY "***dbpro03 END***".
      *
      * ファイルクローズ
           CLOSE 人事部ファイル.
           CLOSE 総務部ファイル.
           CLOSE 退職者ファイル.
      *
       終了処理－ＥＸ.
       EXIT.
      *
