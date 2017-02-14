@ECHO OFF

REM run our main driver script
PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "& '%~dpn0.ps1'"

REM Switch to project dir
cd project 

REM spin up the vagrant box 
vagrant up 