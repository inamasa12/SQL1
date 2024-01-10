
5.1
CREATE VIEW ViewRenshu5_1 (shohin_mei, hanbai_tanka, torokubi)
AS
SELECT shohin_mei, hanbai_tanka, torokubi
FROM Shohin
WHERE hanbai_tanka >= 1000 and torokubi = '2009-9-20';

5.2
NULL制約のあるshohin_id、shohin_bunruiの情報がないためエラーとなる

5.3
SELECT shohin_mei
        , shohin_bunrui
        , hanbai_tanka
        , (SELECT AVG(hanbai_tanka) FROM Shohin) AS hanbai_taka_all
FROM Shohin;

5.4
CREATE VIEW AvgTankaByBunrui
AS
SELECT shohin_id
        , shohin_mei
        , shohin_bunrui
        , hanbai_tanka
        , (SELECT AVG(hanbai_tanka) 
            FROM Shohin AS S2 
            WHERE S2.shohin_bunrui = S1.shohin_bunrui) AS avg_hanbai_taka
FROM Shohin AS S1;
