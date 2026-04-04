@echo off
echo Running database dump before commit...
cmd /c scripts\dump-db.bat
git add liquibase\data\seed.sql
echo Seed file updated and staged.
pause