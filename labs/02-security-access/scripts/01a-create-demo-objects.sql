/*
Lab 02 - sample data setup (ADAPTED from study notes)
Run AFTER 01-create-lab-databases.sql and BEFORE 04-grant-select.sql.
Run as an account authorised to create tables and insert sample data.
This script DOES NOT DROP existing objects or delete existing rows.
*/
USE [Treinamento_Modulo02_1];
GO
IF OBJECT_ID(N'dbo.Modulo02', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.Modulo02 (
        Id_Treinamento INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Modulo02 PRIMARY KEY,
        Dt_Referencia DATETIME2(3) NOT NULL CONSTRAINT DF_Modulo02_Dt DEFAULT SYSUTCDATETIME(),
        Ds_Observacao NVARCHAR(100) NOT NULL
    );
END;
GO
IF NOT EXISTS (SELECT 1 FROM dbo.Modulo02)
BEGIN
    INSERT INTO dbo.Modulo02 (Ds_Observacao)
    VALUES (N'Example access test 01'), (N'Example access test 02'),
           (N'Example access test 03'), (N'Example access test 04'),
           (N'Example access test 05'), (N'Example access test 06'),
           (N'Example access test 07'), (N'Example access test 08'),
           (N'Example access test 09'), (N'Example access test 10');
END;
GO
SELECT COUNT(*) AS demo_rows FROM dbo.Modulo02;
GO
USE [Treinamento_Modulo02_2];
GO
IF OBJECT_ID(N'dbo.Modulo02_Database2', N'U') IS NULL
    CREATE TABLE dbo.Modulo02_Database2 (cod INT NOT NULL);
GO
IF NOT EXISTS (SELECT 1 FROM dbo.Modulo02_Database2 WHERE cod = 20)
    INSERT INTO dbo.Modulo02_Database2 (cod) VALUES (20);
GO
SELECT * FROM dbo.Modulo02_Database2;
GO
