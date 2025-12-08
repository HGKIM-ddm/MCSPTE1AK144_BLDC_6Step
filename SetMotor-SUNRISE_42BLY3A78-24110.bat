@echo off
rem ============configure area start============
set hFile_path=".\Sources\Config"
set txtFile_path=".\FreeMASTER_control\MCAT\param_files"
rem =============configure area end=============

echo Upload BLDC_appconfig.h and M1_params.txt files with parameters for SUNRISE 42BLY3A78-24110 motor

if exist %hFile_path%\BLDC_appconfig.h del %hFile_path%\BLDC_appconfig.h
copy %hFile_path%\BLDC_appconfig_SUNRISE_42BLY3A78-24110.h %hFile_path%\BLDC_appconfig.h

if exist %txtFile_path%\M1_params.txt del %txtFile_path%\M1_params.txt
copy %txtFile_path%\M1_params_SUNRISE_42BLY3A78-24110.txt %txtFile_path%\M1_params.txt

echo Upload done