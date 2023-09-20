
# Exercise 1

## Table of contents
* [General info](#general-info)
* [Included files](#included-files)
* [How to run jobs](#how-to-run-jobs)

## General info
This directory contains the files needed to work on the Exercise 1 of the final assignment of the course of Foundations of High Performance Computing. You'll find a brief explanation of the files and then the instructions to be followed to replicate our results.

## Included files
In the root directory, you can find the files:
* `main.c`: it contains the instructions on how to proceed based on which command-line argument is called.
* `Makefile`: is the makefile to compile the codes included in the `src/` folder.
* `src/`: it contains the main codes needed to implement the Game of Life in a hybrid MPI+OpenMP approach:
  * `read_write_pgm.c`: the code to read/write from/to a `.pgm` file.
  * `ordered_evolution.c`: the code to implement the ordered evolution of GOL in parallel.
  * `static_evolution.c`: the code to implement the static evolution of GOL in parallel.
* `include/`: it contains all the header files needed for the functions that are defined in the codes included in `src/`.
* `EPYC/`: it contains the data for the scalability studies on Epyc nodes.
* `THIN/`: it contains the data for the scalability studies on Thin nodes.

Both the `EPYC/` and the `THIN` directories are structured as follow:
* `OpenMP_scalability`
* `Strong_MPI_scalability`
* `Weak_MPI_scalability`

Each of these three final directories includes:
* one `job.sh` file: it is the bash shell script to give specific command-line arguments. It can be edited by the user based on which results they want to analyze. For example, they can edit the size of the playground (`k`), or the number of iterations (`n`) to perform.
* several `.csv` files with the results that we obtained when performing the scalability studies.


## How to run jobs
The files included in this repository are written to use the resources of the cluster ORFEO (at Area Science Park in Trieste), which uses SLURM as resource manager.
To replicate our results, we invite you to:
1. Connect to ORFEO
2. Clone this repository
3. Navigate to the folder of interest based on the configuration that you want to test, until you get to the level of the `job.sh` file
4. Call `sbatch job.sh`

For example, if you want to analyze the change in run-time for the ordered evolution in the Strong MPI scalability case on Epyc nodes, you should:
* Navigate to `EPYC/Srong_MPI_scalability/ordered/`
* Call `sbatch job.sh`

You will have as results:
* a `.csv` file with the time measurements,
* a `.pgm` file with the written final playground,
* one or more other `.pgm` file, based on the argument that you gave to the `-s` command for the number of snapshots that you want to obtain,
* a `slurm-xxxxx.out` file (where 'xxxxx' is the id number of the job that you run) with a step-by-step output of the job.
