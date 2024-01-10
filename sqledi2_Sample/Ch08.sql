8.1
current_max_tanka列にはshohin_id昇順で当該データまでの販売単価最大値が表示される

SELECT shohin_id, shohin_mei, hanbai_tanka
        , MAX (hanbai_tanka) OVER (ORDER BY shohin_id) AS current_max_tanka
        FROM Shohin;

8.2
SELECT torokubi, shohin_id, shohin_mei, hanbai_tanka
        , SUM (hanbai_tanka) OVER (ORDER BY COALESCE(torokubi, '2008-1-1')) AS sum_tanka
        FROM Shohin;


SELECT torokubi, shohin_id, shohin_mei, hanbai_tanka
        , SUM (hanbai_tanka) OVER (ORDER BY torokubi NULLS FIRST) AS sum_tanka
        FROM Shohin;        