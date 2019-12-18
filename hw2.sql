SELECT 'ФИО: Анисимова Анна';
--Простые выборки
--1
 SELECT * 
FROM ratings 
LIMIT 10; 
--2
 SELECT *
 FROM links 
 WHERE (movieid>100 AND movieid<1000) AND(imdbid LIKE '%42');
 --Сложные выборки: Join 
--1
SELECT  links.imdbId
FROM links
INNER JOIN ratings ON ratings.movieid=links.movieid
WHERE ratings.rating=5;
--3Аггрегация данных: базовые статистики 
--1
SELECT COUNT(DISTINCT links.movieid) 
FROM links LEFT JOIN ratings ON ratings.movieid=links.movieid
WHERE ratings.rating is NULL;

--2
SELECT userid
FROM ratings
GROUP BY userid HAVING avg(rating) > 3.5
ORDER BY avg(rating) DESC LIMIT 10;

--4Иерархические запросы
--1
SELECT  links.imdbId
FROM links
INNER JOIN ratings ON ratings.movieid=links.movieid
WHERE (SELECT AVG(ratings.rating)>3.5
	   FROM ratings)
LIMIT 10;
--2
SELECT avg(avg_per_user)
 FROM (SELECT avg(rating) AS avg_per_user
  FROM ratings
  GROUP BY userid HAVING COUNT(userid) > 10)
 AS avg_all_users;
