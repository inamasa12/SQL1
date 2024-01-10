
6.1
①
指定した価格以外の商品が表示される
価格がNULLの商品は判定不能で表示されない

②
何も表示されない
全てのデータについて「NULLでない」の判定がNULLになるため


6.2
SELECT
    SUM(CASE
            WHEN hanbai_tanka <= 1000 THEN 1
            ELSE 0 
        END) AS low_price,
    SUM(CASE
            WHEN hanbai_tanka > 1000 AND hanbai_tanka <= 3000 THEN 1
            ELSE 0 
        END) AS mid_price,
    SUM(CASE
            WHEN hanbai_tanka > 3000 THEN 1
            ELSE 0 
        END) AS high_price
    FROM Shohin;

