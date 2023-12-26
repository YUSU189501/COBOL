       IDENTIFICATION         DIVISION.
       PROGRAM-ID.            PRO2002.
       ENVIRONMENT            DIVISION.
       INPUT-OUTPUT           SECTION.
       FILE-CONTROL.
           SELECT 西暦ファイル ASSIGN TO
             "/home/suzuki/DATA/SEIREKI2002"
             FILE STATUS IS 西暦状態.
           
       DATA                   DIVISION.
       FILE                   SECTION.
       FD  西暦ファイル.
           COPY CP004.
       WORKING-STORAGE        SECTION.
       01  西暦状態           PIC 9(2).
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
           DISPLAY "***PRO2002 START***".
      *
      * 西暦レコードを初期化する。
           INITIALIZE 西暦レコード.
      * 西暦状態を初期化する。
           INITIALIZE 西暦状態.
      * 西暦ファイルを入力モードで開く。
           OPEN INPUT 西暦ファイル.
      * ファイル存在チェックする。
           IF 西暦状態 = "00"
             THEN
               CLOSE 西暦ファイル
               DISPLAY "既存ファイルのため終了させる。"
               STOP RUN
             ELSE
               CONTINUE
           END-IF.
      * 西暦ファイルを出力モードで開く。
           OPEN OUTPUT 西暦ファイル.
      * ファイル存在チェックする。
           IF 西暦状態 = "00"
             THEN
               CONTINUE
               
             ELSE
               DISPLAY "オープンエラー。"
               STOP RUN
           END-IF.
      *
       初期処理－ＥＸ.
       EXIT.
      *
      ************************************************
       主処理                 SECTION.
      ************************************************
      *
           MOVE 20230910 TO 西暦年月日.
           PERFORM 出力処理.
           MOVE 19890101 TO 西暦年月日.
           PERFORM 出力処理.
           MOVE 18890101 TO 西暦年月日.
           PERFORM 出力処理.
           MOVE 19150101 TO 西暦年月日.
           PERFORM 出力処理.
           MOVE 20190101 TO 西暦年月日.
           PERFORM 出力処理.
           MOVE 19700101 TO 西暦年月日.
           PERFORM 出力処理.
           MOVE 20200229 TO 西暦年月日.
           PERFORM 出力処理.
      *
       主処理－ＥＸ.
       EXIT.
      *
      ************************************************
       出力処理             SECTION.
      ************************************************
      *
      * 西暦レコードを出力する。
           WRITE 西暦レコード
           END-WRITE.
      *
       出力処理－ＥＸ.
       EXIT.
      *
      ************************************************
       終了処理                 SECTION.
      ************************************************
      *
      * 西暦ファイルを閉じる。
           CLOSE 西暦ファイル.
      * SUB2002呼出し。
           CALL "SUB2002"
             ON EXCEPTION
               DISPLAY "サブルーチン呼出し失敗"
             NOT ON EXCEPTION
               CONTINUE
           END-CALL.
      *
           DISPLAY "***PRO2002 END***".
      *
       終了処理－ＥＸ.
       EXIT.
      *
