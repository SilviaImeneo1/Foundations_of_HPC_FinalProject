# Paths to the libraries
MKLROOT := /opt/area/shared/programs/x86/oneAPI/2022.3.1/mkl/2022.2.1
OPENBLASROOT := ${OPENBLAS_ROOT}   #environment variable
BLISROOT := /u/dssc/gcosta00/assignment/exercise2/blis

# Directory where to place compiled executables
loc := build

# Variables for libraries paths and flags needed to link the code with MKL, OpenBLAS, and BLIS
MKL_LIBS := -L$(MKLROOT)/lib/intel64 -lmkl_intel_lp64 -lmkl_gnu_thread -lmkl_core -lgomp -lpthread -ldl
OPENBLAS_LIBS := -L$(OPENBLASROOT)/lib -lopenblas -lpthread
BLIS_LIBS := -L$(BLISROOT)/lib -lblis -lpthread

# Executables that will be generated.
EXECS := mkl_double.x mkl_float.x openblas_double.x openblas_float.x blis_double.x blis_float.x

# Declare the targets `all` and `clean` as "phony" targets: tasks that don't produce files with the corresponding names
.PHONY: all clean

# Specifies the `all` target. By running the command `make all` in the Shell script, it builds all the executables
all: ${EXECS}

# Rules for building each executable
mkl_double.x: gemm.c | $(loc)
    gcc -DUSE_DOUBLE -DMKL $^ -m64 -I$(MKLROOT)/include $(MKL_LIBS) -o $(loc)/$@ -DWRITE_CSV -DMULTIPLE_ITERATIONS -lm

openblas_double.x: gemm.c | $(loc)
    gcc -DUSE_DOUBLE -DOPENBLAS $^ -m64 -I$(OPENBLASROOT)/include $(OPENBLAS_LIBS) -o $(loc)/$@ -fopenmp -lm -DWRITE_CSV -DMULTIPLE_ITERATIONS -lm

blis_double.x: gemm.c | $(loc)
    gcc -DUSE_DOUBLE -DBLIS $^ -m64 -I$(BLISROOT)/include/blis $(BLIS_LIBS) -o $(loc)/$@ -lpthread -lblis -fopenmp -lm -DWRITE_CSV -DMULTIPLE_ITERATIONS -lm

mkl_float.x: gemm.c | $(loc)
    gcc -DUSE_FLOAT -DMKL $^ -m64 -I$(MKLROOT)/include $(MKL_LIBS) -o $(loc)/$@ -DWRITE_CSV -DMULTIPLE_ITERATIONS -lm

openblas_float.x: gemm.c | $(loc)
    gcc -DUSE_FLOAT -DOPENBLAS $^ -m64 -I$(OPENBLASROOT)/include $(OPENBLAS_LIBS) -o $(loc)/$@ -fopenmp -lm -DWRITE_CSV -DMULTIPLE_ITERATIONS -lm

blis_float.x: gemm.c | $(loc)
    gcc -DUSE_FLOAT -DBLIS $^ -m64 -I$(BLISROOT)/include/blis $(BLIS_LIBS) -o $(loc)/$@ -lpthread -lblis -fopenmp -lm -DWRITE_CSV -DMULTIPLE_ITERATIONS -lm


# Ensures that $(loc) directory exists, else creates it
$(loc):
	mkdir -p $(loc)
	
# Removes all executables from $(loc) directory
clean:
	rm -rf $(loc)/*.x

