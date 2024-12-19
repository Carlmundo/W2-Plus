@echo off
set lang[0,code]=de
set lang[0,name]=German
set lang[1,code]=es
set lang[1,name]=Spanish
set lang[2,code]=es-419
set lang[2,name]=Spanish (Latin America)
set lang[3,code]=fr
set lang[3,name]=French
set lang[4,code]=it
set lang[4,name]=Italian
set lang[5,code]=nl
set lang[5,name]=Dutch
set lang[6,code]=pl
set lang[6,name]=Polish
set lang[7,code]=pt-br
set lang[7,name]=Portuguese (Brazil)
set lang[8,code]=ru
set lang[8,name]=Russian
set lang[9,code]=sv
set lang[9,name]=Swedish
set lang[10,code]=pt
set lang[10,name]=Portuguese
set lang[11,code]=cs
set lang[11,name]=Czech

echo Deleting existing translated frontends...
echo.
for /L %%i in (0,1,11) do call del "..\Patch\Languages\%%lang[%%i,name]%%\frontend.exe" /s

echo.
echo Writing new frontends...
set rh="D:\Apps\Resource Hacker\ResourceHacker.exe"
for /L %%i in (0,1,11) do call %rh% -script "%%lang[%%i,code]%%.txt"
for /L %%i in (0,1,11) do call find "Success!" "Logs\%%lang[%%i,code]%%.log" /c
pause