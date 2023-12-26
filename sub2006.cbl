       IDENTIFICATION         DIVISION.
       PROGRAM-ID.            SUB2006.
       ENVIRONMENT            DIVISION.
       INPUT-OUTPUT           SECTION.
       FILE-CONTROL.
           SELECT 結果ファイル ASSIGN TO
             "/home/suzuki/DATA/KEKKA2003"
             FILE STATUS IS 結果状態.
       DATA                   DIVISION.
       FILE                   SECTION.
       FD  結果ファイル.
       01  結果レコード.
           COPY CP006.
      *
       WORKING-STORAGE        SECTION.
       01  ワークエリア.
           05 結果状態        PIC X(2).
           05 終了ステータス  PIC X(1).
      *
       PROCEDURE              DIVISION.
       開始                   SECTION.
      *
           PERFORM 初期処理.
      *
           PERFORM 主処理.
      *
           PERFORM 終了処理.
      *
           EXIT PROGRAM.
      *
      ****************************************************
       初期処理               SECTION.
      ****************************************************
      *
      *結果ファイルを入力モードで開く。
           OPEN INPUT 結果ファイル.
      *ファイル存在チェックする。
           IF 結果状態 = "00"
             THEN
               CONTINUE
             ELSE
               DISPLAY "オープンエラー。"
                       "プログラム終了します。"
               EXIT PROGRAM
           END-IF.
      *
       初期処理－ＥＸ.
       EXIT.
      *
      ****************************************************
       主処理                 SECTION.
      ****************************************************
      *
      *終了ステータスが1になるまで、
      *結果ファイルを読み込むのを繰り返す。
           PERFORM UNTIL 終了ステータス = "1"
             READ 結果ファイル
               AT END
                 MOVE "1" TO 終了ステータス
               NOT AT END
                 DISPLAY 従業員コード ","
                         所属コード ","
                         氏名 ","
                         年齢 ","
                         性別
             END-READ
           END-PERFORM.
      *
       主処理－ＥＸ.
       EXIT.
      *
      ****************************************************
       終了処理           SECTION.
      ****************************************************
      *
      *結果ファイルをクローズする。
           CLOSE 結果ファイル.
      *
       終了処理－ＥＸ.
       EXIT.
      *
