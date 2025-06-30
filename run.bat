@echo off
echo Activating virtual environment...

:: Use the current Jenkins workspace path
call %WORKSPACE%\.venv\Scripts\activate.bat

echo Running Robot Tests...
pabot --processes 1 --outputdir results TestCases\login_test.robot

echo Done!
