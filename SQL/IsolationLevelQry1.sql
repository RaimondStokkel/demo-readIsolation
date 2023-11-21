USE [default]
GO

BEGIN TRAN;

-- Update new value to the record
UPDATE [dbo].[CRONUS NL$Customer$437dbf0e-84ff-417a-965d-ed2bb9650972] WITH (ROWLOCK)
   SET [Blocked] = 3
 WHERE [No_] = 10000

-- Wait for 20 Seconds
WAITFOR DELAY '00:00:20'

--Rollback the changes
ROLLBACK TRAN;


SELECT C.No_, C.Blocked
  FROM [dbo].[CRONUS NL$Customer$437dbf0e-84ff-417a-965d-ed2bb9650972] as C

GO


