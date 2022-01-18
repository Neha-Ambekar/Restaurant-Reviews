USE BUDT703_Project_0501_09;

BEGIN TRANSACTION;

IF EXISTS (
	SELECT *
	FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLE_NAME = 'TerpsandBurps.Suggest' AND TABLE_SCHEMA = 'dbo' )
	ALTER TABLE [TerpsandBurps.Suggest]
		DROP CONSTRAINT IF EXISTS fk_Suggest_resId;

IF EXISTS (
	SELECT *
	FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLE_NAME = 'TerpsandBurps.Suggest' AND TABLE_SCHEMA = 'dbo' )
	ALTER TABLE [TerpsandBurps.Suggest]
		DROP CONSTRAINT IF EXISTS fk_Suggest_userId;

IF EXISTS (
	SELECT *
	FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLE_NAME = 'TerpsandBurps.Review' AND TABLE_SCHEMA = 'dbo' )
	ALTER TABLE [TerpsandBurps.Review]
		DROP CONSTRAINT IF EXISTS fk_Review_userId;

IF EXISTS (
	SELECT *
	FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLE_NAME = 'TerpsandBurps.Review' AND TABLE_SCHEMA = 'dbo' )
	ALTER TABLE [TerpsandBurps.Review]
		DROP CONSTRAINT IF EXISTS fk_Review_resId;

DROP TABLE IF EXISTS [TerpsandBurps.Suggest];
DROP TABLE IF EXISTS [TerpsandBurps.Review];
DROP TABLE IF EXISTS [TerpsandBurps.User];
DROP TABLE IF EXISTS [TerpsandBurps.Restaurant];


CREATE TABLE [TerpsandBurps.Restaurant] (
	resId VARCHAR(50) NOT NULL,
	resName VARCHAR(50) NOT NULL,
	resStreetAddress VARCHAR(50) NOT NULL,
	resCity VARCHAR(50) NOT NULL,
	resState CHAR(10) NOT NULL,
	resPostalCode CHAR(50) NOT NULL,
	resLatitude VARCHAR(50),
	resLongitude VARCHAR(50),
	resStars DECIMAL(5),
	resReviewCount INT,
	resIsOpen BIT,
	resHasTakeout BIT,
	resMondayTimings VARCHAR(30),
	resTuesdayTimings VARCHAR(30),
	resWednesdayTimings VARCHAR(30),
	resThursdayTimings VARCHAR(30),
	resFridayTimings VARCHAR(30),
	resSaturdayTimings VARCHAR(30),
	resSundayTimings VARCHAR(30),
	CONSTRAINT pk_Restaurant_resId PRIMARY KEY (resId));


