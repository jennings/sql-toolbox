-- To view currently-executing processes and the query they're executing:
-- (from: http://blog.sqlauthority.com/2009/01/07/sql-server-find-currently-running-query-t-sql/)

SELECT
    sqltext.TEXT,
    req.session_id,
    req.status,
    req.command,
    req.cpu_time,
    req.total_elapsed_time
FROM sys.dm_exec_requests req
CROSS APPLY sys.dm_exec_sql_text(sql_handle) AS sqltext


-- To kill a running process by session_id:

KILL [session_id]


-- To view information about a process:
-- (from: http://blog.sqlauthority.com/2015/08/31/sql-server-spid-is-killedrollback-state-what-to-do-next/)

SELECT
    spid
    ,kpid
    ,login_time
    ,last_batch
    ,status
    ,hostname
    ,nt_username
    ,loginame
    ,hostprocess
    ,cpu
    ,memusage
    ,physical_io
FROM sys.sysprocesses
