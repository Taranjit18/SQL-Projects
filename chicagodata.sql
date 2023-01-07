--Problem 1: Find the total number of crimes recorded in the CRIME table.
SELECT COUNT(DISTINCT(CASE_NUMBER))
FROM Chicago_Crime_Data

--Problem 2: List community areas with per capita income less than 11000.
SELECT COMMUNITY_AREA_NAME 
FROM Census_Data
WHERE PER_CAPITA_INCOME<11000
--Problem 3: List all case numbers for crimes involving minors?
SELECT CASE_NUMBER 
FROM Chicago_Crime_Data
WHERE DESCRIPTION LIKE "%Child%"
--Problem 4: List all kidnapping crimes involving a child?(children are not considered minors for the purposes of crime analysis)
SELECT CASE_NUMBER 
FROM Chicago_Crime_Data
WHERE DESCRIPTION LIKE "%Child%" and UPPER(PRIMARY_TYPE) = "KIDNAPPING"



--Problem 5: What kind of crimes were recorded at schools?

SELECT DISTINCT PRIMARY_TYPE
FROM Chicago_Crime_Data
WHERE LOCATION_DESCRIPTION LIKE "%school%"


--Problem 6: List the average safety score for all types of schools.

select avg(SAFETY_SCORE)
FROM Chicago_Public_Schools

--Problem 7: List 5 community areas with highest % of households below poverty line.
SELECT COMMUNITY_AREA_NAME, PERCENTHOUSEHOLDSBELOWPOVERTY
FROM Census_Data
ORDER BY PERCENTHOUSEHOLDSBELOWPOVERTY DESC LIMIT 5


--Problem 8: Which community area(number) is most crime prone?
SELECT COMMUNITY_AREA_NUMBER, COUNT(CASE_NUMBER)AS CRIMECOUNT
FROM Chicago_Crime_Data
GROUP BY COMMUNITY_AREA_NUMBER
ORDER BY CRIMECOUNT DESC LIMIT 1

--Problem 9: Use a sub-query to find the name of the community area with highest hardship index.
SELECT COMMUNITY_AREA_NAME
FROM Census_Data
WHERE HARDSHIP_INDEX = (SELECT MAX(HARDSHIP_INDEX)
						FROM Census_Data)


--Problem 10: Use a sub-query to determine the Community Area Name with most number of crimes?
WITH community AS(
SELECT COMMUNITY_AREA_NUMBER, COUNT(CASE_NUMBER)AS CRIMECOUNT
FROM Chicago_Crime_Data
GROUP BY COMMUNITY_AREA_NUMBER
ORDER BY CRIMECOUNT DESC LIMIT 1
)

SELECT A.COMMUNITY_AREA_NAME, A.COMMUNITY_AREA_NUMBER
FROM Census_Data A
JOIN community ON A.COMMUNITY_AREA_NUMBER = community.COMMUNITY_AREA_NUMBER





--Problem 11: How many Elementary Schools are in the dataset?
SELECT COUNT(DISTINCT(NAME_OF_SCHOOL))
FROM Chicago_Public_Schools
WHERE ElementaryMiddleorHighSchool ="ES"

--Problem 12: Display total number of elementary, middle and high school from Chicago_public_Schools
SELECT ElementaryMiddleorHighSchool, COUNT(*)
FROM Chicago_Public_Schools
GROUP BY ElementaryMiddleorHighSchool


--Problem 13: What is the highest Safety Score? #Which schools have highest Safety Score?
SELECT NAME_OF_SCHOOL, SAFETY_SCORE
FROM Chicago_Public_Schools
WHERE SAFETY_SCORE = (SELECT MAX(SAFETY_SCORE)
						FROM Chicago_Public_Schools)

--Problem 14: Remove the '%' sign for Average Student Attendance column.
SELECT TRIM(AVERAGE_STUDENT_ATTENDANCE,"%")
FROM Chicago_Public_Schools



--Problem 15: Which Schools have Average Student Attendance lower than 70%?
SELECT NAME_OF_SCHOOL
FROM Chicago_Public_Schools
WHERE AVERAGE_STUDENT_ATTENDANCE < "70%" 



--Problem 16: Get the total College Enrollment for each Community Area.
SELECT COMMUNITY_AREA_NAME, SUM(COLLEGE_ENROLLMENT)
FROM Chicago_Public_Schools
GROUP BY COMMUNITY_AREA_NAME


--Problem 17: Get the 5 Community Areas with the least College Enrollment sorted in ascending order
SELECT COMMUNITY_AREA_NAME
FROM Chicago_Public_Schools
WHERE COLLEGE_ENROLLMENT
GROUP BY COMMUNITY_AREA_NAME
ORDER BY COLLEGE_ENROLLMENT ASC LIMIT 5



--Problem 18: Display total number of elementary, middle and high school from Chicago_public_Schools


--Problem 19: Display ZIPCodes from Chicago_Schools which are having more than 5 schools.
SELECT ZIPCode, COUNT(*) AS TOT
FROM Chicago_Public_Schools
GROUP BY ZIPCODE
HAVING TOT >5
ORDER BY TOT DESC



--Problem 20: Get the hardship index for the community area which has the school with the highest enrollment
SELECT A.community_area_name, HARDSHIP_INDEX 
FROM CENSUS_DATA  A ,CHICAGO_PUBLIC_SCHOOLS B
WHERE A.community_area_number  = B.community_area_number  and
B.COLLEGE_ENROLLMENT = (SELECT MAX(COLLEGE_ENROLLMENT) from Chicago_Public_Schools)


--Problem 21: Display the type of crimes with less than 10 reported crimes for each category.
SELECT PRIMARY_TYPE, COUNT(CASE_NUMBER)AS TOT
FROM Chicago_Crime_Data
GROUP BY PRIMARY_TYPE
HAVING TOT<10



--Problem 22 : Display the top 20 least reported types of crime. (Primary_type column) 
SELECT PRIMARY_TYPE, COUNT(CASE_NUMBER) AS TOT
FROM Chicago_Crime_Data
GROUP BY PRIMARY_TYPE
ORDER BY TOT ASC LIMIT 20
