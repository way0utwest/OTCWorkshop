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

ALTER PROCEDURE dbo.GetLatestBlogForAuthor
    @authorid INT,
    @top INT
AS
BEGIN
    SELECT TOP (@top)
           a.ArticlesID,
           c.ContactFullName,
           a.Description,
           a.PublishDate,
           a.Title,
           a.URL
    FROM dbo.Articles AS a
        INNER JOIN dbo.Contacts AS c
            ON c.ContactsID = a.AuthorID
    WHERE a.AuthorID = @authorid
    ORDER BY a.PublishDate DESC;
END;
GO









/**************************************************************************************
Demo - Writing new code, let's build a query.

ssf Articles, use cs_art snippet
add join to ArticlePayment 
where a.publishdate < sysdatetime()
Use column picker again
See Prompt table schema option for fixing articlepayment schema name missing
Qualify Object Names - CTRL+B,Q
**************************************************************************************/
SELECT TOP 10
       apy.ArticleID,
       apy.ArticlePaymentRate,
       apy.AuthorPaid,
       c.ContactFullName,
       c.Email,
       apy.PaymentDate,
       ars.PublishDate,
       apy.PublishDate AS PaymentPublishDate
FROM Articles AS ars
    INNER JOIN Contacts AS c
        ON ars.AuthorID = c.ContactsID
    INNER JOIN dbo.ArticlePayment AS apy
        ON apy.PublishDate = ars.PublishDate;














/**************************************************************************************
Demo - Fix Snippet
goto Snippet Manager
add schema.
**************************************************************************************/














/**************************************************************************************
Demo - Adding data to RSS
Use the snippet
**************************************************************************************/








GO
/**************************************************************************************
Demo - Changing Formatting for Corporate Style
Change style to corporate
AP GetLatest
**************************************************************************************/




-- ??
-- Create a new table
-- ctcustom - Question table
CREATE TABLE Question (
 QuestionKey INT IDENTITY(1,1) NOT NULL CONSTRAINT QuestionPK PRIMARY KEY
 , QuestionText VARCHAR(1000)
 , QuestionTitle VARCHAR(100) 
 , QuestionValue TINYINT
)
GO


/**************************************************************

                          End Demo

***************************************************************/ 
