/*
SQL Prompt Demo - Setup

Database: SimpleTalkDev
Copyright 2019 Redgate Software
*/
USE SimpleTalk_1_Steve
GO

/**************************************************************************************
Demo - Test data
Let's add data with data generator - open project
**************************************************************************************/









/**************************************************************************************
Demo - Evalute our Proc PaymentReportForArticles

tsqltest snippet - zPaymentTests.[test check article payment totals and bonus]
cs_payment test code snippet
**************************************************************************************/
EXEC dbo.PaymentReportForArticles @startdate = '1983-01-01',
                                  @enddate = '1984-01-01';
GO





GO

EXEC tsqlt.Run @TestName = N'zPaymentTests.[test check article payment totals and bonus]'








GO

/**************************************************************************************
Demo - other tests
**************************************************************************************/
EXEC tsqlt.NewTestClass
  @ClassName = N'SQLCop' -- nvarchar(max)
GO
-- create stubs
IF NOT EXISTS( SELECT name FROM sys.objects WHERE name = 'test Procedures Named SP_')
  EXEC('create procedure [SQLCop].[test Procedures Named SP_] as begin select 1 end')
IF NOT EXISTS( SELECT name FROM sys.objects WHERE name = 'test Procedures with @@Identity')
  EXEC('create procedure [SQLCop].[test Procedures with @@Identity] as begin select 1 end')
IF NOT EXISTS( SELECT name FROM sys.objects WHERE name = 'test Tables without a primary key')
  EXEC('create procedure [SQLCop].[test Tables without a primary key] as begin select 1 end')
IF NOT EXISTS( SELECT name FROM sys.objects WHERE name = 'test prevent tbl Table prefix')
  EXEC('create procedure [SQLCop].[test prevent tbl Table prefix] as begin select 1 end')

-- Include some SQLCop tests
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [SQLCop].[test Procedures Named SP_]
AS
BEGIN
    -- Written by George Mastros
    -- February 25, 2012
    -- http://sqlcop.lessthandot.com
    -- http://blogs.lessthandot.com/index.php/DataMgmt/DBProgramming/MSSQLServer/don-t-start-your-procedures-with-sp_
    
    SET NOCOUNT ON
    
-- Act  
    SELECT	'Stored Procedure Name' = s.name + '.' + o.name
	INTO #actual
    From	sys.objects o
            INNER JOIN sys.schemas s ON s.schema_id = o.schema_id
            LEFT OUTER JOIN sys.extended_properties e ON o.object_id = e.major_id
                                                              AND e.class_desc = 'OBJECT_OR_COLUMN'
                                                              AND e.name = 'sp_Exception'
    Where	o.type = 'P'
            AND s.name <> 'tsqlt'
			AND o.name COLLATE SQL_LATIN1_GENERAL_CP1_CI_AI LIKE 'sp[_]%'
            And o.name COLLATE SQL_LATIN1_GENERAL_CP1_CI_AI NOT LIKE '%diagram%'
            AND (e.value != 1 OR e.value IS NULL)
    Order By s.name, o.name

    EXEC tsqlt.AssertEmptyTable
      @TableName = N'#actual'
    , -- nvarchar(max)
      @Message = N'There are stored procedures named sp_' -- nvarchar(max)
    
END;
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [SQLCop].[test Procedures with @@Identity]
AS
BEGIN
	-- Written by George Mastros
	-- February 25, 2012
	-- http://sqlcop.lessthandot.com
	-- http://wiki.lessthandot.com/index.php/6_Different_Ways_To_Get_The_Current_Identity_Value
	
	SET NOCOUNT ON

	Declare @Output VarChar(max)
	Set @Output = ''

	Select	@Output = @Output + Schema_Name(schema_id) + '.' + name + Char(13) + Char(10)
	From	sys.all_objects
	Where	type = 'P'
			AND name Not In('sp_helpdiagrams','sp_upgraddiagrams','sp_creatediagram','testProcedures with @@Identity')
			And Object_Definition(object_id) COLLATE SQL_LATIN1_GENERAL_CP1_CI_AI Like '%@@identity%'
			And is_ms_shipped = 0
			and schema_id <> Schema_id('tSQLt')
			and schema_id <> Schema_id('SQLCop')
	ORDER BY Schema_Name(schema_id), name 

	If @Output > '' 
		Begin
			Set @Output = Char(13) + Char(10) 
						  + 'For more information:  '
						  + 'http://wiki.lessthandot.com/index.php/6_Different_Ways_To_Get_The_Current_Identity_Value'
						  + Char(13) + Char(10) 
						  + Char(13) + Char(10) 
						  + @Output
			EXEC tSQLt.Fail @Output
		End
	
END;

GO
CREATE OR ALTER PROCEDURE [SQLCop].[test Tables without a primary key]
AS
BEGIN

-- Assemble
DECLARE @output nvarchar(max)

-- act
SELECT AllTables.name
 INTO #actual
  FROM    ( SELECT    o.name ,
                    o.object_id AS id ,
                    COALESCE( e. value, 0) AS 'PKException'
          FROM      sys.objects o
                    INNER JOIN sys.schemas s ON s. schema_id = o.schema_id
----------------------------------
---- New Code --------------------
----------------------------------
                    LEFT OUTER JOIN sys.extended_properties e ON o.object_id = e .major_id
                                                              AND e.value = 1
                                                              AND e.class_desc = 'OBJECT_OR_COLUMN'
                                                              AND e.name = 'PKException'
----------------------------------
---- New Code --------------------
----------------------------------
          WHERE     o.type = 'U'
                    AND s.name <> 'tsqlt'
        ) AS AllTables
        LEFT JOIN ( SELECT  parent_object_id
                    FROM    sys.objects
                    WHERE   type = 'PK'
                  ) AS PrimaryKeys ON AllTables.id = PrimaryKeys.parent_object_id
WHERE    PrimaryKeys.parent_object_id IS NULL
        AND AllTables.PKException = 0
ORDER BY AllTables.name;

-- assert
EXEC tsqlt.AssertEmptyTable @TableName = N'#actual', -- nvarchar(max)
  @Message = N'There are tables without a primary key.' -- nvarchar(max)
END


GO

/**************************************************************************************
Demo - SQLTest
**************************************************************************************/
-- View SQL Test
-- run tests
/*

EXEC sys.sp_addextendedproperty 
  @name = 'PKException',
  @value = 1, -- sql_variant
  @level0type = 'schema', -- varchar(128)
  @level0name = 'dbo', -- sysname
  @level1type = 'table', -- varchar(128)
  @level1name = 'DMSSTAT_TSTATS' -- sysname
  ;
GO
*/

-- run tests

/*

EXEC sys.sp_addextendedproperty 
  @name = 'PKException',
  @value = 1, -- sql_variant
  @level0type = 'schema', -- varchar(128)
  @level0name = 'dbo', -- sysname
  @level1type = 'table', -- varchar(128)
  @level1name = 'DMSSTAT_RSTATS' -- sysname
  ;
GO
*/

/**************************************************************

                          End Demo

***************************************************************/ 
