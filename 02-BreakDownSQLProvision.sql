/**************************************************************************

Redgate On the Cog Workshop - 2 hour

Breaking down SQL Provision

Copyright 2019 Redgate Software
***************************************************************************/

-- Show the GUI
-- http://localhost:14145/dashboard
-- Note the clones with the image
-- Check sizes





-- Let's add new data and show the image process.
USE SimpleTalk_5_Prod
GO
INSERT dbo.RSSFeeds
(FeedName, Checked, FeedBurner, ModifiedDate)
VALUES
('SQL in the City', 1, 1, SYSDATETIME())
GO
SELECT * FROM dbo.RSSFeeds
GO



-- Powershell
-- .\00-6-CreateNewBaseImage.ps1

-- watch GUI
-- see images change
-- Clones stay with old image.


-- deploy new dev database
-- ./01_NewDeveloper.ps1 Kendra SimpleTalk_Base dkrSpectre\SQL2017
USE SimpleTalk_1_Grant
GO
SELECT * 
 FROM dbo.RSSFeeds
GO



-- Examine the scripts for image creation


-- Examine the developer deployment script


-- SQL Clone cmdlet Reference - https://documentation.red-gate.com/clone4/automation/powershell-cmdlet-reference


/**************************************************************

                          End Demo

***************************************************************/ 
