/**************************************************************************

Redgate On the Cog Workshop - 2 hour

Provision new database demo and link to VCS

Copyright 2019 Redgate Software
***************************************************************************/

-- Powershell
-- Provision a new developer database



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




-- Link to VCS
-- Repo is here: 
-- C:\Users\way0u\Source\Repos\ASimpleTalkDB\
-- git status
-- Link in SOC
-- Get latest, commit new changes, push.
-- Show at https://github.com/way0utwest/ASimpleTalkDB

-- Git branch -b steve
-- git push -u origin steve
-- Check Online


/**************************************************************

                          End Demo

***************************************************************/ 
