chcp 866
@echo off
setlocal

REM ����砥� ��� ��㯯� � ���� � ��⠫��� ��㤥�⮢ �� ��������� ��ப�
set "group_code=%1"
set "students_dir=%2"
set "group_students_dir=%students_dir%\%group_code%"

REM �஢��塞 ����稥 ��ࠬ��஢ ��������� ��ப�
if "%group_code%"=="" (
    echo ��ࠬ���/��� �� 㪠���.
    pause
)

if "%students_dir%"=="" (
    echo ��ࠬ���/��� �� 㪠���.
    pause
)

REM �஢��塞 ����⢮����� ��⠫��� ��㤥�⮢
if not exist "%students_dir%" (
    echo ��ࠬ���/��� ������ ����୮.
    pause
)

REM �஢��塞 ����⢮����� ��⠫��� ��㯯� ��㤥�⮢
if not exist "%group_students_dir%" (
    echo ��ࠬ���/��� ������ ����୮.
    pause
)

REM �뢮��� ���� ��� �롮� ���ࠢ����� �뢮��
:menu
cls
echo �롥�� ���ࠢ����� �뢮��:
echo 1. �� ��࠭
echo 2. � 䠩�
echo 3. �� �ਭ��
set /p choice="������ �����: "

REM ���室�� � ᮮ⢥�����饩 ��⪥ � ����ᨬ��� �� �롮� ���짮��⥫�
if "%choice%"=="1" goto :print_screen
if "%choice%"=="2" goto :print_file
if "%choice%"=="3" goto :print_printer

echo ������ �롮�. ��������, ������ ����� �� 1 �� 3.
pause
goto :menu

REM ��⪠ ��� �뢮�� ᯨ᪠ 䠩��� �� ��࠭
:print_screen
dir "%group_students_dir%"
echo ���᮪ 䠩��� � ��⠫��� ��㤥�⮢ (%group_code%) �뢥��� �� ��࠭.
goto :end

REM ��⪠ ��� �뢮�� ᯨ᪠ 䠩��� � 䠩�
:print_file
set "output_file=%students_dir%\���᮪_䠩���_%group_code%.txt"
echo ���᮪ 䠩��� � ��⠫��� ��㤥�⮢ (%group_code%) �㤥� ��࠭�� � 䠩�� "%output_file%".
dir "%group_students_dir%" > "%output_file%"
echo ���᮪ 䠩��� ��࠭�� � 䠩�� "%output_file%".
goto :end

REM ��⪠ ��� �뢮�� ᯨ᪠ 䠩��� �� �ਭ��
:print_printer
echo ���᮪ 䠩��� � ��⠫��� ��㤥�⮢ (%group_code%) �㤥� ��ࠢ��� �� �ਭ��.
dir "%group_students_dir%" > prn
echo ���᮪ 䠩��� ��ࠢ��� �� �ਭ��.
goto :end

REM ��⪠ ��� �����襭�� �ணࠬ��
:end
pause