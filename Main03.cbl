       IDENTIFICATION         DIVISION.
       PROGRAM-ID.            Main03.
       DATA                   DIVISION.
       WORKING-STORAGE        SECTION.
       01  カウンタ           PIC 9(2).
       01  年齢               PIC 9(2).
       PROCEDURE              DIVISION.
       対象抽出               SECTION.
      *
           PERFORM 初期化処理.
      *
           PERFORM 主処理.
      *
           STOP RUN.
      *
      *************************************************
       初期化処理             SECTION.
      *************************************************
      *
           INITIALIZE カウンタ.
      *
       初期化処理-EX.
       EXIT.
      *
      *************************************************
       主処理             SECTION.
      *************************************************
      *
           PERFORM 10 TIMES
             DISPLAY "年齢:" WITH NO ADVANCING
             ACCEPT 年齢
      *
             IF 年齢 < 10 OR >= 30 AND <= 39 OR = 44 OR
                = 55 OR >= 75
               THEN
                 ADD 1 TO カウンタ
               ELSE
                 CONTINUE
             END-IF
           END-PERFORM.
           DISPLAY "カウンタ:" カウンタ.
      *
       主処理-EX.
       EXIT.
      *
