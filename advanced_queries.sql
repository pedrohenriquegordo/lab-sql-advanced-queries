use sakila;

#1
WITH
  A AS (SELECT actor_id AS a_id1, film_id AS f_id1 FROM film_actor),
  B AS (SELECT actor_id AS a_id2, film_id AS f_id2 FROM film_actor)
SELECT a_id1 AS 'Actor\' 1 ID', a_id2 AS 'Actor\' 2 ID' FROM A JOIN B
WHERE A.a_id1 <> B.a_id2
AND A.f_id1 = B.f_id2;

#2
WITH
	A AS (SELECT title, film_id FROM film),
    B AS (SELECT actor_id, film_id FROM film_actor)
SELECT A.title AS 'Film', B.actor_id AS 'Actor\' ID' FROM A JOIN B ON A.film_id = B.film_id
ORDER BY B.actor_id IN(SELECT actor_id FROM B GROUP BY actor_id ORDER BY COUNT(film_id) DESC);

