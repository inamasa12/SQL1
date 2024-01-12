# SQL1
SQL ～ゼロからはじめるデータベース操作～  

1. データベースとSQL  
- SQLの文とその種類  
    - DDL(Data Definition Language):  
    データを格納するデータベースやテーブルを操作  
    CREATE, DROP, ALTER...  
    - DML(Data Manipulation Language):  
    テーブル内のデータを操作  
    SELECT, INSERT, UPDATE, DELETE...  
    - DCL(Data Control Language):  
    全体を制御  
    COMMIT, ROLLBACK, GRANT, REVOKE...  
- テーブルの作成  
    - データベースの作成  
    CREATE DATABASE <db_name>  
    - テーブルの作成  
    CREATE TABLE <table_name>  
    (col_name1  CHAR(4) NOT NULL,  
    col_name2   VARCHAR(10) NOT NULL,  
    col_name3   INTEGER NULL,  
    col_name4   DATE  
    PRIMARY KEY (col_name1))  
- テーブルの削除と変更  
    - テーブルの削除  
    DROP TABLE <table_name>  
    - テーブルの定義変更  
    ALTER TABLE <table_name> ADD COLUMN col_name INTEGER NOT NULL  
    ALTER TABLE <table_name> DROP COLUMN col_name  

2. 検索の基本  
- 算術演算子と比較演算子  
NULLに比較演算子は使えない  
NULLとの演算はNULLが返る  
SELECT * FROM table WHERE col IS (NOT) NULL  
- 論理演算子  
SELECT * FROM table WHERE NOT col > 0  

3. 集約と並び替え  
- テーブルを集約して検索する  
SELECT (*) FROM table ⇒ 全行をカウント  
SELECT (col) FROM table ⇒ NULLでない行をカウント  
SELECT (DISTINCT col) FROM table ⇒ NULLでない行を重複を除いてカウント  
- 集約した結果に条件を指定する  
HAVINGを用いる  
    ~~~
    SELECT col, COUNT(*)
        FROM table
        GROUP BY col
        HAVING count(*) = 2
    ~~~
- 検索結果を並び替える  
ソート処理はマシンの負荷が大きい  
集約関数でもソートできる  
    ~~~
    SELECT col 
        FROM table 
        GROUP BY col 
        ORDER BY COUNT(*)
    ~~~

4. データの更新  
