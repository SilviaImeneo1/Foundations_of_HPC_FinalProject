# Exercise 2

## Table of contents
* [General info](#general-info)
* [Included files](#included-files)
* [Setup](#setup)

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

Each of the four final directories, include one or more `.sh` file

## Setup
Connect to ORFEO
