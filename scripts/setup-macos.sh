#!/bin/bash

. "$GITHUB_ACTION_PATH"/scripts/_setup-init.sh

case $(sw_vers -productVersion) in
  10.15.*)
    OS_VERSION=10.15
    ;;
  11.*)
    OS_VERSION=11
    ;;
  12.*)
    OS_VERSION=12
    ;;
esac

if [[ $INPUT_FORTRAN_COMPILER == latest ]]; then
  case $OS_VERSION in
    10.15)
      INPUT_FORTRAN_COMPILER=gfortran-11
      ;;
    11)
      INPUT_FORTRAN_COMPILER=gfortran-11
      ;;
    12)
      INPUT_FORTRAN_COMPILER=gfortran-11
      ;;
  esac
fi

case $OS_VERSION:$INPUT_FORTRAN_COMPILER in
  10.15:gfortran-9|\
  10.15:gfortran-10|\
  10.15:gfortran-11|\
  11:gfortran-9|\
  11:gfortran-10|\
  11:gfortran-11|\
  12:gfortran-11)
    # pre-installed
    FC=$INPUT_FORTRAN_COMPILER
    GCC_V=${FC##*-}
    CC=gcc-$GCC_V
    CXX=g++-$GCC_V
    GCOV=gcov-$GCC_V
    ;;
  *:gfortran-[5-9]|\
  *:gfortran-[1-9][0-9])
    export HOMEBREW_NO_ANALYTICS=ON
    export HOMEBREW_NO_AUTO_UPDATE=ON
    export HOMEBREW_NO_BOTTLE_SOURCE_FALLBACK=ON
    export HOMEBREW_NO_GITHUB_API=ON
    export HOMEBREW_NO_INSTALL_CLEANUP=ON
    FC=$INPUT_FORTRAN_COMPILER
    GCC_V=${FC##*-}
    CC=gcc-$GCC_V
    CXX=g++-$GCC_V
    GCOV=gcov-$GCC_V
    brew install gcc@$GCC_V || brew upgrade gcc@$GCC_V || :
    brew link gcc@$GCC_V
    ;;
esac

. "$GITHUB_ACTION_PATH"/scripts/_setup-fin.sh
