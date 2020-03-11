@ECHO off
TITLE Embed Shockwave IN HTML
:start
SET wizard=N
SET /p wizard=Would you like to use the setup wizard (vs. the quick method) (y/N) :
IF %wizard%==y ( CALL :wizard ) ELSE ( IF %wizard%==Y ( CALL :wizard ) ELSE ( CALL :quick))
EXIT
:wizard
SET /p shockwave=Please enter the name of the Shockwave file (with a .swf extension) : 
IF EXIST %shockwave% ( ECHO Using file %shockwave% ) ELSE ( CALL :noSuchFile )
SET /p HTML=Please enter the name of the target HTML file (with a .html extension). If the file does not exist it will be created. :
IF NOT EXIST %HTML% (TYPE NUL > %HTML%)
ECHO Using file %HTML%
SET /p name=Please enter the name of the name of the Shockwave program (ie. the name of the game):
SET /p fullscreen=Would you like the game to be fullscreen? (Y/n) :
IF %fullscreen%==n CALL :askSize ELSE ( IF %fullscreen%==N CALL :askSize )
ECHO ^<html^> > %HTML%
ECHO ^<head^> >> %HTML%
ECHO ^<title^> %name% ^</title^> >> %HTML%
ECHO ^</html^> >> %HTML%
ECHO ^<body^> >> %HTML%
IF %fullscreen%==n ( CALL :embedFlashCustom ) ELSE ( IF %fullscreen%==N ( CALL :embedFlashCustom) ELSE ( CALL :embedFlashFullscreen ))
ECHO ^</body^> >> %HTML%
ECHO ^</html^> >> %HTML%
ECHO Done!
PAUSE
EXIT /B 0
:quick
ECHO Remember to name your Shockwave file "shockwave.swf" (no capitals). The HTML file will be created for you and any data in "page.html" WILL BE OVERWITTEN!
PAUSE
SET shockwave=shockwave.swf
SET HTML=page.html
TYPE NUL > %HTML%
ECHO ^<html^> > %HTML%
ECHO ^<head^> >> %HTML%
ECHO ^<title^> Shockwave ^</title^> >> %HTML%
ECHO ^</html^> >> %HTML%
ECHO ^<body^> >> %HTML%
ECHO ^<embed src="%shockwave%" width="1280" height="720"^>^</embed^> >> %HTML%
ECHO ^</body^> >> %HTML%
ECHO ^</html^> >> %HTML%
ECHO Done!
PAUSE
EXIT /B 0
:noSuchFile
ECHO No such File
GOTO wizard
EXIT /B 0
:askSize
SET /p sizeH=What would you like the horizontal size to be? :
SET /p sizeV=What would you like the verticle size to be? :
EXIT /B 0
:embedFlashFullscreen
ECHO ^<embed src="%shockwave%" width="1280" height="720"^>^</embed^> >> %HTML%
EXIT /B 0
:embedFlashCustom
ECHO ^<embed src="%shockwave%" width="%sizeH%" height="%sizeV%"^>^</embed^> >> %HTML%
EXIT /B 0