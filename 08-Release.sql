/**************************************************************************
Redgate On the Cog Workshop - 2 hour

Automated Release Process

Copyright 2019 Redgate Software
***************************************************************************/
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

/**************************************************************

                          End Demo

***************************************************************/ 
