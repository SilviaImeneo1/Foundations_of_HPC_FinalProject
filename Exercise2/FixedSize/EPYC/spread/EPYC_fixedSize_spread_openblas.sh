#!/bin/bash
#SBATCH --no-requeue
#SBATCH --job-name="EPYC_FixedSize_spread_openblas"
#SBATCH -n 128
#SBATCH -N 1
#SBATCH --get-user-env
#SBATCH --partition=EPYC
#SBATCH --exclusive
#SBATCH --time=02:00:00
#SBATCH --output="summary_3.out"

# Load required modules
module load architecture/AMD
module load mkl
module load openBLAS/0.3.23-omp

# Add BLIS library path to LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/u/dssc/gcosta00/assignment/exercise2/blis/lib:$LD_LIBRARY_PATH

# Store the current working directory
directory=$(pwd)

# Set OpenMP policy, threads, and binding
policy=spread
arch=EPYC #architecture

# Function to clean and compile
clean_and_compile() {
  cd "$1"
  make clean loc="$2"
  make all loc="$2"
  cd "$2"
}

# Function to run benchmarks
run_benchmarks() {
  for lib in openblas; do
    for prec in float double; do
      file="${lib}_${prec}.csv"
      echo "num_cores,time_mean(s),time_sd,GFLOPS_mean,GFLOPS_sd" > "$file"
    done
  done

  for cores in $(seq 2 2 128); do
    for lib in openblas; do
      for prec in float double; do
        echo -n "${cores}," >> "${lib}_${prec}.csv"
        export OMP_PLACES=cores
        export OMP_PROC_BIND="$policy"
        export OMP_NUM_THREADS="$cores"
        "./${lib}_${prec}.x" "10000" "10000" "10000"
      done
    done
  done
}

# Run tasks
clean_and_compile ../../.. "$directory"
cd "$directory"

run_benchmarks

clean_and_compile ../../.. "$directory"
module purge

