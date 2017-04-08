---Survey Queries

--How many of the total users completed the survey?
--4081 users completed the survey 
Select user_id, count(*)
from survey
group by user_id

--Survey Question 1: How long have you used Firefox?
---Top 3 Results: More than 5 years 1604, 3 to 5 years, 1226, 2 to 3 years 549 

Select Q1, Count(*)
From survey
Group By Q1
Order By Q1 Asc 

---Of users that completed the survey, identify the number of users who are new to Firefox and who are long time users
---Old 3725
---New 356
Select Age, count(*)
From
	(Select user_id, q1,
			Case 
			When cast(q1 as integer) <=2 then 'New'
			Else 'Old'
			End as Age
	From Survey) as Stuff
Group by Age

--Survey Question 2: Do you use more than one browser in your daily life?
--Results: Yes 2697, No 1356
S-elect Q2, count(*)
From survey
Group By Q2 

--Survey Question 5: What is your Gender
---Results: Male 3179 Female 257
Select Q5, count(*)
From survey
Group By Q5; 

--Survey Question 6: How old are you
---Top 3 Results: 18-25 years old 1413, 26-35 years old 1145, 36-45 years old 543  

Select Q6, count(*)
From survey
Group By Q6
Order by Q6 Desc

---Top 3 Results Men: 18-25 Years old 1313, 26-35 Years old 1072, 36-45 Years old 487
Select Q6, count(*)
From survey
Where Q5 = '0'
Group By Q6 
Order By Q6 Desc 

---Top 3 Results Women: 18-25 Years old 84, 26-35 Years old 60, 36-45 Years old 37
Select Q6, count(*)
From survey
Where Q5 = '1'
Group By Q6 
Order By Q6 Desc -- Majority of Female users are from 18-25 or 26-35


--Survey Question 7: How much time do you spend on the Web each day?
---Top 3 Results: 4-6 hours 1068, 2-4 hours 1063, 1-2 hours 366
Select Q7, count(*)
From survey
Group By Q7 
Order By Q7 Desc -- Majority of browers between 1-4 hours

--Survey Question 9 Where do you usually access the Internet?
---Top Results Home 3910, Work 2317, School 959, Mobile 1494

Select SUM(Home) as Home, Sum(Work) as Work, SUM(School) as School, SUM(Mobile) as Mobile
FROM
(Select user_id, 
	case
	When Q9 like '%0%' then 1
	Else 0
	End as Home,
	Case
	When Q9 like '%1%' then 1
	Else 0
	End as Work,
	Case 
	When Q9 like '%2%' then 1
	Else 0
	End as School,
	Case 
	When Q9 like '%3%' then 1
	Else 0
	End as Mobile
From survey) as stuff


-- Survey Question 11 What are the main reason you use the Web?
---Top 3 Results: Entertainment 2944, Communication 2889, Social Media 2265

Select Sum(Work_Code) as Work_Code, Sum(Work) as Work, SUM(School) as School, SUM(Personal) as Personal,
       SUM(Communication) as Comm, SUM(Social) as Social, SUM(Entertain) as Entert
FROM
	(Select user_id,
		Case
		When Q11 like '%0%' then 1
		Else 0
		End as Work_Code,
		Case
		When Q11 like '%1%' then 1
		Else 0
		End as Work,
		Case
		When Q11 like '%2%' then 1
		Else 0
		End as School,
		Case
		When Q11 like '%3%' then 1
		Else 0
		End as Personal,
		Case
		When Q11 like '%4%' then 1
		Else 0
		End as Communication,
		Case
		When Q11 like '%5%' then 1
		Else 0
		End as Social,
		Case
		When Q11 like '%6%' then 1
		Else 0
		End as Entertain
From Survey) as Stuff


--Survey Question 12 What are your most frequently visited websites?
 ---Top 3 Results Search Engines 3204, News 2532, Youtube 2328

Select SUM(Search) as Search, SUM(Videos) as Videos, SUM(News) as News, SUM(Social) as Social, SUM(Games) as Games, 
	SUM(Shopping) as Shopping, SUM(Bills) as Bills, SUM(Downloads) as Downloads, SUM(Mail) as Mail, SUM(Forums) as Forums,
	SUM(Porn) as Porn, SUM(Gambling) as Gambling,SUM(Docs) as Docs
From
	(Select user_id,
			Case
			When Q12 like '%0%' then 1
			Else 0
			End as Search,
			Case
			When Q12 like '%1%' then 1
			Else 0
			End as Videos,
			Case
			When Q12 like '%2%' then 1
			Else 0
			End as News,
			Case
			When Q12 like '%3%' then 1
			Else 0
			End as Social,
			Case
			When Q12 like '%4%' then 1
			Else 0
			End as Games,
			Case
			When Q12 like '%5%' then 1
			Else 0
			End as Shopping,
			Case
			When Q12 like '%6%' then 1
			Else 0
			End as Bills,
			Case
			When Q12 like '%7%' then 1
			Else 0
			End as Downloads,
			Case
			When Q12 like '%8%' then 1
			Else 0
			End as Mail,
			Case
			When Q12 like '%9%' then 1
			Else 0
			End as Forums,
			Case
			When Q12 like '%10%' then 1
			Else 0
			End as Porn,
			Case
			When Q12 like '%11%' then 1
			Else 0
			End as Gambling,
			Case
			When Q12 like '%12%' then 1
			Else 0
			End as Docs
	From Survey) as Stuff

