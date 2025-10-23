-- INNER JOIN 1
SELECT c.first_name || ' ' || c.last_name AS Nome_Completo, f.title AS Titulo, r.rental_date AS Dia
FROM rental r
INNER JOIN customer c ON c.customer_id = r.customer_id
INNER JOIN inventory i ON i.inventory_id = r.inventory_id
INNER JOIN film f ON f.film_id = i.film_id
ORDER BY nome_completo ASC

SELECT * FROM film_actor

-- INNER JOIN 2
SELECT a.first_name || ' ' || a.last_name AS nome_completo, f.title AS Titulo
FROM film_actor fa
INNER JOIN actor a ON a.actor_id = fa.actor_id
INNER JOIN film f ON f.film_id = fa.film_id
ORDER BY nome_completo ASC

-- INNER JOIN 3
SELECT 
	s.first_name || ' ' || s.last_name AS Nome_Staff,
	c.first_name || ' ' || c.last_name AS Nome_cliente, 
	p.amount AS pagamento
FROM payment p
INNER JOIN staff s ON s.staff_id = p.staff_id
INNER JOIN customer c ON c.customer_id = p.customer_id
ORDER BY payment_date ASC

-- LEFT JOIN 1
SELECT 
	c.first_name || ' ' || c.last_name AS Nome_Completo,
	r.last_update
FROM rental r
INNER JOIN customer c ON c.customer_id = r.customer_id

-- LEFT JOIN 2
SELECT
	f.title AS titulo,
	STRING_AGG(a.first_name || ' ' || a.last_name, ', ') AS atores
FROM film_actor fa
LEFT JOIN film f ON f.film_id = fa.film_id
LEFT JOIN actor a ON a.actor_id = fa.actor_id
GROUP BY f.title
ORDER BY titulo ASC

-- LEFT JOIN 3
SELECT
	s.store_id AS Loja,
	st.first_name || ' ' || st.last_name AS gerente
FROM store s
LEFT JOIN staff st ON st.staff_id = s.manager_staff_id
ORDER BY loja ASC

-- DESAFIO 1
SELECT
	c.first_name || ' ' || c.last_name AS Cliente,
	SUM(p.amount) AS pagamentos
FROM payment p
LEFT JOIN customer c ON c.customer_id = p.customer_id
GROUP BY c.first_name, c.last_name
ORDER BY cliente ASC

-- DESAFIO 2
SELECT
    c.first_name || ' ' || c.last_name AS cliente,
    p.amount,
    p.payment_date
FROM payment p
LEFT JOIN customer c ON c.customer_id = p.customer_id
WHERE c.customer_id = 2
ORDER BY p.payment_date ASC;