-- create table
CREATE TABLE netflix(
      show_id VARCHAR(6),
	  type VARCHAR(10),
	  title VARCHAR(150),
	  director VARCHAR(210),
	  casts VARCHAR(1000),
	  country VARCHAR(150),
	  date_added VARCHAR(50),
	  release_year INT,
	  rating VARCHAR(10),
	  duration VARCHAR(20),
	  listed_in VARCHAR(30),
	  description VARCHAR(250)
);

SELECT * FROM netflix;

SELECT COUNT(*) as total_content
FROM netflix;

SELECT 
DISTINCT type
FROM netflix;
-------------------------------------------------------------------------

-- 15 Business Problems & Solutions

--1. Count the number of Movies vs TV Shows
SELECT type, COUNT(*) 
FROM netflix
GROUP BY type;

--2. Find the most common rating for movies and TV shows
SELECT rating, COUNT(*) AS total_count
FROM netflix
GROUP BY rating
ORDER BY total_count DESC
LIMIT 1;

SELECT type, rating, COUNT(*) AS total_count
FROM netflix
GROUP BY type, rating
ORDER BY type, total_count DESC;

--3. List all movies released in a specific year (e.g., 2020)
SELECT * 
FROM netflix
WHERE release_year = 2020;

--4. Find the top 5 countries with the most content on Netflix
SELECT 
    TRIM(unnest(string_to_array(country, ','))) AS country,
    COUNT(*) AS total_content
FROM netflix
WHERE country IS NOT NULL
GROUP BY country
ORDER BY total_content DESC
LIMIT 5;

--5. Identify the longest movie
SELECT *
FROM netflix
WHERE type = 'Movie'
ORDER BY SPLIT_PART(duration, ' ', 1)::INT DESC;

--6. Find content added in the last 5 years
SELECT*
FROM netflix
WHERE TO_DATE(date_added, 'Month DD, YYYY') >= CURRENT_DATE - INTERVAL '5 years';

--7. Find all the movies/TV shows by director 'Rajiv Chilaka'!
SELECT *
FROM netflix
WHERE director = 'Rajiv Chilaka';

--8. List all TV shows with more than 5 seasons
SELECT * FROM netflix
WHERE type = 'TV Show'
AND CAST(SPLIT_PART(duration, ' ', 1) AS INT) > 5;
  
--9. Count the number of content items in each genre
SELECT 
    TRIM(unnest(string_to_array(listed_in, ','))) AS genre,
    COUNT(*) AS total_content
FROM netflix
GROUP BY genre
ORDER BY total_content DESC;

--10.Find each year and the average numbers of content release in India on netflix. 
-- return top 5 year with highest avg content release!
SELECT release_year,
COUNT(*) AS total_content,
ROUND(COUNT(*)::numeric, 2) AS avg_content
FROM netflix
WHERE country LIKE '%India%'
GROUP BY release_year
ORDER BY avg_content DESC
LIMIT 5;

--11. List all movies that are documentaries
SELECT * FROM netflix
WHERE listed_in LIKE '%Documentaries';

--12. Find all content without a director
SELECT * FROM netflix
WHERE director IS NULL;

--13. Find how many movies actor 'Salman Khan' appeared in last 10 years!
SELECT 
    COUNT(*) AS total_movies
FROM netflix
WHERE type = 'Movie'
  AND casts ILIKE '%Salman Khan%'
  AND release_year >= EXTRACT(YEAR FROM CURRENT_DATE) - 10;

--14. Find the top 10 actors who have appeared in the highest number of movies produced in India.
SELECT 
	UNNEST(STRING_TO_ARRAY(casts, ',')) as actor,
	COUNT(*)
FROM netflix
WHERE country = 'India'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;

--15. Categorize the content based on the presence of the keywords 'kill' and 'violence' in --the description field. Label content containing these keywords as 'Bad' and all other 
--content as 'Good'. Count how many items fall into each category.
SELECT category,TYPE,
COUNT(*) AS content_count
FROM (SELECT *,
        CASE 
            WHEN description ILIKE '%kill%' OR description ILIKE '%violence%' THEN 'Bad'
            ELSE 'Good'
        END AS category
    FROM netflix
) AS categorized_content
GROUP BY 1,2
ORDER BY 2;
