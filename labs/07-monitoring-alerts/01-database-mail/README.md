# Lab 01 — SQL Server Database Mail Configuration

## 1. Objective

Configure and validate SQL Server Database Mail to enable
email notifications for database administration activities.

This laboratory focuses on configuring SMTP connectivity,
testing email delivery, monitoring outgoing messages,
and troubleshooting Database Mail issues.

## 2. Laboratory Environment

| Component | Technology |
|-----------|------------|
| Database Engine | SQL Server Developer Edition |
| Operating System | Windows Server 2022 |
| Management Tool | SQL Server Management Studio |
| Server | SQL01 |
| SMTP Provider | Gmail |
| Environment | Oracle VirtualBox |

## 3. Implementation

### Step 1 — Configure Database Mail

Using SQL Server Management Studio:

1. Open Management.
2. Right-click Database Mail.
3. Select Configure Database Mail.
4. Create a new Database Mail account.
5. Configure the SMTP server.
6. Create a Database Mail profile.

### Step 2 — Configure SMTP

SMTP settings used:

| Property | Value |
|----------|-------|
| SMTP Server | smtp.gmail.com |
| Port | 587 |
| SSL/TLS | Enabled |
| Authentication | Basic Authentication |
| Email Provider | Gmail |

Gmail requires an appropriate authentication method,
such as a Google App Password for eligible accounts.

Credentials must never be stored in this repository.

### Step 3 — Test Email Delivery

After configuring Database Mail, I performed an email
delivery test using SQL Server Management Studio.

The test confirmed that SQL Server could communicate
with Gmail's SMTP server and deliver an email successfully.

## 4. Monitoring Database Mail

The following query can be used to inspect Database Mail
messages and their delivery status.

```sql
USE msdb;
GO

SELECT
    mailitem_id,
    recipients,
    subject,
    sent_status,
    send_request_date
FROM dbo.sysmail_allitems
ORDER BY send_request_date DESC;
```

### Message Status

| Status | Description |
|--------|-------------|
| sent | Message accepted by the SMTP server |
| unsent | Message waiting to be processed |
| retrying | Delivery failed and another attempt is scheduled |
| failed | Message delivery failed |

## 5. Troubleshooting

During the configuration process, I investigated
Database Mail message delivery and queue management.

Useful troubleshooting activities include:

- Checking Database Mail configuration.
- Verifying SMTP authentication settings.
- Reviewing message delivery status.
- Identifying messages waiting in the queue.
- Investigating failed delivery attempts.
- Managing pending email messages.

### Check Pending Emails

```sql
USE msdb;
GO

SELECT
    mailitem_id,
    recipients,
    subject,
    sent_status
FROM dbo.sysmail_unsentitems;
```

### Database Mail Queue Management

Database Mail processing can be temporarily stopped
using the following stored procedure:

```sql
EXEC msdb.dbo.sysmail_stop_sp;
```

To restart Database Mail:

```sql
EXEC msdb.dbo.sysmail_start_sp;
```

Pending messages should be reviewed before performing
any deletion or cleanup operation.

## 6. Results

- Database Mail configured successfully.
- SMTP connectivity established using Gmail.
- Email delivery tested successfully.
- Database Mail monitoring queries documented.
- Queue management procedures reviewed.

## 7. Lessons Learned

This laboratory helped reinforce my knowledge of:

- SQL Server Database Mail architecture.
- SMTP authentication and connectivity.
- Database Mail profiles and accounts.
- Email delivery monitoring.
- Troubleshooting message queues.
- Operational procedures used in DBA environments.

## 8. Next Steps

- Configure a SQL Server Agent Operator.
- Create SQL Server Agent Jobs.
- Configure email notifications for failed jobs.
- Test automated database monitoring alerts.

## References

- Microsoft SQL Server Documentation
- Microsoft Learn — Database Mail
