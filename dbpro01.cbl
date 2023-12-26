       IDENTIFICATION         DIVISION.
       PROGRAM-ID.            dbpro01.
       DATA                   DIVISION.
       WORKING-STORAGE        SECTION.
      *** 1.ホスト変数の定義
           EXEC SQL BEGIN DECLARE SECTION END-EXEC.
       01  DBNAME         PIC X(10) VALUE "mydb".
       01  USERNAME       PIC X(10) VALUE "suzuki".
       01  PASSWORD       PIC X(10) VALUE "yudai103".
       01  SW-AREA.
         03 SW-NOTFOUND   PIC X(1) VALUE SPACE.
       01  CST-AREA.
         03 CST-1X        PIC X(1) VALUE "1".
         03 CST-SQL-NF    PIC S9(5) VALUE +100.
       01  SEISEKIHYO.
         03 GAKUSEKINO    PIC X(4).
         03 GAKUSEINAME   PIC X(40).
         03 HOUGAKU       PIC 9(4).
         03 KEIZAIGAKU    PIC 9(4).
         03 TETSUGAKU     PIC 9(4).
         03 JOUHORIRON    PIC 9(4).
         03 GAIKOKUGO     PIC 9(4).
         03 SOUGOUSEISEKI PIC X(1).
           EXEC SQL END DECLARE SECTION END-EXEC.
      *** 2.共通領域の定義
           EXEC SQL INCLUDE SQLCA END-EXEC.
      *
       PROCEDURE               DIVISION.
       KAISI                   SECTION.
       main.
      *** 3.データベースと接続
           EXEC SQL
             CONNECT :USERNAME IDENTIFIED BY
             :PASSWORD USING :DBNAME
           END-EXEC.
      *** 4.データベースアクセス
      * 全件削除
           EXEC SQL
             DELETE FROM seisekihyo
           END-EXEC.
      *
           DISPLAY "DB ALL DELETE END".
      *
      * 追加
      * 学籍番号S001の追加
           EXEC SQL
             INSERT INTO seisekihyo
             VALUES
             ('S001','ODANOBUNAGA',77,55,80,75,93,NULL)
           END-EXEC.
      * 学籍番号A002の追加
           EXEC SQL
             INSERT INTO seisekihyo
             VALUES
             ('A002','TOYOTOMIHIDEYOSHI',64,69,70,0,59,NULL)
           END-EXEC.
      * 学籍番号E003の追加
           EXEC SQL
             INSERT INTO seisekihyo
             VALUES
             ('E003','TOKUGAWAIEYASU',80,83,85,90,79,NULL)
           END-EXEC.
      * 学籍番号F004の追加
           EXEC SQL
             INSERT INTO seisekihyo
             VALUES
             ('F004','ISHIDAMITSUNARI',85,82,90,95,80,NULL)
           END-EXEC.
      * 学籍番号G005の追加
           EXEC SQL
             INSERT INTO seisekihyo
             VALUES
             ('G005','MOURITERUMOTO',80,79,81,52,78,NULL)
           END-EXEC.
      * 学籍番号H006の追加
           EXEC SQL
             INSERT INTO seisekihyo
             VALUES
             ('H006','MIYAMOTOMUSASHI',49,35,47,48,30,NULL)
           END-EXEC.
      *
           PERFORM COMMIT-PRO.
      *
           DISPLAY "DB INSERT END".
      * 更新
           EXEC SQL
             UPDATE seisekihyo
             SET hougaku = 85,tetsugaku = 67
             WHERE gakusekino = 'S001'
           END-EXEC.
      *
           EXEC SQL
             UPDATE seisekihyo
             SET gaikokugo  = 81
             WHERE gakusekino IN ('A002','E003')
           END-EXEC.
      *
           EXEC SQL
             UPDATE seisekihyo
             SET gaikokugo = 47
             WHERE gakusekino IN ('G005','H006')
           END-EXEC.
      *
           PERFORM COMMIT-PRO.
      *
      * 総合成績更新
           EXEC SQL
             UPDATE seisekihyo
             SET sougouseiseki = 'A'
             WHERE hougaku >= 80 AND keizaigaku >= 80
               AND tetsugaku >= 80 AND jouhoriron >= 80
               AND gaikokugo >= 80
           END-EXEC.
      *
           EXEC SQL
             UPDATE seisekihyo
             SET sougouseiseki = 'B'
             WHERE (hougaku >= 80 OR gaikokugo >= 80)
               AND (keizaigaku >= 80 OR tetsugaku >= 80)
               AND sougouseiseki IS NULL
           END-EXEC.
      *
           EXEC SQL
             UPDATE seisekihyo
             SET sougouseiseki = 'D'
             WHERE hougaku < 50 AND keizaigaku < 50
               AND tetsugaku < 50 AND jouhoriron < 50
               AND gaikokugo < 50
               AND sougouseiseki IS NULL
           END-EXEC.
      *
           EXEC SQL
             UPDATE seisekihyo
             SET sougouseiseki = 'C'
             WHERE sougouseiseki IS NULL
           END-EXEC.
      *
           PERFORM COMMIT-PRO.
      *
           DISPLAY "DB UPDATE END".
      *
      * 削除
           EXEC SQL
             DELETE FROM seisekihyo
             WHERE hougaku = 0 OR keizaigaku = 0
               OR tetsugaku = 0 OR jouhoriron = 0
               OR gaikokugo = 0
           END-EXEC.
      *
           PERFORM COMMIT-PRO.
      *
           DISPLAY "DB DELETE END".
      *
      *** 5.コミット処理
           PERFORM COMMIT-PRO.
      *** 6.カーソルオープン処理
           PERFORM OPEN-RTN.
      *** 7.FETCH処理
           PERFORM FETCH-RTN 
            UNTIL SW-NOTFOUND = CST-1X.
      *** 8.カーソルクローズ処理
           PERFORM CLOSE-RTN.
      *** 9･プログラム終了
           PERFORM PROEND.
       COMMIT-PRO             SECTION.
           DISPLAY "コミット処理".
           EXEC SQL
             COMMIT
           END-EXEC.
       OPEN-RTN               SECTION.
           DISPLAY "カーソルオープン処理"
           EXEC SQL
             DECLARE CSR01 CURSOR FOR
               SELECT gakusekino,gakuseiname,hougaku,
                      keizaigaku,tetsugaku,
                      jouhoriron,gaikokugo,
                      sougouseiseki
               FROM seisekihyo
               ORDER BY sougouseiseki
           END-EXEC.
      *
           EXEC SQL
             OPEN CSR01
           END-EXEC.
      *
       FETCH-RTN              SECTION.
           DISPLAY "FETCH処理".
           EXEC SQL
             FETCH CSR01
             INTO :GAKUSEKINO,:GAKUSEINAME,:HOUGAKU,
                  :KEIZAIGAKU,:TETSUGAKU,:JOUHORIRON,
                  :GAIKOKUGO,:SOUGOUSEISEKI
           END-EXEC.
      *
           IF SQLCODE = CST-SQL-NF
             THEN
               MOVE CST-1X TO SW-NOTFOUND
               DISPLAY SQLCODE
             ELSE
               DISPLAY "学籍番号" GAKUSEKINO
                       "学生名" GAKUSEINAME
                       "法学" HOUGAKU
                       "経済学" KEIZAIGAKU
                       "哲学" TETSUGAKU
                       "情報理論" JOUHORIRON
                       "外国語" GAIKOKUGO
                       "総合成績" SOUGOUSEISEKI
           END-IF.
       CLOSE-RTN              SECTION.
           DISPLAY "カーソルクローズ処理".
           EXEC SQL
             CLOSE CSR01
           END-EXEC.
       PROEND                 SECTION.
           DISPLAY "プログラム終了"
           STOP RUN.
