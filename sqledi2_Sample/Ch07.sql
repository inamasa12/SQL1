
EXISTS & EXCEPT について

下記のサブクエリで、SkillsからのEXCEPTはEmpSkillsの各emp毎に行われる
このため、Skillsの全てのskillを持っているempはEXIXTSではFalse（返り値がない）、NOT EXISTSではTrue（返り値がある）となる
結果、Skillsのskillを持っているempだけが表示されることになる

SELECT *
  FROM EmpSkills ES1
 WHERE NOT EXISTS
        (SELECT skill
           FROM Skills
         EXCEPT
         SELECT skill
           FROM EmpSkills ES2
          WHERE ES1.emp = ES2.emp);
従業員ごとにSkills/skill EXCEPT EmpSkills/skillの評価が行われ、当該従業員がSkills/skillを持っている場合に偽となる
NOTがかかっているため、当該従業員が表示される

この場合はSkillsのskill以外を持っているempが表示される
SELECT *
  FROM EmpSkills ES1
 WHERE EXISTS
        (SELECT skill
           FROM EmpSkills ES2
           WHERE ES1.emp=ES2.emp
         EXCEPT
         SELECT skill
           FROM Skills);


7.1
SELECT * FROM Shohin; と同じ結果が得られる

SELECT * 
    FROM Shohin
UNION 
SELECT *
    FROM Shohin
INTERSECT
SELECT *
    FROM Shohin
ORDER BY shohin_id;

7.2
SELECT COALESCE(TS.tenpo_id, '不明') AS tenpo_id
      , COALESCE(TS.tenpo_mei, '不明') AS tenpo_mei
      , S.shohin_id, S.shohin_mei, S.hanbai_tanka
  FROM TenpoShohin TS 
  RIGHT OUTER JOIN Shohin S
  ON TS.shohin_id = S.shohin_id
  ORDER BY tenpo_id;

SELECT CASE WHEN TS.tenpo_id IS NULL THEN '不明'
            ELSE TS.tenpo_id
            END AS tenpo_id
      , CASE WHEN TS.tenpo_mei IS NULL THEN '不明'
            ELSE TS.tenpo_mei
            END AS tenpo_mei
      , S.shohin_id, S.shohin_mei, S.hanbai_tanka
  FROM TenpoShohin TS 
  RIGHT OUTER JOIN Shohin S
  ON TS.shohin_id = S.shohin_id
  ORDER BY tenpo_id;


