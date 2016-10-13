-- From: http://blog.sqlauthority.com/2009/01/07/sql-server-find-currently-running-query-t-sql/

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
