/*
Workshop cleanup
*/

-- Unlink db from VCS
-- delete development and qa databases
USE master
GO
DROP DATABASE SimpleTalk_1_Grant
GO
DROP DATABASE SimpleTalk_1_Steve
GO
DROP DATABASE SimpleTalk_1_Kendra
GO
DROP DATABASE SimpleTalk_3_QA
GO

-- Clean up git
-- in repo for ASimpleTalkDB
--      git checkout master
--      git branch -d steve


USE SimpleTalk_5_Prod
GO
DELETE FROM dbo.RSSFeeds
WHERE FeedName = 'Redgate Automation'
GO
USE SimpleTalk_5_Prod
GO
DROP INDEX UserIDX_Username
GO
USE master
GO
