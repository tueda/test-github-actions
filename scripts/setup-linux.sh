#!/bin/bash

. "$GITHUB_ACTION_PATH"/scripts/_setup-init.sh

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
    GCC_V=${FC##*-}
    CC=gcc-$GCC_V
    CXX=g++-$GCC_V
    GCOV=gcov-$GCC_V
    ;;
  *:gfortran-4.[1-9]|\
  *:gfortran-[5-9]|\
  *:gfortran-[1-9][0-9])
    FC=$INPUT_FORTRAN_COMPILER
    GCC_V=${FC##*-}
    CC=gcc-$GCC_V
    GCOV=gcov-$GCC_V
    sudo apt-get update -qq
    if $INPUT_ENABLE_CXX; then
      CXX=g++-$GCC_V
      sudo apt-get install -y -qq "$FC" "$CXX"
    else
      sudo apt-get install -y -qq "$FC"
    fi
    ;;
esac

. "$GITHUB_ACTION_PATH"/scripts/_setup-fin.sh
