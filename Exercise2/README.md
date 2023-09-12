# Exercise 2

## Table of contents
* [General info](#general-info)
* [Included files](#included-files)
* [How to run jobs](#how-to-run-jobs)

## General info
This directory contains the files needed to work on the Exercise 2 of the final assignment of the course of FHPC. You'll find a brief explanation of the files and then the instructions to be followed to replicate our results.

## Included files
In the root directory, you can find the files:
* `gemm.c`: it's the source to iteratively execute the gemm function, to measure its performance, and to store its results in csv files.
* 'Makefile': the Makefile to compile `gemm.c` with the three libraries MKL, OpenBLAS and BLIS. It includes rules for building the executable for both single and double precision.
* `FixedCores/`: it's the directory that contains the results of the execution of the `gemm.c` function when scaling over the size of the matrix.
* `FixedSize/`: it's the directory that contains the results of the execution of the `gemm.c` function when scaling over the number of cores.

Both the `FixedCores/` and the `FixedSize` directories are structured as follow:
* EPYC
  * close
  * spread
* THIN
  * close
  * spread

Each of the four final directories includes:
* one or more `.sh` file. When we could not execute the three libraries together within the allowed 2 hours, we prepared multiple `.sh` files to execute them separatly.
* several `.csv` files with the results that we obtained when measuring the performance of the libraries.
Reading the name of each `.sh` and `.csv` file should be enough to have a clear understanding of the applied configuration. For example, `EPYC_FixedCores_close_MKL_openBLAS.sh` is the shell script for the libraries MKL and openBLAS, run using a close thread allocation policy, when scaling over the size of the matrix, using EPYC nodes.

## How to run jobs
The files included in this repository are written to use the resources of the cluster ORFEO (at Area Science Park in Trieste), which uses SLURM as resource manager.
To replicate our results, we invite you to:
1. Connect to ORFEO
2. Clone this repository
3. Install the BLIS library and edit its path in the Makefile
4. Navigate to the folder of interest based on the configuration that you want to test, until you get to the level of the `.sh` file
5. Call `sbatch 'name_of_.sh_file'`

For example, if you want to test the performance of the MKL library, in the case of spread allocation policy, using THIN nodes when scaling over the number of cores, you should:
* Navigate to `FixedSize/THIN/spread/`
* Call `sbatch THIN_fixedSize_spread_mkl.sh`
