@echo off
Title WinRAR Cracker
cls
set/a count=0

echo   _____ _     _____             _           
echo  ^|__   ^|_^|___^|     ^|___ ___ ___^| ^|_ ___ ___ 
echo  ^|   __^| ^| . ^|   --^|  _^| .'^|  _^| '_^| -_^|  _^|
echo  ^|_____^|_^|  _^|_____^|_^| ^|__,^|___^|_,_^|___^|_^|  
echo          ^|_^|
echo.

IF EXIST "%programfiles%\WinRAR\Unrar.exe" (
    set path=%programfiles%\WinRAR\Unrar.exe
    copy /y "%path%" "Unrar.exe" >nul
) ELSE (
    echo WinRAR not installed^!
    exit /b
)

set/p "archive=Path to rar: "
IF NOT EXIST "%archive%" (
    echo.
    echo File not found^!
    exit /b
)

set/p "wordlist=Path to wordlist: "
IF NOT EXIST "%wordlist%" (
    echo.
    echo Wordlist not found^!
    exit /b
)

echo.
echo Ready? Strike ^<ENTER^> to crack and ^<CTRL+C^> to abort...
pause>nul
echo.

setlocal EnableDelayedExpansion

FOR /F "delims=" %%A IN (%wordlist%) DO (
    set password=%%A
    set/a count=!count!+1

    echo ^[Password ^#!count!^] Using ---^> !password!
    
    Unrar.exe e -inul -p!password! "%archive%" "%CD%"

    IF /I !ERRORLEVEL! EQU 0 (
        echo.
        echo Password^: !password!
        pause >nul
        exit /b
    )
)

echo Done. Nothing found...
exit /b
