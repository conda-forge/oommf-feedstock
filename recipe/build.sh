#!/bin/bash

# Compile OOMMF.
export OOMMF_TCL_CONFIG=${PREFIX}/lib/tclConfig.sh
export OOMMF_TK_CONFIG=${PREFIX}/lib/tkConfig.sh

# ensure compiler executables exist in build prefix
# due to invalid assumptions about compiler executable names
# in oommf build config
if [[ "$(uname)" == "Darwin" ]]; then
  cpp_bin="clang++"
  oommf_platform="darwin"
else
  cpp_bin="g++"
  oommf_platform="linux-x86_64"
  export LDFLAGS="-lm -lz -D_GLIBCXX_USE_CXX11_ABI=0 $LDFLAGS"
  # oommf does some linking without extra_, so include them in CXXFLAGS
  export CXXFLAGS="$CXXFLAGS $LDFLAGS"
  export LDFLAGS="$LDFLAGS -lstdc++"
fi
# scrub debug-prefix-map which causes problems
export CXXFLAGS=$(echo ${CXXFLAGS:-} | sed -E 's@\-fdebug\-prefix\-map[^ ]*@@g')
# create compiler command with cxx flags
export OOMMF_CPP="$cpp_bin -c $CXXFLAGS"

test -f "$BUILD_PREFIX/bin/$cpp_bin" || ln -s "$CC" "$BUILD_PREFIX/bin/$cpp_bin"

# make sure LDFLAGS are respected
sed -i -e '/# START EDIT HERE/a\
$config SetValue program_linker_extra_args $env(LDFLAGS)
' oommf/config/platforms/$oommf_platform.tcl

# fix possibly incorrect TCL_RANLIB
if [[ ! -z "$RANLIB" ]]; then
    sed -i -e '/# START EDIT HERE/a\
$config SetValue TCL_RANLIB $env(RANLIB)
' oommf/config/platforms/$oommf_platform.tcl
fi

make build -j${CPU_COUNT}

# remove TCL_RANLIB and program_linker_extra_args from config
sed -i -e '/$config SetValue TCL_RANLIB $env(RANLIB)/d' oommf/config/platforms/$oommf_platform.tcl
sed -i -e '/$config SetValue program_linker_extra_args $env(LDFLAGS)/d' oommf/config/platforms/$oommf_platform.tcl


# Copy all OOMMF sources and compiled files into $PREFIX/opt/.
#echo "INSTALL SOFTWARE ======"
install -d ${PREFIX}/opt/
install -d ${PREFIX}/bin/
cp -r ${SRC_DIR}/oommf ${PREFIX}/opt/
find ${PREFIX}/opt/oommf -name '*.o' -exec rm {} \;

# Create an executable called 'oommf' in ${PREFIX}/bin which
# calls the OOMMF executable in $PREFIX/opt/.
cat > ${PREFIX}/bin/oommf <<EOF
#! /bin/bash
export OOMMF_TCL_CONFIG=$PREFIX/lib/tclConfig.sh
export OOMMF_TK_CONFIG=$PREFIX/lib/tkConfig.sh
$PREFIX/bin/tclsh $PREFIX/opt/oommf/oommf.tcl "\$@"
EOF
chmod a+x ${PREFIX}/bin/oommf
