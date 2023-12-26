       IDENTIFICATION         DIVISION.
       PROGRAM-ID.            PRO2003.
       ENVIRONMENT            DIVISION.
       INPUT-OUTPUT           SECTION.
       FILE-CONTROL.
           SELECT 人事ファイル1 ASSIGN TO
             "/home/suzuki/DATA/JINJI2003-1".
           SELECT 人事ファイル2 ASSIGN TO
             "/home/suzuki/DATA/JINJI2003-2".
           SELECT 結果ファイル ASSIGN TO
             "/home/suzuki/DATA/KEKKA2003".
           SELECT 人事併合ファイル ASSIGN TO
             "/home/suzuki/DATA/MERGE2003".
       DATA                   DIVISION.
       FILE                   SECTION.
       FD  人事ファイル1.
       01  人事レコード1.
           COPY CP006.
       FD  人事ファイル2.
       01  人事レコード2.
           COPY CP006.
       FD  結果ファイル.
       01  結果レコード.
           COPY CP006.
       SD  人事併合ファイル.
       01  人事併合レコード.
           COPY CP007.
       PROCEDURE              DIVISION.
       開始                   SECTION.
      *
           PERFORM 初期処理.
      *
           PERFORM 併合処理.
      *
           STOP RUN.
      *
      ****************************************************
       初期処理               SECTION.
      ****************************************************
      *
      *SUB2004をコールする。
           CALL "SUB2004".
      *SUB2005をコールする。
           CALL "SUB2005".
      *
       初期処理－ＥＸ.
       EXIT.
      ****************************************************
       併合処理               SECTION.
      ****************************************************
      *
      *併合処理をする。
           MERGE 人事併合ファイル
             ASCENDING  KEY 所属キー
             DESCENDING KEY 従業員キー
             USING  人事ファイル1 人事ファイル2
             GIVING 結果ファイル.
      *
      *SUB2006をコールする。
           CALL "SUB2006".
      *
       併合処理－ＥＸ.
       EXIT.
