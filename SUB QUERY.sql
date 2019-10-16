--1

USE pub
SELECT title AS 'Books', price
FROM titles
WHERE price > ( SELECT AVG(price)
FROM titles )
ORDER BY price ASC

--2
 SELECT AVG(price) AS 'average'
FROM titles 
WHERE price > ( SELECT AVG(price)
FROM titles )



--3

SELECT distinct type AS 'type'
FROM titles
WHERE price > ( SELECT AVG(price)
FROM titles )
ORDER BY type ASC


--4

SELECT type FROM titles 
WHERE price >(
		SELECT AVG(price)
		FROM titles
		WHERE title LIKE 'o%')
GROUP BY type

--5
SELECT title
FROM titles t
WHERE  NOT EXISTS (
SELECT *
FROM sales s
WHERE s.title_id=t.title_id
)


--6
SELECT pub_name
FROM publishers p
WHERE  EXISTS (
SELECT *
FROM titles t
WHERE t.pub_id = p.pub_id AND advance>'10000'

)


--7

SELECT	t.title_id AS 'title nb',t.title AS 'title',city AS 'City',state AS 'State',SUM(qty) AS 'quantity'
FROM titles t	JOIN sales s ON t.title_id=S.title_id
				JOIN stores ss ON s.stor_id=ss.stor_id
WHERE ss.state IN ('CA','WA')
GROUP BY t.title_id, city, title, state
ORDER BY city


--8

SELECT	city , state , SUM(qty) AS 'quantity'
FROM titles t	JOIN sales s ON t.title_id=s.title_id
				JOIN stores ss ON s.stor_id=ss.stor_id
WHERE state='WA'
GROUP BY city, state


--9

SELECT	pub_name AS 'Publisher', fname+' '+ lname AS 'employee Name', job_lvl
FROM  publishers p	JOIN employee e ON p.pub_id= e.pub_id		
WHERE job_lvl>'200'
GROUP BY pub_name , fname,lname, job_lvl


--10

SELECT distinct title AS 'title',price
FROM titles
WHERE price = ( SELECT MAX(price)
FROM titles )
ORDER BY title ASC


--11

SELECT TOP 1 title AS 'title', advance AS 'price'
FROM titles
ORDER BY advance DESC;

--12

SELECT TOP 1 j.job_id, COUNT(*) AS "Number of Employees"
FROM employee e JOIN jobs j ON e.job_id=j.job_id
GROUP BY j.job_id
ORDER BY COUNT(*) DESC;


--13

SELECT YEAR(hire_date) AS 'year', COUNT(*) AS "Number of Employees"
FROM employee 
GROUP BY YEAR(hire_date)

--14

SELECT TOP 1 YEAR(hire_date) AS 'year', COUNT(*) AS "Number of Employees"
FROM employee 
GROUP BY YEAR(hire_date)
ORDER BY COUNT(*) DESC;

--15

SELECT TOP 1 fname AS 'Fname', lname AS 'Lname', CONVERT(varchar(11), hire_date, 0)
 AS "Employment Date"
FROM employee
ORDER BY hire_date DESC;


--16

SELECT title_id, title FROM titles
WHERE title_id NOT IN(SELECT title_id
FROM sales S
WHERE YEAR(ord_date)>=1993)


--17
 
SELECT au_lname + ' ' + au_fname  AS 'Author', CONVERT(VARCHAR, SUM(qty*price)) + ' $' AS 'Income'
FROM authors a	JOIN titleauthor t ON a.au_id = t.au_id

JOIN titles tt ON t.title_id = tt.title_id JOIN sales s ON tt.title_id = s.title_id

GROUP BY au_lname, au_fname
ORDER BY SUM(qty*price) DESC



--18

SELECT au_lname + ' ' + au_fname  ,COUNT(*) AS 'Number of Books'
FROM authors a	JOIN titleauthor t ON a.au_id = t.au_id
GROUP BY au_lname, au_fname
HAVING COUNT (*)>=ALL(SELECT DISTINCT COUNT(*) FROM titleauthor GROUP BY au_id)





