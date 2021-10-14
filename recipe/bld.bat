cd
dir
dir %PREFIX%
dir %PREFIX%\opt

set OOMMF_TCL_CONFIG=%PREFIX%\lib\tclConfig.sh
set OOMMF_TK_CONFIG=%PREFIX%\lib\tkConfig.sh

set OOMMF_ROOT=oommf
set OOMMFTCL=%OOMMF_ROOT%\oommf.tcl

rem mkdir %PREFIX%\opt\oommf
rem xcopy * %PREFIX%\opt\oommf /e

rem # create compiler command with cxx flags
rem export OOMMF_CPP="$cpp_bin -c $CXXFLAGS"

rem test -f "$BUILD_PREFIX/bin/$cpp_bin" || ln -s "$CC" "$BUILD_PREFIX/bin/$cpp_bin"

rem # make sure LDFLAGS are respected
rem # does not seem to have the desired effect
rem sed -i -e '/# START EDIT HERE/a\
rem $config SetValue program_linker_extra_args $env(LDFLAGS)
rem ' oommf/config/platforms/$oommf_platform.tcl

rem # fix possibly incorrect TCL_RANLIB
rem if [[ ! -z "$RANLIB" ]]; then
rem     sed -i -e '/# START EDIT HERE/a\
rem $config SetValue TCL_RANLIB $env(RANLIB)
rem ' oommf/config/platforms/$oommf_platform.tcl
rem fi

rem make build -j${CPU_COUNT}

cd %OOMMF_ROOT%

dir
tclsh oommf.tcl pimake distclean
tclsh oommf.tcl pimake upgrade
tclsh oommf.tcl pimake
tclsh oommf.tcl pimake objclean
dir

rem # remove TCL_RANLIB and program_linker_extra_args from config
rem sed -i -e '/$config SetValue TCL_RANLIB $env(RANLIB)/d' oommf/config/platforms/$oommf_platform.tcl
rem sed -i -e '/$config SetValue program_linker_extra_args $env(LDFLAGS)/d' oommf/config/platforms/$oommf_platform.tcl


rem Copy all OOMMF sources and compiled files into $PREFIX/opt/.
xcopy %SRC_DIR%\oommf %PREFIX%\opt\ /e
dir %PREFIX%\opt\oommf