--Survey Question 13 How often do you find out about the latest computer and technology news
---Top 3 Results Online News 2639, Online Blogs 2376, Conversation 1174

Select SUM(Online_News) as Online_News, SUM(Online_Blogs) as Online_Blogs, SUM(Offline_news) as Offline_news, 
	SUM(Conversation) as Conversation, SUM(Ads) as Ads, SUM(Social_Media) as Social_Media
From	
	(Select user_id,
				Case
				When Q13 like '%0%' then 1
				Else 0
				End as Online_News,
				Case
				When Q13 like '%1%' then 1
				Else 0
				End as Online_Blogs,
				Case
				When Q13 like '%2%' then 1
				Else 0
				End as Offline_News,
				Case
				When Q13 like '%3%' then 1
				Else 0
				End as Conversation,
				Case
				When Q13 like '%4%' then 1
				Else 0
				End as Ads,
				Case
				When Q13 like '%5%' then 1
				Else 0
				End as 	Social_Media
	From Survey) as stuff


--How many extensions used
Select number_extensions, count(*)
From users
Group by number_extensions
Order by count desc --Majority 1-7 extensions


--Tabs Tabs Tabs 

--What is the Average amount of tabs a user has: 6 Tabs
Select Count(Tabs) --452,715 tabs
From
	(Select User_id, Cast(Replace(data2, ' tabs','') as integer) as Tabs
	From events
	where data2 like '%tab%' and event_code = 26) as stuff


Select AVG(count)
From
	(Select User_id, Cast(Replace(data2, ' tabs','') as integer) as Tabs, count(*)
	From events
	where data2 like '%tab%' and event_code = 26
	Group by user_id, Tabs) as stuff

--How many users opened tabs
--14,321 Users opened tabs
Select Distinct user_id
From events
where event_code = 26 and Cast(Replace(data2,' tabs','') as integer) > 0
Order by user_id
	
--Are there users who regularly have more than 10 tabs open?
--1601 Users had more than 10 tabs open 
Select distinct user_id
From events
where event_code = 26 and Cast(Replace(data2,' tabs','') as integer) > 10
Order by user_id

--What fraction of user have ever had 5 or more tabs open
--6098 Users had more than 5 tabs open, 57% of users
Select distinct user_id
From events
where event_code = 26 and Cast(Replace(data2,' tabs','') as integer) >= 5
Order by user_id

--What fraction of users have ever had 10 or more tabs open
--1936 Users had more than 10 tabs open, 18% of users
Select distinct user_id
From events
where event_code = 26 and Cast(Replace(data2,' tabs','') as integer) >= 10
Order by user_id

--What fractions of users have had 15 or more tabs open
--834 Users had more than 15 tabs open, 8% of users
Select distinct user_id
From events
where event_code = 26 and Cast(Replace(data2,' tabs','') as integer) >= 15
Order by user_id

--Maximum of Tabs
Select user_id, count(*)
From events
where event_code = 26
Group By user_id
Order by user_id

--Session Restore
Select data2, count(*)
from events
where event_code=20
Group by data2
order by count desc

--Bookmark total/average
---1,344,192 bookmarks total
---123 Average Bookmarks
---29 Median bookmarks

Select Sum(Bookmarks)
FROM
	(Select distinct user_id, Cast(Replace(data1,' total bookmarks','')as integer) as Bookmarks
	From events
	where event_code = 8) as Books

Select AVG(Bookmarks)
FROM
	(Select distinct user_id, Cast(Replace(data1,' total bookmarks','')as integer) as Bookmarks
	From events
	where event_code = 8) as Books

Select distinct s. user_id
From Events e
Inner Join Survey s on s.user_id=e.user_id
where e. event_code =8

Select distinct user_id, data1
from Events
where event_code = 8


--Bookmarks/Folders created
Select AVG(count)
From
(Select user_id, data1, count(*)
From events
Where event_code=9 and data1= 'New Bookmark Added'
Group by user_id, data1) as count --Average is only 2 bookmarks created per person during trial

Select AVG(count)
From
(Select user_id, data1, count(*)
From events
Where event_code=9 and data1= 'New Bookmark Folder'
Group by user_id, data1) as count --Average 1.8 folders created

--What fraction of users created new bookmarks
--2076 bookmarks added, 153 folders
--996 people users made bookmarks
--9.4% made new bookmarks
Select SUM(count)
From
(Select user_id, data1, count(*)
From events
Where event_code=9 and data1= 'New Bookmark Added'
Group by user_id, data1 
order by count desc) as stuff

