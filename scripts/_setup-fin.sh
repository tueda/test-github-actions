# shellcheck shell=bash

# Check executables.

if command -v "$FC"; then :;else
  echo "Error: Fortran compiler not installed: fortran-compiler=$INPUT_FORTRAN_COMPILER" >&2
  exit 1
fi

if $INPUT_ENABLE_CC; then
  if command -v "$CC"; then :;else
    echo "Error: C compiler not installed: fortran-compiler=$INPUT_FORTRAN_COMPILER" >&2
    exit 1
  fi
fi

if $INPUT_ENABLE_CXX; then
  if command -v "$CXX"; then :;else
    echo "Error: C++ compiler not installed: fortran-compiler=$INPUT_FORTRAN_COMPILER" >&2
    exit 1
  fi
fi

if $INPUT_ENABLE_GCOV; then
  if command -v "$GCOV"; then :;else
    echo "Error: gcov not installed: fortran-compiler=$INPUT_FORTRAN_COMPILER" >&2
    exit 1
  fi
fi

# Print executable paths and versions.

command -v "$FC"
$FC --version
if [[ -n "$CC" ]]; then
  command -v "$CC"
  $CC --version
fi
if [[ -n "$CXX" ]]; then
  command -v "$CXX"
  $CXX --version
fi
if [[ -n "$GCOV" ]]; then
  command -v "$GCOV"
  $GCOV --version
fi

# Export environment variables.

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
