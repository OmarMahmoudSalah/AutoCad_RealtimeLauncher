@echo off
ECHO =============================
ECHO AUTOCAD -22/9/2018
ECHO =============================
ECHO This Project automates running AutoCad With Best Performance Of Your
ECHO PC with ordered commands using your preinstalled tools by 
ECHO Killing most unwanted and cleaning your pc from cache and temp files 
ECHO =============================
ECHO **Created By OmarKwedar**
ECHO Copyrights : Autodesk
ECHO =============================
PAUSE
CLS
del /F /S /Q "%WINDIR%\TEMP\*" 2>NUL
if exist "%ALLUSERSPROFILE%\Microsoft\Search\Data\Temp" rmdir /s /q "%ALLUSERSPROFILE%\Microsoft\Search\Data\Temp"
del /s /f /q %userprofile%\Recent\*.*
del /s /f /q %windir%\Prefetch\*.* 
del /s /f /q %windir%\Temp\*.*
del /s /f /q %windir%\system32\dllcache\*.*    
rd /s /q %windir%\system32\dllcache    
md %windir%\system32\dllcache
del /s /f /q "%USERPROFILE%\Cookies"\*.*    
rd /s /q "%USERPROFILE%\Cookies"    
md "%USERPROFILE%\Cookies"
pause
CLS
Set "whitelist=%whitelist% sihost ACADBeta.exe SynTPHelper mbam dllhost conhost explorer SynTPEnh cmd tasklist taskmgr svchost chrome"
@For /f "skip=3 tokens=1" %%i in (
'TASKLIST /FI "USERNAME eq %userdomain%\%username%" /FI "STATUS eq running" ^| findstr /VI "%whitelist%"'
) Do ( 
taskkill /f /im "%%i" 
)
taskkill /F /IM "chrome.exe">nul 2>&1
taskkill /F /IM "OfficeClickToRun.exe">nul 2>&1
CLS
cd %Systemroot%
C:
cd ..
cd ..
cd ..
start "" /realtime "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\AutoCAD *.*\AutoCAD *.* .lnk" /nologo
start taskmgr.exe
exit