# Compiler options
CC := gcc
CFLAGS := -m64 -fopenmp -lm -DWRITE_CSV -DMULTIPLE_ITERATIONS

# Libraries
MKLROOT := ${MKLROOT}
OPENBLASROOT := ${OPENBLAS_ROOT}
BLISROOT := /u/dssc/simene00//myblis

MKL_LIBS := -L$(MKLROOT)/lib/intel64 -lmkl_intel_lp64 -lmkl_gnu_thread -lmkl_core -lgomp -lpthread -ldl
OPENBLAS_LIBS := -L$(OPENBLASROOT)/lib -lopenblas -lpthread
BLIS_LIBS := -L$(BLISROOT)/lib -lblis -lpthread

# Executables
EXECS := mkl_double.x mkl_float.x openblas_double.x openblas_float.x blis_double.x blis_float.x

# Source file
SRC := gemm.c

# Build directory
BUILD_DIR := build

# Default target
all: $(EXECS)

# Rules for compiling executables
$(EXECS): $(SRC)
        $(CC) $(CFLAGS) $(patsubst %.x, -DUSE_%,$@) -I$(if $(filter mkl%,$@),
        $(MKLROOT)/include, $(if $(filter openblas%,$@),
        $(OPENBLASROOT)/include,
        $(BLISROOT)/include/blis)) $(patsubst %.x, -L$(if $(filter mkl%,$@),
        $(MKLROOT)/lib/intel64, $(if $(filter openblas%,$@),
        $(OPENBLASROOT)/lib, $(BLISROOT)/lib)),$(LIBS)) $^ -o $(BUILD_DIR)/$@

# Clean rule
clean:
      	rm -rf $(BUILD_DIR)/*.x

# Phony targets
.PHONY: all clean
