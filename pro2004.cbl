       IDENTIFICATION         DIVISION.
       PROGRAM-ID.            PRO2004.
       ENVIRONMENT            DIVISION.
       INPUT-OUTPUT           SECTION.
       FILE-CONTROL.
           SELECT 人事ファイル1 ASSIGN TO
             "/home/suzuki/DATA/JINJI2003-1"
             FILE STATUS IS 人事状態.
       DATA                   DIVISION.
       FILE                   SECTION.
       FD  人事ファイル1.
       01  人事レコード1.
           COPY CP006A.
      *
       WORKING-STORAGE        SECTION.
       01  人事状態           PIC X(2).
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
           STOP RUN.
      *
      ****************************************************
       初期処理               SECTION.
      ****************************************************
      *
      *人事ファイルを入力モードで開く。
           OPEN INPUT 人事ファイル1.
      *ファイル存在チェックする。
           IF 人事状態 = "00"
             THEN
               DISPLAY "既存ファイルのため終了します"
               EXIT PROGRAM
             ELSE
               CONTINUE
           END-IF.
      *
      *人事ファイルを出力モードで開く。
           OPEN OUTPUT 人事ファイル1.
      *ファイル存在チェックする。
           IF 人事状態 = "00"
             THEN
               CONTINUE
             ELSE
               DISPLAY "オープンエラー。"
                       "プログラムを終了します。"
               STOP RUN
           END-IF.
      *
       初期処理－ＥＸ.
       EXIT.
      *
      ****************************************************
       主処理                 SECTION.
      ****************************************************
      *
      *書き込み処理する。
           MOVE "11111"    TO 従業員コード.
           MOVE ","        TO カンマＡ.
           MOVE "AAA"      TO 所属コード.
           MOVE ","        TO カンマＢ.
           MOVE "佐藤一郎" TO 氏名.
           MOVE ","        TO カンマＣ.
           MOVE 25         TO 年齢.
           MOVE ","        TO カンマＤ.
           MOVE "M"        TO 性別.
           PERFORM 書き込み処理.
           MOVE "33333"    TO 従業員コード.
           MOVE ","        TO カンマＡ.
           MOVE "CCC"      TO 所属コード.
           MOVE ","        TO カンマＢ.
           MOVE "鈴木次郎" TO 氏名.
           MOVE ","        TO カンマＣ.
           MOVE 25         TO 年齢.
           MOVE ","        TO カンマＤ.
           MOVE "M"        TO 性別.
           PERFORM 書き込み処理.
           MOVE "55555"    TO 従業員コード.
           MOVE ","        TO カンマＡ.
           MOVE "EEE"      TO 所属コード.
           MOVE ","        TO カンマＢ.
           MOVE "高橋三郎" TO 氏名.
           MOVE ","        TO カンマＣ.
           MOVE 25         TO 年齢.
           MOVE ","        TO カンマＤ.
           MOVE "M"        TO 性別.
           PERFORM 書き込み処理.
           MOVE "77777"    TO 従業員コード.
           MOVE ","        TO カンマＡ.
           MOVE "GGG"      TO 所属コード.
           MOVE ","        TO カンマＢ.
           MOVE "渡辺四郎" TO 氏名.
           MOVE ","        TO カンマＣ.
           MOVE 25         TO 年齢.
           MOVE ","        TO カンマＤ.
           MOVE "M"        TO 性別.
           PERFORM 書き込み処理.
      *
       主処理－ＥＸ.
       EXIT.
      *
      ****************************************************
       書き込み処理           SECTION.
      ****************************************************
      *
      *人事レコードに書き込む。
           WRITE 人事レコード1
           END-WRITE.
      *
       書き込み処理－ＥＸ.
       EXIT.
      *
      ****************************************************
       終了処理           SECTION.
      ****************************************************
      *
      *人事ファイルをクローズする。
           CLOSE 人事ファイル1.
      *
       終了処理－ＥＸ.
       EXIT.
      *
