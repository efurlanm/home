# Variables

*Last edited: 2024-11-26*

## Notes

* Everything in Python is an object: because almost everything (apart from reserved keywords) is an instance of a certain class and has some attributes.
* Python is a dynamically typed language: in Python, variables don’t have types but the object they point to do. This means that the same variable can point to different objects over time. In contrast, in static languages, variables can only point to one type.
* In Python, variables and data structures don't contain objects. They're pointers (they point to objects).
* In Python a pointer just represents the connection between a variable and an object.


```python
x = 100
type(x)
```




    int



`int` is the class itself - not a string representing it. You could use this class to create other integers. In the next cell, the class `int` is taking a string as a parameter and creating an integer:


```python
int('123')
```




    123



`type` is a metaclass type of which all classes are instances:


```python
type(int)
```




    type



Every object in Python is defined with some attributes. To see the default attributes of an object you can use the `dir` function. Attributes can be methods or simply store some data.


```python
dir(x)
```




    ['__abs__',
     '__add__',
     '__and__',
     '__bool__',
     '__ceil__',
     '__class__',
     '__delattr__',
     '__dir__',
     '__divmod__',
     '__doc__',
     '__eq__',
     '__float__',
     '__floor__',
     '__floordiv__',
     '__format__',
     '__ge__',
     '__getattribute__',
     '__getnewargs__',
     '__getstate__',
     '__gt__',
     '__hash__',
     '__index__',
     '__init__',
     '__init_subclass__',
     '__int__',
     '__invert__',
     '__le__',
     '__lshift__',
     '__lt__',
     '__mod__',
     '__mul__',
     '__ne__',
     '__neg__',
     '__new__',
     '__or__',
     '__pos__',
     '__pow__',
     '__radd__',
     '__rand__',
     '__rdivmod__',
     '__reduce__',
     '__reduce_ex__',
     '__repr__',
     '__rfloordiv__',
     '__rlshift__',
     '__rmod__',
     '__rmul__',
     '__ror__',
     '__round__',
     '__rpow__',
     '__rrshift__',
     '__rshift__',
     '__rsub__',
     '__rtruediv__',
     '__rxor__',
     '__setattr__',
     '__sizeof__',
     '__str__',
     '__sub__',
     '__subclasshook__',
     '__truediv__',
     '__trunc__',
     '__xor__',
     'as_integer_ratio',
     'bit_count',
     'bit_length',
     'conjugate',
     'denominator',
     'from_bytes',
     'imag',
     'is_integer',
     'numerator',
     'real',
     'to_bytes']



## Assignment statements

Assignment statements don't copy anything: they just point a variable to an object. So assigning one variable to another variable just points two variables to the same object.

The [`id()` function](https://www.w3schools.com/python/ref_func_id.asp) returns a unique id for the specified object. All objects in Python has its own unique id. The id is assigned to the object when it is created. In CPython the id is the object's memory address, and will be different for each time you run the program, except for some object that has a constant unique id, like integers from -5 to 256.


```python
y = x
```

The variables x and y have the same address:


```python
id(x)
```




    109694784787944




```python
id(y)
```




    109694784787944



Integers from -5 to 256 have a constant unique id:


```python
a = 256
id(a)
```




    109694784792936




```python
b = 256
id(b)
```




    109694784792936



In Python:

* **Assignment** changes a variable (it changes which object it points to)
* **Mutation** changes an object (which any number of variables might point to)

Mutations change objects, not variables. But variables point to objects. So if another variable points to an object that we've just mutated, that other variable will reflect the same change; not because the variable changed but because the object it points to changed.

Python's `is` operator checks whether two objects are the same object (a.k.a. identity):


```python
x is y
```




    True



In this case, both variables point to the same object, as we defined previously. This can cause certain problems in Python, because when you change one variable, the other is also changed:


```python
b = c = d = [1, 2, 3]
b.append(4)
b, c, d
```




    ([1, 2, 3, 4], [1, 2, 3, 4], [1, 2, 3, 4])



In "b = c = d" we are creating 3 variables that are pointers to the same object. When we change the object, the 3 variables continue to point to the same object.

But in this other case it is a little different. Initially the 3 variables point to the same object, but when changing the variable e, a new object is created for this variable. The other 2 remain the same.


```python
e = f = g = 12345
e = 67890
e, f, g
```




    (67890, 12345, 12345)




```python
id(e), id(f), id(g)
```




    (139893191742224, 139893191742480, 139893191742480)



This is because numbers and strings are immutable, it is not possible to change the object. Every time we try to change it, a new object is created, and the variable changes the pointer:


```python
e = 3456
id(e)
```




    139893193705360



If we try to change it again, a new object is created, and the variable changes pointer once more:


```python
e = 3456
id(e)
```




    139893193716304



When the old integer object is no longer referenced by any variable or part of the program, it becomes eligible for garbage collection. Python's garbage collector will eventually reclaim the memory used by this object, making it available for future use by the program.

In a loop, new objects are created at each iteration:


```python
e = 0
for i in range(10):
    e = e + 1
    print(id(e), id(i))
```

    109694784784776 109694784784744
    109694784784808 109694784784776
    109694784784840 109694784784808
    109694784784872 109694784784840
    109694784784904 109694784784872
    109694784784936 109694784784904
    109694784784968 109694784784936
    109694784785000 109694784784968
    109694784785032 109694784785000
    109694784785064 109694784785032


Note: in this case, if efficiency is desired, a possible solution is to use the implicit looping features, where possible, of an external library such as Numpy. In extreme cases, loops can be programmed in Fortran using [Numpy F2PY](https://numpy.org/doc/stable/f2py/) and embedded in the code as a library function.

Any operation on an immutable object always returns a new object instead of modifying the original. Immutables: int, float, complex, str, tuple, frozenset, and bytes.

## Structures

Lists are mutable. In the following example, the variable row points to the same row address as the array:


```python
matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
row = matrix[1]
id(matrix), id(matrix[1]), id(row)
```




    (139893192135680, 139893216035968, 139893216035968)



If we mutate the list that row points to:


```python
row[0] = 1000
```

We'll see that change in both places:


```python
print(row)
print(matrix)
```

    [1000, 5, 6]
    [[1, 2, 3], [1000, 5, 6], [7, 8, 9]]


## Function arguments

In this case both variables point to the same object:


```python
def f1(row):
    row[0] = 1000

matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
row = matrix[1]
f1(row)
print(f"{row}\n{matrix}")
```

    [1000, 5, 6]
    [[1, 2, 3], [1000, 5, 6], [7, 8, 9]]


In this case, since there is a mutation in the row variable inside the function, then a new object is created and the two variables each point to their object:


```python
def f1(row):
    row = matrix[1]
    row[0] = 2000

matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
row = matrix[0]
f1(row)
print(f"{row}\n{matrix}")
```

    [1, 2, 3]
    [[1, 2, 3], [2000, 5, 6], [7, 8, 9]]


## Object identity


```python
x = y = 0
x is y
```




    True




```python
x = y = 0
x is not y
```




    False



## References

* Hunner, T. (2022). [Variables and objects in Python](https://www.pythonmorsels.com/pointers/).
* Bader, N. (2021). [What does it mean that everything in Python is an object?](https://medium.com/@thehippieandtheboss/what-is-an-object-in-python-f38f4026a07f).
