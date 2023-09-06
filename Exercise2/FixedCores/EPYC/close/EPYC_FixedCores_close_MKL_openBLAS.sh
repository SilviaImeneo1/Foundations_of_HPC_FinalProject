#!/bin/bash
#SBATCH --no-requeue
#SBATCH --job-name="Epyc_FixedCores_close_MKL_open_BLAS"
#SBATCH -n 64
#SBATCH -N 1
#SBATCH --get-user-env
#SBATCH --partition=EPYC
#SBATCH --exclusive
#SBATCH --time=02:00:00
#SBATCH --output="summary.out"

# Load required modules
module load architecture/AMD
module load mkl
module load openBLAS/0.3.23-omp

# Store the current working directory
directory=$(pwd)

# Set OpenMP policy, threads, and binding
policy=close
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
  for lib in openblas mkl; do
    for prec in float double; do
      file="${lib}_${prec}.csv"
      echo "matrix_size,time_mean(s),time_sd,GFLOPS_mean,GFLOPS_sd" > "$file"
    done
  done

  for i in {0..18}; do
    let size=$((2000+1000*$i))
    for lib in openblas mkl; do
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
export OMP_NUM_THREADS=64

run_benchmarks

clean_and_compile ../../.. "$directory"
module purge


