4.1
Aさんのトランザクションはコミットされていないため、BさんのSELECT文に返されるデータはない

4.2
キー違反でINSERT文はエラーになる

4.3
INSERT INTO Shohin
VALUES ('0001', 'Tシャツ', '衣服', 1000, 500, '2009-09-20'),
('0002', '穴あけパンチ', '事務用品', 500, 320, '2009-09-11'),
('0003', 'カッターシャツ', '衣服', 4000, 2800, NULL);

CREATE TABLE ShohinSaeki
(shohin_id     CHAR(4) NOT NULL,
 shohin_mei    VARCHAR(100) NOT NULL,
 hanbai_tanka  INTEGER,
 shiire_tanka  INTEGER,
 saeki         INTEGER, 
 PRIMARY KEY (shohin_id));

INSERT INTO ShohinSaeki
SELECT shohin_id, shohin_mei, hanbai_tanka, shiire_tanka, hanbai_tanka - shiire_tanka
FROM Shohin;

4.4
個別に行う必要がある
UPDATE ShohinSaeki
SET hanbai_tanka = 3000
WHERE shohin_id = '0003';

UPDATE ShohinSaeki
SET saeki = hanbai_tanka - shiire_tanka
WHERE shohin_id = '0003';
