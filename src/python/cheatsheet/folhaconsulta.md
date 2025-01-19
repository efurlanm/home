# Python - Folha de Consulta

Notebook auxiliar com trechos de código, testes, e exemplos.

## 3. Operadores


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



## 4. Operadores lógicos


```python
"a" in "False"
```




    True




```python
'a' not in 'false'
```




    False




```python
5 not in (2, 5, 3)
```




    False




```python
3 not in [2, 5, 3]
```




    False




```python
4 not in [2, 5, 3]
```




    True



## all()

<https://docs.python.org/2/library/functions.html?_x_tr_sl=auto&_x_tr_tl=en&_x_tr_hl=en-US&_x_tr_pto=wapp#all>


```python
a = [True, True, True]
b = [True, True, False]
c = []
print(all(a), all(b), all(c))
```

    True False True


## any()


```python
a = [True, True, True]
b = [True, True, False]
c = []
print(any(a), any(b), any(c))
```

    True True False


## bytearray


```python
prime = [2, 3, 5, 7]
byte = bytearray(prime)
print(byte)
```

    bytearray(b'\x02\x03\x05\x07')


## callable


```python
x = 10
print(callable(x))
```

    False



```python
def func(x):
    return (x)

y = func
print(callable(y))
```

    True


## classmethod()


```python
class CM:
    a = 0
    def mostra_a(cls, x):
        cls.a = x
        print('"a" obtido:', cls.a)
CM.mostra_a = classmethod(CM.mostra_a)
CM.mostra_a(123)
```

    "a" obtido: 123


## staticmethod()


```python
class Calc:
    def adc(n1, n2):
        return n1 + n2
func = staticmethod(Calc.adc)
print(func(6, 8))
```

    14


Teste de um trecho em "python-opers-funcoes.html" Versão 19.12 de 14/12/24


```python
class Cl:
    def ad(a,b):
        return a + b
Cl.ad = staticmethod(Cl.ad)
print(Cl.ad(5,7))
```

    12


## compile()


```python
string = 'a=8\nb=7\nsoma=a+b\nprint(soma)'
ref = compile(string, 'filename', 'exec')
exec(ref)
```

    15


## time.sleep(n)


```python
import time
print("Início da espera de 10 s .")
time.sleep(2)
print("Término da espera.")
```

    Início da espera de 10 s .
    Término da espera.


## delattr()


```python
class A:
  x = 10
instancia = A()
print(instancia.x)
delattr(A, 'x')
```

    10


## dict()


```python
n = dict(x=5, y=0)
print(n, type(n))
```

    {'x': 5, 'y': 0} <class 'dict'>


## dir()


```python
n = [10]
print(dir(n))
```

    ['__add__', '__class__', '__class_getitem__', '__contains__', '__delattr__', '__delitem__', '__dir__', '__doc__', '__eq__', '__format__', '__ge__', '__getattribute__', '__getitem__', '__gt__', '__hash__', '__iadd__', '__imul__', '__init__', '__init_subclass__', '__iter__', '__le__', '__len__', '__lt__', '__mul__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__reversed__', '__rmul__', '__setattr__', '__setitem__', '__sizeof__', '__str__', '__subclasshook__', 'append', 'clear', 'copy', 'count', 'extend', 'index', 'insert', 'pop', 'remove', 'reverse', 'sort']


## enumerate()


```python
lang = ['Python', 'C', 'Fortran']
enumlang = enumerate(lang)
print(list(enumlang))

```

    [(0, 'Python'), (1, 'C'), (2, 'Fortran')]


## eval()


```python
a = 3
quad = eval('a * a')
print(quad)
```

    9


## getattr()


```python
class A:
    a = 123
instancia = A()
b = getattr(instancia, 'a')
print(b)
```

    123


## globals()


