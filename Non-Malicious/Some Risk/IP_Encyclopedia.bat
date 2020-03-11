@echo off
:start
title Batch IP Encyclopaedia
color 1a
:begin
echo *********************************************
echo.
echo Welcome to Batch IP Encyclopedia
echo.
echo *********************************************
echo.
:top
echo Enter RHOST IP Address:
set /p RHOST=
pause
if %RHOST%==restart goto start
echo.
echo Send Packets?(y/n)
set /p send=
if %send%==y ping %RHOST%
if %send%==n stop
pause
set RHOST=0
goto top
  



