@echo off
title Limpieza del Sistema - Menu Interactivo
color 0A
mode con: cols=80 lines=30

:: ============================================
:: Verificar permisos de administrador
:: ============================================
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Solicitando permisos de administrador...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:menu
cls
echo.
echo ================================
echo     LIMPIEZA DEL SISTEMA
echo ================================
echo.
echo Selecciona las opciones que deseas limpiar:
echo.
echo   [1] Carpeta TEMP del usuario          [%temp_status%]
echo   [2] Carpeta TMP                       [%tmp_status%]
echo   [3] Carpeta Prefetch de Windows       [%prefetch_status%]
echo   [4] Papelera de Reciclaje             [%recycle_status%]
echo.
echo   [A] Limpiar TODO (todas las opciones)
echo   [0] Salir del script
echo.
echo ================================
set "temp_status=ON"
set "tmp_status=ON"
set "prefetch_status=ON"
set "recycle_status=ON"

set /p "opcion=Elige una opcion (1-4, A, 0): "

if "%opcion%"=="0" goto salir
if /i "%opcion%"=="A" goto limpiar_todo

if "%opcion%"=="1" (
    set "limpiar_temp=si"
    goto confirmar
)
if "%opcion%"=="2" (
    set "limpiar_tmp=si"
    goto confirmar
)
if "%opcion%"=="3" (
    set "limpiar_prefetch=si"
    goto confirmar
)
if "%opcion%"=="4" (
    set "limpiar_recycle=si"
    goto confirmar
)

echo.
echo Opcion no valida. Intenta de nuevo.
pause
goto menu

:confirmar
cls
echo.
echo ================================
echo     CONFIRMACION DE LIMPIEZA
echo ================================
echo.
if defined limpiar_temp echo - Se limpiara: TEMP del usuario
if defined limpiar_tmp echo - Se limpiara: Carpeta TMP
if defined limpiar_prefetch echo - Se limpiara: Prefetch
if defined limpiar_recycle echo - Se limpiara: Papelera de reciclaje
echo.
set /p "confirmar=¿Deseas proceder con la limpieza? (S/N): "
if /i "%confirmar%"=="S" goto ejecutar_limpieza
if /i "%confirmar%"=="N" goto menu

echo Opcion no valida.
pause
goto confirmar

:ejecutar_limpieza
cls
echo.
echo ================================
echo     INICIANDO LIMPIEZA...
echo ================================
echo.

if defined limpiar_temp (
    echo [1/4] Limpiando TEMP del usuario...
    del /q /f /s "%TEMP%\*" >nul 2>&1
    for /d %%i in ("%TEMP%\*") do rd /s /q "%%i" >nul 2>&1
    echo    ^> Listo.
)

if defined limpiar_tmp (
    echo [2/4] Limpiando TMP...
    del /q /f /s "%TMP%\*" >nul 2>&1
    for /d %%i in ("%TMP%\*") do rd /s /q "%%i" >nul 2>&1
    echo    ^> Listo.
)

if defined limpiar_prefetch (
    echo [3/4] Limpiando Prefetch...
    del /q /f /s "C:\Windows\Prefetch\*" >nul 2>&1
    echo    ^> Listo.
)

if defined limpiar_recycle (
    echo [4/4] Vaciando Papelera de reciclaje...
    powershell -Command "Clear-RecycleBin -Force -ErrorAction SilentlyContinue" >nul 2>&1
    echo    ^> Listo.
)

echo.
echo ================================
echo     LIMPIEZA COMPLETADA
echo ================================
echo.
pause
goto menu

:limpiar_todo
set "limpiar_temp=si"
set "limpiar_tmp=si"
set "limpiar_prefetch=si"
set "limpiar_recycle=si"
goto ejecutar_limpieza

:salir
cls
echo.
echo ================================
echo     Saliendo del script...
echo ================================
echo.
timeout /t 2 >nul
exit
