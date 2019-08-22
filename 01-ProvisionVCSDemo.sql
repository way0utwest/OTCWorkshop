/**************************************************************************

Redgate On the Cog Workshop - 2 hour

Provision new database demo and link to VCS

Copyright 2019 Redgate Software
***************************************************************************/

/*
We have already set a few things up. A new developer machine with
-- SSMS
-- Git
-- Redgate Toolbelt


We want to get a developer up to speed quickly, working with code.
-- 1. Get the repo
-- 2. Deploy a database

*/



-- Cmd
-- git status




-- Powershell CLI
-- Provision a new developer database
-- ./01_NewDeveloper.ps1 Steve SimpleTalk_Base dkrSpectre\SQL2017


-- Let's check the new database
USE SimpleTalk_1_Steve
GO
SELECT * 
 FROM dbo.Articles
 ORDER BY AuthorID;
GO

-- Separate databases
-- Do one more for Grant
-- ./01_NewDeveloper.ps1 Grant SimpleTalk_Base dkrSpectre\SQL2017
USE SimpleTalk_1_Grant
GO
SELECT * 
 FROM dbo.Articles
 ORDER BY AuthorID;
GO

-- show these are independent
UPDATE dbo.RSSFeeds SET FeedName = 'New Test'
 WHERE RSSFeedID = 1
GO
SELECT * FROM dbo.RSSFeeds
GO

USE SimpleTalk_1_steve
GO
SELECT * FROM dbo.RSSFeeds
GO


-- reset Grant
USE SimpleTalk_1_grant
GO
SELECT * FROM dbo.RSSFeeds
GO


-- Link to VCS
-- Repo is here: 
-- C:\Users\way0u\Source\Repos\ASimpleTalkDB\
-- git status
-- Git branch -b steve

-- Link in SOC
-- Get latest, commit new changes, push.
-- Show at https://github.com/way0utwest/ASimpleTalkDB

-- git push -u origin steve
-- Check Online



/**************************************************************

                          End Demo

***************************************************************/ 
