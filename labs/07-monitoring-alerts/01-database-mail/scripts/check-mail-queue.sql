/*
Project: SQL Server DBA Labs
Lab: Database Mail Configuration
Author: Matheus Cruz

Description:
Monitor Database Mail message delivery status.
*/

USE msdb;
GO

-- Check all Database Mail messages

SELECT
    mailitem_id,
    recipients,
    subject,
    sent_status,
    send_request_date
FROM dbo.sysmail_allitems
ORDER BY send_request_date DESC;
GO

-- Check pending emails

SELECT
    mailitem_id,
    recipients,
    subject,
    sent_status
FROM dbo.sysmail_unsentitems;
GO

-- Check Database Mail queue

EXEC dbo.sysmail_help_queue_sp
    @queue_type = 'mail';
GO

-- Query to monitor pending emails

SELECT TOP (5)
    sent_status,
    *
FROM msdb.dbo.sysmail_unsentitems
ORDER BY send_request_date DESC;
GO


-- Query to check email delivery status

SELECT TOP (5)
    sent_status,
    *
FROM msdb.dbo.sysmail_mailitems
ORDER BY send_request_date DESC;
GO
