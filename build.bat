@echo off

:: Variables de entorno
if not "%~1"=="" set FLEX_HOME=%~1
if not "%~2"=="" set BUILD=%~2

:: build
echo build with %FLEX_HOME%

:: Si desea contruir su propia version recuerde cambiar esto por la ubicación de instalación de su Ant
ant -buildfile %BUILD%.xml