```python
print(globals())
```

    {'__name__': '__main__', '__doc__': 'Automatically created module for IPython interactive environment', '__package__': None, '__loader__': None, '__spec__': None, '__builtin__': <module 'builtins' (built-in)>, '__builtins__': <module 'builtins' (built-in)>, '_ih': ['', "lang = ['Python', 'Java', 'JavaScript']\nenumlang = enumerate(lang)\nprint(enumlang)\n#print(list(enumerated_languages))", "lang = ['Python', 'Java', 'JavaScript']\nenumlang = enumerate(lang)\nprint(list(enumerated_languages))", "lang = ['Python', 'Java', 'JavaScript']\nenumlang = enumerate(lang)\nprint(list(enumlang))", "lang = ['Python', 'Java', 'JavaScript']\nenumlang = enumerate(lang)\nprint(list(enumlang))", "lang = ['Python', 'C', 'Fortran']\nenumlang = enumerate(lang)\nprint(list(enumlang))", "a = 9\nquad = eval('a * a')\nprint(quad)", "a = 3\nquad = eval('a * a')\nprint(quad)", "class A:\n    a = 123\ninstancia = A()\nb = getattr(instancia, 'a')\nprint(b)", 'print(globals())'], '_oh': {}, '_dh': ['/content'], 'In': ['', "lang = ['Python', 'Java', 'JavaScript']\nenumlang = enumerate(lang)\nprint(enumlang)\n#print(list(enumerated_languages))", "lang = ['Python', 'Java', 'JavaScript']\nenumlang = enumerate(lang)\nprint(list(enumerated_languages))", "lang = ['Python', 'Java', 'JavaScript']\nenumlang = enumerate(lang)\nprint(list(enumlang))", "lang = ['Python', 'Java', 'JavaScript']\nenumlang = enumerate(lang)\nprint(list(enumlang))", "lang = ['Python', 'C', 'Fortran']\nenumlang = enumerate(lang)\nprint(list(enumlang))", "a = 9\nquad = eval('a * a')\nprint(quad)", "a = 3\nquad = eval('a * a')\nprint(quad)", "class A:\n    a = 123\ninstancia = A()\nb = getattr(instancia, 'a')\nprint(b)", 'print(globals())'], 'Out': {}, 'get_ipython': <bound method InteractiveShell.get_ipython of <google.colab._shell.Shell object at 0x7e1f44f76200>>, 'exit': <IPython.core.autocall.ZMQExitAutocall object at 0x7e1f44f76bf0>, 'quit': <IPython.core.autocall.ZMQExitAutocall object at 0x7e1f44f76bf0>, '_': '', '__': '', '___': '', '_i': "class A:\n    a = 123\ninstancia = A()\nb = getattr(instancia, 'a')\nprint(b)", '_ii': "a = 3\nquad = eval('a * a')\nprint(quad)", '_iii': "a = 9\nquad = eval('a * a')\nprint(quad)", '_i1': "lang = ['Python', 'Java', 'JavaScript']\nenumlang = enumerate(lang)\nprint(enumlang)\n#print(list(enumerated_languages))", 'lang': ['Python', 'C', 'Fortran'], 'enumlang': <enumerate object at 0x7e1f2b617100>, '_i2': "lang = ['Python', 'Java', 'JavaScript']\nenumlang = enumerate(lang)\nprint(list(enumerated_languages))", '_i3': "lang = ['Python', 'Java', 'JavaScript']\nenumlang = enumerate(lang)\nprint(list(enumlang))", '_i4': "lang = ['Python', 'Java', 'JavaScript']\nenumlang = enumerate(lang)\nprint(list(enumlang))", '_i5': "lang = ['Python', 'C', 'Fortran']\nenumlang = enumerate(lang)\nprint(list(enumlang))", '_i6': "a = 9\nquad = eval('a * a')\nprint(quad)", 'a': 3, 'quad': 9, '_i7': "a = 3\nquad = eval('a * a')\nprint(quad)", '_i8': "class A:\n    a = 123\ninstancia = A()\nb = getattr(instancia, 'a')\nprint(b)", 'A': <class '__main__.A'>, 'instancia': <__main__.A object at 0x7e1f2bea7f70>, 'b': 123, '_i9': 'print(globals())'}


## hasattr()


