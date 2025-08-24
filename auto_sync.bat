@echo off
echo Starting auto-sync script...
echo This will commit, push, and pull changes every 10 seconds.
echo Press Ctrl+C to stop.
echo.

:loop
echo [%time%] Starting sync cycle...

REM Add all changes (including new files)
echo Adding all changes...
git add -A

REM Wait a moment for add to complete
for /l %%x in (1,1,50000) do rem

REM Check if there are any changes to commit
git diff --cached --quiet
if %errorlevel% neq 0 (
    echo Committing changes...
    git commit -m "Auto-commit: %date% %time%"
    
    REM Wait a moment for commit to complete
    for /l %%x in (1,1,50000) do rem
    
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
    for /l %%j in (1,1,500000) do rem
)

goto loop
