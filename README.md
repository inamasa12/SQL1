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



