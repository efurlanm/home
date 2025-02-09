# Notes on Python

This page contains my personal notes on Python-related topics that I find interesting. It is a work in progress and subject to constant change.


## Files & directories

* Main directory: <https://github.com/efurlanm/home/tree/main/python>

* **cheatsheet/** -  Python Cheat Sheet, by Valdemar W. Setzer. The directory contains my attempt to help build the cheat sheet by describing some functions and modules that are not yet in the sheet. It is a work in progress and subject to constant change. Setzer's cheatsheet web page: <https://www.ime.usp.br/~vwsetzer/python-opers-funcoes.html>. (in Portuguese)

* [variables.ipynb](notebooks/variables.ipynb) - my personal notes on how Python variables work.

* [folhaconsulta.ipynb](cheatsheet/folhaconsulta.ipynb) - auxiliary Notebook used in the cheat sheet to confirm the operation of some items.


## Random notes

* Python is considered a dynamic and strongly typed language.
  * Strongly Typed: Python does not allow implicit operations between different types without explicit conversion. For example, adding a string to a number will generate an error unless the string is explicitly converted to a number.
  * Dynamically Typed: The type of a variable is determined at runtime and can change as new values ​​are assigned to it, meaning that a variable x adopts the type of the value assigned to it. For example, when executing the assignment x = 1, x will be of type integer. If the assignment x = 1.5 is then executed, x will become of type float.
* Variables function as references (or pointers) to objects. When a value is assigned to a variable, it does not directly store the value, but rather a reference to the object that contains the value.
* Immutable variables: int, float, complex, str, tuple, frozenset, and bytes.
* Mutable variables: list, dict, set, bytearray, object (class instance).

<br><sub>Last edited: 2025-01-17 13:14:20</sub>
