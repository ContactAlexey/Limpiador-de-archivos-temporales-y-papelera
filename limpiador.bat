@echo off
title Limpieza del sistema
color 0A

:: ============================================
:: Verificar permisos de administrador
:: ============================================
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Solicitando permisos de administrador...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:: ============================================
:: Inicio de limpieza
:: ============================================
echo.
echo  ================================
echo   LIMPIEZA DEL SISTEMA
echo  ================================
echo.

:: Carpeta TEMP del usuario
echo [1/4] Limpiando TEMP del usuario...
del /q /f /s "%TEMP%\*" >nul 2>&1
for /d %%i in ("%TEMP%\*") do rd /s /q "%%i" >nul 2>&1
echo       Listo.

:: Carpeta TMP
echo [2/4] Limpiando TMP...
del /q /f /s "%TMP%\*" >nul 2>&1
for /d %%i in ("%TMP%\*") do rd /s /q "%%i" >nul 2>&1
echo       Listo.

:: Prefetch de Windows
echo [3/4] Limpiando Prefetch...
del /q /f /s "C:\Windows\Prefetch\*" >nul 2>&1
echo       Listo.

:: Papelera de reciclaje
echo [4/4] Vaciando Papelera de reciclaje...
powershell -Command "Clear-RecycleBin -Force -ErrorAction SilentlyContinue"
echo       Listo.

:: ============================================
:: Fin
:: ============================================
echo.
echo  ================================
echo   Limpieza completada con exito
echo  ================================
echo.
pause