INSERT INTO [TerpsandBurps.Restaurant] VALUES
('tnhfDv5Il8EaGSXZG_R001','Taqueria Habanero','Berwyn Heights','College Park','MD','20740','38.99124','-76.932444','4.5','204','1','1','11:00 AM - 10:00 PM',
'11:00 AM - 10:00 PM','11:00 AM - 10:00 PM','11:00 AM - 10:00 PM','11:00 AM - 10:00 PM','11:00 AM - 10:00 PM','11:00 AM - 10:00 PM'),
('tnhfDv5Il8EaGSXZG_R002','El Taco Rico','6000 Greenbelt Rd Beltway Plaza Mall','Greenbelt','MD','20770','38.382105','-76.2285','4','45','1','1',
'10:00 AM - 9:00 PM','10:00 AM - 9:00 PM','10:00 AM - 9:00 PM','10:00 AM - 9:00 PM','10:00 AM - 9:00 PM','11:00 AM - 8:00 PM','11:00 AM - 8:00 PM'),
('tnhfDv5Il8EaGSXZG_R003','Azteca Restaurant-Cantina','9505 Baltimore Ave','College Park','MD','20740','39.009368794392','-76.9287406445103','3.5',
'294','1','1','11:00 AM - 11:00 PM','11:00 AM - 11:00 PM','11:00 AM - 11:00 PM','11:00 AM - 11:00 PM','11:00 AM - 11:00 PM','11:00 AM - 11:00 PM',
'11:00 AM - 11:00 PM'),
('tnhfDv5Il8EaGSXZG_R004','Taqueria La Placita','5020 Edmonston Rd','Hyattsville','MD','20781','38.950446797643','-76.9260406022064','4','286','1','1',
'5:00 AM - 10:00 PM','5:00 AM - 10:00 PM','5:00 AM - 10:00 PM','5:00 AM - 10:00 PM','5:00 AM - 10:00 PM','5:00 AM - 10:00 PM','5:00 AM - 10:00 PM'),
('tnhfDv5Il8EaGSXZG_R005','Tacos A La Madre
','5010 Berwyn Rd','College Park','MD','20740','38.9950014486788','-76.9259323179383','4.5','4','1','1',Null,Null,Null,Null,Null,'1:00 - 6:00 PM',
'1:00 -8:00 PM'),
('tnhfDv5Il8EaGSXZG_R006','Krazi kebob','5110 Roanoke Pl Ste 102 ','College Park','MD','20740','38.9950980256345','-76.9221640180621','4','241','1','1',
'11:00 AM - 9:30 PM','11:00 AM - 9:30 PM','11:00 AM - 9:30 PM','11:00 AM - 9:30 PM','11:00 AM - 9:30 PM','11:00 AM - 9:30 PM','11:00 AM - 9:30 PM'),
('tnhfDv5Il8EaGSXZG_R007','Taqueria El Mexicano','7811 Riggs Rd','Hyattsville','MD','20783','38.9846176940256','-76.9785286445342','4','64','1','1','
9:00 AM - 9:30 PM','9:00 AM - 9:30 PM','9:00 AM - 9:30 PM','9:00 AM - 9:30 PM','9:00 AM - 10:30 PM','9:00 AM - 10:30 PM','9:00 AM - 10:30 PM'),
('tnhfDv5Il8EaGSXZG_R008','Tacos 5 De Mayo Restaurant','7201 Annapolis Rd','Hyattsville','MD','20784','38.959258701418','-76.8902912373253','4.5','227',
'1','1','11:00 AM - 8:00 PM','11:00 AM - 8:00 PM','11:00 AM - 8:00 PM','11:00 AM - 8:00 PM','11:00 AM - 8:00 PM','11:00 AM - 8:00 PM','11:00 AM - 8:00 PM'),
('tnhfDv5Il8EaGSXZG_R009','Cielo Rojo','7056 Carroll Ave ','Takoma Park','MD','20912','38.975437665451','-77.0105416886169','4.5','266','1','1',
'3:00 PM - 9:00 PM','11:30 AM - 9:00 PM','11:30 AM - 9:00 PM','11:30 AM - 9:00 PM','11:30 AM - 9:30 PM','9:00 AM - 9:30 PM','9:00 AM - 9:30 PM')

CREATE TABLE [TerpsandBurps.User] (
	userId VARCHAR(23) NOT NULL,
	userName VARCHAR(25) NOT NULL,
	userReviewCount INT,
	userYelpingSince DATE,
	userFriends INT,
	userUseful INT,
	userFunny INT,
	userCool INT,
	userFuns INT,
	userElite BIT,
	userAverageStars DECIMAL(3),
	CONSTRAINT pk_User_userId PRIMARY KEY (userId));


INSERT INTO [TerpsandBurps.User] VALUES
('Ha3iJu77CxlrFm-vQR_U001','Ronnie T','208','2016-11-09','117','3','1','2','0','1','5'),
('Ha3iJu77CxlrFm-vQR_U002','Jennifer J.','145','2018-01-22','443','134','11','88','0','1','5'),
('Ha3iJu77CxlrFm-vQR_U003','Erik L.','1','2017-11-09','74','0','0','0','0','0','5'),
('Ha3iJu77CxlrFm-vQR_U004','Ann R.','55','2016-11-10','319','0','0','0','0','0','4'),
('Ha3iJu77CxlrFm-vQR_U005','Jisue G','33','2018-12-11','331','1','0','0','0','1','4'),
('Ha3iJu77CxlrFm-vQR_U006','Sharon W.','485','2016-03-11','107','1468','262','595','0','1','4.5'),
('Ha3iJu77CxlrFm-vQR_U007','Nicole S.','16','2017-04-11','86','8','0','6','0','0','4.62'),
('Ha3iJu77CxlrFm-vQR_U008','Khoi N.','752','2015-06-13','441','1398','201','729','0','1','4.8'),
('Ha3iJu77CxlrFm-vQR_U009','Mike Q','82','2020-11-14','296','58','2','24','0','1','4'),
('Ha3iJu77CxlrFm-vQR_U010','Kenny L.','282','2013-11-11','226','544','290','377','0','1','4.2'),
('Ha3iJu77CxlrFm-vQR_U011','NinaDivaStar P.','27','2021-06-01','115','23','9','3','0','0','3.2'),
('Ha3iJu77CxlrFm-vQR_U012','Lia M.','2268','2005-12-25','913','12590','4156','7838','0','1','4.7'),
('Ha3iJu77CxlrFm-vQR_U013','Krishna Bhavithavya K.','332','2018-01-08','74','1','1','1','0','1','4.6'),
('Ha3iJu77CxlrFm-vQR_U014','Benjamin M.','8','2016-05-11','505','4','1','3','0','0','5'),
('Ha3iJu77CxlrFm-vQR_U015','Shivana D','172','2018-11-16','38','172','31','102','0','1','4.8'),
('Ha3iJu77CxlrFm-vQR_U016','Jennifer E.','22','2011-10-10','0','2','0','3','0','0','4.8'),
('Ha3iJu77CxlrFm-vQR_U017','John C.','28','2007-03-11','3','165','30','26','0','0','3.5'),
('Ha3iJu77CxlrFm-vQR_U018','Austin G','3048','2014-11-08','1135','8238','2209','4830','0','1','4.9');


CREATE TABLE [TerpsandBurps.Review] (
	revId VARCHAR(23) NOT NULL,
	userId VARCHAR(23) NOT NULL,
	resId VARCHAR(50) NOT NULL,
	revStars DECIMAL(3),
	revDate DATE,
	revText VARCHAR(5000),
	revUpvotes INT,
	CONSTRAINT pk_Review_revId PRIMARY KEY (revId),
	CONSTRAINT fk_Review_userId FOREIGN KEY (userId)
		REFERENCES [TerpsandBurps.User] (userId)
		ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_Review_resId FOREIGN KEY (resId)
		REFERENCES [TerpsandBurps.Restaurant] (resId)
		ON DELETE CASCADE ON UPDATE CASCADE);

INSERT INTO [TerpsandBurps.Review] VALUES
('zdSx_SD6obEhz9VrW_RV001','Ha3iJu77CxlrFm-vQR_U002','tnhfDv5Il8EaGSXZG_R003','5','2021-01-22','Craving Tex-Mex, so we here on a whim after errands.

Restaurant is spacious and clean, and ALL the restaurant staff were very friendly and attentive. Service was also quick. The servers wore masks.

We ordered the burritos entrees - Santa Fe (steak) and the twins one (chicken and beef). Everything was well seasoned and delicious.

Great price point, service and food! Glad we came here to try them out.','0'),
('zdSx_SD6obEhz9VrW_RV002','Ha3iJu77CxlrFm-vQR_U001','tnhfDv5Il8EaGSXZG_R001','5','2021-06-18','So I have wanted to try this place for the longest time, 
and I am glad that I finally did. I was greeted by kind and welcoming customer service and seated promptly. I would like to note that there is a takeout section 
and also a dine in section.','6'),
('zdSx_SD6obEhz9VrW_RV003','Ha3iJu77CxlrFm-vQR_U003','tnhfDv5Il8EaGSXZG_R005','5','2021-10-18','A few months later, they introduced the Birria tacos. 
Without exaggeration, those changed my life. I''ve never had anything that tasted that good. The tacologists that created the recipe to those honey dew drops from 
heaven should be given a Nobel peace prize for the gift they have provided us here in the DMV. No tacos come close. I''ve tried so many tacos, but I always 
find myself coming back to Tacos a la Madre. Their food is top notch and their customer service is phenomenal. I''m so glad they have found a home in College Park 
because now I will be going here every week. This is not a joke.

Their location in Berwyn is such a nice sight to view. The colors are vibrant and gives off a welcoming feel. Their menu displays and drink display are all nice 
touches that make ordering so easy.','0'),
('zdSx_SD6obEhz9VrW_RV004','Ha3iJu77CxlrFm-vQR_U004','tnhfDv5Il8EaGSXZG_R001','4','2021-11-10','I''ve been to Taqueria Habanero countless times and it''s honestly one of 
the best places in College Park. There is something about their food, the nachos specifically, that I just crave. I always just get it as my entree and I''m always 
stuffed after just the nachos.','0'),
('zdSx_SD6obEhz9VrW_RV005','Ha3iJu77CxlrFm-vQR_U006','tnhfDv5Il8EaGSXZG_R003','3','2021-07-09','Friends invited us to meet them at Azteca. We got lost on the way to 
the restaurant (sorry Waze lady, I should have listened to you) so we were late. When we found the restaurant it stood alone and had a parking lot in the back. 
We told our friends to start without us so when we finally arrived we just ordered single tacos.  Our server was nice and attentive, but it was hard to understand 
her with a mask on. She asked me something about my taco and I only heard ""grilled chicken"" so I said yes. Well it turned out I had ordered a soft taco. Husband 
was nice enough to trade his crispy taco for mine. The chicken in the taco was nicely grilled and it was served with a fairly standard platter of rice and beans. 
The food was good but the disappointment was the margarita. It was rather bland and I really didn''t taste of any alcohol.

The restaurant itself is pleasant with a reception area as you enter and restrooms off to the side. There''s an entrance into the dining room that is L-shaped. 
They weren''t crowded at lunch time and I appreciated that they were social distancing the other customers. If invited to meet friends I''d go again 
(especially now that I know where it is) but it won''t replace my go-to favorite restaurant to get delicious margaritas and chips with salsa that is addictive.','2'),
('zdSx_SD6obEhz9VrW_RV006','Ha3iJu77CxlrFm-vQR_U007','tnhfDv5Il8EaGSXZG_R005','5','2021-11-07','Ok first of all 10/10 delicious the flavor of these tacos . 
Loved the family ambiance of seeing everyone working together in the back. But $15 for 3 birria tacos with consomme is kind of steep if you ask me. Where I''m from that 
would get you a whole dinner with rice and beans. However that being said I will be coming back just closer to pay day','0'),
('zdSx_SD6obEhz9VrW_RV007','Ha3iJu77CxlrFm-vQR_U008','tnhfDv5Il8EaGSXZG_R004','5','2021-10-28','This is as authentic as it gets when it comes to tacos. 
My friend and I stopped by on a busy weekday. There was a light out the door. Parking was luckily easy to find even with the lot being entirely filled. 
We ordered the barbacoa, carnitas, pastor, carne asada, cachete, chorizo and lengua. Wow flavors here are on point. Meats were seasoned well, tender and juicy. 
The way they pack it as well its so efficient. Stuffed in some aluminum foil. When I got home 15 minutes after they were still piping hot. I personally loved the lengua, 
carnitas, pastor and cachete the most. They packed the most flavor. If you want to indulge and don''t mind the calories then go with the pork ones. 
I''m glad my friend recommended this place as I will definitely be coming back. Expect quick service, authentic Mexican tacos and delicious flavors. 
Don''t be turned away by the long lines this is now my favorite taco spot in the area!','2'),
('zdSx_SD6obEhz9VrW_RV008','Ha3iJu77CxlrFm-vQR_U009','tnhfDv5Il8EaGSXZG_R002','4','2021-10-14','Taste was good. I got 3, an al pastor, carne Assad and lengua. 
Al pastor did not have the sweetness to like I would have imagined. The tongue was great! I thought all the meats were a dry. So I had to put on a lot of lime and salsa. 
Good thing their salsa was not too spicy.','1'),
('zdSx_SD6obEhz9VrW_RV009','Ha3iJu77CxlrFm-vQR_U010','tnhfDv5Il8EaGSXZG_R004','4','2021-06-13','OMG I''m gonna miss this place so much lol. For sure, 
I will try to come here when in the DC area. Man, I was so happy to have enjoyed and come back twice here! We went when it was packed not realizing there was a 
soccer match between USA & Mexico (USA won! Yay! Sorry) and even though packed, the employees were on it getting through everyone''s order quick and ensuring a 
minimal wait time. With covid and all, there was a long but we only waited roughly 15 mins, so not too bad considering the food came out in less than 5 mins. 
What is also cool is that if you dine in, they will have a server being your food to you, following you to the table bench of your choice. I really liked the 
neighborhood vibe of the locals, I felt comfortable and one with the locals lol. Made the experience well worth it and the food more enjoyable.
What is unfortunate is that the two times I went, my order was incorrect :''( but I still ate good lmao. The first time I asked for two Tripa Tacos 
and instead one was with Trompa Taco, but it was good so whatever lol. The second time, I asked for four tacos and only for charged for three :( 
lol so not much of a complaint but the cashier maybe will need to slow it down in the typing part? Because they repeated what I ordered as they entered it 
so maybe the POS (looked outdated too) couldn''t keep up with the entering fast pace of the employee?
The sauces that come with it is very authentic and delicious! You get more bang for your dollar here. I will say that I don''t think the tortillas are hand made 
or authentic but the rest is legit. :) Employees are nice too so be nice and patient. Can''t wait to go back and order more tacos!!!','5'),
('zdSx_SD6obEhz9VrW_RV010','Ha3iJu77CxlrFm-vQR_U011','tnhfDv5Il8EaGSXZG_R002','2','2021-06-12','The shortest version to sum up this review is this...on tacos alone, 
they''re definitely not bad. 4/5 on those...but the service...for ppl they assume to-be NON-HISPANIC or definitely non Spanish-speaking... negative fuggin 3!','2'),
('zdSx_SD6obEhz9VrW_RV011','Ha3iJu77CxlrFm-vQR_U012','tnhfDv5Il8EaGSXZG_R007','4','2017-07-27','I love a good mole, and Taqueria El Mexicano is the place for it. 
Their mole is rich, smoky, and delicious, plus it''s huge and reasonably priced. The rice and beans were good too, but the mole takes center stage. 
I also had an al pastor taco and snacked on some chicharrones de harina with hot sauce. The taco was great, and I enjoyed my chicharrones. No strawberry soda though.

The staff is friendly, but the place is small and the parking is tough. Try coming a bit later at night for better parking, but definitely do try to get here, 
as you won''t be disappointed.','4'),
('zdSx_SD6obEhz9VrW_RV012','Ha3iJu77CxlrFm-vQR_U014','tnhfDv5Il8EaGSXZG_R007','5','2020-02-16','Hands down best mexican restaurant I have been able to find so far in the 
DMV area. Do try their mole poblano and chile relleno. Make sure to order extra handmade tortillas - you will not regret it.','3'),
('zdSx_SD6obEhz9VrW_RV013','Ha3iJu77CxlrFm-vQR_U015','tnhfDv5Il8EaGSXZG_R008','5','2021-08-01','I was pleasantly surprised - this place doesn''t look like much from 
the outside, and it certainly wasn''t busy on a Saturday afternoon, but the food really hit the spot! They also have outdoor dining set up in a little garden 
area adjacent to the building.','2'),
('zdSx_SD6obEhz9VrW_RV014','Ha3iJu77CxlrFm-vQR_U013','tnhfDv5Il8EaGSXZG_R006','5','2020-12-20','Let me start by the customer service, the staff were amazing and the owner 
was super friendly. We got the 1. Krazi Naan wrap (5/5) I got it with basmati rice with cilantro and lime and with chicken tikka and falafel ($2 more) but totally 
worth it. The chicken was cooked nice and the falafel had a great taste. See the picture for the sauce combinations. Everything was super tasty and for a price of $13. 
It will definitely come for two meals.','5'),
('zdSx_SD6obEhz9VrW_RV015','Ha3iJu77CxlrFm-vQR_U018','tnhfDv5Il8EaGSXZG_R008','5','2021-05-23','Tacos 5 De Mayo takes out out of the D.C. area and into Mexico. It''s a 
small brightly painted building along a major road with a small parking lot for customers. Once inside, you order at the register and they bring you your food','19'),
('zdSx_SD6obEhz9VrW_RV016','Ha3iJu77CxlrFm-vQR_U016','tnhfDv5Il8EaGSXZG_R009','4.8','2021-10-30','They only have outdoor seating at this time and take reservations. 
The service was excellent. I can''t wait to go back!','0'),
('zdSx_SD6obEhz9VrW_RV017','Ha3iJu77CxlrFm-vQR_U017','tnhfDv5Il8EaGSXZG_R009','3.5','2021-10-17','The chicken mole enchilada was very good. 
The fish tacos were also delicious. The spicy margarita was superb but don''t get the hibiscus margarita which was too sweet and lacked any complexity.
The service was frustrating. After a long wait past our reservation time to be seated we were helped quickly, and the food came quickly. 
But as soon as the food was dropped off we didn''t see anyone for 25 minutes. To be more accurate: we saw a staff member at another table twice but couldn''t 
get his attention (despite waving with hands up high). We gave up trying to order another drink, but then couldn''t get our bill. It was a disappointing end to a 
delicious meal. We will certainly go again on the hope that this was a one-off issue.','0');

CREATE TABLE [TerpsandBurps.Suggest] (
	sugId VARCHAR(22) NOT NULL,
	sugText VARCHAR(500) NOT NULL,
	sugDate DATE,
	sugComplimentCount INT,
	resId VARCHAR(50) NOT NULL,
	userId VARCHAR(23) NOT NULL,
	CONSTRAINT pk_Suggest_sugId PRIMARY KEY (sugId),
	CONSTRAINT fk_Suggest_resId FOREIGN KEY (resId)
		REFERENCES [TerpsandBurps.Restaurant] (resId)
		ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_Suggest_userId FOREIGN KEY (userId)
		REFERENCES [TerpsandBurps.User] (userId)
		ON DELETE CASCADE ON UPDATE CASCADE );

INSERT INTO [TerpsandBurps.Suggest] VALUES
('Vb3iJu77CxlrFm-v_S001','Check it out, you are in for a treat. Cheers to good eats!','2021-06-18','80','tnhfDv5Il8EaGSXZG_R001','Ha3iJu77CxlrFm-vQR_U001'),
('Vb3iJu77CxlrFm-v_S002','We ordered the burritos entrees - Santa Fe (steak) and the twins one (chicken and beef). Everything was well seasoned and delicious.',
'08-07-2021','26','tnhfDv5Il8EaGSXZG_R003','Ha3iJu77CxlrFm-vQR_U002'),
('Vb3iJu77CxlrFm-v_S003','The shrimp was definitely my favorite. I honestly thought nothing could compare to the perfection of those tacos.','2021-10-18','0',
'tnhfDv5Il8EaGSXZG_R005','Ha3iJu77CxlrFm-vQR_U003'),
('Vb3iJu77CxlrFm-v_S004','There were a ton of people so I totally understood, but it was just a little inconvenient since I was on a time crunch.','2021-11-10',
'3','tnhfDv5Il8EaGSXZG_R001','Ha3iJu77CxlrFm-vQR_U004'),
('Vb3iJu77CxlrFm-v_S005','he chicken in the taco was nicely grilled and it was served with a fairly standard platter of rice and beans. 
The food was good but the disappointment was the margarita. It was rather bland and I really didn''t taste of any alcohol.',
'2021-07-09','134','tnhfDv5Il8EaGSXZG_R003','Ha3iJu77CxlrFm-vQR_U006'),
('Vb3iJu77CxlrFm-v_S006',' However that being said I will be coming back just closer to pay day','2021-11-07','0','tnhfDv5Il8EaGSXZG_R005','Ha3iJu77CxlrFm-vQR_U007'),
('Vb3iJu77CxlrFm-v_S007','We ordered the barbacoa, carnitas, pastor, carne asada, cachete, chorizo and lengua. Wow flavors here are on point.','2021-10-28',
'109','tnhfDv5Il8EaGSXZG_R004','Ha3iJu77CxlrFm-vQR_U008'),
('Vb3iJu77CxlrFm-v_S008','I''d try it again, maybe during peak hours to see if that helps the dryness. Otherwise I''m not too eager to come back. 
I''d still recommend you to stop by and try it in the least.','2021-10-14','0','tnhfDv5Il8EaGSXZG_R002','Ha3iJu77CxlrFm-vQR_U009'),
('Vb3iJu77CxlrFm-v_S009','I asked for two Tripa Tacos and instead one was with Trompa Taco, but it was good so whatever lol. The second time','2021-06-13',
'77','tnhfDv5Il8EaGSXZG_R004','Ha3iJu77CxlrFm-vQR_U010'),
('Vb3iJu77CxlrFm-v_S010','Funny....considering ppl who call in orders tend to come in to p/up, to take it away. 
That''s the whole point of calling in. Nobody calls in, to sit down and eat...SIMPLE non complex taqueria orders.','2021-06-12','6','tnhfDv5Il8EaGSXZG_R002',
'Ha3iJu77CxlrFm-vQR_U011'),
('Vb3iJu77CxlrFm-v_S011','Their mole is rich, smoky, and delicious, plus it''s huge and reasonably priced. The rice and beans were good too, 
but the mole takes center stage.','2017-07-27','3249','tnhfDv5Il8EaGSXZG_R007','Ha3iJu77CxlrFm-vQR_U012'),
('Vb3iJu77CxlrFm-v_S012','Do try their mole poblano and chile relleno.','2020-02-16','1','tnhfDv5Il8EaGSXZG_R007','Ha3iJu77CxlrFm-vQR_U014'),
('Vb3iJu77CxlrFm-v_S013','Everything tasted authentic and as though it was made with effort instead of just thrown together. Highly recommend trying it out!',
'2021-08-01','0','tnhfDv5Il8EaGSXZG_R008','Ha3iJu77CxlrFm-vQR_U015'),
('Vb3iJu77CxlrFm-v_S014','I highly recommend the place if you are craving for Indian food. Kudos to the staff as well. There is limited paid parking available.',
'2020-12-20','43','tnhfDv5Il8EaGSXZG_R006','Ha3iJu77CxlrFm-vQR_U013'),
('Vb3iJu77CxlrFm-v_S015','It''s excellent! Every table gets free chips and salsa. We weren''t overly hungry so we each order two street tacos.',
'2021-05-23','546','tnhfDv5Il8EaGSXZG_R008','Ha3iJu77CxlrFm-vQR_U018'),
('Vb3iJu77CxlrFm-v_S016','Maybe they could provide indoor sitting','2021-10-30','0','tnhfDv5Il8EaGSXZG_R009','Ha3iJu77CxlrFm-vQR_U016'),
('Vb3iJu77CxlrFm-v_S017',' We will certainly go again on the hope that this was a one-off issue.','2021-10-17','0','tnhfDv5Il8EaGSXZG_R009','Ha3iJu77CxlrFm-vQR_U017');

COMMIT;