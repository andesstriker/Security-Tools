# Useful Commands

## Terminal commands
- `which `: tells you where a program is located
  - `which curl`
- `hexdump -C /bin/ls | less`: dumps all the hex in the file ?
- `cat`: concatenates files or reads standard input
- `;` can be used to write multiple commands in one line
- strace
  - ex `strace -f ./bomb` 
- `ltrace`
- `objdump intel -h <file> | less`: will dump the hex in intel assembly
  - can be modified to dump the assembly for a specific architecture
- `readelf -h <file>`:reads file headers


## Pwndbg
- `backtrace`
- `tbreak *address`
- `examine`/`x`
- `p (void ()(char *))(0xaddress)(input)` 
  - this is a way to call functions dynamically if debugging is blocked
- you can start gdb by `start` command and be able to query things in gdb
- `gbd-core` to see the core dumped
- `break main`
  - stops in main  
- `cyclic 100`
  - useful for recognizable patterns for stack overflows
  - `cyclic -l faaa`
  - can lookup a specific pattern