USE BUDT703_Project_0501_09;

BEGIN TRANSACTION;

-- Dropping the views:


DROP VIEW [Restaurant_Report];
DROP VIEW [Review_Report];
DROP VIEW [Suggestion_Report];
DROP VIEW [User_Credibility_Report];


-- Business Questions :

-- Question 1
-- Find all the information regarding the resturants in one single report.

GO

   CREATE VIEW [Restaurant_Report] AS 
   SELECT [resName] AS 'Restaurant Name', CONCAT([resStreetAddress],', ',[resCity],', ', [resState],', ',[resPostalCode]) AS 'Restaurant Address', 
  [resStars] AS 'Restaurant Rating', [resReviewCount] AS 'Number of reviews received',  CASE WHEN ( [resHasTakeout] =1 ) THEN 'YES' ELSE 'NO' END
   AS 'Offers Takeout', CONCAT('MONDAY: ',[resMondayTimings],'TUESDAY: ',[resTuesdayTimings],'WEDNESDAY: ',[resWednesdayTimings],'THURSDAY: ',[resThursdayTimings],
   'FRIDAY: ',[resFridayTimings], 'SATURDAY: ', [resSaturdayTimings], 'SUNDAY: ', [resSundayTimings]) AS 'Restaurant Timings'
   FROM [BUDT703_Project_0501_09].[dbo].[TerpsandBurps.Restaurant] res;


-- Question 2
-- Find all the reviews for a particular resturants.

GO 

   CREATE VIEW [Review_Report] AS 
    SELECT res.[resName] AS 'Restaurant Name', rev.[revStars] AS 'Review Rating', rev.[revUpvotes] AS 'Review Upvotes', rev.[revDate] AS 'Date of Review', 
	rev.[revText] AS 'Review' 
   FROM [BUDT703_Project_0501_09].[dbo].[TerpsandBurps.Restaurant] res 
   INNER JOIN [BUDT703_Project_0501_09].[dbo].[TerpsandBurps.Review] rev ON 
   res.[resId] = rev.[resId]  ;


-- Question 3
-- Finding all the suggestions for a particular restuarant.

GO

    CREATE VIEW [Suggestion_Report] AS  
	SELECT res.[resName] AS 'Restaurant Name', sug.[sugComplimentCount] AS 'Suggestion Upvotes', sug.[sugDate] AS 'Date of Suggestion', sug.[sugText] AS 'Suggestion' 
	FROM [BUDT703_Project_0501_09].[dbo].[TerpsandBurps.Restaurant] res 
	INNER JOIN [BUDT703_Project_0501_09].[dbo].[TerpsandBurps.Suggest] sug ON 
	res.[resId] = sug.[resId];


-- Question 4
-- Find the credibility of the reviewers by looking at the ratings received by each reviewer.

GO

   CREATE VIEW [User_Credibility_Report] AS  
   SELECT u.[userName] AS 'Name of the Reviewer', u.[userReviewCount] AS 'Number of reviews submitted by Reviewer', u.[userYelpingSince] 
   AS 'When the Reviewer joined Terps & Burps',u.[userFriends] AS 'Number of friends', u.[userUseful] AS 'Count of users that found the review useful', 
   u.[userAverageStars] AS 'The average rating of all ratings provided by Reviewer',
   CASE 
	WHEN ((u.[userElite] = 1 ) and (u.[userFriends] >100) and (u.[userReviewCount] > 50) and (u.[userUseful] > 500)) 
	THEN 'Highly Credible' 
	ELSE 'Moderately Credible' 
	END AS 'Reviewer Credibility'
   FROM [BUDT703_Project_0501_09].[dbo].[TerpsandBurps.User] u ;