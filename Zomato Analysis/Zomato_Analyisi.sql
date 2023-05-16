USE zomato;

-- Write an SQL query to solve the given problem statement.
-- For a high-level overview of the hotels, provide us the top 5 most voted hotels in the delivery category.
SELECT name,votes,rating FROM zomato
where type='Delivery'
GROUP BY name,votes,rating
ORDER BY votes DESC
LIMIT 5;

-- Write an SQL query to solve the given problem statement.
-- The rating of a hotel is a key identifier in determining a restaurant’s performance. Hence for a particular location called Banashankari find out the top 5 highly rated hotels in the delivery category.

SELECT name,rating,location,type FROM zomato
WHERE type='Delivery' and location='Banashankari'
GROUP BY name,rating,location,type
ORDER BY rating DESC
LIMIT 5;

-- Write an SQL query to solve the given problem statement.
-- compare the ratings of the cheapest and most expensive hotels in Indiranagar.
SELECT MIN(cheapest.rating) as cheapest_rating ,MAX(expensive.rating) as expensive_rating
FROM (SELECT rating FROM zomato WHERE location='Indiranagar' ORDER BY approx_cost ASC LIMIT 1 ) as cheapest,
(SELECT rating FROM zomato WHERE location='Indiranagar' ORDER BY approx_cost DESC LIMIT 1 ) as expensive;

-- Write an SQL query to solve the given problem statement.
-- Online ordering of food has exponentially increased over time. Compare the total votes of restaurants that provide online ordering services and those who don’t provide online ordering service.

SELECT * FROM zomato;

SELECT online_order,SUM(votes) as total FROM zomato
GROUP BY online_order;

-- Write an SQL query to solve the given problem statement.
-- Number of votes defines how much the customers are involved with the service provided by the restaurants For each Restaurant type, find out the number of restaurants, total votes, and average rating. 
-- Display the data with the highest votes on the top( if the first row of output is NA display the remaining rows).

SELECT type,count(name) as no_of_customers,SUM(votes),AVG(rating) FROM zomato
WHERE type<>'NA'
GROUP BY type
ORDER BY no_of_customers DESC;

-- Write an SQL query to solve the given problem statement.
-- What is the most liked dish of the most-voted restaurant on Zomato(as the restaurant has a tie-up with Zomato, the restaurant compulsorily provides online ordering and delivery facilities.

SELECT * FROM zomato;

SELECT name,rating,dish_liked,votes
FROM zomato
GROUP BY name,rating,dish_liked,votes
ORDER BY votes DESC
LIMIT 1;

-- Write an SQL query to solve the given problem statement.
-- To increase the maximum profit, Zomato is in need to expand its business. For doing so Zomato wants the list of the top 15 restaurants which have min 150 votes, have a rating greater than 3, and 
-- is currently not providing online ordering. Display the restaurants with highest votes on the top.

SELECT name,online_order,rating,votes
FROM zomato
WHERE rating>3 and votes>=50 and online_order='NO'
GROUP BY name,online_order,rating,votes
ORDER BY votes DESC
LIMIT 15;









