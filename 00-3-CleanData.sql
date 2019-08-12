/**************************************************************************

Redgate On the Cog Workshop - 2 hour

Setup 00-1-Prod-Setup

Fix some data after Data Generator has run

***************************************************************************/

-- clean up emails
UPDATE
    dbo.Contacts
 SET
    Email = SUBSTRING(ContactFullName, 1, CHARINDEX(' ', ContactFullName) - 1) + '@'
            + SUBSTRING(Email, CHARINDEX('@', Email) + 1, LEN(Email));
GO

UPDATE dbo.Users SET NTAuthAccount = 'MyDomain\\' + Username;
