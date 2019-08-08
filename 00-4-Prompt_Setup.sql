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
