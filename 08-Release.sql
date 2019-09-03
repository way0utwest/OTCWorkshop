USE SimpleTalk_1_Steve
GO
EXEC dbo.GetLatestBlogForAuthor @authorid = 101
GO

USE SimpleTalk_3_qa
GO
EXEC dbo.GetLatestBlogForAuthor @authorid = 101
GO
USE SimpleTalk_5_Prod
GO
EXEC dbo.GetLatestBlogForAuthor @authorid = 101
GO
