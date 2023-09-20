# Foundations_of_HPC_FinalProject

This repository contains the final assignment for the course in Foundations of High Performance Computing (AY 2022/2023) of the Master Degree in Data Science and Scientific Computing of the University of Trieste.

The official GitHub page of the course, together with the detailed instructions for this assignment, can be found [here](https://github.com/Foundations-of-HPC/Foundations_of_HPC_2022).

The assignment is composed of two exercises:
* Exercise 1: it is about the implementation of Conway's Game of Life (GOL) using a hybrid MPI+OpenMP code to parallelize the work. The MPI part focuses on distributing the initial playground across different MPI tasks, while the OpenMP one focuses on using multiple threads to parallelize the work within each task.
We had to perform three scalability studies on this code: OpenMP scalability, Strong MPI scalability, and Weak MPI scalability.

* Exercise 2: it is about the comparison of the performance of three math libraries: MKL, openBLAS and BLIS. Their behavior had to be compared when using the `gemm.c` function, both for single and double precision floating point numbers, to perform matrix-matrix multiplication. We were requested to try different thread allocation policies (close and spread) and to test different scenarios: an increasing size of the matrices with a fixed number of cores used, and, vice versa, an increasing number of cores with a fixed size of the matrices.


Further information can be found in the directories of each exercise and by reading the `Report.pdf` file.
