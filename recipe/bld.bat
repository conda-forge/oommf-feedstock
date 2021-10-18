cd
dir
dir %PREFIX%

set OOMMF_TCL_CONFIG=%PREFIX%\Library\lib\tclConfig.sh
set OOMMF_TK_CONFIG=%PREFIX%\Library\lib\tkConfig.sh

set OOMMF_ROOT=%cd%\oommf
set OOMMFTCL=%OOMMF_ROOT%\oommf.tcl

cd %OOMMF_ROOT%

tclsh %OOMMFTCL% pimake distclean
if errorlevel 1 exit 1

tclsh %OOMMFTCL% pimake upgrade
if errorlevel 1 exit 1

tclsh %OOMMFTCL% pimake
if errorlevel 1 exit 1

tclsh %OOMMFTCL% pimake objclean
if errorlevel 1 exit 1

rem Copy all OOMMF sources and compiled files into %PREFIX%\opt\.
mkdir %PREFIX%\Library\opt\oommf
if errorlevel 1 exit 1

xcopy %SRC_DIR%\oommf %PREFIX%\Library\opt\oommf /e
if errorlevel 1 exit 1

rem Create executable
mkdir %PREFIX%\Library\bin\

echo set OOMMF_TCL_CONFIG=%PREFIX%\Library\lib\tclConfig.sh> %PREFIX%\Library\bin\oommf.bat
echo set OOMMF_TK_CONFIG=%PREFIX%\Library\lib\tkConfig.sh>> %PREFIX%\Library\bin\oommf.bat
echo %PREFIX%\Library\bin\tclsh %PREFIX%\Library\opt\oommf\oommf.tcl %*>> %PREFIX%\Library\bin\oommf.bat
