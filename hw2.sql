SELECT 'ФИО: Анисимова Анна';
1Простые выборки
1. SELECT * 
FROM ratings 
LIMIT 10; # выводит 10 записей из таблицы ratings
2. SELECT *
 FROM links 
 WHERE (movieid>100 AND movieid<1000) AND(imdbid LIKE '%42');#выбрать из таблицы links всё записи, у которых imdbid оканчивается на "42", а поле movieid между 100 и 1000 
2Сложные выборки: Join
1.SELECT  links.imdbId
FROM links
INNER JOIN ratings ON ratings.movieid=links.movieid
WHERE ratings.rating=5; #выбрать из таблицы links все imdbId, которым ставили рейтинг 5
3Аггрегация данных: базовые статистики
1. SELECT COUNT(movieid)
FROM ratings
WHERE rating IS NULL;
2.SELECT userid
FROM ratings
GROUP BY userid HAVING AVG(rating)>3.5;
4Иерархические запросы
1. SELECT  links.imdbId
FROM links
INNER JOIN ratings ON ratings.movieid=links.movieid
WHERE (SELECT AVG(ratings.rating)>3.5
	   FROM ratings)
LIMIT 10;#Подзапросы: достать любые 10 imbdId из links у которых средний рейтинг больше 3.5.
WITH tmp_table
AS ( SELECT COUNT(rating) AS rating_1
    FROM ratings
    )
SELECT AVG(rating_1)
FROM tmp_table
GROUP BY rating_1 HAVING rating_1>10;#Common Table Expressions: посчитать средний рейтинг по пользователям, у которых более 10 оценок. Нужно подсчитать средний рейтинг по все пользователям, которые попали под условие - то есть в ответе должно быть одно число.