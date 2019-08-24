/*
SQL Prompt Demo - Setup

Database: SimpleTalkDev

Copyright 2019 Redgate Software
*/

CREATE PROCEDURE GetLatestBlogForAuthor
  @authorid INT
  AS
  BEGIN
	SELECT TOP 1 *
	 FROM dbo.Articles AS a INNER JOIN dbo.Contacts AS c ON c.ContactsID = a.AuthorID
	 WHERE a.AuthorID = @authorid
  END
GO


/*
Snippet

ctcustom

Create Custom table according to our standards




*/
CREATE TABLE MyTable (
 MyTableKey INT IDENTITY(1,1) NOT NULL CONSTRAINT MyTablePK PRIMARY KEY
 , 
)
GO
CREATE OR ALTER PROCEDURE dbo.PaymentReportForArticles
   @startdate DATE
   , @enddate date
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
CREATE PROCEDURE SearchArticles (@AuthorName VARCHAR(200) = NULL, @ArticleTitle VARCHAR(142) = NULL, @ArticleDesc varchar(1000) = NULL, @ReadingTimeMax int = NULL)
AS
DECLARE @sSQL NVARCHAR(2000), @Where NVARCHAR(1000) = ''
SET @sSQL = 'SELECT ProductID, ReferenceOrderID, TransactionType, Quantity, TransactionDate, ActualCost
from dbo.Articles as a inner join dbo.Contacts as c on a.authorid = c.contactsid '
 
IF @AuthorName is not null
SET @Where = @Where + 'AND c.ContactFullName like @_Author '
IF @OrderID is not null
SET @Where = @Where + 'AND ReferenceOrderID = @_OrderID '
IF @TransactionType IS NOT NULL
SET @Where = @Where + 'AND TransactionType = @_TransactionType '
IF @Qty IS NOT NULL
SET @Where = @Where + 'AND Quantity = @_Qty '
 
IF LEN(@Where) > 0
SET @sSQL = @sSQL + 'WHERE ' + RIGHT(@Where, LEN(@Where)-3)
 
EXEC sp_executesql @sSQL,
N'@_Product int, @_OrderID int, @_TransactionType char(1), @_Qty int',
@_Author = @AuthorName, @_OrderID = @OrderID, @_TransactionType = @TransactionType, @_Qty = @Qty
 
GO