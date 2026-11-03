USE ERP;
GO
IF NOT EXISTS (
    SELECT 1 
    FROM sys.columns 
    WHERE object_id = OBJECT_ID(N'[dbo].[trn_TrainingParticipant]') 
      AND name = N'MealPreference'
)
BEGIN
    ALTER TABLE [dbo].[trn_TrainingParticipant] 
        ADD [MealPreference] INT NULL;                 -- 1 = Veg, 2 = Non-Veg
END
ELSE
BEGIN
    PRINT 'Column [MealPreference] already exists in [trn_TrainingParticipant].';
END
GO

IF NOT EXISTS (
    SELECT 1 
    FROM sys.check_constraints 
    WHERE name = N'CK_trn_TrainingParticipant_MealPreference'
)
BEGIN
    ALTER TABLE [dbo].[trn_TrainingParticipant] 
        ADD CONSTRAINT [CK_trn_TrainingParticipant_MealPreference] 
        CHECK ([MealPreference] IN (1, 2));
END
ELSE
BEGIN
    PRINT 'Constraint [CK_trn_TrainingParticipant_MealPreference] already exists.';
END
GO