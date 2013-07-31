@echo off
mode con:cols=50 lines=20
popd
title xml2html

:Titlepage
cls
echo.
echo 		  xml2html UI:
echo 	===============================
echo.
echo 	1. Validate + XSLT 
echo.
echo 	2. XSLT only
echo.
echo.
echo [q]= EXIT
choice /c:12q3456789abcdefghijklmnoprstuvwxyz /N 
IF ERRORLEVEL 4 GOTO err
IF ERRORLEVEL 3 GOTO END
IF ERRORLEVEL 2 GOTO page2
IF ERRORLEVEL 1 GOTO page1
GOTO END

:page1
cls
set "CDIR=%~dp0"
set "CDIR=%CDIR:~0,-1%"
for /R "%CDIR%\" %%G in (*F.xml) do (
set id=%%~nG)
set id=%id:~0,-5%
echo.
echo Validation in progress
echo.
xmllint -htmlout -valid -noout "%CDIR%\%id%_tagF.xml" >> "%CDIR%\%id%_report.html" 2>&1
echo. 
echo xml2html transformation
echo.
copy "%CDIR%\%id%_tagF.xml" "%CDIR%\%id%_tagFtemp.xml"
cscript C:\xml\removeDTD.vbs "" "" "%CDIR%\%id%_tagFtemp.xml"
java -cp C:\xml\Saxon9\saxon9.jar net.sf.saxon.Transform -versionmsg:off -s:"%CDIR%\%id%_tagFtemp.xml"  -xsl:C:\xml\xml2html\xml2html-pipeline.xsl -o:"%CDIR%\%id%.html"
del "%CDIR%\%id%_tagFtemp.xml"
echo.
echo To go back, hit any key...
@pause > NUL
goto Titlepage

:page2
cls
echo.
echo 		  HTML pipeline:
echo 	===============================
echo.
echo 	1. Plain HTML
echo 	2. Extended HTML
echo 	3. mData enriched HTML
echo 	4. ePub
echo.
echo [i]= INFO
echo [b]= BACK
echo [q]= EXIT
echo.
set /p choice=Choose pipeline and hit enter 
if '%choice%'=='' goto page2
if '%choice%'=='1' goto page2a
if '%choice%'=='2' goto page2b
if '%choice%'=='3' goto page2c
if '%choice%'=='4' goto page2d
if '%choice%'=='i' goto infopage
if '%choice%'=='b' goto Titlepage
if '%choice%'=='q' goto END
GOTO err

:page2a
set "CDIR=%~dp0"
set "CDIR=%CDIR:~0,-1%"
for /R "%CDIR%\" %%G in (*F.xml) do (
set id=%%~nG)
set id=%id:~0,-5%
echo.
echo Plain HTML
echo.
copy "%CDIR%\%id%_tagF.xml" "%CDIR%\%id%_tagFtemp.xml"
cscript C:\xml\removeDTD.vbs "" "" "%CDIR%\%id%_tagFtemp.xml"
java -cp C:\xml\Saxon9\saxon9.jar net.sf.saxon.Transform -versionmsg:off -s:"%CDIR%\%id%_tagFtemp.xml"  -xsl:C:\xml\xml2html\xml2html-pipeline.xsl -o:"%CDIR%\%id%.html"
del "%CDIR%\%id%_tagFtemp.xml"
echo.
echo To go back, hit any key...
@pause > NUL
goto Titlepage

:page2b
set "CDIR=%~dp0"
set "CDIR=%CDIR:~0,-1%"
for /R "%CDIR%\" %%G in (*F.xml) do (
set id=%%~nG)
set id=%id:~0,-5%
echo.
echo Extended HTML
echo.
copy "%CDIR%\%id%_tagF.xml" "%CDIR%\%id%_tagFtemp.xml"
cscript C:\xml\removeDTD.vbs "" "" "%CDIR%\%id%_tagFtemp.xml"
java -cp C:\xml\Saxon9\saxon9.jar net.sf.saxon.Transform -versionmsg:off -s:"%CDIR%\%id%_tagFtemp.xml"  -xsl:C:\xml\xml2html\xml2html-pipeline.xsl -o:"%CDIR%\%id%.html"
del "%CDIR%\%id%_tagFtemp.xml"
echo.
echo To go back, hit any key...
@pause > NUL
goto Titlepage

:page2c
set "CDIR=%~dp0"
set "CDIR=%CDIR:~0,-1%"
for /R "%CDIR%\" %%G in (*F.xml) do (
set id=%%~nG)
set id=%id:~0,-5%
echo.
echo mData enriched HTML
echo.
copy "%CDIR%\%id%_tagF.xml" "%CDIR%\%id%_tagFtemp.xml"
cscript C:\xml\removeDTD.vbs "" "" "%CDIR%\%id%_tagFtemp.xml"
java -cp C:\xml\Saxon9\saxon9.jar net.sf.saxon.Transform -versionmsg:off -s:"%CDIR%\%id%_tagFtemp.xml"  -xsl:C:\xml\xml2html\xml2html-pipeline.xsl -o:"%CDIR%\%id%.html"
del "%CDIR%\%id%_tagFtemp.xml"
echo.
echo To go back, hit any key...
@pause > NUL
goto Titlepage

:page2d
set "CDIR=%~dp0"
set "CDIR=%CDIR:~0,-1%"
for /R "%CDIR%\" %%G in (*F.xml) do (
set id=%%~nG)
set id=%id:~0,-5%
echo.
echo ePub
echo.
copy "%CDIR%\%id%_tagF.xml" "%CDIR%\%id%_tagFtemp.xml"
cscript C:\xml\removeDTD.vbs "" "" "%CDIR%\%id%_tagFtemp.xml"
java -cp C:\xml\Saxon9\saxon9.jar net.sf.saxon.Transform -versionmsg:off -s:"%CDIR%\%id%_tagFtemp.xml"  -xsl:C:\xml\xml2html\xml2html-pipeline.xsl -o:"%CDIR%\%id%.html"
del "%CDIR%\%id%_tagFtemp.xml"
echo.
echo To go back, hit any key...
@pause > NUL
goto Titlepage

:infopage
cls
echo Documentation about pipelining options (in progress)
echo.
@pause > NUL
GOTO page2

:err
cls
echo Error navigating UI, go back!
@pause > NUL
goto Titlepage

:END
exit

