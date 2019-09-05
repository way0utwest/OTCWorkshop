/**************************************************************************
Redgate On the Cog Workshop - 2 hour

Testing T-SQL Code

Copyright 2019 Redgate Software
***************************************************************************/
USE SimpleTalk_1_Steve
GO

/**************************************************************************************
Demo - Test data
Let's add data with data generator - open project
Generate some data in dev db
**************************************************************************************/

 






/**************************************************************************************
Demo - tsqlt framework
Add the tsqlt framework to our dev database
- Show SQL Test
**************************************************************************************/
SELECT * FROM tSQLt.Info()




/**************************************************************************************
Demo - Create some tests
SQLCop.sql
**************************************************************************************/



/**************************************************************************************
Demo - SQLTest
**************************************************************************************/
-- View SQL Test
-- run tests





/**************************************************************************************
Demo - SQLTest
**************************************************************************************/
CREATE TABLE NewTable
( NewTableID INT
)
GO
-- Run tests


/*

EXEC sys.sp_addextendedproperty 
  @name = 'PKException',
  @value = 1, -- sql_variant
  @level0type = 'schema', -- varchar(128)
  @level0name = 'dbo', -- sysname
  @level1type = 'table', -- varchar(128)
  @level1name = 'NewTable' -- sysname
  ;
GO
*/




-- If we want to fix this
ALTER TABLE NewTable ALTER COLUMN NewTableID INT NOT NULL
GO
ALTER TABLE dbo.NewTable ADD CONSTRAINT NewTablePK PRIMARY KEY (NewTableID)
GO


-- run tests

/*

EXEC sys.sp_dropextendedproperty 
  @name = 'PKException',
  @level0type = 'schema', -- varchar(128)
  @level0name = 'dbo', -- sysname
  @level1type = 'table', -- varchar(128)
  @level1name = 'NewTable' -- sysname
  ;
GO
*/





/**************************************************************************************
Demo - Evalute our Proc PaymentReportForArticles

tsqltest snippet - zPaymentTests.[test check article payment totals and bonus]
cs_payment test code snippet
**************************************************************************************/
EXEC dbo.PaymentReportForArticles @startdate = '1983-01-01',
                                  @enddate = '1984-01-01';
GO
--EXEC tsqlt.NewTestClass @ClassName = N'zPaymentTests' -- nvarchar(max)
--CREATE PROCEDURE [zPaymentTests].[test ensure article payment aggregates are correct]







GO
EXEC tsqlt.Run @TestName = N'zPaymentTests.[test ensure article payment aggregates are correct]'






GO






/**************************************************************

                          End Demo

***************************************************************/ 
