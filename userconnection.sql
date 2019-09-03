EXECUTE sp_user_counter10 11

SELECT *
 FROM master.sys.dm_os_performance_counters AS dopc
 WHERE dopc.object_name LIKE 'MSSQL$SQL2017:user%'
