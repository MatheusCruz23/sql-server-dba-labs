/*
Lab 02 - review object-level permission rows for mcruz in both databases.
Reminder: sys.database_permissions captures explicit permissions only;
role membership and effective permissions require separate checks.
*/
USE [Treinamento_Modulo02_1];
GO
SELECT
    DB_NAME() AS database_name,
    p.name AS principal_name,
    perm.class_desc,
    perm.permission_name,
    perm.state_desc,
    OBJECT_SCHEMA_NAME(perm.major_id) AS object_schema,
    OBJECT_NAME(perm.major_id) AS object_name
FROM sys.database_permissions AS perm
JOIN sys.database_principals AS p
  ON p.principal_id = perm.grantee_principal_id
WHERE p.name = N'mcruz'
ORDER BY perm.class_desc, object_schema, object_name, perm.permission_name;
GO
USE [Treinamento_Modulo02_2];
GO
SELECT
    DB_NAME() AS database_name,
    p.name AS principal_name,
    perm.permission_name,
    perm.state_desc,
    OBJECT_SCHEMA_NAME(perm.major_id) AS object_schema,
    OBJECT_NAME(perm.major_id) AS object_name
FROM sys.database_permissions AS perm
JOIN sys.database_principals AS p
  ON p.principal_id = perm.grantee_principal_id
WHERE p.name = N'mcruz'
ORDER BY perm.class_desc, object_schema, object_name;
GO
