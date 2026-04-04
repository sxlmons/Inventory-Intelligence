@echo off

FOR /f %%i IN ('docker compose ps -q db') DO SET CONTAINER_NAME=%%i

SET DB_USER=postgres
SET DB_NAME=inventoryTeam
SET OUTPUT_FILE=liquibase\data\seed.sql

echo Dumping database...

docker exec -t %CONTAINER_NAME% ^
  pg_dump -U %DB_USER% -d %DB_NAME% ^
  --data-only --inserts ^
  > %OUTPUT_FILE%

echo Dump complete: %OUTPUT_FILE%