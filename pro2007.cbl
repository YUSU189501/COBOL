       IDENTIFICATION         DIVISION.
       PROGRAM-ID.            PRO2007.
       ENVIRONMENT            DIVISION.
       INPUT-OUTPUT           SECTION.
       FILE-CONTROL.
           SELECT 人事部ファイル ASSIGN TO
             "/home/suzuki/DATA/JINJI2007"
             FILE STATUS IS 人事状態.
           SELECT 総務部ファイル ASSIGN TO
             "/home/suzuki/DATA/SOUMU2007"
             FILE STATUS IS 総務状態.
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
       WORKING-STORAGE        SECTION.
       01  状態.
         03 人事状態          PIC X(2).
         03 総務状態          PIC X(2).
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
           DISPLAY "***PRO2007 START***".
      *
           OPEN INPUT 人事部ファイル.
           OPEN INPUT 総務部ファイル.
      *
           IF "00" = 人事状態 OR 総務状態
             THEN
               DISPLAY "既存ファイルの為、終了します"
               STOP RUN
             ELSE
               CONTINUE
           END-IF.
      *
           OPEN OUTPUT 人事部ファイル.
           OPEN OUTPUT 総務部ファイル.
      *
           IF "00" = 人事状態 OR 総務状態
             THEN
               CONTINUE
             ELSE
               DISPLAY "オープンエラー。"
                       "プログラム終了。"
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
           PERFORM 人事部ファイル作成処理.
      *
           PERFORM 総務部ファイル作成処理.
      *
       主処理－ＥＸ.
       EXIT.
      *
      ************************************************
       人事部ファイル作成処理 SECTION.
      ************************************************
      *
      * 人事部ファイル作成処理
           MOVE "SATOHICHIRO"
             TO 氏名 OF 人事部レコード.
           MOVE 60 TO 年齢 OF 人事部レコード.
      *
           PERFORM 人事部レコード書き込み.
      *
           MOVE "SATOHJIRO"
             TO 氏名 OF 人事部レコード.
           MOVE 40 TO 年齢 OF 人事部レコード.
      *
           PERFORM 人事部レコード書き込み.
      *
           MOVE "SATOHSABURO"
             TO 氏名 OF 人事部レコード.
           MOVE 40 TO 年齢 OF 人事部レコード.
      *
           PERFORM 人事部レコード書き込み.
      *
           MOVE "SATOHSHIRO"
             TO 氏名 OF 人事部レコード.
           MOVE 60 TO 年齢 OF 人事部レコード.
      *
           PERFORM 人事部レコード書き込み.
      *
           MOVE "SATOHGORO"
             TO 氏名 OF 人事部レコード.
           MOVE 25 TO 年齢 OF 人事部レコード.
      *
           PERFORM 人事部レコード書き込み.
      *
           MOVE "SATOHROKURO"
             TO 氏名 OF 人事部レコード.
           MOVE 30 TO 年齢 OF 人事部レコード.
      *
           PERFORM 人事部レコード書き込み.
      *
           MOVE "SATOHSHICHIRO"
             TO 氏名 OF 人事部レコード.
           MOVE 25 TO 年齢 OF 人事部レコード.
      *
           PERFORM 人事部レコード書き込み.
      *
           MOVE "SATOHHACHIRO"
             TO 氏名 OF 人事部レコード.
           MOVE 60 TO 年齢 OF 人事部レコード.
      *
           PERFORM 人事部レコード書き込み.
      *
           MOVE "SATOHKURO"
             TO 氏名 OF 人事部レコード.
           MOVE 25 TO 年齢 OF 人事部レコード.
      *
           PERFORM 人事部レコード書き込み.
           MOVE "SATOHJURO"
             TO 氏名 OF 人事部レコード.
           MOVE 60 TO 年齢 OF 人事部レコード.
      *
           PERFORM 人事部レコード書き込み.
      *
           MOVE "SATOHJUICHIRO"
             TO 氏名 OF 人事部レコード.
           MOVE 60 TO 年齢 OF 人事部レコード.
      *
           PERFORM 人事部レコード書き込み.
      *
           MOVE "SATOHJUNIRO"
             TO 氏名 OF 人事部レコード.
           MOVE 40 TO 年齢 OF 人事部レコード.
      *
           PERFORM 人事部レコード書き込み.
      *
           MOVE "SATOHJUSANRO"
             TO 氏名 OF 人事部レコード.
           MOVE 40 TO 年齢 OF 人事部レコード.
      *
           PERFORM 人事部レコード書き込み.
      *
           MOVE "SATOHJUSHIRO"
             TO 氏名 OF 人事部レコード.
           MOVE 60 TO 年齢 OF 人事部レコード.
      *
           PERFORM 人事部レコード書き込み.
      *
           MOVE "SATOHJUGORO"
             TO 氏名 OF 人事部レコード.
           MOVE 25 TO 年齢 OF 人事部レコード.
      *
           PERFORM 人事部レコード書き込み.
      *
           MOVE "SATOHJUROKURO"
             TO 氏名 OF 人事部レコード.
           MOVE 30 TO 年齢 OF 人事部レコード.
      *
           PERFORM 人事部レコード書き込み.
      *
           MOVE "SATOHJUSHICHIRO"
             TO 氏名 OF 人事部レコード.
           MOVE 25 TO 年齢 OF 人事部レコード.
      *
           PERFORM 人事部レコード書き込み.
      *
           MOVE "SATOHJUHACHIRO"
             TO 氏名 OF 人事部レコード.
           MOVE 60 TO 年齢 OF 人事部レコード.
      *
           PERFORM 人事部レコード書き込み.
      *
           MOVE "SATOHJUKURO"
             TO 氏名 OF 人事部レコード.
           MOVE 25 TO 年齢 OF 人事部レコード.
      *
           PERFORM 人事部レコード書き込み.
           MOVE "SATOHNIJURO"
             TO 氏名 OF 人事部レコード.
           MOVE 60 TO 年齢 OF 人事部レコード.
      *
           PERFORM 人事部レコード書き込み.
      *
           MOVE "SATOHNIJUICHIRO"
             TO 氏名 OF 人事部レコード.
           MOVE 60 TO 年齢 OF 人事部レコード.
      *
           PERFORM 人事部レコード書き込み.
      *
           MOVE "SATOHNIJUNIRO"
             TO 氏名 OF 人事部レコード.
           MOVE 40 TO 年齢 OF 人事部レコード.
      *
           PERFORM 人事部レコード書き込み.
      *
           MOVE "SATOHNIJUSANRO"
             TO 氏名 OF 人事部レコード.
           MOVE 40 TO 年齢 OF 人事部レコード.
      *
           PERFORM 人事部レコード書き込み.
      *
           MOVE "SATOHNIJUSHIRO"
             TO 氏名 OF 人事部レコード.
           MOVE 60 TO 年齢 OF 人事部レコード.
      *
           PERFORM 人事部レコード書き込み.
      *
           MOVE "SATOHNIJUGORO"
             TO 氏名 OF 人事部レコード.
           MOVE 25 TO 年齢 OF 人事部レコード.
      *
           PERFORM 人事部レコード書き込み.
      *
           MOVE "SATOHNIJUROKURO"
             TO 氏名 OF 人事部レコード.
           MOVE 30 TO 年齢 OF 人事部レコード.
      *
           PERFORM 人事部レコード書き込み.
      *
           MOVE "SATOHNIJUSHICHIRO"
             TO 氏名 OF 人事部レコード.
           MOVE 25 TO 年齢 OF 人事部レコード.
      *
           PERFORM 人事部レコード書き込み.
      *
           MOVE "SATOHNIJUHACHIRO"
             TO 氏名 OF 人事部レコード.
           MOVE 60 TO 年齢 OF 人事部レコード.
      *
           PERFORM 人事部レコード書き込み.
      *
           MOVE "SATOHNIJUKURO"
             TO 氏名 OF 人事部レコード.
           MOVE 25 TO 年齢 OF 人事部レコード.
      *
           PERFORM 人事部レコード書き込み.
      *
           MOVE "SATOHSANJURO"
             TO 氏名 OF 人事部レコード.
           MOVE 60 TO 年齢 OF 人事部レコード.
      *
           PERFORM 人事部レコード書き込み.
      *
       人事部ファイル作成処理－ＥＸ.
       EXIT.
      *
      ************************************************
       総務部ファイル作成処理 SECTION.
      ************************************************
      *
      * 総務部ファイル作成処理
           MOVE "SUZUKIICHIRO"
             TO 氏名 OF 総務部レコード.
           MOVE 60 TO 年齢 OF 総務部レコード.
      *
           PERFORM 総務部レコード書き込み.
      *
           MOVE "SUZUKIJIRO"
             TO 氏名 OF 総務部レコード.
           MOVE 40 TO 年齢 OF 総務部レコード.
      *
           PERFORM 総務部レコード書き込み.
      *
           MOVE "SUZUKISABURO"
             TO 氏名 OF 総務部レコード.
           MOVE 40 TO 年齢 OF 総務部レコード.
      *
           PERFORM 総務部レコード書き込み.
      *
           MOVE "SUZUKISHIRO"
             TO 氏名 OF 総務部レコード.
           MOVE 60 TO 年齢 OF 総務部レコード.
      *
           PERFORM 総務部レコード書き込み.
      *
           MOVE "SUZUKIGORO"
             TO 氏名 OF 総務部レコード.
           MOVE 25 TO 年齢 OF 総務部レコード.
      *
           PERFORM 総務部レコード書き込み.
      *
           MOVE "SUZUKIROKURO"
             TO 氏名 OF 総務部レコード.
           MOVE 30 TO 年齢 OF 総務部レコード.
      *
           PERFORM 総務部レコード書き込み.
      *
           MOVE "SUZUKISHICHIRO"
             TO 氏名 OF 総務部レコード.
           MOVE 25 TO 年齢 OF 総務部レコード.
      *
           PERFORM 総務部レコード書き込み.
      *
           MOVE "SUZUKIHACHIRO"
             TO 氏名 OF 総務部レコード.
           MOVE 60 TO 年齢 OF 総務部レコード.
      *
           PERFORM 総務部レコード書き込み.
      *
           MOVE "SUZUKIKURO"
             TO 氏名 OF 総務部レコード.
           MOVE 25 TO 年齢 OF 総務部レコード.
      *
           PERFORM 総務部レコード書き込み.
           MOVE "SUZUKIJURO"
             TO 氏名 OF 総務部レコード.
           MOVE 60 TO 年齢 OF 総務部レコード.
      *
           PERFORM 総務部レコード書き込み.
      *
           MOVE "SUZUKIJUICHIRO"
             TO 氏名 OF 総務部レコード.
           MOVE 60 TO 年齢 OF 総務部レコード.
      *
           PERFORM 総務部レコード書き込み.
      *
           MOVE "SUZUKIJUNIRO"
             TO 氏名 OF 総務部レコード.
           MOVE 40 TO 年齢 OF 総務部レコード.
      *
           PERFORM 総務部レコード書き込み.
      *
           MOVE "SUZUKIJUSANRO"
             TO 氏名 OF 総務部レコード.
           MOVE 40 TO 年齢 OF 総務部レコード.
      *
           PERFORM 総務部レコード書き込み.
      *
           MOVE "SUZUKIJUSHIRO"
             TO 氏名 OF 総務部レコード.
           MOVE 60 TO 年齢 OF 総務部レコード.
      *
           PERFORM 総務部レコード書き込み.
      *
           MOVE "SUZUKIJUGORO"
             TO 氏名 OF 総務部レコード.
           MOVE 25 TO 年齢 OF 総務部レコード.
      *
           PERFORM 総務部レコード書き込み.
      *
           MOVE "SUZUKIJUROKURO"
             TO 氏名 OF 総務部レコード.
           MOVE 30 TO 年齢 OF 総務部レコード.
      *
           PERFORM 総務部レコード書き込み.
      *
           MOVE "SUZUKIJUSHICHIRO"
             TO 氏名 OF 総務部レコード.
           MOVE 25 TO 年齢 OF 総務部レコード.
      *
           PERFORM 総務部レコード書き込み.
      *
           MOVE "SUZUKIJUHACHIRO"
             TO 氏名 OF 総務部レコード.
           MOVE 60 TO 年齢 OF 総務部レコード.
      *
           PERFORM 総務部レコード書き込み.
      *
           MOVE "SUZUKIJUKURO"
             TO 氏名 OF 総務部レコード.
           MOVE 25 TO 年齢 OF 総務部レコード.
      *
           PERFORM 総務部レコード書き込み.
      *
           MOVE "SUZUKINIJURO"
             TO 氏名 OF 総務部レコード.
           MOVE 60 TO 年齢 OF 総務部レコード.
      *
           PERFORM 総務部レコード書き込み.
      *
           MOVE "SUZUKINIJUICHIRO"
             TO 氏名 OF 総務部レコード.
           MOVE 60 TO 年齢 OF 総務部レコード.
      *
           PERFORM 総務部レコード書き込み.
      *
           MOVE "SUZUKINIJUNIRO"
             TO 氏名 OF 総務部レコード.
           MOVE 40 TO 年齢 OF 総務部レコード.
      *
           PERFORM 総務部レコード書き込み.
      *
           MOVE "SUZUKINIJUSANRO"
             TO 氏名 OF 総務部レコード.
           MOVE 40 TO 年齢 OF 総務部レコード.
      *
           PERFORM 総務部レコード書き込み.
      *
           MOVE "SUZUKINIJUSHIRO"
             TO 氏名 OF 総務部レコード.
           MOVE 60 TO 年齢 OF 総務部レコード.
      *
           PERFORM 総務部レコード書き込み.
      *
           MOVE "SUZUKINIJUGORO"
             TO 氏名 OF 総務部レコード.
           MOVE 25 TO 年齢 OF 総務部レコード.
      *
           PERFORM 総務部レコード書き込み.
      *
           MOVE "SUZUKINIJUROKURO"
             TO 氏名 OF 総務部レコード.
           MOVE 30 TO 年齢 OF 総務部レコード.
      *
           PERFORM 総務部レコード書き込み.
      *
           MOVE "SUZUKINIJUSHICHIRO"
             TO 氏名 OF 総務部レコード.
           MOVE 25 TO 年齢 OF 総務部レコード.
      *
           PERFORM 総務部レコード書き込み.
      *
           MOVE "SUZUKINIJUHACHIRO"
             TO 氏名 OF 総務部レコード.
           MOVE 60 TO 年齢 OF 総務部レコード.
      *
           PERFORM 総務部レコード書き込み.
      *
           MOVE "SUZUKINIJUKURO"
             TO 氏名 OF 総務部レコード.
           MOVE 25 TO 年齢 OF 総務部レコード.
      *
           PERFORM 総務部レコード書き込み.
           MOVE "SUZUKISANJURO"
             TO 氏名 OF 総務部レコード.
           MOVE 60 TO 年齢 OF 総務部レコード.
      *
           PERFORM 総務部レコード書き込み.
      *
       総務部ファイル作成処理－ＥＸ.
       EXIT.
      *
      ************************************************
       終了処理               SECTION.
      ************************************************
      *
           DISPLAY "***PRO2007 END***".
      *
      * ファイルクローズ
           CLOSE 人事部ファイル.
           CLOSE 総務部ファイル.
      *
       終了処理－ＥＸ.
       EXIT.
      *
      ************************************************
       人事部レコード書き込み SECTION.
      ************************************************
      *
      * 人事部レコード書き込み
           WRITE 人事部レコード
           END-WRITE.
      *
       人事部レコード書き込み－ＥＸ.
       EXIT.
      *
      ************************************************
       総務部レコード書き込み SECTION.
      ************************************************
      *
      * 総務部レコード書き込み
           WRITE 総務部レコード
           END-WRITE.
      *
       総務部レコード書き込み－ＥＸ.
       EXIT.
      *
