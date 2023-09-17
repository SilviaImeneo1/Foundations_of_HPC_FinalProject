\subsubsection{Directory organization}

\begin{itemize}
  \item ex\_1/
  \begin{itemize}
    \item main.c
    \item Makefile
    \item include/
    \begin{itemize}
      \item ordered\_evolution.h
      \item read\_write\_pgm.h
      \item static\_evolution.h
    \end{itemize}
    \item src/
    \begin{itemize}
      \item ordered\_evolution.c
      \item read\_write\_pgm.c
      \item static\_evolution.c
    \end{itemize}
    \item obj/
    \begin{itemize}
      \item ordered\_evolution.o
      \item read\_write\_pgm.o
      \item static\_evolution.o
    \end{itemize}
    \item EPYC/
    \begin{itemize}
      \item MPI\_strong\_scalability/
      \begin{itemize}
        \item job.sh
      \end{itemize}
      \item MPI\_weak\_scalability/
      \begin{itemize}
        \item job.sh
      \end{itemize}
      \item OMP\_scalability/
      \begin{itemize}
        \item job.sh
      \end{itemize}
    \end{itemize}
    \item THIN/
    \begin{itemize}
      \item MPI\_strong\_scalability/
      \begin{itemize}
        \item job.sh
      \end{itemize}
      \item MPI\_weak\_scalability/
      \begin{itemize}
        \item job.sh
      \end{itemize}
      \item OMP\_scalability/
      \begin{itemize}
        \item job.sh
      \end{itemize}
    \end{itemize}
  \end{itemize}
\end{itemize}
