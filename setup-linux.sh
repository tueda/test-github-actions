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
    if $INPUT_ENABLE_CXX; then
      sudo apt-get install -y -qq "$INPUT_FORTRAN_COMPILER" "g++-${INPUT_FORTRAN_COMPILER##*-}"
    else
      sudo apt-get install -y -qq "$INPUT_FORTRAN_COMPILER"
    fi
    FC=$INPUT_FORTRAN_COMPILER
    CC=gcc-${FC##*-}
    if $INPUT_ENABLE_CXX; then
      CXX=g++-${FC##*-}
    fi
    GCOV=gcov-${FC##*-}
    ;;
esac

command -v "$FC"
if [[ -n "$CC" ]]; then
  command -v "$CC"
fi
if [[ -n "$CXX" ]]; then
  command -v "$CXX"
fi
if [[ -n "$GCOV" ]]; then
  command -v "$GCOV"
fi

echo "FC=$FC" >>"$GITHUB_ENV"
echo "FPM_FC=$FC" >>"$GITHUB_ENV"
if [[ -n "$CC" ]]; then
  echo "CC=$CC" >>"$GITHUB_ENV"
  echo "FPM_CC=$CC" >>"$GITHUB_ENV"
fi
if [[ -n "$CXX" ]]; then
  echo "CXX=$CXX" >>"$GITHUB_ENV"
fi
if [[ -n "$GCOV" ]]; then
  echo "GCOV=$GCOV" >>"$GITHUB_ENV"
fi
