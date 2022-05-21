# setup-fortran

This action installs a Fortran compiler and adequately sets environment variables
`FC`, `CC`, `CXX`, `GCOV`, `FPM_FC` and `FPM_CC`.


## Options

**`fortran-compiler`** (optional, default: `latest`):
the Fortran compiler to install. See the table below.

**`enable-cc`** (optional, default: `false`):
Install also the C compiler compatible with the Fortran compiler.

**`enable-cxx`** (optional, default: `false`):
Install also the C++ compiler compatible with the Fortran compiler.

**`enable-gcov`** (optional, default: `false`):
Install also gcov compatible with the Fortran compiler.


## Compilers

| Virtual environment | `fortran-compiler` | `enable-cc`        | `enable-cxx`       | `enable-gcov`      | Notes                                                  |
|---------------------|--------------------|:------------------:|:------------------:|:------------------:|--------------------------------------------------------|
| `ubuntu-18.04`      | `gfortran-4.8`     | :white_check_mark: | :white_check_mark: | :white_check_mark: | Ubuntu 4.8.5-4ubuntu8                                  |
| `ubuntu-18.04`      | `gfortran-5`       | :white_check_mark: | :white_check_mark: | :white_check_mark: | Ubuntu 5.5.0-12ubuntu1                                 |
| `ubuntu-18.04`      | `gfortran-6`       | :white_check_mark: | :white_check_mark: | :white_check_mark: | Ubuntu 6.5.0-2ubuntu1~18.04                            |
| `ubuntu-18.04`      | `gfortran-7`       | :white_check_mark: | :white_check_mark: | :white_check_mark: | Ubuntu 7.5.0-3ubuntu1~18.04, pre-installed, default    |
| `ubuntu-18.04`      | `gfortran-8`       | :white_check_mark: | :white_check_mark: | :white_check_mark: | Ubuntu 8.4.0-1ubuntu1~18.04                            |
| `ubuntu-18.04`      | `gfortran-9`       | :white_check_mark: | :white_check_mark: | :white_check_mark: | Ubuntu 9.4.0-1ubuntu1~18.04, pre-installed             |
| `ubuntu-18.04`      | `gfortran-10`      | :white_check_mark: | :white_check_mark: | :white_check_mark: | Ubuntu 10.3.0-1ubuntu1~18.04~1, pre-installed          |
| `ubuntu-18.04`      | `gfortran-11`      | :white_check_mark: | :white_check_mark: | :white_check_mark: | Ubuntu 11.1.0-1ubuntu1~18.04.1, latest                 |
| `ubuntu-20.04`      | `gfortran-7`       | :white_check_mark: | :white_check_mark: | :white_check_mark: | Ubuntu 7.5.0-6ubuntu2                                  |
| `ubuntu-20.04`      | `gfortran-8`       | :white_check_mark: | :white_check_mark: | :white_check_mark: | Ubuntu 8.4.0-3ubuntu2                                  |
| `ubuntu-20.04`      | `gfortran-9`       | :white_check_mark: | :white_check_mark: | :white_check_mark: | Ubuntu 9.4.0-1ubuntu1~20.04.1, pre-installed, default  |
| `ubuntu-20.04`      | `gfortran-10`      | :white_check_mark: | :white_check_mark: | :white_check_mark: | Ubuntu 10.3.0-1ubuntu1~20.04, pre-installed            |
| `ubuntu-20.04`      | `gfortran-11`      | :white_check_mark: | :white_check_mark: | :white_check_mark: | Ubuntu 11.1.0-1ubuntu1~20.04, latest                   |
| `ubuntu-22.04`      | `gfortran-9`       | :white_check_mark: | :white_check_mark: | :white_check_mark: | Ubuntu 9.4.0-5ubuntu1, pre-installed                   |
| `ubuntu-22.04`      | `gfortran-10`      | :white_check_mark: | :white_check_mark: | :white_check_mark: | Ubuntu 10.3.0-15ubuntu1, pre-installed                 |
| `ubuntu-22.04`      | `gfortran-11`      | :white_check_mark: | :white_check_mark: | :white_check_mark: | Ubuntu 11.2.0-19ubuntu1, pre-installed, default        |
| `ubuntu-22.04`      | `gfortran-12`      | :white_check_mark: | :white_check_mark: | :white_check_mark: | Ubuntu 12-20220319-1ubuntu1, latest                    |
| `macos-10.15`       | `gfortran-9`       | :white_check_mark: | :white_check_mark: | :white_check_mark: | Homebrew GCC 9.4.0, pre-installed                      |
| `macos-10.15`       | `gfortran-10`      | :white_check_mark: | :white_check_mark: | :white_check_mark: | Homebrew GCC 10.3.0, pre-installed                     |
| `macos-10.15`       | `gfortran-11`      | :white_check_mark: | :white_check_mark: | :white_check_mark: | Homebrew GCC 11.3.0, pre-installed, latest             |
| `windows-2019`      |

## License

MIT
