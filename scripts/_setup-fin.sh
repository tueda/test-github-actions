# shellcheck shell=bash

# Check executables.

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
