/*
OPTIONAL CLEANUP REFERENCE - REVIEW BEFORE RUNNING.
No destructive statements are executed by default.
Review dependencies, active sessions, ownership and permissions before any manual cleanup.
Do not drop a login/user/database until you've identified all dependencies.
*/
USE [Treinamento_Modulo02_1];
GO
SELECT name, type_desc
FROM sys.database_principals
WHERE name = N'mcruz';
GO
-- Optional object-level cleanup after you have backed up your work:
-- REVOKE SELECT ON OBJECT::dbo.Modulo02 FROM [mcruz];
-- REVOKE SELECT ON OBJECT::dbo.fncModulo02 FROM [mcruz];
-- REVOKE SELECT ON OBJECT::dbo.vwModulo02 FROM [mcruz];
-- REVOKE EXECUTE ON OBJECT::dbo.stpModulo02 FROM [mcruz];
-- REVOKE EXECUTE FROM [mcruz];  -- database-level permission
-- REVOKE EXECUTE ON OBJECT::dbo.stpModulo02_2 FROM [mcruz];
-- Review dbo schema ownership, role memberships and dependencies first.
-- DROP USER [mcruz];
-- In DB2, separately DROP USER [mcruz] after reviewing dependencies.
-- In master, finally DROP LOGIN [mcruz] after reviewing active sessions.
-- NO DROP DATABASE statements are provided in this package.