```python
class A: a = 123
instancia = A()
print(hasattr(A, "a"), hasattr(instancia, "a"))
```

    True True


## format()


```python
a = 123
b = format(a, 'x')
print(b)
```

    7b


## hash()


```python
a = 'Python'
b = hash(a)
print(b)
```

    4858793859416338903


## isinstance()


```python
a = [1, 2, 3, 4, 2, 5]
b = isinstance(a, list)
print(b)
```

    True


## issubclass()


```python
class A:
  def __init__(x):
    print(x)
class B(A):
  def __init__(self):
    A.__init__('argumento')
print(issubclass(B, A))
```

    True


# iter()


```python
a = ['1', '2', '3']
b = iter(a)
print(next(b), next(b), next(b))

```

    1 2 3


## locals()


```python
print(locals())
```

    {'__name__': '__main__', '__doc__': 'Automatically created module for IPython interactive environment', '__package__': None, '__loader__': None, '__spec__': None, '__builtin__': <module 'builtins' (built-in)>, '__builtins__': <module 'builtins' (built-in)>, '_ih': ['', 'print(locals())'], '_oh': {}, '_dh': ['/content'], 'In': ['', 'print(locals())'], 'Out': {}, 'get_ipython': <bound method InteractiveShell.get_ipython of <google.colab._shell.Shell object at 0x7d1a1def21a0>>, 'exit': <IPython.core.autocall.ZMQExitAutocall object at 0x7d1a1def2b90>, 'quit': <IPython.core.autocall.ZMQExitAutocall object at 0x7d1a1def2b90>, '_': '', '__': '', '___': '', '_i': '', '_ii': '', '_iii': '', '_i1': 'print(locals())'}


## memoryview()


```python
a = bytearray('ABC', 'utf-8')
m = memoryview(a)
print(list(m[1:3]))
```

    [66, 67]


## next()


```python
a = [1, 2, 3]
b = iter(a)
c = next(b)
d = next(b)
print(c, d)
```

    1 2


## objetc()


```python
a = object()
print(dir(a))
```

    ['__class__', '__delattr__', '__dir__', '__doc__', '__eq__', '__format__', '__ge__', '__getattribute__', '__gt__', '__hash__', '__init__', '__init_subclass__', '__le__', '__lt__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__']


## open()


```python
f = open('a.txt', 'w')
f.write('Olá, mundo!')
f.close()
f = open('a.txt', 'r')
b = f.read()
f.close()
print(b)
```

    Olá, mundo!


## property()


```python
class P:
    def __init__(self, n):
        print("Inicia")
        self.b = n
    def get_n(self):
        print("Obtem n")
        return self.b
    def set_n(self, v):
        print("Define n")
        self.b = v
    def del_n(self):
        print("Apaga n")
        del self.b
    n = property(get_n, set_n, del_n)
a = P('Joao')
print(a.n)
a.n = "Jose"
del a.n
```

    Inicia
    Obtem n
    Joao
    Define n
    Apaga n


## reduce()


```python
from functools import reduce
def m(x, y):
    return x * y
n = [1, 2, 3, 4, 5]
r = reduce(m, n)
print(r)
```

    120


## reload()


```python
import importlib
import numpy
importlib.reload(numpy)
```

    /usr/lib/python3.10/importlib/__init__.py:169: UserWarning: The NumPy module was reloaded (imported a second time). This can in some cases result in small but subtle issues and is discouraged.
      _bootstrap._exec(spec, module)





    <module 'numpy' from '/usr/local/lib/python3.10/dist-packages/numpy/__init__.py'>



## repr()


```python
class P:
    def __init__(self, n, i):
        self.n = n
        self.i = i
    def __repr__(self):
        return f"P(n='{self.n}', i={self.i})"
a = P("Fulano", 30)
print(repr(a))
```

    P(n='Fulano', i=30)


## reversed()


```python
a = 'Python'
b = reversed(a)
print(list(b))
```

    ['n', 'o', 'h', 't', 'y', 'P']


## setattr()


