/* DBCOUNTRY*/

SELECT cia.name,cia.population FROM cia WHERE name='Canada'



SELECT cia.name,cia.population,cia.area,CAST(cia.population/cia.area AS INT) AS population_density FROM cia WHERE area > 2000000



SELECT CONCAT(cia.name,' is in ',cia.region) AS country_regiorn FROM cia WHERE cia.area < 2000 AND cia.gdp > 5000000000



SELECT cia.name FROM cia WHERE cia.name IN ('Sri Lanka', 'Ceylon', 'Persia', 'Iran')



SELECT cia.name FROM cia WHERE LEFT(cia.name,1) = 'D'



SELECT cia.name , cia.area FROM cia WHERE cia.area BETWEEN 207600 AND 244820



SELECT cia.name, cia.population FROM cia WHERE cia.population >= 200000000


SELECT cia.name,cia.area  FROM cia WHERE  cia.area >= 2300000 ORDER BY cia.area DESC



SELECT cia.name,'$'+ CAST(cia.gdp/cia.population AS VARCHAR(50) )AS gdp_capita  FROM cia WHERE cia.population >= 200000000 ORDER BY gdp_capita DESC

/**SELECT cia.name, CASE when cia.population > 0 then cia.gdp/cia.population end AS percapita FROM cia**/



SELECT cia.name,CONCAT(str(cia.population/1000000,6,2),' M') AS millions FROM cia WHERE cia.region = 'South America' ORDER BY millions DESC



SELECT cia.name,cia.population FROM cia WHERE  cia.name in ('China','Japan','Iraq','Iran')


SELECT cia.name FROM cia WHERE cia.name LIKE '%United%' ORDER BY cia.region




SELECT cia.name,cia.population FROM cia WHERE cia.name = 'France' OR cia.name ='Germany'



SELECT cia.name FROM cia WHERE LEFT(cia.name,1)='S' AND cia.region='Europe'








/** Pub DATABASE**/
SELECT authors.au_lname AS LASt_Name , authors.au_fname AS First_Name FROM authors  WHERE authors.au_lname='Smith' ORDER BY authors.au_fname



SELECT DISTINCT authors.state FROM authors



SELECT authors.au_lname,authors.au_fname,authors.city,authors.state FROM authors WHERE authors.state='CA' AND authors.city != 'Oakland' OR authors.city = 'Salt Lake City'



SELECT titles.title, titles.price FROM titles WHERE titles.price BETWEEN 5 AND 20



SELECT titles.title,titles.price FROM titles WHERE titles.price IS NULL



SELECT authors.au_lname,authors.au_fname FROM authors WHERE RIGHT(authors.au_lname,3)='ger'



SELECT authors.au_lname,authors.au_fname FROM authors WHERE LEFT(authors.au_lname,1)= 'D' AND LEFT(authors.au_lname,1)= 'd' 



SELECT authors.au_lname,authors.au_fname FROM authors WHERE LEN(authors.au_lname)= 5 AND RIGHT(authors.au_lname,4) = 'mith'


SELECT CONCAT(authors.au_lname,' ',authors.au_fname) AS Author_name,authors.state FROM authors
