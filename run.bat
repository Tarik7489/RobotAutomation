@echo off
echo Creating virtual environment if not exists...
python -m venv .venv

echo Activating virtual environment...
call .venv\Scripts\activate.bat

echo Installing dependencies...
pip install --upgrade pip
pip install -r requirements.txt
pip install robotframework-pabot

echo Running Robot Tests...
pabot --processes 1 --outputdir results TestCases\login_test.robot

echo Done!
