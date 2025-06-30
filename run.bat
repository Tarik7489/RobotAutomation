@echo off
echo Activating virtual environment...

:: Activate the virtual environment using relative path
call .venv\Scripts\activate.bat

echo Running Robot Tests...

:: Run Robot tests using relative paths (so it works in any workspace)
pabot --processes 1 --outputdir results TestCases\login_test.robot

echo.
echo Test execution complete.
pause

