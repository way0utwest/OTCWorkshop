/**************************************************************************
Redgate On the Cog Workshop - 2 hour

Safe Environments with Data Masker

Copyright 2019 Redgate Software
***************************************************************************/

-- Launch Data Masker from the project file
-- Note the structure of the rules (in order)
-- Substitution rule
-- user rule - change names
-- Dependency of domain rule (right click, remove dependency, add back)



-- Check contacts in production
-- start at 101
USE SimpleTalk_5_Prod
GO
SELECT *
FROM dbo.Contacts
ORDER BY ContactsID;
GO
USE SimpleTalk_1_steve
GO
SELECT *
FROM dbo.Contacts
ORDER BY ContactsID;
GO


-- open inject_st_contact.sql



/**************************************************************

                          End Demo

***************************************************************/ 
