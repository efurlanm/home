# Pointer assignment

*Last edited: 2024-11-24*

Based on:

- <https://stackoverflow.com/questions/31885866/what-does-equals-greater-than-mean-in-fortran/>
- John Mahaffy. Fortran 90 Lectures. Fortran 90 POINTERs. <https://web.archive.org/web/20230531132345/http://www.personal.psu.edu/jhm/f90/lectures/42.html>
- Dennis C. Smolarski, S.J.'s. Math 60 (Scientific Programming). Notes: Fortran-90 Pointers. <https://web.archive.org/web/20150829041610/http://math.scu.edu/~dsmolars/ma60/notesforpnt.html>

## Pointers

Pointers are a key feature of the C programming language, and one reason is the way they pass arguments to functions. In the case of Fortran, they pass the address of an argument to the function, so that both the function and the calling routine agree on the location of the corresponding variable in the argument list. In the case of C, they simply pass the value of the argument to the function, allowing fine-grained control over complex data structures. When the Fortran 90 standard was being drafted, there was a request for this feature, and something a little different was approved, in many ways more powerful and in some ways intentionally crippled, allowing users to be insulated from the details of memory allocation, which for parallel computers is not a bad thing. As a result, **POINTER in Fortran 90 points to variables of your choice, but does not directly tell you the memory address of that variable**. On the surface, it behaves like an executable [EQUIVALENCE](https://stackoverflow.com/questions/74577332/what-is-the-purpose-of-equivalence-in-fortran/) statement, but it actually does much more. The restrictions of the new Fortran 90 constructs allow good portability between different computers, at the expense perhaps of maximum performance. One consequence is that this may require a bit more control over the physical layout of my data structure. [[Source](https://web.archive.org/web/20230531132345/http://www.personal.psu.edu/jhm/f90/lectures/42.html)]

The concept of pointers in Fortran-90 is similar, but not identical, to the concept of pointers in other languages that implement it. In brief, a pointer in Fortran-90 is an **alias**, that is an alternative name, for the variable it points to. In practice, this means that Fortra-90 pointer variables:

* **do not store addresses**, but evaluate to the same value as the variable they point to;
* do not need any sort of "dereferencing" (eg, the C/C++ `*` or the Pascal `^`) to obtain the value associated with the pointer variable. 

The ability to "point" to a portion of a big data structure, such as a row or column of an array, is one of the main differences between the ways "pointers" can be used in Fortran-90. They can also be used independently as variables like any other variable. As a result, Fortran-90's "pointer" variable idea is far more flexible than comparable variables in other programming languages. [[Source](https://web.archive.org/web/20150829041610/http://math.scu.edu/~dsmolars/ma60/notesforpnt.html)]

## The syntactic element '=>'

In modern Fortran, the syntactic element `=>` appears in six contexts, the majority of which are closely related. Many, but not all, are connected to pointers. Contexts are pointer assignment, pointer initialization, procedure (pointer) declaration, type-bound procedure declaration, association, and renaming. In many cases, `=>` can be interpreted as a temporary or permanent alternative to reference another entity. In none, however, does `=>` function as an operator, which means that it does not return a result like an operator.

### Pointer assignment

"=>" is commonly referred to as the pointer assignment operator, though it is not truly an operator as it returns no value.

Examples from <https://fortran-lang.discourse.group/t/understanding-fortran-pointers/1142> :


```python
%%writefile p1.f90
implicit none
integer, pointer :: point
integer, target :: targ
targ = 3
point => targ
print*, point, targ
end
```

    Overwriting p1.f90



```python
! gfortran p1.f90 && ./a.out
```

               3           3



```python
%%writefile p2.f90
implicit none
integer, pointer :: point
integer, target :: targ
point => targ
point = 3
print*, point, targ
end
```

    Overwriting p2.f90



```python
! gfortran p2.f90 && ./a.out
```

               3           3



```python
%%writefile p3.f90
implicit none
integer, parameter :: n = 6*10**8
```

    Overwriting p3.f90


To declare a pointer variable, one add the keyword POINTER in the variable declaration before the double colon:


```python
%%writefile -a p3.f90
real   , target    :: x(n)
```

    Appending to p3.f90


One also needs to identify those variables to which Y can point, and this is done by adding the keyword TARGET in the variable declarations of such variables:


```python
%%writefile -a p3.f90
real   , pointer   :: p1(:),p2(:),p3(:)
```

    Appending to p3.f90



```python
%%writefile -a p3.f90
call random_number(x)
```

    Appending to p3.f90


Fortran-90 has introduced a pointer assignment operator which is indicated by using two symbols together in this way: `=>` :


```python
%%writefile -a p3.f90
p1 => x
p2 => x
p3 => x
```

    Appending to p3.f90


then p1 would, in effect, become an alias for x. One way to think about this, is that after the pointer assignment, in the symbol table, the memory location associated with x is now also the memory location associated with p1. Thus if the value of x changes, so does the value of p1 and vice versa. 


```python
%%writefile -a p3.f90
print*,sizeof(x),x(1),p1(1),p2(1),p3(1),x(n),p1(n),p2(n),p3(n)
end
```

    Appending to p3.f90



```python
! gfortran p3.f90 && ./a.out
```

               2400000000  0.357109964      0.357109964      0.357109964      0.357109964      0.942338943      0.942338943      0.942338943      0.942338943    


## `use` association renaming

```Fortran
use mod_a, c => a
use mod_b, only : cc => bb
```
Renaming entities uses the associated `=>` element. In these `use` statements, the module entities `a` and `bb` are known by the local names `c` and `cc`.
