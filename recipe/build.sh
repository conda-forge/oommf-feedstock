#!/bin/bash

TCLTKVERSION=8.6

# Compile OOMMF.
export OOMMF_TCL_CONFIG=${SYS_PREFIX}/lib/tclConfig.sh
export OOMMF_TK_CONFIG=${SYS_PREFIX}/lib/tkConfig.sh
make build-with-dmi-extension-all

# Copy all OOMMF sources and compiled files into $PREFIX/opt/.
echo "INSTALL SOFTWARE ======"
install -d ${SYS_PREFIX}/opt/
install -d ${SYS_PREFIX}/bin/
cp -r ${SRC_DIR}/oommf ${SYS_PREFIX}/opt/

# Create an executable called 'oommf' in ${PREFIX}/bin which
# calls the OOMMF executable in $PREFIX/opt/.
oommf_command=$(cat <<EOF
#! /bin/bash
export OOMMF_TCL_CONFIG=$SYS_PREFIX/lib/tclConfig.sh
export OOMMF_TK_CONFIG=$SYS_PREFIX/lib/tkConfig.sh
$PREFIX/bin/tclsh${TCLTKVERSION} $SYS_PREFIX/opt/oommf/oommf.tcl "\$@"
EOF
)
echo "$oommf_command" > ${SYS_PREFIX}/bin/oommf
chmod a+x ${SYS_PREFIX}/bin/oommf
