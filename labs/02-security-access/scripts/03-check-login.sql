/*
Lab 02 — Verify SQL Server login metadata.
Execute with appropriate administrative permissions.
No password values or password hashes are queried.
*/

USE [master];
GO

SELECT
    name,
    create_date,
    modify_date,
    is_disabled,
    is_policy_checked,
    is_expiration_checked,
    LOGINPROPERTY(name, 'PasswordLastSetTime') AS PasswordLastSetTime
FROM sys.sql_logins
WHERE name = N'mcruz';
GO
