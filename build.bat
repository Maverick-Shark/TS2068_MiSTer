@echo off
rem Compila TS2068 para MiSTer con Quartus 17.0 desde linea de comandos
set QUARTUS=C:\altera_lite\17.0\quartus\bin64
"%QUARTUS%\quartus_sh.exe" --flow compile TS2068 -c TS2068
if errorlevel 1 goto :error
for /f %%i in ('powershell -nologo -noprofile -command "Get-Date -Format yyyyMMdd"') do set DT=%%i
copy /y output_files\TS2068.rbf releases\TS2068_%DT%.rbf >nul
echo Hecho: releases\TS2068_%DT%.rbf
goto :eof
:error
echo Error de compilacion
exit /b 1
