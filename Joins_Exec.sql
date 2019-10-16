
USE pub;
SELECT publishers.pub_name AS publisher,employee.lname AS lASt_name,employee.fname AS first_name,jobs.job_desc AS title
FROM publishers
INNER JOIN employee ON publishers.pub_id=employee.pub_id
INNER JOIN jobs ON employee.job_id=jobs.job_id 
ORDER BY publishers.pub_name

USE pub;
 SELECT titles.title,stores.stor_name AS Store,stores.city AS city ,stores.state
 FROM titles
 INNER JOIN sales ON titles.title_id=sales.title_id
 INNER JOIN stores ON sales.stor_id=stores.stor_id
 ORDER BY title

USE pub;
	SELECT CONCAT(au_fname,' ',au_lname) AS author,titles.title AS title
	FROM authors
	INNER JOIN titleauthor ON authors.au_id=titleauthor.au_id
	INNER JOIN titles ON titleauthor.title_id=titles.title_id 
	ORDER BY author


USE pub;
SELECT authors.au_fname,authors.au_lname,COUNT(*) AS number
FROM authors
INNER JOIN titleauthor ON authors.au_id=titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id=titles.title_id
GROUP BY authors.au_fname,authors.au_lname



USE pub;
SELECT titles.title,publishers.pub_name,CONCAT(authors.au_lname,' ',LEFT(authors.au_fname,1),'.')
FROM authors
INNER JOIN titleauthor ON authors.au_id=titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id=titles.title_id
INNER JOIN publishers ON titles.pub_id=publishers.pub_id
ORDER BY title



USE pub;
SELECT stores.stor_name,stores.city,stores.state,titles.title,sales.qty
FROM titles
INNER JOIN sales ON titles.title_id=sales.title_id
INNER JOIN stores ON sales.stor_id=stores.stor_id
WHERE stores.state='WA'
ORDER BY sales.qty





USE pub;
SELECT publishers.pub_name,titles.title_id
 FROM publishers
 INNER JOIN titles ON publishers.pub_id=titles.pub_id
 WHERE titles.advance >=1000



USE pub;
SELECT DISTINCT publishers.pub_name,titles.type 
FROM publishers
INNER JOIN titles ON publishers.pub_id=titles.pub_id
WHERE titles.type='business' OR  titles.type='psychology' 



USE pub;
SELECT titles.title,authors.au_fname,authors.au_lname
FROM titles
INNER JOIN titleauthor ON titles.title_id=titleauthor.title_id
INNER JOIN authors ON titleauthor.au_id=authors.au_id
WHERE CONCAT(authors.au_fname,' ',authors.au_lname)='Albert Ringer'


USE pub;
SELECT publishers.pub_name,COUNT(*)
FROM publishers
INNER JOIN employee ON publishers.pub_id=employee.pub_id
GROUP BY publishers.pub_name


USE pub;
SELECT DISTINCT publishers.pub_name ,COUNT(titles.title_id) AS no_of_books ,MIN(price) AS MIN_price, MAX(titles.price) AS MAX_price,SUM(price) AS SUM_price,AVG(price) AS AVG_price FROM publishers
INNER JOIN titles ON publishers.pub_id=titles.pub_id
GROUP BY publishers.pub_name


USE pub;
SELECT stores.stor_name,COUNT(DISTINCT(sales.title_id)) AS no_of_different_books FROM stores
INNER JOIN sales ON stores.stor_id=sales.stor_id
GROUP BY stores.stor_name


USE pub;
SELECT  titles.title,SUM(sales.qty) AS quantity_sold FROM titles
INNER JOIN sales ON titles.title_id=sales.title_id
GROUP BY titles.title HAVING SUM(sales.qty) < 25


USE pub;
SELECT publishers.pub_name,MAX(titles.advance) FROM publishers
INNER JOIN titles ON publishers.pub_id=titles.pub_id
GROUP BY publishers.pub_name

USE pub;
SELECT CONCAT(authors.au_lname,' ',authors.au_fname) AS author FROM authors WHERE authors.cONtract=0 ORDER BY author


USE pub;
SELECT titles.title,SUM(sales.qty) FROM titles
INNER JOIN sales ON titles.title_id=sales.title_id
GROUP BY titles.title


USE pub;
SELECT stores.stor_name,SUM(sales.qty) AS number_of_books_sold FROM stores
INNER JOIN sales ON stores.stor_id=sales.stor_id
GROUP BY stores.stor_name