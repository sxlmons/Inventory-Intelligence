@REM @echo off

@REM FOR /f %%i IN ('docker compose ps -q db') DO SET CONTAINER_NAME=%%i

@REM SET DB_USER=postgres
@REM SET DB_NAME=inventoryTeam
@REM SET OUTPUT_FILE=liquibase\data\seed.sql

@REM echo Dumping database...

@REM docker exec -t %CONTAINER_NAME% ^
@REM   pg_dump -U %DB_USER% -d %DB_NAME% ^
@REM   --data-only --inserts ^
@REM   > %OUTPUT_FILE%

@REM echo Dump complete: %OUTPUT_FILE%