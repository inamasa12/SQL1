3.1
・文字列を合計している
・GROUP BY句で集約した列がSELECT句に存在しない
・WHERE句がGROUP BY句より後ろに記載されている

3.2
SELECT shohin_bunrui, sum(hanbai_tanka), sum(shiire_tanka)
    FROM Shohin
    GROUP BY shohin_bunrui
    HAVING sum(hanbai_tanka) > sum(shiire_tanka) * 1.5;

3.3
SELECT * FROM Shohin ORDER BY torokubi DESC, hanbai_tanka;