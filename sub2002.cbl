       IDENTIFICATION         DIVISION.
       PROGRAM-ID.            SUB2002.
       ENVIRONMENT            DIVISION.
       INPUT-OUTPUT           SECTION.
       FILE-CONTROL.
           SELECT 西暦ファイル ASSIGN TO
             "/home/suzuki/DATA/SEIREKI2002"
             FILE STATUS IS 西暦状態.
           SELECT 和暦ファイル ASSIGN TO
             "/home/suzuki/DATA/WAREKI2002"
             FILE STATUS IS 和暦状態.
       DATA                   DIVISION.
       FILE                   SECTION.
       FD  西暦ファイル.
           COPY CP004.
      *
       FD  和暦ファイル.
           COPY CP005.
       WORKING-STORAGE        SECTION.
      *
       01  ワークエリア.
           05 状態.
             10 西暦状態      PIC X(02).
             10 和暦状態      PIC X(02).
           05 終了ステータス  PIC X(01).
           05 読み込み件数    PIC 9(02).
           05 出力件数        PIC 9(02).
           05 閏年コード      PIC X(01).
           05 西暦年／１００  PIC 9(04).
           05 西暦年／４００  PIC 9(04).
           05 西暦年／４      PIC 9(04).
           05 Ｒ１００        PIC 9(04).
           05 Ｒ４００        PIC 9(04).
           05 Ｒ４            PIC 9(04).
      *
       01  退避レコード.
           05 和暦年月日.
              10 和暦         PIC X(01).
              10 和暦年       PIC X(02).
              10 和暦年Ａ
                       REDEFINES 和暦年 PIC 9(02).
              10 和暦月       PIC X(02).
              10 和暦日       PIC X(02).
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
           DISPLAY "***SUB2002 START***".
      *
      * 西暦レコードを初期化する。
           INITIALIZE 西暦レコード.
      * 和暦レコードを初期化する。
           INITIALIZE 和暦レコード.
      * ワークエリアを初期化する。
           INITIALIZE ワークエリア.
      * 退避レコードを初期化する。
           INITIALIZE 退避レコード.
      * 西暦ファイルを入力モードで開く。
           OPEN INPUT 西暦ファイル.
      * 和暦ファイルを出力モードで開く。
           OPEN OUTPUT 和暦ファイル.
      * ファイル存在チェックする。
           IF "00" NOT= 西暦状態 AND 和暦状態
             THEN
               PERFORM 異常終了処理
             ELSE
               CONTINUE
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
             READ 西暦ファイル
               AT END
                 DISPLAY "出力件数:" 出力件数
                 MOVE "1" TO 終了ステータス
               NOT AT END
                 ADD 1 TO 読み込み件数
                 DISPLAY 読み込み件数 "レコード目:"
                         西暦年月日
                 PERFORM 月判定処理
                 PERFORM 日判定処理
                 PERFORM 西暦和暦処理
                 PERFORM 和暦出力処理
                 ADD 1 TO 出力件数
                 INITIALIZE 退避レコード
             END-READ
           END-PERFORM.
      *
       主処理－ＥＸ.
       EXIT.
      *
      ************************************************
       月判定処理             SECTION.
      ************************************************
      *
      * あり得ない月を排除する｡
           IF 西暦月 IS NUMERIC
             THEN
               IF ( 西暦月 >= 1 ) AND
                  ( 西暦月 <= 12 )
                 THEN
                   MOVE 西暦月 TO 和暦月
                     OF 退避レコード
                 ELSE
                   PERFORM 異常終了処理
               END-IF
           END-IF.
      *
       月判定処理－ＥＸ.
       EXIT.
      *
      ************************************************
       日判定処理             SECTION.
      ************************************************
      *
      * あり得ない日を排除する｡
           IF 西暦日 IS NUMERIC
             THEN
               EVALUATE 西暦月
                 WHEN 1
                   IF ( 西暦日 >= 1  ) AND
                      ( 西暦日 <= 31 )
                     THEN
                       MOVE 西暦日
                         TO 和暦日 OF 退避レコード
                      ELSE
                        PERFORM 異常終了処理
                   END-IF
                 WHEN 2
                   PERFORM 閏年判定処理
                   IF 閏年コード = "1"
                     THEN
                       IF ( 西暦日 >= 1  ) AND
                          ( 西暦日 <= 29 )
                         THEN
                           MOVE 西暦日 TO 和暦日
                             OF 退避レコード
                         ELSE
                           PERFORM 異常終了処理
                       END-IF
                     ELSE
                       IF ( 西暦日 >= 1  ) AND
                          ( 西暦日 <= 28 )
                         THEN
                           MOVE 西暦日 TO 和暦日
                             OF 退避レコード
                         ELSE
                           PERFORM 異常終了処理
                       END-IF
                   END-IF
                 WHEN 3
                   IF ( 西暦日 >= 1  ) AND
                      ( 西暦日 <= 31 )
                     THEN
                       MOVE 西暦日
                         TO 和暦日 OF 退避レコード
                      ELSE
                        PERFORM 異常終了処理
                   END-IF
                 WHEN 4
                   IF ( 西暦日 >= 1  ) AND
                      ( 西暦日 <= 30 )
                     THEN
                       MOVE 西暦日 TO 和暦日
                         OF 退避レコード
                      ELSE
                        PERFORM 異常終了処理
                   END-IF
                 WHEN 5
                   IF ( 西暦日 >= 1  ) AND
                      ( 西暦日 <= 31 )
                     THEN
                       MOVE 西暦日
                         TO 和暦日 OF 退避レコード
                      ELSE
                        PERFORM 異常終了処理
                   END-IF
                 WHEN 6
                   IF ( 西暦日 >= 1  ) AND
                      ( 西暦日 <= 30 )
                     THEN
                       MOVE 西暦日 TO 和暦日
                         OF 退避レコード
                      ELSE
                        PERFORM 異常終了処理
                   END-IF
                  WHEN 7
                   IF ( 西暦日 >= 1  ) AND
                      ( 西暦日 <= 31 )
                     THEN
                       MOVE 西暦日
                         TO 和暦日 OF 退避レコード
                      ELSE
                        PERFORM 異常終了処理
                   END-IF
                  WHEN 8
                   IF ( 西暦日 >= 1  ) AND
                      ( 西暦日 <= 31 )
                     THEN
                       MOVE 西暦日
                         TO 和暦日 OF 退避レコード
                      ELSE
                        PERFORM 異常終了処理
                   END-IF
                 WHEN 9
                   IF ( 西暦日 >= 1  ) AND
                      ( 西暦日 <= 30 )
                     THEN
                       MOVE 西暦日 TO 和暦日
                         OF 退避レコード
                      ELSE
                        PERFORM 異常終了処理
                   END-IF
                 WHEN 10
                   IF ( 西暦日 >= 1  ) AND
                      ( 西暦日 <= 31 )
                     THEN
                       MOVE 西暦日
                         TO 和暦日 OF 退避レコード
                      ELSE
                        PERFORM 異常終了処理
                   END-IF
                 WHEN 11
                   IF ( 西暦日 >= 1  ) AND
                      ( 西暦日 <= 30 )
                     THEN
                       MOVE 西暦日 TO 和暦日
                         OF 退避レコード
                      ELSE
                        PERFORM 異常終了処理
                   END-IF
                 WHEN 12
                   IF ( 西暦日 >= 1  ) AND
                      ( 西暦日 <= 31 )
                     THEN
                       MOVE 西暦日 TO 和暦日
                         OF 退避レコード
                      ELSE
                        PERFORM 異常終了処理
                   END-IF
               END-EVALUATE
             ELSE
               PERFORM 異常終了処理
           END-IF.
      *
       日判定処理－ＥＸ.
       EXIT.
      *
      ************************************************
       閏年判定処理             SECTION.
      ************************************************
      *
      *閏年かどうか判定する。
           DIVIDE 西暦年 BY 100
             GIVING 西暦年／１００
             REMAINDER Ｒ１００.
           DIVIDE 西暦年  BY 400
             GIVING 西暦年／４００
             REMAINDER Ｒ４００.
           DIVIDE 西暦年  BY 4
             GIVING 西暦年／４
             REMAINDER Ｒ４.
           IF ( Ｒ４００ = 0 OR Ｒ４ = 0 ) AND
              ( Ｒ１００ NOT= 0 )
             THEN
               MOVE "1" TO 閏年コード
             ELSE
               MOVE "2" TO 閏年コード
           END-IF.
      *
       閏年判定処理－ＥＸ.
       EXIT.
      *
      ************************************************
       西暦和暦処理             SECTION.
      ************************************************
      *
      *西暦年月日から和暦年を割り出す。
           IF 西暦年 IS NUMERIC
             THEN
               IF ( 西暦年月日 >= 18681023 ) AND
                  ( 西暦年月日 <= 19120729 )
                 THEN
                   MOVE "M" TO 和暦
                            OF 退避レコード
                   COMPUTE 和暦年Ａ OF
                           退避レコード =
                           西暦年 - 1867
                 ELSE
                   CONTINUE
               END-IF
               IF ( 西暦年月日 >= 19120730 ) AND
                  ( 西暦年月日 <= 19261224 )
                 THEN
                   MOVE "T" TO 和暦
                            OF 退避レコード
                   COMPUTE 和暦年Ａ OF
                           退避レコード =
                           西暦年 - 1911
                 ELSE
                   CONTINUE
               END-IF
               IF ( 西暦年月日 >= 19261225 ) AND
                  ( 西暦年月日 <= 19890107 )
                 THEN
                   MOVE "S" TO 和暦
                            OF 退避レコード
                   COMPUTE 和暦年Ａ OF
                           退避レコード =
                           西暦年 - 1925
                 ELSE
                   CONTINUE
               END-IF
               IF ( 西暦年月日 >= 19890108 ) AND
                  ( 西暦年月日 <= 20190430 )
                 THEN
                   MOVE "H" TO 和暦
                            OF 退避レコード
                   COMPUTE 和暦年Ａ OF
                           退避レコード =
                           西暦年 - 1988
                 ELSE
                   CONTINUE
               END-IF
               IF 西暦年月日 >= 20190501
                 THEN
                   MOVE "R" TO 和暦
                            OF 退避レコード
                   COMPUTE 和暦年Ａ OF
                           退避レコード =
                           西暦年 - 2018
                 ELSE
                   CONTINUE
               END-IF
             ELSE
               PERFORM 異常終了処理
           END-IF.
           DISPLAY "退避レコードの中身見る。"
           DISPLAY 和暦年月日 OF 退避レコード.
      *
       西暦和暦処理－ＥＸ.
       EXIT.
      *
      ************************************************
       和暦出力処理             SECTION.
      ************************************************
      *
      * 和暦レコードを出力する。
           WRITE 和暦レコード
             FROM 退避レコード
           END-WRITE.
      *
       和暦出力処理－ＥＸ.
       EXIT.
      *
      ************************************************
       終了処理                 SECTION.
      ************************************************
      *
      * 和暦ファイルを閉じる。
           CLOSE 和暦ファイル.
      * 西暦ファイルを閉じる。
           CLOSE 西暦ファイル.
      *
      * SUB2003呼出し。
           CALL "SUB2003"
             ON EXCEPTION
               DISPLAY "サブルーチン呼出し失敗"
             NOT ON EXCEPTION
               CONTINUE
           END-CALL.
      *
           DISPLAY "***SUB2002 END***".
      *
       終了処理－ＥＸ.
       EXIT.
      *
      ************************************************
       異常終了処理             SECTION.
      ************************************************
      *
      * 異常終了のメッセージを出す。
           DISPLAY "異常終了".
           DISPLAY 西暦年月日.
      *
      * 和暦ファイルを閉じる。
           CLOSE 和暦ファイル.
      * 西暦ファイルを閉じる。
           CLOSE 西暦ファイル.
      *
      * SUB2003呼出し。
      * この時点でWRITEした和暦ファイルをREADする。
           CALL "SUB2003"
             ON EXCEPTION
               DISPLAY "サブルーチン呼出し失敗"
             NOT ON EXCEPTION
               CONTINUE
           END-CALL.
      *
           DISPLAY "***SUB2002 ABEND***".
      *
      * プログラムを終了させる。
           EXIT-PROGRAM.
      *
       異常終了処理－ＥＸ.
       EXIT.
      *
