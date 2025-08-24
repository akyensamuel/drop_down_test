@echo off
echo Starting auto-sync script...
echo This will commit, push, and pull changes every 10 seconds.
echo Press Ctrl+C to stop.
echo.

:loop
echo [%time%] Starting sync cycle...

REM Add all changes
echo Adding changes...
git add .

REM Check if there are any changes to commit
git diff --cached --quiet
if %errorlevel% neq 0 (
    echo Committing changes...
    git commit -m "Auto-commit: %date% %time%"
    
    echo Pushing changes...
    git push origin main
    if %errorlevel% neq 0 (
        echo Warning: Push failed, continuing...
    )
) else (
    echo No changes to commit.
)

echo Pulling latest changes...
git pull origin main
if %errorlevel% neq 0 (
    echo Warning: Pull failed, continuing...
)

echo [%time%] Sync cycle completed.
echo.
echo Waiting 10 seconds...
for /l %%i in (1,1,10) do (
    echo %%i...
    for /l %%j in (1,1,100) do (
        for /l %%k in (1,1,1000) do rem
    )
)

goto loop
