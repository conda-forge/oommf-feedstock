#!/bin/bash

TCLTKVERSION=8.6

# Compile OOMMF.
export OOMMF_TCL_CONFIG=/opt/conda/lib/tclConfig.sh
export OOMMF_TK_CONFIG=/opt/conda/lib/tkConfig.sh

# Check compiler.
if [ $GXX ]
then
  # Linux
  echo "LS -LA LIB"
  #ls -la /opt/conda/lib
  echo "TCL CONFIG"
  more /opt/conda/lib/tclConfig.sh
  IFS=- read -a compiler_full_name <<< $GXX
  export COMPILER_NAME=g++ 
  ln ${BUILD_PREFIX}/bin/${HOST}-${COMPILER_NAME} ${BUILD_PREFIX}/bin/${COMPILER_NAME}
  ln ${BUILD_PREFIX}/bin/${HOST}-ld ${BUILD_PREFIX}/bin/ld
  echo "RANLIB"
  echo ${BUILD_PREFIX}/bin/${HOST}-ranlib
  mkdir -p /home/conda/feedstock_root/build_artifacts/tk_1542322308353/_build_env/bin/
  ln ${BUILD_PREFIX}/bin/${HOST}-ranlib /home/conda/feedstock_root/build_artifacts/tk_1542322308353/_build_env/bin/${HOST}-ranlib
  echo "LS -LA OOMMF"
  #ls -la oommf
  tclsh oommf/oommf.tcl +platform
else
  # MacOS
  IFS=- read -a compiler_full_name <<< $CXX
  export COMPILER_NAME=clang++
  echo $COMPILER_NAME
fi

make build-with-dmi-extension-all

# Copy all OOMMF sources and compiled files into $PREFIX/opt/.
echo "INSTALL SOFTWARE ======"
export PREFIX2=/opt/oommf
install -d ${PREFIX2}/opt/
install -d ${PREFIX2}/bin/
cp -r ${SRC_DIR}/oommf ${PREFIX2}/opt/

# Create an executable called 'oommf' in ${PREFIX2}/bin which
# calls the OOMMF executable in $PREFIX2/opt/.
oommf_command=$(cat <<EOF
#! /bin/bash
export OOMMF_TCL_CONFIG=/opt/conda/lib/tclConfig.sh
export OOMMF_TK_CONFIG=/opt/conda/lib/tkConfig.sh
/opt/conda/bin/tclsh${TCLTKVERSION} $PREFIX2/opt/oommf/oommf.tcl "\$@"
EOF
)
echo "$oommf_command" > ${PREFIX2}/bin/oommf
chmod a+x ${PREFIX2}/bin/oommf
