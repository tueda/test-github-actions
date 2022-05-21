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

| Virtual environment | `fortran-compiler` | `enable-cc`        | `enable-cxx`       | `enable-gcov`      |
|---------------------|--------------------|:------------------:|:------------------:|:------------------:|
| `ubuntu-18.04`      | `gfortran-4.8`     | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| `ubuntu-18.04`      | `gfortran-5`       | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| `ubuntu-18.04`      | `gfortran-6`       | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| `ubuntu-18.04`      | `gfortran-7`       | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| `ubuntu-18.04`      | `gfortran-8`       | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| `ubuntu-18.04`      | `gfortran-9`       | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| `ubuntu-18.04`      | `gfortran-10`      | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| `ubuntu-18.04`      | `gfortran-11`      | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| `ubuntu-20.04`      | `gfortran-7`       | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| `ubuntu-20.04`      | `gfortran-8`       | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| `ubuntu-20.04`      | `gfortran-9`       | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| `ubuntu-20.04`      | `gfortran-10`      | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| `ubuntu-20.04`      | `gfortran-11`      | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| `ubuntu-22.04`      | `gfortran-9`       | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| `ubuntu-22.04`      | `gfortran-10`      | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| `ubuntu-22.04`      | `gfortran-11`      | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| `ubuntu-22.04`      | `gfortran-12`      | :white_check_mark: | :white_check_mark: | :white_check_mark: |


## License

MIT
