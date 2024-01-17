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
    ~~~  
    CREATE TABLE <table_name>  
       (col_name1  CHAR(4) NOT NULL,  
        col_name2   VARCHAR(10) NOT NULL,  
        col_name3   INTEGER NULL,  
        col_name4   DATE,  
        PRIMARY KEY (col_name1))  
    ~~~
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
- データの登録  
INSERT文  
    ~~~
    -- 直接値を挿入
    INSERT INTO table 
        VALUES (col1_1, col2_1 , ... , coln_1),
               (col1_2, DEFAULT, ... , coln_2),
               (col1_3,        , ... , coln_3),
               ...
    
    -- 他のテーブルから挿入
    INSERT INTO table1
    SELECT col1, col2, ..., coln
        FROM table2
    ~~~
- データの削除  
全削除の場合、DELETEよりTRUNCATEが速い　　
- データの更新  
UPDATE文  
    ~~~
    UPDATE table
        SET col1 = 式1,
            col2 = 式2
        WHERE col3 >= 0
    ~~~
- トランザクション  
BEGIN TRANSACTION; で開始  
COMMIT;で確定、ROLLBACK;で取り消し  
SQL Serverの場合、トランザクション内で任意のSQLがエラーとなっても、それ以外のSQLは実行されるため注意（全てのSQLを取り消すオプションはある）  

5. 複雑な問い合わせ  
- ビュー  
ビューを重ねるとパフォーマンスは低下する  
- サブクエリ  
サブクエリを重ねるとパフォーマンスは低下する  
スカラサブクエリは定数として各所で用いることができる  
- 相関サブクエリ  
サブクエリを親データで限定する  
    ~~~
    -- 例
    SELECT *
        FROM table1 S1
        WHERE col_1 > (SELECT AVG(col_A)
                        FROM table2 S2
                        WHERE S2.col_B = S1.col_2) 
    ~~~

6. 関数、述語、CASE式  
- いろいろな関数  
%: 剰余算  
+: 文字  
SUBSTRING(str, from, num): 文字列の置き換え  
COALESCE(col1, col2, ...): NULLを順次補完  
- 述語  
戻り値が真理値となる特定の関数  
LIKE: 文字列比較（%、_といった正規表現と併せて用いる）  
IS NULL / IS NOT NULL: NULL判定  
EXISTS:
指定したクエリが値を返す場合に真、返さない場合に偽を返す  
相関サブクエリを指定した場合は、各親データに対して戻り値があるかどうかを判定して論理値を返す  
    ~~~
    table1のcol1について、table2でcol1が'X'のものだけを返す
    SELECT *
        FROM table1 AS S
        WHERE EXISTS (select *
                        FROM table2 AS TS
                        where TS.col1 = 'X'
                                AND TS.col2 = S.col1)
    ~~~
- CASE式  
    ~~~
    例
    SELECT CASE
                WHEN col1 = 'A' THEN 1
                WHEN col2 = 'B' THEN 2
                ELSE NULL
            END AS colX
        FROM table
    ~~~

7. 集合演算  
- テーブルの足し算と引き算  
UNION(ALL): 和集合を返す（重複行を残すときはALL）  
INTERSECT:  積集合  
EXCEPT:     差分  
- 結合（列方向）  
FULL OUTER JOIN: 非結合データも表示  
CROSS JOIN: 全てのデータの組み合わせを表示（ON句は必要ない）  

8. SQLで高度な処理を行う  
- ウィンドウ関数  
構文は下記の通り  
function OVER(PARTITION BY col1 ORDER BY col2)  
RANK、ROW_NUMBER等がある  
ウィンドウの範囲指定も可能  
    ~~~
    カレント行を含むn行前までを対象
    AVG(col1) OVER(ORDER BY col2 ROWS n PRECEEDING) 
    カレント行を含むn行後までを対象
    AVG(col1) OVER(ORDER BY col2 ROWS n FOLLOWING) 
    カレント行を含むm行前から、カレント行を含むn行後まで
    AVG(col1) OVER(ORDER BY col2 ROWS BETWEEN m PRECEEDING AND n FOLLOWING) 
    ~~~

- グルーピング演算子  
    ROLLUP: 合計、小計を表示  
    ~~~
    SELECT col, sum(colA)
        FROM table
        GROUP BY ROLLUP (col)
    ~~~
    CUBE: 全ての組み合わせの合計、小計を表示  
    ~~~  
    SELECT col1, col2, sum(colA)
        FROM table
        GROUP BY CUBE (col1, col2)
    ~~~

9. アプリケーションからデータベースへ接続する  
- データベースの世界とアプリケーションの世界をつなぐ  
ドライバはデータベースとアプリケーションのやりとりを管理する  
アプリケーションとデータベースの組み合わせ毎に存在  
Ex.) PostgreSQL JDBC DriverはJavaとPostgreSQLをつなぐ  




