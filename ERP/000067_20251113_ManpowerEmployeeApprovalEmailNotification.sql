USE [ERP]
GO

INSERT INTO [dbo].[cmn_EmailNotificationConfig]
           ([Code]
           ,[Name]
           ,[TemplateFile]
           ,[DataQuery]
           ,[FromQuery]
           ,[ToQuery]
           ,[CcQuery]
           ,[BccQuery]
           ,[TupleParameters]
           ,[Active]
           ,[CreatedDate]
           ,[UpdatedDate])
     VALUES
           ('CasualEmployeeApproval'
           ,'Manpower Employee Approval'
           ,'ProjectNotifications.html'
           ,'SELECT ''Manpower Employee Approval Notification'' AS Subject, CONCAT(''New Employee request "'', EMPV.NameWithInitial, '' ('', EMPV.EPFNo, '')"'', '' from '', EMPV2.Title, '' '', EMPV2.NameWithInitial, '' ('', EMPV2.EPFNo, '') is pending for your approval.'') AS BodyData FROM cmn_EmployeeVersion EMPV LEFT JOIN cmn_EmployeeVersion EMPV2 on EMPV2.EmployeeId = @userEmployeeId WHERE EMPV.EmployeeId = @employeeId'
           ,'SELECT ''notifications.ceslerp@gmail.com'' AS [Email]'
           ,'SELECT EMPV.NameWithInitial, EMPV.PrivateEmail AS Email FROM cmn_EmployeeVersion EMPV WHERE EMPV.EmployeeId IN (SELECT WRK.HeadOfWorkSpace FROM cmn_WorkSpace WRK WHERE WRK.WorkSpaceId IN (SELECT EMPV.WorkSpaceId FROM cmn_EmployeeVersion EMPV WHERE EMPV.EmployeeId = @employeeId))'
           ,NULL
           ,NULL
           ,'<employeeId,guid><userEmployeeId,guid>'
           ,1
           ,GETDATE()
           ,GETDATE())
GO
