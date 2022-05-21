#!/bin/bash

. "$GITHUB_ACTION_PATH"/setup-init.sh

OS_VERSION=$(lsb_release -rs)

if [[ $INPUT_FORTRAN_COMPILER == default ]]; then
  case $OS_VERSION in
    18.04)
      INPUT_FORTRAN_COMPILER=gfortran-7
      ;;
    20.04)
      INPUT_FORTRAN_COMPILER=gfortran-9
      ;;
    22.04)
      INPUT_FORTRAN_COMPILER=gfortran-11
      ;;
  esac
fi

if [[ $INPUT_FORTRAN_COMPILER == latest ]]; then
  case $OS_VERSION in
    18.04)
      INPUT_FORTRAN_COMPILER=gfortran-11
      ;;
    20.04)
      INPUT_FORTRAN_COMPILER=gfortran-11
      ;;
    22.04)
      INPUT_FORTRAN_COMPILER=gfortran-12
      ;;
  esac
fi

case $OS_VERSION:$INPUT_FORTRAN_COMPILER in
  18.04:gfortran-7|\
  18.04:gfortran-9|\
  18.04:gfortran-10|\
  20.04:gfortran-9|\
  20.04:gfortran-10|\
  22.04:gfortran-9|\
  22.04:gfortran-10|\
  22.04:gfortran-11)
    # pre-installed
    FC=$INPUT_FORTRAN_COMPILER
    CC=gcc-${FC##*-}
    CXX=g++-${FC##*-}
    GCOV=gcov-${FC##*-}
    ;;
  *:gfortran-4.[1-9]|\
  *:gfortran-[5-9]|\
  *:gfortran-[1-9][0-9])
    sudo apt-get update -qq
    sudo apt-get install -y -qq "$INPUT_FORTRAN_COMPILER"
    FC=$INPUT_FORTRAN_COMPILER
    CC=gcc-${FC##*-}
    GCOV=gcov-${FC##*-}
    ;;
esac

command -v "$FC"
command -v "$CC"
command -v "$GCOV"

echo "FC=$FC" >>"$GITHUB_ENV"
echo "FPM_FC=$FC" >>"$GITHUB_ENV"
echo "GCOV=$GCOV" >>"$GITHUB_ENV"
