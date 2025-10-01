USE [ERP]
GO

INSERT INTO [dbo].[hrm_EmployeeTransitionType] 
(EmployeeTransitionTypeId, Name, TransitionCode, IsActive)
VALUES
('a0671fb3-f14b-47c1-92c7-0cd50270c18d', 'Transfer', 'TRN', 1),
('0ada5785-2566-4138-ae9c-1f261d5e545a', 'Expiration', 'EXP', 1),
('5f0dd074-f04d-41b8-9cc3-408bde42af7b', 'Back To Cecb', 'BCC', 1),
('35bc84cc-3d97-4a74-8d20-5d9efcfd49f0', 'Retirement', 'RET', 1),
('5e978e88-e321-4394-a403-70e150316e17', 'Vacated Of Post', 'VOP', 1),
('ff71fb1a-8950-49d3-ba72-72066f4e8622', 'Deactivate', 'DEA', 1),
('d9d43e24-9a21-40d2-b2bc-7775bbaa107f', 'Special NoPay', 'NOL', 1),
('10432d6d-72bb-4a74-bc58-a6704b9f3446', 'Attach To Ministry', 'ATM', 1),
('92d826e8-f6d1-4bdd-8bc5-b46e1c3648ae', 'Promotion', 'PRM', 1),
('8e149372-dd26-4a16-8b7c-bfb1ca17c879', 'Transfer To Cecb', 'TTC', 1),
('7b378c87-41cb-45fb-8196-cd86e83af1a5', 'Termination', 'TER', 1),
('e9fb9493-e657-45d8-b077-d2f92790ef82', 'Suspended', 'SP', 1),
('776b2c5e-f4fc-4ae6-8dad-d903f3e75e0c', 'Cecb Reattach', 'CRA', 1),
('5d0a5639-9e60-4c90-ad71-def539041c68', 'Passed Away', 'PAW', 1),
('ed04847b-df53-44c6-a60e-febdc60703dd', 'Rejoin ', 'RJ', 1);
GO

