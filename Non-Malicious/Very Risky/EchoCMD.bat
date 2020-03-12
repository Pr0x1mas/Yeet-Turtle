@echo off
title EchoCMD

echo EchoCMD [Version 1.5.2]
echo (c) 2020 Pr0x1mas. All rights reserved.
ver
echo (c) 2019 Microsoft Corporation. All rights reserved.
echo(

:input
	set directory=%cd%^^^>
	set /P command=%directory%
	
:run
	%command%
	goto input
