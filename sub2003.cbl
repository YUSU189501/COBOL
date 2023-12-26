       IDENTIFICATION         DIVISION.
       PROGRAM-ID.            SUB2003.
       ENVIRONMENT            DIVISION.
       INPUT-OUTPUT           SECTION.
       FILE-CONTROL.
           SELECT 和暦ファイル ASSIGN TO
             "/home/suzuki/DATA/WAREKI2002"
             FILE STATUS IS 和暦状態.
       DATA                   DIVISION.
       FILE                   SECTION.
       FD  和暦ファイル.
           COPY CP005.
       WORKING-STORAGE        SECTION.
      *
       01  ワークエリア.
           05 和暦状態        PIC X(02).
           05 終了ステータス  PIC X(01).
           05 読み込み件数    PIC 9(02).
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
           EXIT PROGRAM.
      *
      ************************************************
       初期処理               SECTION.
      ************************************************
      *
           DISPLAY "***SUB2003 START***".
      *
      * 和暦レコードを初期化する。
           INITIALIZE 和暦レコード.
      * ワークエリアを初期化する。
           INITIALIZE ワークエリア.
      * 西暦ファイルを入力モードで開く。
           OPEN INPUT 和暦ファイル.
      * ファイル存在チェックする。
           IF 和暦状態 = "00"
             THEN
               CONTINUE
             ELSE
               DISPLAY "オープンエラー。"
               EXIT PROGRAM
           END-IF.
      *
       初期処理－ＥＸ.
       EXIT.
      *
      ************************************************
       主処理                 SECTION.
      ************************************************
      *
      * 終了ステータスが1になるまで、
      * 西暦ファイルを読み込むのを繰り返す。
           PERFORM UNTIL ( 終了ステータス
                         = "1" )
             READ 和暦ファイル
               AT END
                 DISPLAY "読み込み件数:"
                          読み込み件数
                 MOVE "1" TO 終了ステータス
               NOT AT END
                 ADD 1 TO 読み込み件数
                 DISPLAY 読み込み件数 "レコード目:"
                         和暦年月日
             END-READ
           END-PERFORM.
      *
       主処理－ＥＸ.
       EXIT.
      *
      ************************************************
       終了処理                 SECTION.
      ************************************************
      *
      * 和暦ファイルを閉じる。
           CLOSE 和暦ファイル.
      *
           DISPLAY "***SUB2003 END***".
      *
       終了処理－ＥＸ.
       EXIT.
      *
