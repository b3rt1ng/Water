@echo off
title water.bat
set /a admina=0
set /a shodanapi=0
color 0b
::echo set shellobj = CreateObject("WScript.Shell") >> c.vbs
::echo Wscript.Sleep(2000) >> c.vbs
::echo shellobj.sendkeys "{F11}" >> c.vbs
::start /min c.vbs
::ping 127.0.0.1 -n 2 > nul
::del c.vbs
:check_Permissions
NET SESSION >nul 2>&1
IF %ERRORLEVEL% EQU 0 (
    set /a admina=1
) ELSE (
    set /a admina=0
)
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
if %admina% == 0 call :c 0c "WARNING, ADMINS RIGHTS NOT GRANTED !" /n
echo.
call :c 0a "1) Ip informations " /n
call :c 0a "2) Network scan" /n
call :c 0a "3) Live ip" /n
call :c 0a "4) Shodan" /n
call :c 0a "5) See my packet trafic to a website" /n
echo.
call :c 0d "Parrot"&call :c 0b ":/ "
set /p choice=
if %choice% == 1 goto ip_resolver
if %choice% == 2 goto uping
if %choice% == 3 goto liveip
if %choice% == 4 goto shodan
if %choice% == 5 goto tracertt
if %choice% == hid goto hidsecret
if %choice% == exit exit
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
FOR /F "tokens=* USEBACKQ" %%F IN (`curl "https://ipapi.co/"%ip%"/latlong/  "`) DO (
SET loc=%%F
)
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
echo.
call :c 0f "--------------------------------------------" /n
call :c 0e "1) show location on map" /n
call :c 0e "2) shodan look up" /n
call :c 0e "3) store ip to cache" /n
call :c 0e "0) back to menu" /n
:bak
set /p ipcho=
if %ipcho% == 1 start www.google.com/maps/?q=%loc%
if %ipcho% == 2 start https://www.shodan.io/host/%ip%
if %ipcho% == 3 set ipcache=%ip%
if %ipcho% == 0 goto menu
goto bak
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
title water.bat
call :c 0a "ping finished with "&call :c 0b "%fnd% "&call :c 0a "host found." /n
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

:pwsh
cls
call :c 0b "1) sda poisoner" /n
call :c 0b "00) goto menu " /n
set /p choicep=
if %choicep% == 00 goto menu
goto pwsh

:shodan
cls
set qweri=webcam_XP
if %shodanapi% == 0 call :c 0c "You didn't provided your shodan api key yet." /n
if %shodanapi% == 1 goto shodan1
echo.
call :c 0a "1) provide my API key" /n
call :c 0a "2) go get an api key" /n
call :c 0a "3) try a free api" /n
set /p shochoice=
if %shochoice% == 1 goto providesho
if %shochoice% == 2 start https://developer.shodan.io/
if %shochoice% == 3 goto rdmapi
goto shodan
:rdmapi
set shodanapikey=UNmOjxeFS2mPA3kmzm1sZwC0XjaTTksy
goto shodan1
:providesho
cls
set /p shodanapikey=Your API key:
set /a shodanapi=1
goto shodan
:shodan1
cls
call :c 0a "your API key is: " &call :c 0d "%shodanapikey%" /n
call :c 0a "IP in cache:     " &call :c 0d "%ipcache%" /n
call :c 0a "Query word:      " &call :c 0d "%qweri%" /n
echo.
call :c 0a "1) set another ip" /n
call :c 0a "2) set query word" /n
call :c 0a "3) global search" /n
call :c 0a "4) global search matches" /n
call :c 0a "5) query token search" /n
call :c 0a "6) see crawler port scans" /n
call :c 0a "7) all ip info" /n
call :c 0a "8) change API" /n
call :c 0a "0) back to menu" /n
echo.
call :c 0d "Parrot"&call :c 0b ":/ "
set /p shodanchoice=
if %shodanchoice% == 0 goto menu
if %shodanchoice% == 1 goto changeipshodan
if %shodanchoice% == 2 goto changequery
if %shodanchoice% == 3 goto gloser
if %shodanchoice% == 4 goto sematches
if %shodanchoice% == 5 goto qweto
if %shodanchoice% == 6 goto crawlerport
if %shodanchoice% == 7 goto allipinfo
if %shodanchoice% == 8 goto newapi
goto shodan1
:changeipshodan
cls
call :c 0a "set up an ip adress" /n
set /p ipcache=
goto shodan1
:changequery
cls
call :c 0a "set another query word" /n
set /p qweri=
goto shodan1
:allipinfo
cls
curl https://api.shodan.io/shodan/host/%ipcache%?key=%shodanapikey%
pause > nul
goto shodan1
:gloser
cls
curl "https://api.shodan.io/shodan/host/search?key=%shodanapikey%&query=%qweri%"
pause > nul
goto shodan1
:sematches
cls
curl "https://api.shodan.io/shodan/host/count?key=%shodanapikey&query=%qweri%"
pause > nul
goto shodan1
:qweto
cls
curl "https://api.shodan.io/shodan/host/search/tokens?key=%shodanapikey%&query=%qweri%"
pause > nul
goto shodan1
:crawlerport
cls
curl https://api.shodan.io/shodan/ports?key=%shodanapikey%
pause > nul
goto shodan1
:newapi
cls
call :c 0a "set another API key" /n
set /p shodanapikey=
goto shodan1

:tracertt
cls
set /p wbst= set a website url:
tracert %wbst%
pause > nul
goto menu
