@echo off
title water.bat
color 0b
echo set shellobj = CreateObject("WScript.Shell") >> c.vbs
echo Wscript.Sleep(2000) >> c.vbs
echo shellobj.sendkeys "{F11}" >> c.vbs
start /min c.vbs
ping 127.0.0.1 -n 2 > nul
del c.vbs
set "file=https://puu.sh/DI81J/82f33a7ee3.mp3"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs
ping 127.0.0.1 -n 2 > nul
del sound.vbs
goto menu
setlocal disableDelayedExpansion
set q=^"
:c
setlocal enableDelayedExpansion
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:colorPrint Color  Str  [/n]
setlocal
set "s=%~2"
call :colorPrintVar %1 s %3
exit /b
:colorPrintVar  Color  StrVar  [/n]
if not defined DEL call :initColorPrint
setlocal enableDelayedExpansion
pushd .
':
cd \
set "s=!%~2!"
:: The single blank line within the following IN() clause is critical - DO NOT REMOVE
for %%n in (^"^

^") do (
  set "s=!s:\=%%~n\%%~n!"
  set "s=!s:/=%%~n/%%~n!"
  set "s=!s::=%%~n:%%~n!"
)
for /f delims^=^ eol^= %%s in ("!s!") do (
  if "!" equ "" setlocal disableDelayedExpansion
  if %%s==\ (
    findstr /a:%~1 "." "\'" nul
    <nul set /p "=%DEL%%DEL%%DEL%"
  ) else if %%s==/ (
    findstr /a:%~1 "." "/.\'" nul
    <nul set /p "=%DEL%%DEL%%DEL%%DEL%%DEL%"
  ) else (
    >colorPrint.txt (echo %%s\..\')
    findstr /a:%~1 /f:colorPrint.txt "."
    <nul set /p "=%DEL%%DEL%%DEL%%DEL%%DEL%%DEL%%DEL%"
  )
)
if /i "%~3"=="/n" echo(
popd
exit /b


:initColorPrint
for /f %%A in ('"prompt $H&for %%B in (1) do rem"') do set "DEL=%%A %%A"
<nul >"%temp%\'" set /p "=."
subst ': "%temp%" >nul
exit /b


:cleanupColorPrint
2>nul del "%temp%\'"
2>nul del "%temp%\colorPrint.txt"
>nul subst ': /d
exit /b
:menu
cls
set /a choice = 0
set back = 1
echo     :::       :::     ::: ::::::::::: :::::::::: ::::::::: 
echo    :+:       :+:   :+: :+:   :+:     :+:        :+:    :+: 
echo   +:+       +:+  +:+   +:+  +:+     +:+        +:+    +:+  
echo  +#+  +:+  +#+ +#++:++#++: +#+     +#++:++#   +#++:++#:    
echo +#+ +#+#+ +#+ +#+     +#+ +#+     +#+        +#+    +#+    
echo #+#+# #+#+#  #+#     #+# #+#     #+#        #+#    #+#     
echo ###   ###   ###     ### ###     ########## ###    ### 
echo.
call :c 0a "1) Ip informations " /n
call :c 0a "2) Network scan" /n
call :c 0a "3) Live ip" /n 
echo.
call :c 0d "Parrot"&call :c 0b ":/ "
if exist d.vbs start d.vbs
set /p choice= 
if %choice% == 1 goto ip_resolver
if %choice% == 2 goto uping
if %choice% == 3 goto liveip
if %choice% == hid goto hidsecret
goto menu

:hidsecret
echo set shellobj = CreateObject("WScript.Shell") >> d.vbs
echo Wscript.Sleep(3000) >> d.vbs
echo shellobj.sendkeys "hello %username%, the script is typing for you !" >> d.vbs
echo Wscript.Sleep(1000) >> d.vbs
echo shellobj.sendkeys "{BS 46}" >> d.vbs
start /min d.vbs
ping 127.0.0.1 -n 2 > nul
del d.vbs
goto menu

:ip_resolver
for /f %%a in ('powershell Invoke-RestMethod api.ipify.org') do set PublicIP=%%a
goto beg

:beg
cls
echo your ip is %PublicIP%
call :c 0b "Type an IP adress : "&set /p ip=
cls
call :c 0a "IP:          " &echo %ip%
call :c 0a "Vendor name: "&curl "https://ipapi.co/"%ip%"/org/"&call :c 0A " " /n
call :c 0a "ASN:         "&curl "https://ipapi.co/"%ip%"/asn/"&call :c 0A " " /n
call :c 0C "Country:     "&curl "https://ipapi.co/"%ip%"/country/"&call :c 0A " " /n
call :c 0C "City:        "&curl "https://ipapi.co/"%ip%"/city/ "&call :c 0A " " /n
call :c 0C "Location:    "&curl "https://ipapi.co/"%ip%"/latlong/  "&call :c 0A " " /n
call :c 0C "Post code:   "&curl "https://ipapi.co/"%ip%"/postal/  "&call :c 0A " " /n
call :c 0C "Continent:   "&curl "https://ipapi.co/"%ip%"/continent_code/  "&call :c 0A " " /n
call :c 0C "Time zone:   "&curl "https://ipapi.co/"%ip%"/timezone/  "&call :c 0A " " /n
call :c 0C "Language:    "&curl "https://ipapi.co/"%ip%"/languages/  "&call :c 0A " " /n
call :c 0C "Region:      "&curl "https://ipapi.co/"%ip%"/region/  "&call :c 0A " " /n
echo press someting to continue
pause >nul
goto menu


:: ping 
:uping
cls
set /a fnd=0
call :c 0a "Third byte number: "
set /p first=
for /f "delims=[] tokens=2" %%a in ('ping -4 -n 1 %ComputerName% ^| findstr [') do set NetworkIP=%%a
cls
call :c 0D "PING RESULT:" /n
set second=0
:looping
title Pinging 192.168.%first%.%second%
ping -w 1 -n 1 192.168.%first%.%second% | find "TTL=" >nul 
if errorlevel 1 ( 
    goto 1895462
) else (
  set /a fnd=fnd+1
  if 192.168.%first%.%second%==%NetworkIP% call :c 0F "192.168.%first%.%second%: "&call :c 0A "FOUND"&call :c 0B " (YOU)" /n&goto 1895462
    call :c 0F "192.168.%first%.%second%: "&call :c 0A "FOUND" /n
)
:1895462
set /a second=second+1
if %second%==255 goto endping
goto looping
:endping
echo.
call :c 0a "ping finished with "&call :c 0a "%fnd%"&call :c 0a "host found." /n
echo press someting to continue
pause >nul
goto menu

:liveip
cls
:14785
for /f %%a in ('powershell Invoke-RestMethod api.ipify.org') do set PublicIP=%%a
call :c 0C "%PublicIP% "&call :c 0B "at "&call :c 0A "(%time%)" /n
echo %PublicIP%| clip
ping 127.0.0.1 -n 1 > nul
goto 14785
