       IDENTIFICATION         DIVISION.
       PROGRAM-ID.            PRO2001.
       ENVIRONMENT            DIVISION.
       INPUT-OUTPUT           SECTION.
       FILE-CONTROL.
           SELECT 人事ファイル ASSIGN TO
             "/home/suzuki/DATA/JINJI2001"
             FILE STATUS IS 人事状態.
           SELECT 出力人事ファイル ASSIGN TO
             "/home/suzuki/DATA/OUT2001"
             FILE STATUS IS 出力状態.
       DATA                   DIVISION.
       FILE                   SECTION.
       FD  人事ファイル.
           COPY CP001.
       FD  出力人事ファイル.
       01  出力人事レコード   PIC X(50).
       WORKING-STORAGE        SECTION.
       01  状態.
           05 人事状態        PIC X(2).
           05 出力状態        PIC X(2).
       01  タイトル.
           COPY CP002.
       01  詳細行.
           COPY CP003.
       01  判定               PIC X(1).
           88 続行            VALUE "1".
           88 終了            VALUE "2".
       01  件数               PIC 9(2).
           88 出力人事実行    VALUE ZERO.
           88 改ページ        VALUE 10.
       PROCEDURE              DIVISION.
      ***********************************
       開始                   SECTION.
      ***********************************
      *
           PERFORM 初期処理.
      *
           PERFORM 主処理.
      *
           PERFORM 終了処理.
      *
           STOP RUN.
      *
      ***********************************
       初期処理               SECTION.
      ***********************************
      *
      *  人事ファイルを入力モードで開く。
           OPEN INPUT  人事ファイル.
           OPEN OUTPUT 出力人事ファイル.
      *  ファイル存在チェックする。
           IF "00" NOT = 人事状態 AND 出力状態
             THEN
               PERFORM 終了処理
               PERFORM 異常終了処理
             ELSE
               SET 続行 改ページ TO TRUE
           END-IF.
      *
       初期処理－ＥＸＴ.
           EXIT.
      *
      ***********************************
       主処理               SECTION.
      ***********************************
      *
      *  条件名「続行」かつ「改ページ」の場合。
           IF 続行 AND 改ページ
             THEN
      *  条件名「終了」まで処理を繰り返す。
               PERFORM UNTIL 終了
      *  人事ファイルを読み込む。
                 READ 人事ファイル
                   AT END
                     SET 終了 TO TRUE
                     IF 改ページ
                       THEN
                         CONTINUE
                       ELSE
                         PERFORM フッター出力
                     END-IF
                   NOT AT END
                     PERFORM ヘッダー出力
                        THRU レコード出力
                     IF 改ページ
                       THEN
                         PERFORM フッター出力
                       ELSE
                         CONTINUE
                     END-IF
                 END-READ
               END-PERFORM
             ELSE
               CONTINUE
           END-IF.
      *
       主処理－ＥＸＴ.
           EXIT.
      *
      ***********************************
       終了処理               SECTION.
      ***********************************
      *
      *  出力人事ファイルを閉じる。
           CLOSE 出力人事ファイル.
      *  人事ファイルを閉じる。
           CLOSE 人事ファイル.
      *
       終了処理－ＥＸＴ.
           EXIT.
      *
      ***********************************
       ヘッダー出力           SECTION.
      ***********************************
      *
      *  タイトルから出力人事ファイルに書き込む。
           IF 改ページ
             THEN
               WRITE 出力人事レコード FROM タイトル
                 AFTER 2 LINE
               END-WRITE
               SET 出力人事実行 TO TRUE
             ELSE
               CONTINUE
           END-IF.
      *
       タイトル出力－ＥＸＴ.
           EXIT.
      *
      ***********************************
       レコード出力           SECTION.
      ***********************************
      *
      *  詳細行を初期化する。。
           INITIALIZE 詳細行.
      *  人事レコードを詳細行に1度に転記する。。
           MOVE CORR 人事レコード TO 詳細行.
      *  詳細行から出力人事レコードに書き込む。
           WRITE 出力人事レコード FROM 詳細行
             AFTER 2 LINE
           END-WRITE.
      *  件数を1件追加する。
           ADD 1 TO 件数.
      *
       レコード出力－ＥＸＴ.
           EXIT.
      *
      ***********************************
       フッター出力           SECTION.
      ***********************************
      *
      *  件数から出力人事レコードに書き込む。
           WRITE 出力人事レコード FROM 件数
               AFTER 2 LINE
           END-WRITE.
      *
       フッター出力－ＥＸＴ.
           EXIT.
      *
      ***********************************
       異常終了処理           SECTION.
      ***********************************
      *
      *  異常処理でプログラムを終了させる。
           DISPLAY "異常終了しました。"
           STOP RUN.
      *
       異常終了処理－ＥＸＴ.
           EXIT.
      *
