/*
CI Demo - Checking deployment status of a procedure

Database: SimpleTalkDev
Copyright 2019 Redgate Software
*/


USE SimpleTalk_1_Steve
EXEC GetLatestBlogForAuthor 2, 1
GO
USE SimpleTalk_3_QA
EXEC GetLatestBlogForAuthor 2, 1
GO
USE SimpleTalk_5_Prod
EXEC GetLatestBlogForAuthor 2






/**************************************************************

                          End Demo

***************************************************************/ 
