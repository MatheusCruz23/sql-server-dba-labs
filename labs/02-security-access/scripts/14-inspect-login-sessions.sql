/*
Lab 02 - view active sessions associated with mcruz.
Uses sys.dm_exec_sessions instead of the legacy sys.sysprocesses view.
Requires appropriate SQL Server visibility permissions.
This script does not issue KILL commands.
*/
USE [master];
GO
SELECT
    session_id,
    login_name,
    original_login_name,
    host_name,
    program_name,
    status,
    login_time
FROM sys.dm_exec_sessions
WHERE login_name = N'mcruz' OR original_login_name = N'mcruz'
ORDER BY session_id;
GO
