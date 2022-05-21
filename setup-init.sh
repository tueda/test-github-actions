#!/bin/bash

set -eu
set -o pipefail

# Trap ERR to print the stack trace when a command fails.
# See: https://gist.github.com/ahendrix/7030300
function _errexit() {
  local err=$?
  set +o xtrace
  local code="${1:-1}"
  echo "Error in ${BASH_SOURCE[1]}:${BASH_LINENO[0]}: '${BASH_COMMAND}' exited with status $err" >&2
  # Print out the stack trace described by $FUNCNAME
  if [ ${#FUNCNAME[@]} -gt 2 ]; then
    echo "Traceback:" >&2
    for ((i=1;i<${#FUNCNAME[@]}-1;i++)); do
      echo "  [$i]: at ${BASH_SOURCE[$i+1]}:${BASH_LINENO[$i]} in function ${FUNCNAME[$i]}" >&2
    done
  fi
  echo "Exiting with status ${code}" >&2
  exit "${code}"
}
trap '_errexit' ERR
set -o errtrace

# Normalize inputs

case $INPUT_ENABLE_CC in
  true|True|TRUE|Yes|yes|1)
    INPUT_ENABLE_CC=:
    ;;
  false|False|FALSE|No|no|0)
    INPUT_ENABLE_CC=false
    ;;
  *)
    echo "enable-cc must be a boolean value: $INPUT_ENABLE_CC">&2
    exit 1
    ;;
esac

case $INPUT_ENABLE_CXX in
  true|True|TRUE|Yes|yes|1)
    INPUT_ENABLE_CXX=:
    ;;
  false|False|FALSE|No|no|0)
    INPUT_ENABLE_CXX=false
    ;;
  *)
    echo "enable-cxx must be a boolean value: $INPUT_ENABLE_CXX">&2
    exit 1
    ;;
esac

case $INPUT_ENABLE_GCOV in
  true|True|TRUE|Yes|yes|1)
    INPUT_ENABLE_GCOV=:
    ;;
  false|False|FALSE|No|no|0)
    INPUT_ENABLE_GCOV=false
    ;;
  *)
    echo "enable-gcov must be a boolean value: $INPUT_ENABLE_GCOV">&2
    exit 1
    ;;
esac
