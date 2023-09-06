#!/bin/bash
#SBATCH --no-requeue
#SBATCH --job-name="Epyc_blis_FixedCores_close"
#SBATCH -n 12
#SBATCH -N 1
#SBATCH --get-user-env
#SBATCH --partition=THIN
#SBATCH --exclusive
#SBATCH --time=02:00:00
#SBATCH --output="summary_4.out"

# Load required modules
module load architecture/Intel
module load openBLAS/0.3.23-omp
# Add BLIS library path to LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/u/dssc/gcosta00/assignment/exercise2/blis/lib:$LD_LIBRARY_PATH

# Store the current working directory
directory=$(pwd)

# Set OpenMP policy, threads, and binding
policy=spread
arch=THIN #architecture

# Function to clean and compile
clean_and_compile() {
  cd "$1"
  make clean loc="$2"
  make all loc="$2"
  cd "$2"
}

# Function to run benchmarks
run_benchmarks() {
  for lib in blis; do
    for prec in float double; do
      file="${lib}_${prec}.csv"
      echo "matrix_size,time_mean(s),time_sd,GFLOPS_mean,GFLOPS_sd" > "$file"
    done
  done

  for size in $(seq 12000 1000 20000); do
    for lib in blis; do
      for prec in float double; do
        echo -n "${size}," >> "${lib}_${prec}.csv"
        "./${lib}_${prec}.x" "$size" "$size" "$size"
      done
    done
  done
}

# Run tasks
clean_and_compile ../../.. "$directory"
cd "$directory"

export OMP_PLACES=cores
export OMP_PROC_BIND="$policy"
export OMP_NUM_THREADS=12
export BLIS_NUM_THREADS=12

run_benchmarks

clean_and_compile ../../.. "$directory"
module purge


