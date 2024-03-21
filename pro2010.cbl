       IDENTIFICATION         DIVISION.
       PROGRAM-ID.            PRO2010.
       ENVIRONMENT            DIVISION.
       INPUT-OUTPUT           SECTION.
       FILE-CONTROL.
           SELECT 領収書ファイル ASSIGN TO
             "/home/suzuki/DATA/RYOSYUSHO1"
             FILE STATUS IS 領収状態.
       DATA                   DIVISION.
       FILE                   SECTION.
       FD  領収書ファイル.
       01  領収書レコード.
           05 日付            PIC 9(08).
           05 カンマ1         PIC X(01).
           05 商品名          PIC X(40).
           05 カンマ2         PIC X(01).
           05 値段            PIC 9(10).
       WORKING-STORAGE        SECTION.
       01  領収状態           PIC X(02).
       PROCEDURE              DIVISION.
       開始                   SECTION.
       初期処理.
           OPEN INPUT 領収書ファイル.
           IF 領収状態 = "00"
             THEN
               CLOSE 領収書ファイル
               DISPLAY "既存ファイルのため終了します"
               GO TO プログラム終了
             ELSE
               CONTINUE
           END-IF.
      *
           OPEN OUTPUT 領収書ファイル.
           IF 領収状態 = "00"
             THEN
               CONTINUE
             ELSE
               DISPLAY "オープンエラー。"
                       "プログラムを終了します。"
           END-IF.
       データ作成処理.
           MOVE 20230102
             TO 日付.
           MOVE ","
             TO カンマ1.
           MOVE "◆パブロンゴールド"
             TO 商品名.
           MOVE ","
             TO カンマ2.
           MOVE 1280
             TO 値段.
      *
           PERFORM 書き込み処理.
      *
           MOVE 20230102
             TO 日付.
           MOVE ","
             TO カンマ1.
           MOVE "*キリン生茶"
             TO 商品名.
           MOVE ","
             TO カンマ2.
           MOVE 433
             TO 値段.
      *
           PERFORM 書き込み処理.
      *
           MOVE 20230107
             TO 日付.
           MOVE ","
             TO カンマ1.
           MOVE "*キリン生茶"
             TO 商品名.
           MOVE ","
             TO カンマ2.
           MOVE 433
             TO 値段.
      *
           PERFORM 書き込み処理.
      *
           MOVE 20230107
             TO 日付.
           MOVE ","
             TO カンマ1.
           MOVE "*シマダヤ流水麺"
             TO 商品名.
           MOVE ","
             TO カンマ2.
           MOVE 218
             TO 値段.
      *
           PERFORM 書き込み処理.
      *
           MOVE 20230107
             TO 日付.
           MOVE ","
             TO カンマ1.
           MOVE "キレイキレイ"
             TO 商品名.
           MOVE ","
             TO カンマ2.
           MOVE 498
             TO 値段.
      *
           PERFORM 書き込み処理.
      *
           MOVE 20230107
             TO 日付.
           MOVE ","
             TO カンマ1.
           MOVE "キュキュット詰め替え用"
             TO 商品名.
           MOVE ","
             TO カンマ2.
           MOVE 297
             TO 値段.
      *
           PERFORM 書き込み処理.
      *
           MOVE 20230207
             TO 日付.
           MOVE ","
             TO カンマ1.
           MOVE "◆パブロンゴールド"
             TO 商品名.
           MOVE ","
             TO カンマ2.
           MOVE 1280
             TO 値段.
      *
           PERFORM 書き込み処理.
      *
           MOVE 20230207
             TO 日付.
           MOVE ","
             TO カンマ1.
           MOVE "キレイキレイ"
             TO 商品名.
           MOVE ","
             TO カンマ2.
           MOVE 498
             TO 値段.
      *
           PERFORM 書き込み処理.
      *
           MOVE 20230207
             TO 日付.
           MOVE ","
             TO カンマ1.
           MOVE "*サントリクラフトボス"
             TO 商品名.
           MOVE ","
             TO カンマ2.
           MOVE 218
             TO 値段.
      *
           PERFORM 書き込み処理.
      *
           MOVE 20230207
             TO 日付.
           MOVE ","
             TO カンマ1.
           MOVE "キュキュット詰め替え用"
             TO 商品名.
           MOVE ","
             TO カンマ2.
           MOVE 297
             TO 値段.
      *
           PERFORM 書き込み処理.
      *
           MOVE 20230211
             TO 日付.
           MOVE ","
             TO カンマ1.
           MOVE "*アサヒ三ツ矢サイダー"
             TO 商品名.
           MOVE ","
             TO カンマ2.
           MOVE 137
             TO 値段.
      *
           PERFORM 書き込み処理.
      *
           MOVE 20230211
             TO 日付.
           MOVE ","
             TO カンマ1.
           MOVE "◆バファリン"
             TO 商品名.
           MOVE ","
             TO カンマ2.
           MOVE 497
             TO 値段.
      *
           MOVE 20230227
             TO 日付.
           MOVE ","
             TO カンマ1.
           MOVE "◆パブロン鼻炎カプセル"
             TO 商品名.
           MOVE ","
             TO カンマ2.
           MOVE 1280
             TO 値段.
      *
           MOVE 20230227
             TO 日付.
           MOVE ","
             TO カンマ1.
           MOVE "キュキュット詰め替え用"
             TO 商品名.
           MOVE ","
             TO カンマ2.
           MOVE 297
             TO 値段.
      *
           PERFORM 書き込み処理.
      *
           MOVE 20230227
             TO 日付.
           MOVE ","
             TO カンマ1.
           MOVE "キレイキレイ"
             TO 商品名.
           MOVE ","
             TO カンマ2.
           MOVE 498
             TO 値段.
      *
           PERFORM 書き込み処理.
      *
           MOVE 20230307
             TO 日付.
           MOVE ","
             TO カンマ1.
           MOVE "◆パブロン鼻炎カプセル"
             TO 商品名.
           MOVE ","
             TO カンマ2.
           MOVE 1280
             TO 値段.
      *
           PERFORM 書き込み処理.
      *
           MOVE 20230307
             TO 日付.
           MOVE ","
             TO カンマ1.
           MOVE "*サントリクラフトボス"
             TO 商品名.
           MOVE ","
             TO カンマ2.
           MOVE 218
             TO 値段
      *
           PERFORM 書き込み処理.
      *
           MOVE 20230312
             TO 日付.
           MOVE ","
             TO カンマ1.
           MOVE "◆パブロンゴールド"
             TO 商品名.
           MOVE ","
             TO カンマ2.
           MOVE 1280
             TO 値段.
      *
           PERFORM 書き込み処理.
      *
           MOVE 20230319
             TO 日付.
           MOVE ","
             TO カンマ1.
           MOVE "◆パブロン鼻炎カプセル"
             TO 商品名.
           MOVE ","
             TO カンマ2.
           MOVE 1280
             TO 値段.
      *
           PERFORM 書き込み処理.
      *
           MOVE 20230319
             TO 日付.
           MOVE ","
             TO カンマ1.
           MOVE "キュキュット詰め替え用"
             TO 商品名.
           MOVE ","
             TO カンマ2.
           MOVE 297
             TO 値段.
      *
           PERFORM 書き込み処理.
      *
           MOVE 20230319
             TO 日付.
           MOVE ","
             TO カンマ1.
           MOVE "キレイキレイ"
             TO 商品名.
           MOVE ","
             TO カンマ2.
           MOVE 498
             TO 値段.
      *
           PERFORM 書き込み処理.
      *
           MOVE 20230325
             TO 日付.
           MOVE ","
             TO カンマ1.
           MOVE "◆パブロン鼻炎カプセル"
             TO 商品名.
           MOVE ","
             TO カンマ2.
           MOVE 1280
             TO 値段.
      *
           PERFORM 書き込み処理.
      *
           MOVE 20230331
             TO 日付.
           MOVE ","
             TO カンマ1.
           MOVE "◆パブロン鼻炎カプセル"
             TO 商品名.
           MOVE ","
             TO カンマ2.
           MOVE 1280
             TO 値段.
      *
           PERFORM 書き込み処理.
      *
           MOVE 20230401
             TO 日付.
           MOVE ","
             TO カンマ1.
           MOVE "◆バファリン"
             TO 商品名.
           MOVE ","
             TO カンマ2.
           MOVE 497
             TO 値段.
      *
           MOVE 20230403
             TO 日付.
           MOVE ","
             TO カンマ1.
           MOVE "◆パブロン鼻炎カプセル"
             TO 商品名.
           MOVE ","
             TO カンマ2.
           MOVE 1280
             TO 値段.
      *
           MOVE 20230403
             TO 日付.
           MOVE ","
             TO カンマ1.
           MOVE "キュキュット詰め替え用"
             TO 商品名.
           MOVE ","
             TO カンマ2.
           MOVE 297
             TO 値段.
      *
           PERFORM 書き込み処理.
      *
           MOVE 20230403
             TO 日付.
           MOVE ","
             TO カンマ1.
           MOVE "キレイキレイ"
             TO 商品名.
           MOVE ","
             TO カンマ2.
           MOVE 498
             TO 値段.
      *
           PERFORM 書き込み処理.
      *
           MOVE 20230411
             TO 日付.
           MOVE ","
             TO カンマ1.
           MOVE "◆パブロン鼻炎カプセル"
             TO 商品名.
           MOVE ","
             TO カンマ2.
           MOVE 1280
             TO 値段.
      *
           PERFORM 書き込み処理.
      *
           MOVE 20230411
             TO 日付.
           MOVE ","
             TO カンマ1.
           MOVE "*サントリクラフトボス"
             TO 商品名.
           MOVE ","
             TO カンマ2.
           MOVE 218
             TO 値段
      *
           PERFORM 書き込み処理.
      *
           MOVE 20230415
             TO 日付.
           MOVE ","
             TO カンマ1.
           MOVE "◆パブロンゴールド"
             TO 商品名.
           MOVE ","
             TO カンマ2.
           MOVE 1280
             TO 値段.
      *
           PERFORM 書き込み処理.
      *
           MOVE 20230419
             TO 日付.
           MOVE ","
             TO カンマ1.
           MOVE "◆パブロン鼻炎カプセル"
             TO 商品名.
           MOVE ","
             TO カンマ2.
           MOVE 1280
             TO 値段.
      *
           PERFORM 書き込み処理.
      *
           MOVE 20230419
             TO 日付.
           MOVE ","
             TO カンマ1.
           MOVE "キュキュット詰め替え用"
             TO 商品名.
           MOVE ","
             TO カンマ2.
           MOVE 297
             TO 値段.
      *
           PERFORM 書き込み処理.
      *
           MOVE 20230419
             TO 日付.
           MOVE ","
             TO カンマ1.
           MOVE "キレイキレイ"
             TO 商品名.
           MOVE ","
             TO カンマ2.
           MOVE 498
             TO 値段.
      *
           PERFORM 書き込み処理.
      *
           MOVE 20230423
             TO 日付.
           MOVE ","
             TO カンマ1.
           MOVE "◆パブロン鼻炎カプセル"
             TO 商品名.
           MOVE ","
             TO カンマ2.
           MOVE 1280
             TO 値段.
      *
           PERFORM 書き込み処理.
      *
           MOVE 20230429
             TO 日付.
           MOVE ","
             TO カンマ1.
           MOVE "◆パブロン鼻炎カプセル"
             TO 商品名.
           MOVE ","
             TO カンマ2.
           MOVE 1280
             TO 値段.
      *
           PERFORM 書き込み処理.
      *
       終了処理.
           CLOSE 領収書ファイル.
       プログラム終了.
           STOP RUN.
       書き込み処理.
           WRITE 領収書レコード
           END-WRITE.
