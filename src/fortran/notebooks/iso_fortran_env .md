# iso_fortran_env intrinsic

*Last edited: 2024-11-27*

Based on: https://fortranwiki.org/fortran/show/iso_fortran_env

## compiler_options intrinsic


```python
%%writefile compoptiintr.f90
use iso_fortran_env
print '(4a)', 'This file was compiled by ', &
              compiler_version(), ' using the options ', &
              compiler_options()
end
```

    Writing compoptiintr.f90



```python
! gfortran compoptiintr.f90 && ./a.out
```

    This file was compiled by GCC version 11.4.0 using the options -mtune=generic -march=x86-64 -fpre-include=/usr/include/finclude/math-vector-fortran.h

