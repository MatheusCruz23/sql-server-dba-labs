/*
Lab 02 — Run this query while CONNECTED AS the SQL login mcruz.
1. Run before executing 04-grant-select.sql: expect error 229.
2. Run again after executing 04-grant-select.sql: expect sample rows.
Do not use administrator credentials for this test.
*/

USE [Treinamento_Modulo02_1];
GO

SELECT ORIGINAL_LOGIN() AS connected_login, USER_NAME() AS database_user;
GO

SELECT * FROM dbo.Modulo02;
GO