```python
class S:
  a = 123
  b = 'Laranja'

c = S()
setattr(c, 'b', 'Abacaxi')
print(c.b)
setattr(c, 'a', 456)
print(c.a)
```

    Abacaxi
    456



```python
class Person: name = 'Eva'; age = 36;
setattr(Person, 'age', 25); print(Person.age)
```

    25



```python
class P: name = 'Eva'; age = 36; setattr(P, 'age', 25); print(P.age)
```


    ---------------------------------------------------------------------------

    NameError                                 Traceback (most recent call last)

    <ipython-input-3-e5482bc16fd2> in <cell line: 1>()
    ----> 1 class P: name = 'Eva'; age = 36; setattr(P, 'age', 25); print(P.age)
    

    <ipython-input-3-e5482bc16fd2> in P()
    ----> 1 class P: name = 'Eva'; age = 36; setattr(P, 'age', 25); print(P.age)
    

    NameError: name 'P' is not defined



```python
class P: name = 'Eva'; age = 36;
```


```python
setattr(P, 'age', 25); print(P.age)
```

    25


## slice()


```python
a = 'abcdefghi'
b = slice(3,6,2)
print(a[b])
```

    df


## super()


```python
class A():
  def __init__(self):
    print('Chamada de A')
class B(A):
  def __init__(self):
    super().__init__()
    print('Chamada de B')
a = B()
```

    Chamada de A
    Chamada de B


## vars()


```python
print(vars(list))
```

    {'__new__': <built-in method __new__ of type object at 0x5cda3469db00>, '__repr__': <slot wrapper '__repr__' of 'list' objects>, '__hash__': None, '__getattribute__': <slot wrapper '__getattribute__' of 'list' objects>, '__lt__': <slot wrapper '__lt__' of 'list' objects>, '__le__': <slot wrapper '__le__' of 'list' objects>, '__eq__': <slot wrapper '__eq__' of 'list' objects>, '__ne__': <slot wrapper '__ne__' of 'list' objects>, '__gt__': <slot wrapper '__gt__' of 'list' objects>, '__ge__': <slot wrapper '__ge__' of 'list' objects>, '__iter__': <slot wrapper '__iter__' of 'list' objects>, '__init__': <slot wrapper '__init__' of 'list' objects>, '__len__': <slot wrapper '__len__' of 'list' objects>, '__getitem__': <method '__getitem__' of 'list' objects>, '__setitem__': <slot wrapper '__setitem__' of 'list' objects>, '__delitem__': <slot wrapper '__delitem__' of 'list' objects>, '__add__': <slot wrapper '__add__' of 'list' objects>, '__mul__': <slot wrapper '__mul__' of 'list' objects>, '__rmul__': <slot wrapper '__rmul__' of 'list' objects>, '__contains__': <slot wrapper '__contains__' of 'list' objects>, '__iadd__': <slot wrapper '__iadd__' of 'list' objects>, '__imul__': <slot wrapper '__imul__' of 'list' objects>, '__reversed__': <method '__reversed__' of 'list' objects>, '__sizeof__': <method '__sizeof__' of 'list' objects>, 'clear': <method 'clear' of 'list' objects>, 'copy': <method 'copy' of 'list' objects>, 'append': <method 'append' of 'list' objects>, 'insert': <method 'insert' of 'list' objects>, 'extend': <method 'extend' of 'list' objects>, 'pop': <method 'pop' of 'list' objects>, 'remove': <method 'remove' of 'list' objects>, 'index': <method 'index' of 'list' objects>, 'count': <method 'count' of 'list' objects>, 'reverse': <method 'reverse' of 'list' objects>, 'sort': <method 'sort' of 'list' objects>, '__class_getitem__': <method '__class_getitem__' of 'list' objects>, '__doc__': 'Built-in mutable sequence.\n\nIf no argument is given, the constructor creates a new empty list.\nThe argument must be an iterable if specified.'}


## zip()


```python
a = ["abc", "def", "ghi"]
b = [12, 34, 56]
c = zip(a, b)
print(list(c))
```

    [('abc', 12), ('def', 34), ('ghi', 56)]


## id()


