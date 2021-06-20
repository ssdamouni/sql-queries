-- Comments in SQL Start with dash-dash --
-- Part 4
SELECT * FROM analytics WHERE id=1880;
SELECT id, app_name FROM analytics WHERE last_updated ='2018-08-01';
SELECT category, COUNT(*) FROM analytics GROUP BY category;
SELECT app_name, reviews FROM analytics DECS LIMIT 5;
SELECT app_name, reviews, rating FROM analytics WHERE rating >= 4.8 ORDER BY reviews DESC LIMIT 1;
SELECT category, AVG(rating) FROM analytics GROUP BY category ORDER BY AVG DESC;
SELECT app_name, price, rating FROM analytics WHERE rating < 3 ORDER BY price DESC LIMIT 1;
--Find all apps with a min install not exceeding 50, that have a rating. Order your results by highest rated first.
SELECT * FROM analytics WHERE min_installs <= 50 AND rating IS NOT NULL ORDER BY rating DESC;
--Find the names of all apps that are rated less than 3 with at least 10000 reviews.
SELECT app_name FROM analytics WHERE rating < 3 AND reviews > 1000;
--Find the top 10 most-reviewed apps that cost between 10 cents and a dollar.
SELECT * FROM analytics WHERE price BETWEEN .10 AND 1 ORDER BY reviews DESC LIMIT 10;
--Find the most out of date app. Hint: You don’t need to do it this way, but it’s possible to do with a subquery: http://www.postgresqltutorial.com/postgresql-max-function/
SELECT * FROM analytics ORDER BY last_updated LIMIT 1;
--Find the most expensive app (the query is very similar to #11).
SELECT * FROM analytics ORDER BY price DESC LIMIT 1;
--Count all the reviews in the Google Play Store.
SELECT SUM(reviews) FROM analytics;
--Find all the categories that have more than 300 apps in them.
SELECT category FROM analytics GROUP BY category HAVING COUNT(*) > 300;
--Find the app that has the highest proportion of min_installs to reviews, among apps that have been installed at least 100,000 times.
--Display the name of the app along with the number of reviews, the min_installs, and the proportion.
SELECT app_name, reviews, min_installs, min_installs/reviews AS proportion FROM analytics WHERE min_installs >= 100,000 ORDER BY proportion DESC LIMIT 1; 