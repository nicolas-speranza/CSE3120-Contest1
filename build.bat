@echo off
setlocal

REM Build script for Escape the Segfault
REM Main source file: Contest1.asm
REM Change this path to wherever your Irvine32 files are installed
set IRVINE_DIR=C:\Irvine\irvine

if not exist "Contest1.asm" (
    echo ERROR: Contest1.asm was not found in this folder.
    exit /b 1
)

if not exist "%IRVINE_DIR%\Irvine32.inc" (
    echo ERROR: Irvine32.inc was not found in %IRVINE_DIR%
    echo Edit build.bat and set IRVINE_DIR to the correct folder.
    exit /b 1
)

if not exist "%IRVINE_DIR%\Irvine32.lib" (
    echo ERROR: Irvine32.lib was not found in %IRVINE_DIR%
    echo Edit build.bat and set IRVINE_DIR to the correct folder.
    exit /b 1
)

echo Assembling Contest1.asm...
ml /c /coff /I "%IRVINE_DIR%" Contest1.asm
if errorlevel 1 (
    echo Assembly failed.
    exit /b 1
)

echo Linking Contest1.obj...
link /SUBSYSTEM:CONSOLE /LIBPATH:"%IRVINE_DIR%" Contest1.obj Irvine32.lib
if errorlevel 1 (
    echo Linking failed.
    exit /b 1
)

echo.
echo Build successful.
echo Run the game with:
echo Contest1.exe

endlocal