```python
a = 5
b = 6
c = a + b
print(id(a), id(b), id(c))
```

    132703492686192 132703492686224 132703492686384


## Classes


```python
class C:
  """Esta é uma classe."""  #Atributo implícito: __doc__, para documentação
  X = 13
  def FdeC (Y):
    return Y + 1

print(C.X)
```

    13



```python
print(C.FdeC(2))
```

    3



```python
print(C.__doc__)
```

    Esta é uma classe.



```python
ObjC = C()
```


```python
print(ObjC.X)
```

    13



```python
 C2 = type('C2', (object,), {'atr': 100})
```


```python
inst = C2()
```


```python
inst.atr
```




    100




```python
class pessoa:
    def __init__(self, nome, idade): #Parâmetros nome, idade
        self.nome = nome #self em lugar do nome da classe
        self.idade = idade

p1 = pessoa('Val',84) #declaração do objeto p1, uso de argumentos
print(p1.nome, p1.idade)
```

    Val 84


Propriedades e Métodos de Classe: Classes podem ter propriedades e métodos que pertencem à própria classe e não às instâncias individuais. Eles são definidos usando a palavra-chave @classmethod ou @staticmethod.


```python
class MinhaClasse:
    contador = 0  # Propriedade de classe

    @classmethod
    def incrementar_contador(cls):
        cls.contador += 1

    @staticmethod
    def metodo_estatico():
        return "Este é um método estático."

```

Encapsulamento e Modificadores de Acesso: Em Python, você pode sugerir o encapsulamento de atributos com um único sublinhado _ para indicar que são protegidos, ou com dois sublinhados __ para indicar que são privados. Isso não impede o acesso, mas é uma convenção para sinalizar que esses atributos não devem ser acessados diretamente.


```python
class MinhaClasse:
    def __init__(self, valor):
        self._protegido = valor  # Indica que deve ser tratado como protegido
        self.__privado = valor  # Indica que deve ser tratado como privado

```

Propriedades (Properties): Em vez de acessar diretamente os atributos de uma classe, você pode usar propriedades para controlar o acesso a eles. Isso é feito usando os decoradores @property.


```python
class MinhaClasse:
    def __init__(self, valor):
        self._valor = valor

    @property
    def valor(self):
        return self._valor

    @valor.setter
    def valor(self, valor):
        if valor < 0:
            raise ValueError("Valor deve ser positivo")
        self._valor = valor

```

Módulos e Pacotes: Classes podem ser organizadas em módulos (arquivos .py) e pacotes (diretórios com um arquivo __init__.py). Isso ajuda a estruturar o código de forma modular e reutilizável.

Sobrescrita de Métodos (Override): Classes podem sobrescrever métodos herdados para modificar ou estender seu comportamento. Isso é feito simplesmente redefinindo o método na subclasse.


```python
class Animal:
    def som(self):
        return "Algum som"

class Cachorro(Animal):
    def som(self):
        return "Latido"

```

Métodos Especiais: Existem outros métodos especiais além do __init__, como __str__, __repr__, __len__, __getitem__, e muitos mais, que permitem definir comportamentos específicos para objetos da classe.

## aiter()


