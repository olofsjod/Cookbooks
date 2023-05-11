# Installing S4
Notes written by Olof Sjödin <olsj@kth.se> 2023 as part of a PhD project.

## Compiling it on a personal computer.

Do `apt install` of:
```
libmkl-full-dev
liblua5.4-dev
build-essential
```

Edit `Makefile.Linux` and change it to the following:

```
diff --git a/Makefile.Linux b/Makefile.Linux
index b36f349..c3e81df 100644
--- a/Makefile.Linux
+++ b/Makefile.Linux
@@ -1,9 +1,9 @@
 OBJDIR = build
 SHLIB_EXT = so
 SHLIB_FLAGS = -fPIC -shared
-LA_LIBS = -llapack -lblas
-LUA_INC = -I/usr/include/lua5.2
-LUA_LIB = -llua5.2
+LA_LIBS = -llapack64 -lblas64
+LUA_INC = -I/usr/include/lua5.4
+LUA_LIB = -llua5.4
 LUA_MODULE_LIB =
 
 MPI_INC =
```


Compile S4 with `make`. The binary `S4` is in `build/`. One can run it with

`./S4 <inputfile>.lua`

## Compiling S4 on PDC

```
module load PDC/21.09
module load all-spack-modules/0.16.3
module load lua-5.3.5-gcc-11.2.0-ik3ei43
module swap PrgEnv-cray PrgEnv-gnu
```

No need to include the libraries for LAPACK and BLAS - it's already included in the wrapper `cc` (C-compiler) and `CC` (C++-compiler). Modify Makefile.Linux such that it is identical to:

```
OBJDIR = build
SHLIB_EXT = so
SHLIB_FLAGS = -fPIC -shared
LA_LIBS =
LUA_INC = 
LUA_LIB = -llua
LUA_MODULE_LIB =

MPI_INC =
MPI_LIB =

CFLAGS   += -O3 -Wall -march=znver2 -mtune=znver2 -mfma -mavx2 -m3dnow -fomit-frame-pointer -fcx-limited-range -fno-exceptions -fPIC -DHAVE_LIBPTHREAD

CXXFLAGS += -O3 -Wall -march=znver2 -mtune=znver2 -mfma -mavx2 -m3dnow -fomit-frame-pointer -fcx-limited-range -fno-exceptions -fPIC -DHAVE_LIBPTHREAD

# If compiling with MPI, the following must be modified to the proper MPI compilers
CC = cc
CXX = CC

```

We also need to add `#include <unistd.h>` to `main_lua.c`. Then type `make` and the compiled binary is in `build/S4` ready for use.

