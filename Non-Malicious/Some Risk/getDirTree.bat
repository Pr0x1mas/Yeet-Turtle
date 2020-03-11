@ECHO off
:start
ECHO The current working directory is %CD%. All file output will be stored here.
SET workingDir=%CD%
SET treeDir=bigFuckingChungus
SET /p treeDir=Please enter the directory to be used when generating the directory tree. If nothing is entered, the directory will default to the working directory.
ECHO WARNING! This will overwrite any data stored in the file "tree.txt". If the file does not exist, it will be created.
PAUSE
IF %treeDir%==bigFuckingChungus ( CALL :treeDefault ) ELSE ( CALL :treeCustom )
ECHO Done!
ECHO Open the file using Microsoft Word and set the encoding to MS-DOS when prompted.
PAUSE
EXIT
:treeCustom
cd %treeDir%
ECHO %workingDir%\tree.txt
tree /F > "%workingDir%\tree.txt"
EXIT /B 0
:treeDefault
ECHO %workingDir%\tree.txt
tree /F > "%workingDir%\tree.txt"
EXIT /B 0