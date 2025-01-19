# Clang [AArch64](https://en.wikipedia.org/wiki/AArch64)

My personal notes on Clang AArch64

- [Clang](https://clang.llvm.org/) release 15.0.7
- JupyterLab 3.5.2
- [Termux 0.118.0](https://termux.dev/en/)
- Moto G4 with [Android 9.0_r44 ARM64 AOSiP](https://forum.xda-developers.com/t/rom-9-0_r44-arm64-android-open-source-illusion-project-athene-unofficial.3889942/)
- Processor: Snapdragon 617 octa-core ARMv8 Cortex-A53 64-bit
    - Two quad-core clusters 1.2/1.5 GHz

Some references:

- https://stackoverflow.com/questions/200292/process-for-reducing-the-size-of-an-executable
- http://www.muppetlabs.com/~breadbox/software/tiny/
- https://stac47.github.io/c/relocation/elf/tutorial/2018/03/01/understanding-relocation-elf.html
- http://timelessname.com/elfbin/
- https://interrupt.memfault.com/blog/dealing-with-large-symbol-files
- https://www.reddit.com/r/C_Programming/comments/wdag9l/how_to_absolutely_minimize_the_executable/
- http://cs107e.github.io/guides/gcc/

2023-01-28


```python
!inxi
```

    [1;34mCPU:[0m 2x 4-core AArch64 (-MCP AMP-) [1;34mspeed/min/max:[0m 435/499:403/1651:1210 MHz[0m
    [1;34mKernel:[0m 3.10.108-lk.r17_rev aarch64 [1;34mUp:[0m 6d 19h 15m [0m[1;34mMem:[0m 1128.3/1843.6 MiB[0m
    [0m(61.2%) [1;34mStorage:[0m 14.56 GiB (186.5% used) [1;34mProcs:[0m 8 [1;34mShell:[0m python3.11[0m
    [1;34minxi:[0m 3.3.24[0m



```python
!inxi -C
```

    [1;34mCPU:[0m
      [1;34mInfo:[0m 2x 4-core [1;34mmodel:[0m AArch64 [1;34mbits:[0m 64 [1;34mtype:[0m MCP AMP[0m
      [1;34mSpeed (MHz):[0m [1;34mavg:[0m 703 [1;34mmin/max:[0m 499:403/1651:1210 [1;34mcores:[0m [1;34m1:[0m 499 [1;34m2:[0m 499[0m
        [1;34m3:[0m 806 [1;34m4:[0m 806 [1;34m5:[0m 806 [1;34m6:[0m 806[0m



```python
!lscpu
```

    Architecture:            aarch64
      CPU op-mode(s):        32-bit, 64-bit
      Byte Order:            Little Endian
    CPU(s):                  8
      On-line CPU(s) list:   1,2,4-7
      Off-line CPU(s) list:  0,3
    Vendor ID:               ARM
      Model name:            Cortex-A53
        Model:               4
        Thread(s) per core:  1
        Core(s) per cluster: 3
        Socket(s):           -
        Cluster(s):          2
        Stepping:            r0p4
        CPU(s) scaling MHz:  61%
        CPU max MHz:         1651.2000
        CPU min MHz:         0.0000
        Flags:               fp asimd evtstrm aes pmull sha1 sha2 crc32



```python
!clang --version
```

    clang version 15.0.7
    Target: aarch64-unknown-linux-android24
    Thread model: posix
    InstalledDir: /data/data/com.termux/files/usr/bin


## tiny.c


```python
%%writefile tiny1.c
int main(void) {
    return 42; 
}
```

    Overwriting tiny.c



```python
!clang -Oz -s tiny1.c
```


```python
!./a.out ; echo $?
```

    /data/data/com.termux/files/usr/bin/bash: line 1: ./a.out: No such file or directory
    127



```python
!wc -c a.out
```

    4248 a.out



```python
!ls -lh a.out
```

    -rwx------ 1 u0_a113 u0_a113 4.2K Jan 27 19:35 [0m[01;32ma.out[0m



```python
!size a.out
```

       text	   data	    bss	    dec	    hex	filename
       1055	    592	      8	   1655	    677	a.out



```python
!objdump -h a.out
```

    
    a.out:     file format elf64-littleaarch64
    
    Sections:
    Idx Name          Size      VMA               LMA               File off  Algn
      0 .interp       00000015  00000000000002a8  00000000000002a8  000002a8  2**0
                      CONTENTS, ALLOC, LOAD, READONLY, DATA
      1 .note.android.ident 00000098  00000000000002c0  00000000000002c0  000002c0  2**2
                      CONTENTS, ALLOC, LOAD, READONLY, DATA
      2 .dynsym       00000060  0000000000000358  0000000000000358  00000358  2**3
                      CONTENTS, ALLOC, LOAD, READONLY, DATA
      3 .gnu.version  00000008  00000000000003b8  00000000000003b8  000003b8  2**1
                      CONTENTS, ALLOC, LOAD, READONLY, DATA
      4 .gnu.version_r 00000020  00000000000003c0  00000000000003c0  000003c0  2**2
                      CONTENTS, ALLOC, LOAD, READONLY, DATA
      5 .gnu.hash     0000001c  00000000000003e0  00000000000003e0  000003e0  2**3
                      CONTENTS, ALLOC, LOAD, READONLY, DATA
      6 .dynstr       00000066  00000000000003fc  00000000000003fc  000003fc  2**0
                      CONTENTS, ALLOC, LOAD, READONLY, DATA
      7 .rela.dyn     00000060  0000000000000468  0000000000000468  00000468  2**3
                      CONTENTS, ALLOC, LOAD, READONLY, DATA
      8 .rela.plt     00000048  00000000000004c8  00000000000004c8  000004c8  2**3
                      CONTENTS, ALLOC, LOAD, READONLY, DATA
      9 .eh_frame_hdr 00000034  0000000000000510  0000000000000510  00000510  2**2
                      CONTENTS, ALLOC, LOAD, READONLY, DATA
     10 .eh_frame     0000009c  0000000000000548  0000000000000548  00000548  2**3
                      CONTENTS, ALLOC, LOAD, READONLY, DATA
     11 .text         000000a0  00000000000015e4  00000000000015e4  000005e4  2**2
                      CONTENTS, ALLOC, LOAD, READONLY, CODE
     12 .plt          00000050  0000000000001690  0000000000001690  00000690  2**4
                      CONTENTS, ALLOC, LOAD, READONLY, CODE
     13 .preinit_array 00000010  00000000000026e0  00000000000026e0  000006e0  2**3
                      CONTENTS, ALLOC, LOAD, DATA
     14 .init_array   00000010  00000000000026f0  00000000000026f0  000006f0  2**3
                      CONTENTS, ALLOC, LOAD, DATA
     15 .fini_array   00000010  0000000000002700  0000000000002700  00000700  2**3
                      CONTENTS, ALLOC, LOAD, DATA
     16 .dynamic      000001d0  0000000000002710  0000000000002710  00000710  2**3
                      CONTENTS, ALLOC, LOAD, DATA
     17 .got          00000020  00000000000028e0  00000000000028e0  000008e0  2**3
                      CONTENTS, ALLOC, LOAD, DATA
     18 .got.plt      00000030  0000000000002900  0000000000002900  00000900  2**3
                      CONTENTS, ALLOC, LOAD, DATA
     19 .bss          00000008  0000000000003930  0000000000003930  00000930  2**3
                      ALLOC
     20 .comment      000000c6  0000000000000000  0000000000000000  00000930  2**0
                      CONTENTS, READONLY



```python
%%writefile tiny.c
extern void _exit(int);

void _start(void) {
    _exit(42); 
}
```

    Overwriting tiny.c



```python
%%writefile tiny.asm
    .global _start
    .text
_start:
    /* syscall exit (int status) */
    mov    w8, #93  /* exit is syscall #1 */
    mov    x0, #42  /* status  := 42 */
    svc    #0
```

    Overwriting tiny.asm



```python
!as tiny.asm -o tiny.o
```

\
Linking with clang:


```python
!clang -Wall -s -nostartfiles -nostdlib tiny.o
```


```python
!./a.out ; echo $?
```

    42



```python
!wc -c a.out
```

    1664 a.out



```python
!size a.out
```

       text	   data	    bss	    dec	    hex	filename
        122	    160	      0	    282	    11a	a.out



```python
!ls -lh a.out
```

    -rwx------ 1 u0_a113 u0_a113 1.7K Jan 27 21:47 [0m[01;32ma.out[0m



```python
!objdump -h a.out
```

    
    a.out:     file format elf64-littleaarch64
    
    Sections:
    Idx Name          Size      VMA               LMA               File off  Algn
      0 .interp       00000015  0000000000000238  0000000000000238  00000238  2**0
                      CONTENTS, ALLOC, LOAD, READONLY, DATA
      1 .dynsym       00000018  0000000000000250  0000000000000250  00000250  2**3
                      CONTENTS, ALLOC, LOAD, READONLY, DATA
      2 .gnu.hash     0000001c  0000000000000268  0000000000000268  00000268  2**3
                      CONTENTS, ALLOC, LOAD, READONLY, DATA
      3 .dynstr       00000025  0000000000000284  0000000000000284  00000284  2**0
                      CONTENTS, ALLOC, LOAD, READONLY, DATA
      4 .text         0000000c  00000000000012ac  00000000000012ac  000002ac  2**2
                      CONTENTS, ALLOC, LOAD, READONLY, CODE
      5 .dynamic      000000a0  00000000000022b8  00000000000022b8  000002b8  2**3
                      CONTENTS, ALLOC, LOAD, DATA
      6 .data         00000000  0000000000003358  0000000000003358  00000358  2**0
                      CONTENTS, ALLOC, LOAD, DATA
      7 .bss          00000000  0000000000003358  0000000000003358  00000358  2**0
                      ALLOC
      8 .comment      00000013  0000000000000000  0000000000000000  00000358  2**0
                      CONTENTS, READONLY



```python
!strip --strip-all --verbose a.out
```

    copy from `a.out' [elf64-littleaarch64] to `stO4z6q4' [elf64-littleaarch64]



```python
!objdump -h a.out
```

    
    a.out:     file format elf64-littleaarch64
    
    Sections:
    Idx Name          Size      VMA               LMA               File off  Algn
      0 .interp       00000015  0000000000000238  0000000000000238  00000238  2**0
                      CONTENTS, ALLOC, LOAD, READONLY, DATA
      1 .dynsym       00000018  0000000000000250  0000000000000250  00000250  2**3
                      CONTENTS, ALLOC, LOAD, READONLY, DATA
      2 .gnu.hash     0000001c  0000000000000268  0000000000000268  00000268  2**3
                      CONTENTS, ALLOC, LOAD, READONLY, DATA
      3 .dynstr       00000025  0000000000000284  0000000000000284  00000284  2**0
                      CONTENTS, ALLOC, LOAD, READONLY, DATA
      4 .text         0000000c  00000000000012ac  00000000000012ac  000002ac  2**2
                      CONTENTS, ALLOC, LOAD, READONLY, CODE
      5 .dynamic      000000a0  00000000000022b8  00000000000022b8  000002b8  2**3
                      CONTENTS, ALLOC, LOAD, DATA
      6 .data         00000000  0000000000003358  0000000000003358  00000358  2**0
                      CONTENTS, ALLOC, LOAD, DATA
      7 .bss          00000000  0000000000003358  0000000000003358  00000000  2**0
                      ALLOC
      8 .comment      00000013  0000000000000000  0000000000000000  00000358  2**0
                      CONTENTS, READONLY


\
Linking and gereneting executable direct from assembly and linker


```python
!rm a.out
```


```python
!ls -lh tiny.o
```

    -rw------- 1 u0_a113 u0_a113 728 Jan 27 21:46 tiny.o



```python
!ld --strip-all --gc-sections -static tiny.o
```


```python
!./a.out ; echo $?
```

    42



```python
!wc -c a.out
```

    344 a.out



```python
!objdump -h a.out
```

    
    a.out:     file format elf64-littleaarch64
    
    Sections:
    Idx Name          Size      VMA               LMA               File off  Algn
      0 .text         0000000c  0000000000400078  0000000000400078  00000078  2**2
                      CONTENTS, ALLOC, LOAD, READONLY, CODE



```python
!as -al tiny.asm
```

    AARCH64 GAS  tiny.asm 			page 1
    
    
       1              	    .global _start
       2              	    .text
       3              	_start:
       4              	    /* syscall exit (int status) */
       5 0000 A80B8052 	    mov    w8, #93  /* exit is syscall #1 */
       6 0004 400580D2 	    mov    x0, #42  /* status  := 42 */
       7 0008 010000D4 	    svc    #0



```python
!objdump -d a.out
```

    
    a.out:     file format elf64-littleaarch64
    
    
    Disassembly of section .text:
    
    0000000000000000 <_start>:
       0:	52800ba8 	mov	w8, #0x5d                  	// #93
       4:	d2800540 	mov	x0, #0x2a                  	// #42
       8:	d4000001 	svc	#0x0



```python
!hexdump -C a.out
```

    00000000  7f 45 4c 46 02 01 01 00  00 00 00 00 00 00 00 00  |.ELF............|
    00000010  01 00 b7 00 01 00 00 00  00 00 00 00 00 00 00 00  |................|
    00000020  00 00 00 00 00 00 00 00  18 01 00 00 00 00 00 00  |................|
    00000030  00 00 00 00 40 00 00 00  00 00 40 00 07 00 06 00  |....@.....@.....|
    00000040  a8 0b 80 52 40 05 80 d2  01 00 00 d4 00 00 00 00  |...R@...........|
    00000050  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
    00000060  00 00 00 00 00 00 00 00  00 00 00 00 03 00 01 00  |................|
    00000070  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
    00000080  00 00 00 00 03 00 02 00  00 00 00 00 00 00 00 00  |................|
    00000090  00 00 00 00 00 00 00 00  00 00 00 00 03 00 03 00  |................|
    000000a0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
    000000b0  01 00 00 00 00 00 01 00  00 00 00 00 00 00 00 00  |................|
    000000c0  00 00 00 00 00 00 00 00  04 00 00 00 10 00 01 00  |................|
    000000d0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
    000000e0  00 24 78 00 5f 73 74 61  72 74 00 00 2e 73 79 6d  |.$x._start...sym|
    000000f0  74 61 62 00 2e 73 74 72  74 61 62 00 2e 73 68 73  |tab..strtab..shs|
    00000100  74 72 74 61 62 00 2e 74  65 78 74 00 2e 64 61 74  |trtab..text..dat|
    00000110  61 00 2e 62 73 73 00 00  00 00 00 00 00 00 00 00  |a..bss..........|
    00000120  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
    *
    00000150  00 00 00 00 00 00 00 00  1b 00 00 00 01 00 00 00  |................|
    00000160  06 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
    00000170  40 00 00 00 00 00 00 00  0c 00 00 00 00 00 00 00  |@...............|
    00000180  00 00 00 00 00 00 00 00  04 00 00 00 00 00 00 00  |................|
    00000190  00 00 00 00 00 00 00 00  21 00 00 00 01 00 00 00  |........!.......|
    000001a0  03 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
    000001b0  4c 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |L...............|
    000001c0  00 00 00 00 00 00 00 00  01 00 00 00 00 00 00 00  |................|
    000001d0  00 00 00 00 00 00 00 00  27 00 00 00 08 00 00 00  |........'.......|
    000001e0  03 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
    000001f0  4c 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |L...............|
    00000200  00 00 00 00 00 00 00 00  01 00 00 00 00 00 00 00  |................|
    00000210  00 00 00 00 00 00 00 00  01 00 00 00 02 00 00 00  |................|
    00000220  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
    00000230  50 00 00 00 00 00 00 00  90 00 00 00 00 00 00 00  |P...............|
    00000240  05 00 00 00 05 00 00 00  08 00 00 00 00 00 00 00  |................|
    00000250  18 00 00 00 00 00 00 00  09 00 00 00 03 00 00 00  |................|
    00000260  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
    00000270  e0 00 00 00 00 00 00 00  0b 00 00 00 00 00 00 00  |................|
    00000280  00 00 00 00 00 00 00 00  01 00 00 00 00 00 00 00  |................|
    00000290  00 00 00 00 00 00 00 00  11 00 00 00 03 00 00 00  |................|
    000002a0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
    000002b0  eb 00 00 00 00 00 00 00  2c 00 00 00 00 00 00 00  |........,.......|
    000002c0  00 00 00 00 00 00 00 00  01 00 00 00 00 00 00 00  |................|
    000002d0  00 00 00 00 00 00 00 00                           |........|
    000002d8



```python
!size a.out
```

       text	   data	    bss	    dec	    hex	filename
         12	      0	      0	     12	      c	a.out



```python
!size -Ax a.out
```

    a.out  :
    section   size   addr
    .text    0xc    0x0
    .data    0x0    0x0
    .bss     0x0    0x0
    Total    0xc
    
    


# C with more aggressive options


```python
%%writefile tiny2.c
extern void _exit(int);

void _start(void) {
    _exit(42); 
}
```

    Writing tiny2.c



```python
%%writefile tiny2.asm
    .global _exit
    .text
_exit:
    /* syscall exit (int status) */
    mov    w8, #93  /* exit is syscall #1 */
    mov    x0, #42  /* status  := 42 */
    svc    #0
```

    Overwriting tiny2.asm



```python
!as tiny2.asm -o tiny2.o
```

- -ffreestanding is used in embedded systems where there is no operating system, and everything has to be self-contained.
    - void main(void) .
    - The standard header files <stdio.h>, <string.h> and so on, are not to be used.
- On ARM64 the "-Oz -ffreestanding" generated assembly does not include SP stack initialization.
- -fident and -fno-ident control whether the output file contains the compiler name and version information.
- -nostdlib implies the individual options -nodefaultlibs and -nostartfiles .
    - the only libraries linked are exactly those that you explicitly name to the linker using the -l flag .
    - http://cs107e.github.io/guides/gcc/

---


```bash
%%bash
clang -Wall -g -Oz -s -static -nostartfiles -nostdlib -ffreestanding \
-fno-ident -fno-asynchronous-unwind-tables  \
-ffunction-sections -fdata-sections -Wl,--gc-sections,--strip-all \
tiny2.o tiny2.c
```


```python
!ls -lh a.out
```

    -rwx------ 1 u0_a113 u0_a113 616 Jan 27 22:29 [0m[01;32ma.out[0m



```python
!./a.out ; echo $?
```

    42



```python
!wc -c a.out
```

    616 a.out



```python
!objdump -h a.out
```

    
    a.out:     file format elf64-littleaarch64
    
    Sections:
    Idx Name          Size      VMA               LMA               File off  Algn
      0 .text         00000014  0000000000201120  0000000000201120  00000120  2**2
                      CONTENTS, ALLOC, LOAD, READONLY, CODE
      1 .comment      00000013  0000000000000000  0000000000000000  00000134  2**0
                      CONTENTS, READONLY



```python
!strip --strip-all --verbose -R .comment a.out
```

    copy from `a.out' [elf64-littleaarch64] to `st227nYp' [elf64-littleaarch64]



```python
!ls -lh a.out
```

    -rwx------ 1 u0_a113 u0_a113 520 Jan 27 22:30 [0m[01;32ma.out[0m



```python
!size a.out
```

       text	   data	    bss	    dec	    hex	filename
         20	      0	      0	     20	     14	a.out



```python
!objdump -h a.out
```

    
    a.out:     file format elf64-littleaarch64
    
    Sections:
    Idx Name          Size      VMA               LMA               File off  Algn
      0 .text         00000014  0000000000201120  0000000000201120  00000120  2**2
                      CONTENTS, ALLOC, LOAD, READONLY, CODE



```python
!objdump -Dz a.out
```

    
    a.out:     file format elf64-littleaarch64
    
    
    Disassembly of section .text:
    
    0000000000201120 <.text>:
      201120:	52800ba8 	mov	w8, #0x5d                  	// #93
      201124:	d2800540 	mov	x0, #0x2a                  	// #42
      201128:	d4000001 	svc	#0x0
      20112c:	52800540 	mov	w0, #0x2a                  	// #42
      201130:	17fffffc 	b	0x201120



```python
!objdump -d a.out
```

    
    a.out:     file format elf64-littleaarch64
    
    
    Disassembly of section .text:
    
    0000000000201120 <.text>:
      201120:	52800ba8 	mov	w8, #0x5d                  	// #93
      201124:	d2800540 	mov	x0, #0x2a                  	// #42
      201128:	d4000001 	svc	#0x0
      20112c:	52800540 	mov	w0, #0x2a                  	// #42
      201130:	17fffffc 	b	0x201120



```python
!hexdump -C a.out
```

    00000000  7f 45 4c 46 02 01 01 00  00 00 00 00 00 00 00 00  |.ELF............|
    00000010  02 00 b7 00 01 00 00 00  2c 11 20 00 00 00 00 00  |........,. .....|
    00000020  40 00 00 00 00 00 00 00  48 01 00 00 00 00 00 00  |@.......H.......|
    00000030  00 00 00 00 40 00 38 00  04 00 40 00 03 00 02 00  |....@.8...@.....|
    00000040  06 00 00 00 04 00 00 00  40 00 00 00 00 00 00 00  |........@.......|
    00000050  40 00 20 00 00 00 00 00  40 00 20 00 00 00 00 00  |@. .....@. .....|
    00000060  e0 00 00 00 00 00 00 00  e0 00 00 00 00 00 00 00  |................|
    00000070  08 00 00 00 00 00 00 00  01 00 00 00 04 00 00 00  |................|
    00000080  00 00 00 00 00 00 00 00  00 00 20 00 00 00 00 00  |.......... .....|
    00000090  00 00 20 00 00 00 00 00  20 01 00 00 00 00 00 00  |.. ..... .......|
    000000a0  20 01 00 00 00 00 00 00  00 10 00 00 00 00 00 00  | ...............|
    000000b0  01 00 00 00 05 00 00 00  20 01 00 00 00 00 00 00  |........ .......|
    000000c0  20 11 20 00 00 00 00 00  20 11 20 00 00 00 00 00  | . ..... . .....|
    000000d0  14 00 00 00 00 00 00 00  14 00 00 00 00 00 00 00  |................|
    000000e0  00 10 00 00 00 00 00 00  51 e5 74 64 06 00 00 00  |........Q.td....|
    000000f0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
    *
    00000120  a8 0b 80 52 40 05 80 d2  01 00 00 d4 40 05 80 52  |...R@.......@..R|
    00000130  fc ff ff 17 00 2e 73 68  73 74 72 74 61 62 00 2e  |......shstrtab..|
    00000140  74 65 78 74 00 00 00 00  00 00 00 00 00 00 00 00  |text............|
    00000150  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
    *
    00000180  00 00 00 00 00 00 00 00  0b 00 00 00 01 00 00 00  |................|
    00000190  06 00 00 00 00 00 00 00  20 11 20 00 00 00 00 00  |........ . .....|
    000001a0  20 01 00 00 00 00 00 00  14 00 00 00 00 00 00 00  | ...............|
    000001b0  00 00 00 00 00 00 00 00  04 00 00 00 00 00 00 00  |................|
    000001c0  00 00 00 00 00 00 00 00  01 00 00 00 03 00 00 00  |................|
    000001d0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
    000001e0  34 01 00 00 00 00 00 00  11 00 00 00 00 00 00 00  |4...............|
    000001f0  00 00 00 00 00 00 00 00  01 00 00 00 00 00 00 00  |................|
    00000200  00 00 00 00 00 00 00 00                           |........|
    00000208


---

- -Wl,–gc-sections: Tell the linker to garbage collect and discard unused sections
- -Wl,-static: Link against static libraries. Required for dead-code elimination


```bash
%%bash
clang tiny2.o tiny2.c \
-Oz -s -ffreestanding -nostartfiles -nostdlib -static -Wl,--gc-sections
```


```python
!ls -lh a.out
```

    -rwx------ 1 u0_a113 u0_a113 632 Jan 27 22:31 [0m[01;32ma.out[0m



```python
!./a.out ; echo $?
```

    42



```python
!size a.out
```

       text	   data	    bss	    dec	    hex	filename
         20	      0	      0	     20	     14	a.out



```python
!objdump -d a.out
```

    
    a.out:     file format elf64-littleaarch64
    
    
    Disassembly of section .text:
    
    0000000000201120 <.text>:
      201120:	52800ba8 	mov	w8, #0x5d                  	// #93
      201124:	d2800540 	mov	x0, #0x2a                  	// #42
      201128:	d4000001 	svc	#0x0
      20112c:	52800540 	mov	w0, #0x2a                  	// #42
      201130:	17fffffc 	b	0x201120



```python
!objdump -h a.out
```

    
    a.out:     file format elf64-littleaarch64
    
    Sections:
    Idx Name          Size      VMA               LMA               File off  Algn
      0 .text         00000014  0000000000201120  0000000000201120  00000120  2**2
                      CONTENTS, ALLOC, LOAD, READONLY, CODE
      1 .comment      00000029  0000000000000000  0000000000000000  00000134  2**0
                      CONTENTS, READONLY



```python
!objdump -s a.out
```

    
    a.out:     file format elf64-littleaarch64
    
    Contents of section .text:
     201120 a80b8052 400580d2 010000d4 40058052  ...R@.......@..R
     201130 fcffff17                             ....            
    Contents of section .comment:
     0000 636c616e 67207665 7273696f 6e203135  clang version 15
     0010 2e302e37 00004c69 6e6b6572 3a204c4c  .0.7..Linker: LL
     0020 44203135 2e302e37 00                 D 15.0.7.       



```python
!strip --verbose -R .comment a.out
```

    copy from `a.out' [elf64-littleaarch64] to `stoSzXe0' [elf64-littleaarch64]



```python
!strip --strip-all --verbose -R .comment a.out
```

    copy from `a.out' [elf64-littleaarch64] to `stzu3HC7' [elf64-littleaarch64]



```python
!./a.out ; echo $?
```

    42



```python
!ls -lh a.out
```

    -rwx------ 1 u0_a113 u0_a113 520 Jan 27 22:32 [0m[01;32ma.out[0m



```python
!objdump -h a.out
```

    
    a.out:     file format elf64-littleaarch64
    
    Sections:
    Idx Name          Size      VMA               LMA               File off  Algn
      0 .text         00000014  0000000000201120  0000000000201120  00000120  2**2
                      CONTENTS, ALLOC, LOAD, READONLY, CODE



```python
!objdump -s a.out
```

    
    a.out:     file format elf64-littleaarch64
    
    Contents of section .text:
     201120 a80b8052 400580d2 010000d4 40058052  ...R@.......@..R
     201130 fcffff17                             ....            



```python
!hexdump -C a.out
```

    00000000  7f 45 4c 46 02 01 01 00  00 00 00 00 00 00 00 00  |.ELF............|
    00000010  02 00 b7 00 01 00 00 00  2c 11 20 00 00 00 00 00  |........,. .....|
    00000020  40 00 00 00 00 00 00 00  48 01 00 00 00 00 00 00  |@.......H.......|
    00000030  00 00 00 00 40 00 38 00  04 00 40 00 03 00 02 00  |....@.8...@.....|
    00000040  06 00 00 00 04 00 00 00  40 00 00 00 00 00 00 00  |........@.......|
    00000050  40 00 20 00 00 00 00 00  40 00 20 00 00 00 00 00  |@. .....@. .....|
    00000060  e0 00 00 00 00 00 00 00  e0 00 00 00 00 00 00 00  |................|
    00000070  08 00 00 00 00 00 00 00  01 00 00 00 04 00 00 00  |................|
    00000080  00 00 00 00 00 00 00 00  00 00 20 00 00 00 00 00  |.......... .....|
    00000090  00 00 20 00 00 00 00 00  20 01 00 00 00 00 00 00  |.. ..... .......|
    000000a0  20 01 00 00 00 00 00 00  00 10 00 00 00 00 00 00  | ...............|
    000000b0  01 00 00 00 05 00 00 00  20 01 00 00 00 00 00 00  |........ .......|
    000000c0  20 11 20 00 00 00 00 00  20 11 20 00 00 00 00 00  | . ..... . .....|
    000000d0  14 00 00 00 00 00 00 00  14 00 00 00 00 00 00 00  |................|
    000000e0  00 10 00 00 00 00 00 00  51 e5 74 64 06 00 00 00  |........Q.td....|
    000000f0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
    *
    00000120  a8 0b 80 52 40 05 80 d2  01 00 00 d4 40 05 80 52  |...R@.......@..R|
    00000130  fc ff ff 17 00 2e 73 68  73 74 72 74 61 62 00 2e  |......shstrtab..|
    00000140  74 65 78 74 00 00 00 00  00 00 00 00 00 00 00 00  |text............|
    00000150  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
    *
    00000180  00 00 00 00 00 00 00 00  0b 00 00 00 01 00 00 00  |................|
    00000190  06 00 00 00 00 00 00 00  20 11 20 00 00 00 00 00  |........ . .....|
    000001a0  20 01 00 00 00 00 00 00  14 00 00 00 00 00 00 00  | ...............|
    000001b0  00 00 00 00 00 00 00 00  04 00 00 00 00 00 00 00  |................|
    000001c0  00 00 00 00 00 00 00 00  01 00 00 00 03 00 00 00  |................|
    000001d0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
    000001e0  34 01 00 00 00 00 00 00  11 00 00 00 00 00 00 00  |4...............|
    000001f0  00 00 00 00 00 00 00 00  01 00 00 00 00 00 00 00  |................|
    00000200  00 00 00 00 00 00 00 00                           |........|
    00000208


---


```python

```


```python
%%writefile tiny3.c
#include <stdio.h>

int main(void) {
    puts("Hello World!\n");
}
```

    Overwriting tiny3.c



```python
!clang -Wall tiny3.c
```


```python
!./a.out
```

    Hello World!
    



```python
!ls -lh a.out
```

    -rwx------ 1 u0_a113 u0_a113 5.9K Jan 27 22:37 [0m[01;32ma.out[0m


---


```python
%%writefile tiny4.c
#include <stdio.h>

void _start(void) {
    puts("Hello World!\n");
}
```

    Overwriting tiny4.c



```bash
%%bash
clang tiny4.c \
-Wall -Oz -s -nostartfiles \
-fno-ident -fno-asynchronous-unwind-tables  \
-ffunction-sections -fdata-sections -Wl,--gc-sections,--strip-all \
```


```python
!strip --strip-all --verbose -R .comment a.out
```

    copy from `a.out' [elf64-littleaarch64] to `stBvxzAr' [elf64-littleaarch64]



```python
!./a.out
```

    Hello World!
    



```python
!ls -lh a.out
```

    -rwx------ 1 u0_a113 u0_a113 2.2K Jan 27 22:53 [0m[01;32ma.out[0m



```python
!objdump -Dz a.out
```

    
    a.out:     file format elf64-littleaarch64
    
    
    Disassembly of section .interp:
    
    0000000000000200 <.interp>:
     200:	7379732f 	.inst	0x7379732f ; undefined
     204:	2f6d6574 	.inst	0x2f6d6574 ; undefined
     208:	2f6e6962 	umlsl	v2.4s, v11.4h, v14.h[6]
     20c:	6b6e696c 	.inst	0x6b6e696c ; undefined
     210:	34367265 	cbz	w5, 6d05c <puts@plt+0x6bd2c>
     214:	Address 0x214 is out of bounds.
    
    
    Disassembly of section .dynsym:
    
    0000000000000218 <.dynsym>:
     218:	00000000 	udf	#0
     21c:	00000000 	udf	#0
     220:	00000000 	udf	#0
     224:	00000000 	udf	#0
     228:	00000000 	udf	#0
     22c:	00000000 	udf	#0
     230:	00000001 	udf	#1
     234:	00000012 	udf	#18
     238:	00000000 	udf	#0
     23c:	00000000 	udf	#0
     240:	00000000 	udf	#0
     244:	00000000 	udf	#0
    
    Disassembly of section .gnu.version:
    
    0000000000000248 <.gnu.version>:
     248:	00020000 	.inst	0x00020000 ; undefined
    
    Disassembly of section .gnu.version_r:
    
    000000000000024c <.gnu.version_r>:
     24c:	00010001 	.inst	0x00010001 ; undefined
     250:	00000006 	udf	#6
     254:	00000010 	udf	#16
     258:	00000000 	udf	#0
     25c:	00050d63 	.inst	0x00050d63 ; undefined
     260:	00020000 	.inst	0x00020000 ; undefined
     264:	0000000e 	udf	#14
     268:	00000000 	udf	#0
    
    Disassembly of section .gnu.hash:
    
    0000000000000270 <.gnu.hash>:
     270:	00000001 	udf	#1
     274:	00000002 	udf	#2
     278:	00000001 	udf	#1
     27c:	0000001a 	udf	#26
     280:	00000000 	udf	#0
     284:	00000000 	udf	#0
     288:	00000000 	udf	#0
    
    Disassembly of section .dynstr:
    
    000000000000028c <.dynstr>:
     28c:	74757000 	.inst	0x74757000 ; undefined
     290:	696c0073 	ldpsw	x19, x0, [x3, #-160]
     294:	732e6362 	.inst	0x732e6362 ; undefined
     298:	494c006f 	.inst	0x494c006f ; undefined
     29c:	2f004342 	.inst	0x2f004342 ; undefined
     2a0:	61746164 	.inst	0x61746164 ; undefined
     2a4:	7461642f 	.inst	0x7461642f ; undefined
     2a8:	6f632f61 	.inst	0x6f632f61 ; undefined
     2ac:	65742e6d 	fmls	z13.h, p3/m, z19.h, z20.h
     2b0:	78756d72 	.inst	0x78756d72 ; undefined
     2b4:	6c69662f 	ldnp	d15, d25, [x17, #-368]
     2b8:	752f7365 	.inst	0x752f7365 ; undefined
     2bc:	6c2f7273 	stnp	d19, d28, [x19, #-272]
     2c0:	6c006269 	stnp	d9, d24, [x19]
     2c4:	6c646269 	ldnp	d9, d24, [x19, #-448]
     2c8:	006f732e 	.inst	0x006f732e ; undefined
    
    Disassembly of section .rela.plt:
    
    00000000000002d0 <.rela.plt>:
     2d0:	00002488 	udf	#9352
     2d4:	00000000 	udf	#0
     2d8:	00000402 	udf	#1026
     2dc:	00000001 	udf	#1
     2e0:	00000000 	udf	#0
     2e4:	00000000 	udf	#0
    
    Disassembly of section .rodata:
    
    00000000000002e8 <.rodata>:
     2e8:	6c6c6548 	ldnp	d8, d25, [x10, #-320]
     2ec:	6f57206f 	umlal2	v15.4s, v3.8h, v7.h[1]
     2f0:	21646c72 	.inst	0x21646c72 ; undefined
     2f4:	Address 0x2f4 is out of bounds.
    
    
    Disassembly of section .text:
    
    00000000000012f8 <.text>:
        12f8:	d503201f 	nop
        12fc:	10ff7f60 	adr	x0, 2e8 <puts@plt-0x1048>
        1300:	1400000c 	b	1330 <puts@plt>
    
    Disassembly of section .plt:
    
    0000000000001310 <puts@plt-0x20>:
        1310:	a9bf7bf0 	stp	x16, x30, [sp, #-16]!
        1314:	b0000010 	adrp	x16, 2000 <puts@plt+0xcd0>
        1318:	f9424211 	ldr	x17, [x16, #1152]
        131c:	91120210 	add	x16, x16, #0x480
        1320:	d61f0220 	br	x17
        1324:	d503201f 	nop
        1328:	d503201f 	nop
        132c:	d503201f 	nop
    
    0000000000001330 <puts@plt>:
        1330:	b0000010 	adrp	x16, 2000 <puts@plt+0xcd0>
        1334:	f9424611 	ldr	x17, [x16, #1160]
        1338:	91122210 	add	x16, x16, #0x488
        133c:	d61f0220 	br	x17
    
    Disassembly of section .dynamic:
    
    0000000000002340 <.dynamic>:
        2340:	0000001d 	udf	#29
        2344:	00000000 	udf	#0
        2348:	00000013 	udf	#19
        234c:	00000000 	udf	#0
        2350:	00000001 	udf	#1
        2354:	00000000 	udf	#0
        2358:	00000037 	udf	#55
        235c:	00000000 	udf	#0
        2360:	00000001 	udf	#1
        2364:	00000000 	udf	#0
        2368:	00000006 	udf	#6
        236c:	00000000 	udf	#0
        2370:	0000001e 	udf	#30
        2374:	00000000 	udf	#0
        2378:	00000008 	udf	#8
        237c:	00000000 	udf	#0
        2380:	6ffffffb 	.inst	0x6ffffffb ; undefined
        2384:	00000000 	udf	#0
        2388:	08000001 	stxrb	w0, w1, [x0]
        238c:	00000000 	udf	#0
        2390:	00000015 	udf	#21
        2394:	00000000 	udf	#0
        2398:	00000000 	udf	#0
        239c:	00000000 	udf	#0
        23a0:	00000017 	udf	#23
        23a4:	00000000 	udf	#0
        23a8:	000002d0 	udf	#720
        23ac:	00000000 	udf	#0
        23b0:	00000002 	udf	#2
        23b4:	00000000 	udf	#0
        23b8:	00000018 	udf	#24
        23bc:	00000000 	udf	#0
        23c0:	00000003 	udf	#3
        23c4:	00000000 	udf	#0
        23c8:	00002470 	udf	#9328
        23cc:	00000000 	udf	#0
        23d0:	00000014 	udf	#20
        23d4:	00000000 	udf	#0
        23d8:	00000007 	udf	#7
        23dc:	00000000 	udf	#0
        23e0:	00000006 	udf	#6
        23e4:	00000000 	udf	#0
        23e8:	00000218 	udf	#536
        23ec:	00000000 	udf	#0
        23f0:	0000000b 	udf	#11
        23f4:	00000000 	udf	#0
        23f8:	00000018 	udf	#24
        23fc:	00000000 	udf	#0
        2400:	00000005 	udf	#5
        2404:	00000000 	udf	#0
        2408:	0000028c 	udf	#652
        240c:	00000000 	udf	#0
        2410:	0000000a 	udf	#10
        2414:	00000000 	udf	#0
        2418:	00000040 	udf	#64
        241c:	00000000 	udf	#0
        2420:	6ffffef5 	.inst	0x6ffffef5 ; undefined
        2424:	00000000 	udf	#0
        2428:	00000270 	udf	#624
        242c:	00000000 	udf	#0
        2430:	6ffffff0 	.inst	0x6ffffff0 ; undefined
        2434:	00000000 	udf	#0
        2438:	00000248 	udf	#584
        243c:	00000000 	udf	#0
        2440:	6ffffffe 	.inst	0x6ffffffe ; undefined
        2444:	00000000 	udf	#0
        2448:	0000024c 	udf	#588
        244c:	00000000 	udf	#0
        2450:	6fffffff 	.inst	0x6fffffff ; undefined
        2454:	00000000 	udf	#0
        2458:	00000001 	udf	#1
        245c:	00000000 	udf	#0
        2460:	00000000 	udf	#0
        2464:	00000000 	udf	#0
        2468:	00000000 	udf	#0
        246c:	00000000 	udf	#0
    
    Disassembly of section .got.plt:
    
    0000000000002470 <.got.plt>:
        2470:	00000000 	udf	#0
        2474:	00000000 	udf	#0
        2478:	00000000 	udf	#0
        247c:	00000000 	udf	#0
        2480:	00000000 	udf	#0
        2484:	00000000 	udf	#0
        2488:	00001310 	udf	#4880
        248c:	00000000 	udf	#0



```python

```

---


```python
%%writefile tiny5.c
#include <stdio.h>

void _start(void) {
    char *s="Hello World!\n";
    write(1,s,strlen(s));
}
```

    Overwriting tiny5.c



```bash
%%bash
clang tiny5.c \
-Oz -s -nostartfiles \
-fno-ident -fno-asynchronous-unwind-tables  \
-ffunction-sections -fdata-sections -Wl,--gc-sections,--strip-all
```

    tiny5.c:5:5: warning: call to undeclared function 'write'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
        write(1,s,strlen(s));
        ^
    1 warning generated.



```python
!strip --strip-all --verbose -R .comment a.out
```

    copy from `a.out' [elf64-littleaarch64] to `stdVAkuP' [elf64-littleaarch64]



```python
!./a.out
```

    Hello World!



```python
!ls -lh a.out
```

    -rwx------ 1 u0_a113 u0_a113 2.2K Jan 27 22:59 [0m[01;32ma.out[0m



```python

```


```python

```


```python
%%writefile hello.s
    .data

/* Data segment: define our message string and calculate its length. */
helloworld:
    .ascii        "Hello, World!\n"
helloworld_len = . - helloworld

    .text

/* Our application's entry point. */
.globl _start
_start:
    /* syscall write(int fd, const void *buf, size_t count) */
    mov     x0, #1              /* fd := STDOUT_FILENO */
    ldr     x1, =helloworld     /* buf := msg */
    ldr     x2, =helloworld_len /* count := len */
    mov     w8, #64             /* write is syscall #64 */
    svc     #0                  /* invoke syscall */

    /* syscall exit(int status) */
    mov     x0, #0               /* status := 0 */
    mov     w8, #93              /* exit is syscall #1 */
    svc     #0                   /* invoke syscall */
```

    Writing hello.s



```python
!as hello.s -o hello.o
```


```python
!ld --strip-all --gc-sections -static hello.o
```


```python
!./a.out
```

    Hello, World!



```python
!ls -lh a.out
```

    -rwx------ 1 u0_a113 u0_a113 520 Jan 27 23:04 [0m[01;32ma.out[0m



```python
!objdump -h a.out
```

    
    a.out:     file format elf64-littleaarch64
    
    Sections:
    Idx Name          Size      VMA               LMA               File off  Algn
      0 .text         00000030  00000000004000b0  00000000004000b0  000000b0  2**3
                      CONTENTS, ALLOC, LOAD, READONLY, CODE
      1 .data         0000000e  00000000004100e0  00000000004100e0  000000e0  2**0
                      CONTENTS, ALLOC, LOAD, DATA



```python
!objdump -s a.out
```

    
    a.out:     file format elf64-littleaarch64
    
    Contents of section .text:
     4000b0 200080d2 e1000058 02010058 08088052   ......X...X...R
     4000c0 010000d4 000080d2 a80b8052 010000d4  ...........R....
     4000d0 e0004100 00000000 0e000000 00000000  ..A.............
    Contents of section .data:
     4100e0 48656c6c 6f2c2057 6f726c64 210a      Hello, World!.  



```python
!objdump -D -j .text a.out
```

    
    a.out:     file format elf64-littleaarch64
    
    
    Disassembly of section .text:
    
    00000000004000b0 <.text>:
      4000b0:	d2800020 	mov	x0, #0x1                   	// #1
      4000b4:	580000e1 	ldr	x1, 0x4000d0
      4000b8:	58000102 	ldr	x2, 0x4000d8
      4000bc:	52800808 	mov	w8, #0x40                  	// #64
      4000c0:	d4000001 	svc	#0x0
      4000c4:	d2800000 	mov	x0, #0x0                   	// #0
      4000c8:	52800ba8 	mov	w8, #0x5d                  	// #93
      4000cc:	d4000001 	svc	#0x0
      4000d0:	004100e0 	.inst	0x004100e0 ; undefined
      4000d4:	00000000 	udf	#0
      4000d8:	0000000e 	udf	#14
      4000dc:	00000000 	udf	#0



```python
!hexdump -C a.out
```

    00000000  7f 45 4c 46 02 01 01 00  00 00 00 00 00 00 00 00  |.ELF............|
    00000010  02 00 b7 00 01 00 00 00  b0 00 40 00 00 00 00 00  |..........@.....|
    00000020  40 00 00 00 00 00 00 00  08 01 00 00 00 00 00 00  |@...............|
    00000030  00 00 00 00 40 00 38 00  02 00 40 00 04 00 03 00  |....@.8...@.....|
    00000040  01 00 00 00 05 00 00 00  00 00 00 00 00 00 00 00  |................|
    00000050  00 00 40 00 00 00 00 00  00 00 40 00 00 00 00 00  |..@.......@.....|
    00000060  e0 00 00 00 00 00 00 00  e0 00 00 00 00 00 00 00  |................|
    00000070  00 00 01 00 00 00 00 00  01 00 00 00 06 00 00 00  |................|
    00000080  e0 00 00 00 00 00 00 00  e0 00 41 00 00 00 00 00  |..........A.....|
    00000090  e0 00 41 00 00 00 00 00  0e 00 00 00 00 00 00 00  |..A.............|
    000000a0  0e 00 00 00 00 00 00 00  00 00 01 00 00 00 00 00  |................|
    000000b0  20 00 80 d2 e1 00 00 58  02 01 00 58 08 08 80 52  | ......X...X...R|
    000000c0  01 00 00 d4 00 00 80 d2  a8 0b 80 52 01 00 00 d4  |...........R....|
    000000d0  e0 00 41 00 00 00 00 00  0e 00 00 00 00 00 00 00  |..A.............|
    000000e0  48 65 6c 6c 6f 2c 20 57  6f 72 6c 64 21 0a 00 2e  |Hello, World!...|
    000000f0  73 68 73 74 72 74 61 62  00 2e 74 65 78 74 00 2e  |shstrtab..text..|
    00000100  64 61 74 61 00 00 00 00  00 00 00 00 00 00 00 00  |data............|
    00000110  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
    *
    00000140  00 00 00 00 00 00 00 00  0b 00 00 00 01 00 00 00  |................|
    00000150  06 00 00 00 00 00 00 00  b0 00 40 00 00 00 00 00  |..........@.....|
    00000160  b0 00 00 00 00 00 00 00  30 00 00 00 00 00 00 00  |........0.......|
    00000170  00 00 00 00 00 00 00 00  08 00 00 00 00 00 00 00  |................|
    00000180  00 00 00 00 00 00 00 00  11 00 00 00 01 00 00 00  |................|
    00000190  03 00 00 00 00 00 00 00  e0 00 41 00 00 00 00 00  |..........A.....|
    000001a0  e0 00 00 00 00 00 00 00  0e 00 00 00 00 00 00 00  |................|
    000001b0  00 00 00 00 00 00 00 00  01 00 00 00 00 00 00 00  |................|
    000001c0  00 00 00 00 00 00 00 00  01 00 00 00 03 00 00 00  |................|
    000001d0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
    000001e0  ee 00 00 00 00 00 00 00  17 00 00 00 00 00 00 00  |................|
    000001f0  00 00 00 00 00 00 00 00  01 00 00 00 00 00 00 00  |................|
    00000200  00 00 00 00 00 00 00 00                           |........|
    00000208



```python

```
