/*
SQL Prompt Demo - Setup

Database: SimpleTalkDev

Copyright 2019 Redgate Software
*/

CREATE PROCEDURE GetLatestBlogForAuthor @authorid INT
AS
BEGIN
    SELECT TOP 1
           *
    FROM dbo.Articles AS a
        INNER JOIN dbo.Contacts AS c
            ON c.ContactsID = a.AuthorID
    WHERE a.AuthorID = @authorid;
END;
GO


/*
Snippet

ctcustom

Create Custom table according to our standards




*/
CREATE TABLE MyTable
(
    MyTableKey INT IDENTITY(1, 1) NOT NULL
        CONSTRAINT MyTablePK PRIMARY KEY,
);
GO
CREATE OR ALTER PROCEDURE dbo.PaymentReportForArticles
    @startdate DATE,
    @enddate DATE
AS
SELECT ContactID,
       COUNT(ArticleID) AS NumberOfArticles,
       CASE
           WHEN COUNT(ArticleID) > 10 THEN
       (SUM(ArticlePaymentRate) + (SUM(ArticlePaymentRate) * .1))
           WHEN COUNT(ArticleID) > 5 THEN
       (SUM(ArticlePaymentRate) + (SUM(ArticlePaymentRate) * .05))
           ELSE
               SUM(ArticlePaymentRate)
       END AS paymenttotal
FROM dbo.ArticlePayment
WHERE PublishDate >= @startdate
      AND PublishDate < @enddate
GROUP BY ContactID;

GO
CREATE PROCEDURE SearchArticles
(
    @AuthorName VARCHAR(200) = NULL,
    @ArticleTitle VARCHAR(142) = NULL,
    @ArticleDesc VARCHAR(1000) = NULL,
    @ReadingTimeMax INT = NULL
)
AS
DECLARE @sSQL NVARCHAR(2000),
        @Where NVARCHAR(1000) = N'';
SET @sSQL
    = N'SELECT ProductID, ReferenceOrderID, TransactionType, Quantity, TransactionDate, ActualCost
from dbo.Articles as a inner join dbo.Contacts as c on a.authorid = c.contactsid ';

IF @AuthorName IS NOT NULL
    SET @Where = @Where + N'AND c.ContactFullName like @_Author ';
IF @ArticleTitle IS NOT NULL
    SET @Where = @Where + N'AND a.title = @_ArticleTitle ';
IF @ArticleDesc IS NOT NULL
    SET @Where = @Where + N'AND TransactionType = @_TransactionType ';
IF @ReadingTimeMax IS NOT NULL
    SET @Where = @Where + N'AND ReadingTimeEstimate <= @_ReadingTimeMax ';

IF LEN(@Where) > 0
    SET @sSQL = @sSQL + N'WHERE ' + RIGHT(@Where, LEN(@Where) - 3);

EXEC sp_executesql @sSQL,
                   N'@_Product int, @_OrderID int, @_TransactionType char(1), @_Qty int',
                   @_Author = @AuthorName,
                   @_ArticleTitle = @ArticleTitle,
                   @_ArticleDesc = @ArticleDesc,
                   @_ReadingTimeMax = @ReadingTimeMax;

GO