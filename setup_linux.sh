#!/bin/bash

. "$GITHUB_ACTION_PATH"/trap_err.sh

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
    # already installed
    ;;
  *:gfortran-4.[1-9]|\
  *:gfortran-[5-9]|\
  *:gfortran-[1-9][0-9])
    sudo apt-get update -qq
    sudo apt-get install -y -qq "$INPUT_FORTRAN_COMPILER"
    ;;
esac

echo "FC=gfortran" >>"$GITHUB_ENV"
echo "FPM_FC=gfortran" >>"$GITHUB_ENV"