```python
import asyncio

async def async_iter():
   for num in range(4):
      await asyncio.sleep(2)
      yield num

async def main():
   iterador = aiter(async_iter())
   while True:
      try:
         item = await iterador.asend(None)
         print(item)
      except StopAsyncIteration:
         break

async def iniciar():
   await main()

asyncio.run(iniciar())
```


    ---------------------------------------------------------------------------

    RuntimeError                              Traceback (most recent call last)

    <ipython-input-9-0d367725cce6> in <cell line: 20>()
         18    await main()
         19 
    ---> 20 asyncio.run(iniciar())
    

    /usr/lib/python3.10/asyncio/runners.py in run(main, debug)
         31     """
         32     if events._get_running_loop() is not None:
    ---> 33         raise RuntimeError(
         34             "asyncio.run() cannot be called from a running event loop")
         35 


    RuntimeError: asyncio.run() cannot be called from a running event loop



```python
asyncio.all_tasks()
```




    set()



## breakpoint()


```python
for i in range(10):
  if i == 6:
    breakpoint() # Pause execution here
  print(i)
```

    0
    1
    2
    3
    4
    5
    > [0;32m<ipython-input-11-ea702df0f94f>[0m(4)[0;36m<cell line: 1>[0;34m()[0m
    [0;32m      1 [0;31m[0;32mfor[0m [0mi[0m [0;32min[0m [0mrange[0m[0;34m([0m[0;36m10[0m[0;34m)[0m[0;34m:[0m[0;34m[0m[0;34m[0m[0m
    [0m[0;32m      2 [0;31m  [0;32mif[0m [0mi[0m [0;34m==[0m [0;36m6[0m[0;34m:[0m[0;34m[0m[0;34m[0m[0m
    [0m[0;32m      3 [0;31m    [0mbreakpoint[0m[0;34m([0m[0;34m)[0m [0;31m# Pause execution here[0m[0;34m[0m[0;34m[0m[0m
    [0m[0;32m----> 4 [0;31m  [0mprint[0m[0;34m([0m[0mi[0m[0;34m)[0m[0;34m[0m[0;34m[0m[0m
    [0m
    --KeyboardInterrupt--
    
    KeyboardInterrupt: Interrupted by user
    6
    7
    8
    9



```python
prime = [2, 3, 5, 7]; byte = bytearray(prime); print(byte)
```

    bytearray(b'\x02\x03\x05\x07')



```python
! python3 --version
```

    Python 3.10.12



```python
x = (1+2j)
x.conjugate()
```




    (1-2j)



## ascii()


```python
numero = 123
lista = [1, 2, "Olá"]
tupla = ("a", "b", "ç")
print(ascii(numero), ascii(lista), ascii(tupla))
```

    123 [1, 2, 'Ol\xe1'] ('a', 'b', '\xe7')


## s.rstrip(c)


```python
texto = "exemplo!!!            "
print(texto.rstrip("!"), "<")
print(texto.rstrip(), "<")
```

    exemplo!!!             <
    exemplo!!! <



```python
print(f"Multiplicação (10 * 3): {10 * 3} \nDivisão (10 / 3): {10 / 3} \nMódulo (10 % 3): {10 % 3} \nDivisão Inteira (10 // 3): {10 // 3}")
```

    Multiplicação (10 * 3): 30 
    Divisão (10 / 3): 3.3333333333333335 
    Módulo (10 % 3): 1 
    Divisão Inteira (10 // 3): 3



```python
print(f"+ e -: 10 + (-5) - 3 + 2.5 - (-1.5) = {10 + (-5) - 3 + 2.5 - (-1.5)}")
```

    + e -: 10 + (-5) - 3 + 2.5 - (-1.5) = 6.0



```python
! lsb_release -a
```

    No LSB modules are available.
    Distributor ID:	Ubuntu
    Description:	Ubuntu 22.04.3 LTS
    Release:	22.04
    Codename:	jammy








## Referências

* GEEKSFORGEEKS. Learn Python Programming Language. 2024. GeeksforGeeks. Disponível em: https://www.geeksforgeeks.org/python-programming-language-tutorial/.
* MICROSOFT CORPORATION. Microsoft Copilot. Ferramenta utilizada para auxiliar na redação. 2024. Disponível em: https://www.microsoft.com/copilot.
* PROGRAMIZ. Learn Python Programming. 2024. Disponível em: https://www.programiz.com/python-programming.
* PYTHON SOFTWARE FOUNDATION. The Python Language Reference. 2024a. Python documentation. Disponível em: https://docs.python.org/3/reference/index.html.
* PYTHON SOFTWARE FOUNDATION. The Python Standard Library. 2024b. Python documentation. Disponível em: https://docs.python.org/3/library/index.html.
* STACK OVERFLOW CONTRIBUTORS. Python Notes for Professionals. [S. l.]: goalkicker.com, 2018. Disponível em: https://books.goalkicker.com/PythonBook.

