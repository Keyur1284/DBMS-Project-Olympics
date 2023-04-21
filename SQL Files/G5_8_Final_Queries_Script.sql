-- 1. List top 3 nations with the highest overall rating

SELECT country_name, rating FROM 
Country NATURAL JOIN Olympic_host
ORDER BY rating DESC
LIMIT 3;


-- 2.  Give the count of players participating in olympics from different nations.

SELECT country_name, COUNT(pid) AS no_of_players FROM
Player NATURAL JOIN Country
GROUP BY cid, country_name;


-- 3. Give the count of players associated with Jalal brand

SELECT brand_name, COUNT(pid) AS total_players FROM
Player_association NATURAL JOIN Brands
WHERE brand_name = 'Jalal'
GROUP BY bid, brand_name;


--4. List the current world record and player's personal best for 
-- Javelin in Track and Field sports category with player name in increasing age 

SELECT name, age, personal_best, world_record FROM 
Events NATURAL JOIN Player_participation 
NATURAL JOIN Player
WHERE sport_name='Track and Field' AND  event_name='Javelin'
ORDER BY Player.Age; 


--5. Get the countries whose weather condititon is temperature < 32 and 
-- wind speed > 10 during olympics

SELECT country_name, temperature_c, wind_speed FROM
Country NATURAL JOIN Olympic_host
NATURAL JOIN Weather_condition
WHERE (temperature_c < 32 AND wind_speed > 10);


--6. List countries in the decreasing order of the streaming duration of Olympics

SELECT country_name, SUM(streaming_duration_hrs) AS total_streaming_duration FROM 
Country NATURAL JOIN Electronic_accessibility
NATURAL JOIN Electronic_media 
GROUP BY cid 
ORDER BY SUM(streaming_duration_hrs) DESC;


--7. List top 10 players with highest total endorsed money from different brands.

SELECT name, SUM(endorsed_money) AS total_endorsed_money FROM 
Player NATURAL JOIN Player_association
NATURAL JOIN Brands
GROUP BY Player.name
ORDER BY SUM(endorsed_money) DESC
LIMIT 10;


--8. List the player names and their origin country who are unfit to 
-- participate(either their dopamine test is positive or their ecg report is abnormal)

SELECT name, country_name, test_name, report FROM 
Player NATURAL JOIN Fitness_checkup
NATURAL JOIN Medical_test 
NATURAL JOIN Country 
WHERE (mid=1 AND report='Positive') OR (mid=2 AND report='Abnormal');


--9. List Countries (in the order that they have hosted) from Asia which have 
-- hosted the olympic between 2011 and 2023

SELECT country_name, year FROM 
Country NATURAL JOIN Olympic_host
WHERE Continent='Asia' AND year BETWEEN 2011 AND 2023
ORDER BY year;


--10. Compare the World record, Olympic record and Player's personal best
-- for those players who passed the dopamine test.

SELECT name, personal_best, world_record, olympic_record FROM
Player NATURAL JOIN Player_participation
NATURAL JOIN Events
NATURAL JOIN Fitness_checkup AS FC
WHERE (mid = 1 AND FC.report = 'Negative');


--11. Get the BMI of the players with value upto 2 decimal place.

SELECT name, age, height, weight, ROUND((weight*10000/(height*height)),2) AS bmi 
FROM Player
ORDER BY name;


--12. Find countries with highest probability of precipitaion 
-- during its olympic hosting (Hint: Humidity > 60 and Temperature > 25)

SELECT Country_name,Continent,Humidity,Temperature_c AS temperature
FROM Weather_condition
NATURAL JOIN Olympic_host
NATURAL JOIN Country
WHERE Humidity > 60 AND Temperature_c > 25;


--13. List the country-wise and language-wise count of the copies sold  

SELECT country_name,print_language, SUM(copies_sold) AS total_copies_sold FROM print_media 
NATURAL JOIN Print_accessibility 
NATURAL JOIN Print_languages 
NATURAL JOIN Country
GROUP BY country_name,print_language
ORDER BY SUM(copies_sold) DESC;


--14. List the player name and sport name of the players associated with more than one brand.

SELECT name, sport_name FROM events
NATURAL JOIN player_participation
NATURAL JOIN player
NATURAL JOIN
(
	SELECT pid, count(pid) as no_of_brands FROM brands
	NATURAL JOIN Player_association
	NATURAL JOIN player
	GROUP BY player_association.pid
	HAVING count(pid)>1
) AS temp;


--15. List podium finishers(name of player and their country) in Pole Vault

SELECT country_name, name, result FROM Player 
NATURAL JOIN Player_participation NATURAL JOIN Country 
NATURAL JOIN Events 
WHERE event_name = 'Pole Vault' 
ORDER BY RESULT DESC 
LIMIT 3;


--16. List the duty wise count of olympic staff for all the countries 
-- which hosted olympics along with year. 

SELECT country_name, year, duty, count(stid) FROM 
Olympic_staff NATURAL JOIN Country 
NATURAL JOIN Olympic_host 
GROUP BY country_name, duty, year 
ORDER BY country_name;


--17. Retrieve the names of countries, electronic media, electronic languages, 
-- and start times for electronic media accessible in those countries
-- in alphabetical order by country name

SELECT country_name, electronic_name, electronic_language, start_time FROM
Country NATURAL JOIN electronic_languages
NATURAL JOIN electronic_media
NATURAL JOIN electronic_accessibility
ORDER BY country_name;


--18. Give name of the country (country name and count of medals) 
-- which won maximum number of medals in sprint events.

SELECT country_name, COUNT(pid) AS total_medals FROM 
Country NATURAL JOIN Player 
WHERE pid IN
(
	(
		SELECT pid FROM player_participation WHERE evid=3 
	 	ORDER BY RESULT ASC 
		LIMIT 3
	)
 
	UNION
	
	(
		SELECT pid FROM player_participation WHERE evid=4 
		ORDER BY RESULT ASC 
		LIMIT 3
	)
)
GROUP BY country_name
ORDER BY count(pid) DESC 
LIMIT 1;