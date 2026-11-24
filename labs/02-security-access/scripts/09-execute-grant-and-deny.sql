/*
Lab 02 - EXECUTE permissions for stored procedures.
IMPORTANT: This reproduces a classroom scenario, NOT least-privilege guidance.
GRANT EXECUTE at DATABASE scope is broad, including future procedures.
Do not run on production or databases with confidential objects.
*/
USE [Treinamento_Modulo02_1];
GO
-- Step A: targeted permission (recommended for specific application needs).
GRANT EXECUTE ON OBJECT::dbo.stpModulo02 TO [mcruz];
GO
-- Step B: OPTIONAL training demonstration of broad grant + object denial.
-- Review the scope before running these statements in your isolated LAB ONLY:
-- GRANT EXECUTE TO [mcruz];
-- DENY EXECUTE ON OBJECT::dbo.stpModulo02_2 TO [mcruz];
-- Test as mcruz: stpModulo02 / stpModulo02_2 / stpModulo02_3.
-- After the exercise, undo the broad permission:
-- REVOKE EXECUTE FROM [mcruz];
-- REVOKE EXECUTE ON OBJECT::dbo.stpModulo02_2 FROM [mcruz];
-- The earlier object-level GRANT on stpModulo02 remains separate.
