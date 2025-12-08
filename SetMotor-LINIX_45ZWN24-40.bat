@echo off
rem ============configure area start============
set hFile_path=".\Sources\Config"
set txtFile_path=".\FreeMASTER_control\MCAT\param_files"
rem =============configure area end=============

echo Upload BLDC_appconfig.h and M1_params.txt files with parameters for LINIX 45ZWN24-40 motor

if exist %hFile_path%\BLDC_appconfig.h del %hFile_path%\BLDC_appconfig.h
copy %hFile_path%\BLDC_appconfig_LINIX_45ZWN24-40.h %hFile_path%\BLDC_appconfig.h

if exist %txtFile_path%\M1_params.txt del %txtFile_path%\M1_params.txt
copy %txtFile_path%\M1_params_LINIX_45ZWN24-40.txt %txtFile_path%\M1_params.txt

echo Upload done