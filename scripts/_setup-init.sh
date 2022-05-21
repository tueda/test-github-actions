# shellcheck shell=bash

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

# Normalize inputs.

function normalize_bool() {
  case $1 in
    TRUE|True|true|T|YES|Yes|yes|Y|y|ON|On|on|1)
      echo :
      ;;
    FALSE|False|false|F|NO|No|no|N|n|OFF|Off|off|0)
      echo false
      ;;
    *)
      echo "Error: $2 must be a boolean value: $2=$1">&2
      exit 1
      ;;
  esac
}

INPUT_ENABLE_CC=$(normalize_bool "$INPUT_ENABLE_CC" enable-cc)
INPUT_ENABLE_CXX=$(normalize_bool "$INPUT_ENABLE_CXX" enable-cxx)
INPUT_ENABLE_GCOV=$(normalize_bool "$INPUT_ENABLE_GCOV" enable-gcov)

# Variables for executables.

# shellcheck disable=SC2034
FC=
# shellcheck disable=SC2034
CC=
# shellcheck disable=SC2034
CXX=
# shellcheck disable=SC2034
GCOV=
