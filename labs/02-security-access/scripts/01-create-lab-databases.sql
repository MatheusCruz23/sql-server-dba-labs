/*
Lab 02 — SQL Server Security & Access Management
Create sample databases without deleting any existing data.
Run using an account with database creation permissions.
*/

USE [master];
GO

IF DB_ID(N'Treinamento_Modulo02_1') IS NULL
    CREATE DATABASE [Treinamento_Modulo02_1];
GO

IF DB_ID(N'Treinamento_Modulo02_2') IS NULL
    CREATE DATABASE [Treinamento_Modulo02_2];
GO

SELECT name, create_date
FROM sys.databases
WHERE name IN (N'Treinamento_Modulo02_1', N'Treinamento_Modulo02_2');
GO
