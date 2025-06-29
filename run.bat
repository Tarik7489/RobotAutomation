@echo off
echo Activating virtual environment...

:: Activate the virtual environment
call E:\inmeet_web_automation_robot_framework\.venv\Scripts\activate.bat

:: Run specific test with full path
pabot --processes 1 --outputdir E:\inmeet_web_automation_robot_framework\results E:\inmeet_web_automation_robot_framework\TestCases\login_test.robot

echo.
echo Test execution complete.
pause