Select distinct user_id
from events
where event_code = 9


--How often do users use bookmarks (Histogram)
--Average use is 9 bookmarks during trial
--60635 bookmarks launched

Select AVG(count)
From
(Select user_id, count(*)
From events
Where event_code=10
Group by user_id, event_code Order by count desc) as count 

Select SUM(count)
From
(Select user_id, count(*)
From events
Where event_code=10
Group by user_id, event_code Order by count desc) as count 

--What fraction launched at least one bookmark during the sample week?
--6534 users launched at least one bookmark
--61% of users
Select user_id, count(*)
From events
where event_code=10
group by user_id


--Bookmark removed
Select AVG(cast(count as float))
From(
Select user_id, data1, count(*)
From events
where event_code=11 and data1 = 'Bookmark Removed'
group by user_id, data1) as count -- 3.9 Bookmarks deleted per person

Select AVG(cast(count as float))
From(
Select user_id, data1, count(*)
From events
where event_code=11 and data1 = 'Bookmark Moved'
group by user_id, data1) as count -- 4.6 Bookmark moved per person

Select data1, count(*)
From events
where event_code = 11
Group by data1
order by count desc --Bookmark removed 1090, Bookmark moved 1066

--How does the number of bookmarks correlate with how long the user has been using Firefox
Select distinct s. user_id, s. Age, e. data1
From
	(Select user_id, q1,
			Case 
			When cast(q1 as integer) <=2 then 'New'
			Else 'Old'
			End as Age
	From Survey) as s
Inner Join events e on e. user_id = s.user_id
Where event_code = 8 and s. age= 'Old'

Select s. user_id, s. Age, e. data1, count(*)
	From
		(Select user_id, q1,
				Case 
				When cast(q1 as integer) <=2 then 'New'
				Else 'Old'
				End as Age
		From Survey) as s
	Inner Join events e on e. user_id = s.user_id
	Where event_code = 8 and s. age= 'New'
	group by s. user_id, s. Age, e. data1 

--How does the frequency of bookmark usage correlate with how long the user has been using Firefox

Select s. user_id, s. Age, count(*)
From
	(Select user_id, q1,
			Case 
			When cast(q1 as integer) <=2 then 'New'
			Else 'Old'
			End as Age
	From Survey) as s
Inner Join events e on e. user_id = s.user_id
Where event_code = 10 and s. age= 'Old'
Group By s.user_id, s.Age

Select s. user_id, s. Age, count(*)
From
	(Select user_id, q1,
			Case 
			When cast(q1 as integer) <=2 then 'New'
			Else 'Old'
			End as Age
	From Survey) as s
Inner Join events e on e. user_id = s.user_id
Where event_code = 10 and s. age= 'New'
Group by s.user_id, s. Age


--How does the frequency of tab usage correlate with how long the user has been using Firefox

Select s. user_id, s. Age, count(*)
From
	(Select user_id, q1,
			Case 
			When cast(q1 as integer) <=2 then 'New'
			Else 'Old'
			End as Age
	From Survey) as s
Inner Join events e on e. user_id = s.user_id
Where event_code = 26 and s. age= 'New'
Group By s.user_id, s.Age


Select s. user_id, s. Age, data2
From
	(Select user_id, q1,
			Case 
			When cast(q1 as integer) <=2 then 'New'
			Else 'Old'
			End as Age
	From Survey) as s
Inner Join events e on e. user_id = s.user_id
Where event_code = 26 and s. age= 'New'



--How does the maximum amount of tabs open correlate with how long the user has been using Firefox

Select user_id, things.age , count(*)
From
	(Select distinct e. user_id, s.age, cast(replace(e. data2,' tabs','') as integer) as Tabs,
			Case when cast(replace(e. data2,' tabs','') as integer) >= 0 then 1
			Else 0
			End as More_Tabs
	From(Select user_id, q1,
		Case 
		When cast(q1 as integer) <=2 then 'New'
		Else 'Old'
		End as Age
		From Survey) as s
	Inner Join events e on e. user_id = s.user_id
	Where e. event_code = 26 and s.Age= 'New'
	Order by user_id) as things
Group By user_id, things.age
Order by user_id asc


Select user_id, things.age , count(*)
From
	(Select distinct e. user_id, s.age, cast(replace(e. data2,' tabs','') as integer) as Tabs,
			Case when cast(replace(e. data2,' tabs','') as integer) >= 0 then 1
			Else 0
			End as More_Tabs
	From(Select user_id, q1,
		Case 
		When cast(q1 as integer) <=2 then 'New'
		Else 'Old'
		End as Age
		From Survey) as s
	Inner Join events e on e. user_id = s.user_id
	Where e. event_code = 26 and s.Age= 'Old'
	Order by user_id) as things
Group By user_id, things.age
Order by user_id asc
