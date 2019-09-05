/*
SQL Tools Demo - Making Coding Easier

Database: SimpleTalkDev
Copyright 2019 Redgate Software
*/

-- Let's add a column to the Articles table
-- at, add Rating numeric(4,2)
ALTER TABLE dbo.Articles ADD rating NUMERIC(4,2)

-- What else might be affected here?
-- Run Dependency Tracker
-- from SOC
-- Search Articles
-- Get list of dependencies
-- walk down, use SQL Search



-- SQL Compare 
-- point to prod v dev
-- see only dev differences. Makes sense with our process
-- Make a change
USE SimpleTalk_5_Prod
GO
CREATE INDEX UserIDX_Username ON dbo.Users (Username) 
GO
-- re-run compare
-- This is the type of drift we want to get back into development



-- From SOC, launch SQL Doc
-- check out docs on article
-- add some MS_Descriptions
-- generate documentation




/**************************************************************

                          End Demo

***************************************************************/ 

