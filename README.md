# libasm
Basic library in Assembler language like libc in C language.
This librairy provide Character utilities, memory management, I/O helpers, String manipulation functions.

## Mini tutorial

## REGISTER

Registers are ultra-fast storage locations inside the ```CPU```. They are not part of the ```stack``` or the ```heap```.

## Aside

| Criterion         | Stack                   | Heap                        |
| ----------------- | ----------------------- | --------------------------- |
| Speed             | Very fast               | Slower                      |
| Memory management | Automatic (LIFO)        | Manual or garbage collected |
| Size              | Small                   | Large                       |
| Allocation        | Known at compile time   | During program execution    |               
| Lifetime          | Limited to the function | Controlled by the program   |


## ARGUMENTS

Argument are ```pointers``` toward the value in reality.
Argument passed throught ASM functions calls (in C or other hight levels languages) :

| Argument number | Register | Notes                                        |
| --------------- | -------- | -------------------------------------------- |
| 1               | `rdi`    | First argument                               |
| 2               | `rsi`    | Second argument                              |
| 3               | `rdx`    | Third argument                               |
| 4               | `rcx`    | Fourth argument                              |
| 5               | `r8`     | Fifth argument                               |
| 6               | `r9`     | Sixth argument                               |
| 7+              | Stack    | Additional arguments are passed on the stack |


## FLAG

| Instruction | Signification                   |
| ----------- | ------------------------------- |
| jne         | `J`ump if `N`ot `E`qual (ZF = 0)|
| je          | `J`ump if `E`qual (ZF = 1)      |
| jnz         | `J`ump if `N`ot `Z`ero (ZF = 0) |
| jz          | `J`ump if `Z`ero (ZF = 1)       |

### RETURN

Return value with "ret" :

| Registre | Taille  | Hex content        | Decimal content |
| -------- | ------- | ------------------ | --------------- |
| `rax`    | 64 bits | 0x000000000000002A | 42              |
| `eax`    | 32 bits | 0x0000002A         | 42              |
| `ax`     | 16 bits | 0x002A             | 42              |
| `al`     | 8 bits  | 0x2A               | 42              |
| `ah`     | 8 bits  | 0x00               | 0               |

### Interpretation of this return value in C

When you return a value from an asm function with ret, the register that the caller reads the value from depends on the function’s prototype :

| Type C   | Register read | Value read                   |
| -------- | ------------- | ---------------------------- |
| `char`   | `al`          | 42                           |
| `short`  | `ax`          | 42                           |
| `int`    | `eax`         | 42                           |
| `long`   | `rax`         | 42                           |

## SYSTEM CALLS

A ```syscall``` is juste a call to a function that we can not performed directly without some checks. We cannot write directly in memory etc...

- Programs cannot touch hardware, open files, or allocate heap memory arbitrarily.  
- **Syscalls** are the controlled interface to do those things safely.  
- The kernel performs **permissions checks, validation, and buffering** before executing the requested action.

### Example: `write` syscall

| Stage            | Description |
|------------------|-------------|
| User Program     | `syscall write(fd, buf, count)` |
| Kernel           | 1️⃣ Check file descriptor and permissions<br>2️⃣ Validate buffer pointer and size<br>3️⃣ Copy data from user buffer to kernel buffer<br>4️⃣ Call device driver to perform the write |
| Return to User   | `rax` = number of bytes written, or -1 if error |



