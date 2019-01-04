#!/bin/bash

TCLTKVERSION=8.6

# Compile OOMMF.
export OOMMF_TCL_CONFIG=${PREFIX}/lib/tclConfig.sh
export OOMMF_TK_CONFIG=${PREFIX}/lib/tkConfig.sh
ls -la ${BUILD_PREFIX}/bin

# Check compiler.
if [ $GXX ]
then
  IFS=- read -a compiler_full_name <<< $GXX
else
  IFS=- read -a compiler_full_name <<< $CXX
fi

export COMPILER_NAME="${compiler_full_name[-1]}" 
echo $COMPILER_NAME
echo $HOST
ln ${BUILD_PREFIX}/bin/${HOST}-${COMPILER_NAME} ${BUILD_PREFIX}/bin/${COMPILER_NAME}

make build-with-dmi-extension-all

# Copy all OOMMF sources and compiled files into $PREFIX/opt/.
#echo "INSTALL SOFTWARE ======"
#install -d ${PREFIX}/opt/
#install -d ${PREFIX}/bin/
#cp -r ${SRC_DIR}/oommf ${PREFIX}/opt/

# Create an executable called 'oommf' in ${PREFIX}/bin which
# calls the OOMMF executable in $PREFIX/opt/.
#oommf_command=$(cat <<EOF
##! /bin/bash
#export OOMMF_TCL_CONFIG=$PREFIX/lib/tclConfig.sh
#export OOMMF_TK_CONFIG=$PREFIX/lib/tkConfig.sh
#$PREFIX/bin/tclsh${TCLTKVERSION} $PREFIX/opt/oommf/oommf.tcl "\$@"
#EOF
#)
#echo "$oommf_command" > ${PREFIX}/bin/oommf
#chmod a+x ${PREFIX}/bin/oommf
