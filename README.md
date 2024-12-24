# Eduardo Furlan's Notes

*Last edited: 2024-12-24*

My random personal notes that I collect over time, on the most varied subjects, such as design and implementation of language, theory, internals, computer architecture, machine learning, high performance processing, programming, cluster, containers, books, links, tips and tricks, curiosities and others.

<table>
    <tr>
        <td><img src="img/construction.gif"></td>
        <td>This website and repositories are permanently under construction, so its contents change constantly.</td>
    </tr>
</table>

## Some directories and files in this repository

(unsorted)

* [HPC](https://github.com/efurlanm/hpc) - repository containing my personal notes on High-Performance Computing (HPC). Efficient language design and implementation are crucial for HPC because they directly impact the performance, scalability, and usability of HPC applications. Languages designed specifically for HPC, such as domain-specific languages (DSLs), can optimize parallelism, manage complex computations, and provide abstractions that simplify the development of high-performance code. Additionally, well-designed compilers and interpreters for these languages can further enhance performance by optimizing code execution on HPC systems.
* [Cluster](cluster) - my personal home cluster.
* [PAPI](papi) - portable performance counter library and related infos.
* [SDumont](SDumont) - directory containing notes about the [Santos Dumont supercomputer](https://sdumont.lncc.br/machine.php).
* [IDRIS](IDRIS) - directory containing the [MPI course](http://www.idris.fr/formations/mpi/), with many examples in F90, from the Institut du Développement et des Ressources en Informatique Scientifique (IDRIS).
* [Python](python/README.md) - my personal notes on Python-related topics that I find interesting.
* [Moving Forth](moving_forth/README.md) - my personal notes on Brad Rodriguez's Moving Forth.
* [Fortran](fortran/README.md) - page with my personal notes about Fortran, a high -level programming language that is historically linked to HPC due to its efficient handling of numerical and scientific calculations.
* [C](c/README.md) - directory with my personal notes on the C programming language, which has efficiency and the ability to directly manipulate hardware resources, allowing optimized performance for compute-intensive tasks. 
* [Assembly](assembly/README.md) - directory with my personal notes on the Assembly programming language.
* [Vintage](vintage.md) - vintage computer internals

## Directories mirrored from ftp://ftp.liv.ac.uk/pub/

* http://github.com/efurlanm/f90/blob/master/F90Course
* http://github.com/efurlanm/f90/blob/master/HPFCourse
* http://github.com/efurlanm/f90/blob/master/HPFFMatter
* http://github.com/efurlanm/f90/blob/master/HTMLHPFCourse

The above directory listing can also be found at

* http://web.archive.org/web/20170706012641/ftp://ftp.liv.ac.uk/pub/F90Course
* http://web.archive.org/web/20170706012641/ftp://ftp.liv.ac.uk/pub/HPFCourse
* http://web.archive.org/web/20170706012641/ftp://ftp.liv.ac.uk/pub/HPFFMatter

("HTMLHPFCourse" is the content of the compressed file HTMLHPFCourse.tar.gz)

## Selected topics

* [Compilers course](https://github.com/efurlanm/teaching/tree/main/comp) (in Portuguese) - lecture notes from the course I teach.

## Selected books & papers

* [A Construção de um Compilador](buildcomp.md) (Building a Compiler), by VW Setzer & ISH Melo - page with my personal notes about the book.
* [Threaded Interpretive Languages: Their Design and Implementation](https://vdoc.pub/documents/threaded-interpretive-languages-their-design-and-implementation-1seph9gct7uo), by RG Loeliger - explores the principles and architecture of [threaded interpretive languages](https://en.wikipedia.org/wiki/Threaded_code), with a specific focus on Forth-like languages. 
* [Threaded code designs for Forth interpreters](https://dl.acm.org/doi/10.1145/146559.146561), by PJ Hong - techniques for implementing threaded code in Forth interpreters.
* [Library](https://vdoc.pub/search/compiler) with several books on compilers, computers, and programming.

## Forums

* [Reddit Programming Languages](http://www.reddit.com/r/ProgrammingLanguages) - discussion of programming languages, programming language theory, design, their syntax and compilers.
* [Reddit Compilers](http://www.reddit.com/r/Compilers) - community where people discuss topics related to compiler design, construction, and theory.
* [comp.compilers newsgroup](https://compilers.iecc.com) - forum within Usenet dedicated to discussions about compiler design, implementation, and usage.

## Wikibooks & Wikipedia

* [Compiler](https://en.wikibooks.org/wiki/Introduction_to_Software_Engineering/Tools/Compiler) - from the book *Introduction to Software Engineering*. Overview of compilers, explaining how they transform source code written in a high-level programming language into machine code or another lower-level language. 
* [Compiler Construction](https://en.wikibooks.org/wiki/Compiler_Construction) - provides a detailed guide on the theory and practice of compiler construction, including lexical analysis, parsing, semantic analysis, optimization, and code generation.
* [Compiler](https://en.wikipedia.org/wiki/Compiler) - in-depth overview of compilers, which are programs that translate source code written in a high-level programming language into machine code, assembly code, or an intermediate code.
* [History of compiler construction](https://en.wikipedia.org/wiki/History_of_compiler_construction) - historical overview of the development of compilers from the early days of computer science to the modern era. It discusses key milestones, influential projects, and significant advancements in compiler technology over the years.
* [Threaded code](https://en.wikipedia.org/wiki/Threaded_code) - programming technique where the code consists primarily of subroutine calls. 

## Links of interest

* [Dynamic Load-balancing](https://www.lume.ufrgs.br/bitstream/handle/10183/34776/000792718.pdf): A New Strategyfor Weather Forecast Models, by Rodrigues, E. R. - the thesis includes approaches such as compiler, processor, Thread, TLS, GDT, LDT, PAPI, Assembly, etc.

## License

My work follows the CC-BY-4.0 license. The works of other authors follow their licenses.
