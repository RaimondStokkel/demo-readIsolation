USE [default]
GO


SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
--SET TRANSACTION ISOLATION LEVEL READ COMMITTED
--SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
--BEGIN TRAN

SELECT C.No_, C.Blocked
  FROM [dbo].[CRONUS NL$Customer$437dbf0e-84ff-417a-965d-ed2bb9650972] as C
  WHERE C.No_ = 10000

-- Wait for 20 Seconds
--WAITFOR DELAY '00:00:20'

--COMMIT TRAN

GO


