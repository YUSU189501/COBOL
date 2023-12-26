       IDENTIFICATION         DIVISION.
       PROGRAM-ID.            SUB2005.
       ENVIRONMENT            DIVISION.
       INPUT-OUTPUT           SECTION.
       FILE-CONTROL.
           SELECT 人事ファイル2 ASSIGN TO
             "/home/suzuki/DATA/JINJI2003-2"
             FILE STATUS IS 人事状態.
       DATA                   DIVISION.
       FILE                   SECTION.
       FD  人事ファイル2.
       01  人事レコード2.
           COPY CP006.
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
           EXIT PROGRAM.
      *
      ****************************************************
       初期処理               SECTION.
      ****************************************************
      *
      *人事ファイルを入力モードで開く。
           OPEN INPUT 人事ファイル2.
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
           OPEN OUTPUT 人事ファイル2.
      *ファイル存在チェックする。
           IF 人事状態 = "00"
             THEN
               CONTINUE
             ELSE
               DISPLAY "オープンエラー。"
                       "プログラムを終了します。"
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
      *書き込み処理する。
           MOVE "22222"      TO 従業員コード.
           MOVE "BBB"        TO 所属コード.
           MOVE "佐藤花子"   TO 氏名.
           MOVE 25           TO 年齢.
           MOVE "F"          TO 性別.
           PERFORM 書き込み処理.
           MOVE "44444"      TO 従業員コード.
           MOVE "DDD"        TO 所属コード.
           MOVE "鈴木さくら" TO 氏名.
           MOVE 25           TO 年齢.
           MOVE "F"          TO 性別.
           PERFORM 書き込み処理.
           MOVE "66666"      TO 従業員コード.
           MOVE "FFF"        TO 所属コード.
           MOVE "高橋裕子"   TO 氏名.
           MOVE 25           TO 年齢.
           MOVE "F"          TO 性別.
           PERFORM 書き込み処理.
           MOVE "88888"      TO 従業員コード.
           MOVE "HHH"        TO 所属コード.
           MOVE "渡辺友里"   TO 氏名.
           MOVE 25           TO 年齢.
           MOVE "F"          TO 性別.
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
           WRITE 人事レコード2
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
           CLOSE 人事ファイル2.
      *
       終了処理－ＥＸ.
       EXIT.
      *
