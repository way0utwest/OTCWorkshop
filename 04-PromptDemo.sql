/*
SQL Prompt Demo - Writing Code

Database: SimpleTalkDev
Copyright 2019 Redgate Software
*/
USE SimpleTalk_1_Steve
GO


/**************************************************************************************
Demo - Alter procedure GetLatest - Need to add a parameter for TOP

Let's add the parameter
Notice the ca marker. Let's click the lightbulb and add ob.
Still an issue, let's fix the SELECT *. What do add? 
We can get the table definition, but we want to just pick columns.
Lastly, format
**************************************************************************************/










/**************************************************************************************
Demo - Writing new code, let's build a query.

ssf Articles, use cs_art snippet
add join to ArticlePayment 
where a.publishdate < sysdatetime()
Use column picker again
See Prompt table schema option for fixing articlepayment schema name missing
Qualify Object Names - CTRL+B,Q
**************************************************************************************/











/**************************************************************************************
Demo - Fix Snippet cs_articlejoin
goto Snippet Manager
add schema.
**************************************************************************************/














/**************************************************************************************
Demo - Adding data to RSS
Create a snippet
**************************************************************************************/
SELECT top 10
 *
 FROM dbo.RSSFeeds
 ORDER BY ModifiedDate desc
GO

GO
SELECT top 10
 *
 FROM dbo.RSSFeeds
 ORDER BY ModifiedDate desc
GO
/**************************************************************************************
Demo - Changing Formatting for Corporate Style
Change style to corporate
AP GetLatest
**************************************************************************************/




-- ??
-- Create a new table
-- ctcustom - Question table


/**************************************************************

                          End Demo

***************************************************************/ 
