       IDENTIFICATION         DIVISION.
       PROGRAM-ID.            PRO2006.
       ENVIRONMENT            DIVISION.
       INPUT-OUTPUT           SECTION.
       FILE-CONTROL.
           SELECT 試験結果ファイル ASSIGN TO
             "/home/suzuki/DATA/SHIKENKEKKA"
             FILE STATUS IS 結果状態.
       DATA                   DIVISION.
       FILE                   SECTION.
       FD  試験結果ファイル.
       01  試験結果レコード.
           COPY CP008.
       WORKING-STORAGE        SECTION.
       01  結果状態           PIC X(2).
       PROCEDURE              DIVISION.
      *************************************************
       開始                   SECTION.
      *************************************************
      *
           PERFORM 初期処理.
      *
           PERFORM 主処理.
      *
           PERFORM 終了処理.
      *
           PERFORM プログラム終了.
      *
      *************************************************
       初期処理               SECTION.
      *************************************************
      *
           DISPLAY "*PRO2006 START*".
      *
           INITIALIZE 試験結果レコード.
      *
           OPEN INPUT 試験結果ファイル.
      *
           IF 結果状態 = "00"
             THEN
               CLOSE 試験結果ファイル
               DISPLAY "既存ファイルのため終了させる。"
               PERFORM プログラム終了
             ELSE
               CONTINUE
           END-IF.
      *
           OPEN OUTPUT 試験結果ファイル.
      *
           IF 結果状態 = "00"
             THEN
               CONTINUE
             ELSE
               DISPLAY "オープンエラー。"
               PERFORM プログラム終了
           END-IF.
      *
       初期処理-EX.
       EXIT.
      *
      *************************************************
       主処理                 SECTION.
      *************************************************
      *
      * SW1046の登録
           MOVE 20231115 TO 受験日.
           MOVE "SW1046" TO 受験者ID.
           MOVE 86       TO 午前.
           MOVE ZERO     TO 午後1.
           MOVE 68       TO 午後2.
           MOVE 91       TO 論述.
           MOVE 80       TO 平均点.
      *
           PERFORM 出力処理.
      *
      * SW1350の登録
           MOVE 20231116 TO 受験日.
           MOVE "SW1350" TO 受験者ID.
           MOVE 65       TO 午前.
           MOVE 53       TO 午後1.
           MOVE 70       TO 午後2.
           MOVE ZERO     TO 論述.
           MOVE 68       TO 平均点.
      *
           PERFORM 出力処理.
      *
      * SW1877の登録
           MOVE 20231117 TO 受験日.
           MOVE "SW1877" TO 受験者ID.
           MOVE ZERO     TO 午前.
           MOVE 59       TO 午後1.
           MOVE 56       TO 午後2.
           MOVE 36       TO 論述.
           MOVE 56       TO 平均点.
      *
           PERFORM 出力処理.
      *
      * SW1878の登録
           MOVE 20231118 TO 受験日.
           MOVE "SW1878" TO 受験者ID.
           MOVE 70       TO 午前.
           MOVE 70       TO 午後1.
           MOVE 70       TO 午後2.
           MOVE 70       TO 論述.
           MOVE 70       TO 平均点.
      *
           PERFORM 出力処理.
      *
      * SW1890の登録
           MOVE 20231119 TO 受験日.
           MOVE "SW1880" TO 受験者ID.
           MOVE 70       TO 午前.
           MOVE 70       TO 午後1.
           MOVE 70       TO 午後2.
           MOVE 90       TO 論述.
           MOVE 75       TO 平均点.
      *
           PERFORM 出力処理.
      *
      * SW1900の登録
           MOVE 20231119 TO 受験日.
           MOVE "SW1900" TO 受験者ID.
           MOVE 70       TO 午前.
           MOVE 70       TO 午後1.
           MOVE 70       TO 午後2.
           MOVE 90       TO 論述.
           MOVE 75       TO 平均点.
      *
           PERFORM 出力処理.
      *
       主処理-EX.
       EXIT.
      *
      *************************************************
       出力処理                 SECTION.
      *************************************************
      *
           DISPLAY "出力処理".
           WRITE 試験結果レコード.
      *
       出力処理-EX.
       EXIT.
      *
      *************************************************
       終了処理                 SECTION.
      *************************************************
      *
           DISPLAY "終了処理".
           CLOSE 試験結果ファイル.
      *
       終了処理-EX.
       EXIT.
      *
      *************************************************
       プログラム終了           SECTION.
      *************************************************
      *
           DISPLAY "*PRO2006 END*".
           STOP RUN.
      *
       プログラム終了-EX.
       EXIT.
      *
