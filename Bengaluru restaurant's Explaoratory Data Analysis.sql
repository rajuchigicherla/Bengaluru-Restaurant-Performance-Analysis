 
SELECT*FROM zomato;

SELECT COUNT(*) 
FROM INFORMATION.SCHEMA.COLUMNS 
WHERE table_name = 'zomato';


--Dropping unwanted columns which are not required for the business problem

ALTER TABLE zomato
DROP COLUMN address,
DROP COLUMN phone;

--Renaming the columns  and adding serial id column to make the data more meaningful and readable

ALTER TABLE zomato
RENAME COLUMN name TO restaurant_name,
RENAME COLUMN rest_type TO restaurant_type
RENAME COLUMN listed_in_type TO dining_type,
RENAME COLUMN rate TO rating;

-- Adding ID column the table

ALTER TABLE zomato
ADD COLUMN id SERIAL;

                         --Handling null values--

--Delete null values of restaurant_name column

DELETE FROM zomato
WHERE restaurant_name IS NULL;

-- Delete null values of online_order 

DELETE FROM zomato
WHERE online_order IS NULL
OR online_order = ' '

-- Delete null values of book_table 

DELETE FROM zomato
WHERE book_table IS NULL OR book_table = ' '

--Replace null values of rating to zero


UPDATE zomato
 SET rating = 0 WHERE rating IS NULL  OR rating = ' '

--Delete null values of votes 

DELETE FROM zomato
WHERE votes IS NULL OR votes = ' '

--  Delete null values of location 

DELETE FROM zomato
WHERE location IS NULL OR location = ' '

-- Replace null values of rest_type to NA 

UPDATE zomato
SET restaurant_type = 'NA'
WHERE restaurant_type IS NULL OR restaurant_type = ' '

  --Replace null values of dish_liked to NA

UPDATE zomato
SET dish_liked = 'NA'
WHERE dish_liked IS NULL OR dish_liked = ' '

--Delete null values of cuisines

DELETE FROM zomato
WHERE cuisines IS NULL OR cuisines = ' '

-- Replace null values of approx_cost_for_two_people to 0

UPDATE zomato
SET approx_cost_for_two_people = 0
WHERE approx_cost_for_two_people IS NULL OR approx_cost_for_two_people = ' '

 -- Replace null values of dining_type to NA
 
UPDATE zomato
SET dining_type = 'NA'
WHERE dining_type IS NULL OR dining_type = ' '

 
--Remove all the duplicate values keeping the first value as it is in the table
DELETE FROM zomato
   WHERE id NOT IN( 
     SELECT  MIN(id) AS min_id
    FROM zomato
    GROUP BY restaurant_name, book_table, online_order, rating, votes, location, restaurant_type,
             dish_liked, cuisines, approx_cost_for_two_people, dining_type
    HAVING COUNT(*) > 1)

--Removing irrelevant or unnecessary text from all the columns in a dataset

DELETE FROM zomato
WHERE 
  (restaurant_name LIKE '%RATED%' OR restaurant_name LIKE '%Rated%')
  OR (online_order LIKE '%RATED%' OR online_order LIKE '%Rated%')
  OR (book_table LIKE '%RATED%' OR book_table LIKE '%Rated%')
  OR (rating LIKE '%RATED%' OR rating LIKE '%Rated%')
  OR (votes LIKE '%RATED%' OR votes LIKE '%Rated%')
  OR (location LIKE '%RATED%' OR location LIKE '%Rated%')
  OR (approx_cost_for_two_people LIKE '%RATED%' OR approx_cost_for_two_people LIKE '%Rated%')
  OR (cuisines LIKE '%RATED%' OR cuisines LIKE '%Rated%')
  OR (dish_liked LIKE '%RATED%' OR dish_liked LIKE '%Rated%')
  OR (restaurant_type LIKE '%RATED%' OR restaurant_type LIKE '%Rated%')
  OR (dining_type LIKE '%RATED%' OR dining_type LIKE '%Rated%');




DELETE FROM zomato
WHERE restaurant_name LIKE '%Ã%' OR
      restaurant_name LIKE '%ƒ%' OR
      restaurant_name LIKE '%©%'; */

DELETE FROM zomato
WHERE online_order NOT IN ('Yes','No')

     
UPDATE zomato
SET rating = 0
WHERE rating  IN ('-','NEW') 


UPDATE zomato
SET rating = REPLACE(rating, '/5', '')
WHERE rating LIKE '%/5';


UPDATE zomato
SET rating = CAST(rating AS NUMERIC(10,1));*/


UPDATE zomato
SET votes = CAST(votes AS INTEGER);


UPDATE zomato
SET approx_cost_for_two_people = CAST(approx_cost_for_two_people AS money)


      
                       --EXPLORATORY DATA ANALYSIS--

-- Total no of restaurant chains in bengaluru

SELECT COUNT(DISTINCT restaurant_name) FEROM zomato;


--Average price for two persons
 
SELECT AVG(approx_cost_for_two_people) AS average_cost_for_two
FROM zomato;


--What percentage of restaurants offer online ordering?

SELECT 
    COUNT(CASE WHEN online_order = 'Yes' THEN 1 END) * 100 /
     COUNT(*) as percentage_online_order
FROM 
    zomato;


--How does the presence of online ordering affect a restaurant's rating?

SELECT 
    online_order,
    AVG(rating) as avg_rating
FROM 
    zomato
GROUP BY 
    online_order;

--Are restaurants with online ordering more likely to receive higher votes?

SELECT 
    online_order,
    AVG(votes) as avg_votes
FROM 
    zomato
GROUP BY 
    online_order;


--What percentage of restaurants have the option to book a table?

SELECT 
    COUNT(CASE WHEN book_table = 'Yes' THEN 1 END) * 100.0 / 
    COUNT(*) AS percentage_book_table
FROM 
    zomato;

--How does the availability of table booking affect a restaurant's rating?

SELECT 
    book_table, AVG(rating) AS avg_rating
FROM 
    zomato
GROUP BY 
    book_table;

--Are restaurants that offer table booking more likely to receive higher votes?

SELECT 
    book_table, AVG(votes) AS avg_votes
FROM 
    zomato
GROUP BY 
    book_table;

--What is the average rating of restaurants in each location?

SELECT location, AVG(rating) AS avg_rating
FROM zomato
GROUP BY location;

--Which restaurant types tend to have the highest ratings?

SELECT restaurant_type, AVG(rating) AS avg_rating
FROM zomato
GROUP BY restaurant_type
ORDER BY avg_rating DESC;

--Is there a correlation between the number of votes and a restaurant's rating?

SELECT rating, COUNT(votes) AS num_votes
FROM zomato
GROUP BY rating
ORDER BY rating DESC;



--Which restaurant types tend to receive the most votes?

SELECT restaurant_type, AVG(votes) AS average_votes
FROM zomato
GROUP BY restaurant_type
ORDER BY average_votes DESC;


--Which restaurant types are the most popular?

SELECT restaurant_type, COUNT(*) as num_restaurants
FROM zomato
GROUP BY restaurant_type
ORDER BY num_restaurants DESC;

--Is there a correlation between restaurant type and cost?

SELECT AVG(approx_cost_for_two_people) as avg_cost, restaurant_type
FROM zomato
GROUP BY restaurant_type
ORDER BY avg_cost DESC;
