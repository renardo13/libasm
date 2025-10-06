# libasm
Basic library in Assembler language like libc in C language.
This librairy provide Character utilities, memory management, I/O helpers, String manipulation functions.

## Mini tutorial with tab

## REGISTER

Registers are ultra-fast storage locations inside the ```CPU```. They are not part of the ```stack``` or the ```heap```.
```Stack``` and ```heap``` are found in the ```RAM```.

The stack is used in assembly for instance with `push` and `pop`. This is automatic memory management (LIFO) -> the order is ***last in first out***.
When you do `pop` you take the value inside the register, you make a copy and you put it on the top of the ***stack***.
```push rax``` -> put the value of rax on the stack \
```pop rdx``` -> take this value and put it in rdx

## Aside

| Criterion          | Stack                       | Heap                          | CPU Registers                                  |
|--------------------|-----------------------------|-------------------------------|------------------------------------------------|
| Speed              | Very fast                   | Slower                        | Ultra-fast (faster than stack)                 |
| Memory management  | Automatic (LIFO)            | Manual or garbage collected   | Fully managed by CPU hardware                  |
| Size               | Small                       | Large                         | Extremely small (dozens to hundreds of bytes)  |
| Allocation         | Known at compile time       | During program execution      | Fixed by CPU architecture (not user-controlled)|
| Lifetime           | Limited to the function     | Controlled by the program     | Lives only while the CPU executes instructions |


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


## CONDITION

For conditions, `Z`ero `F`lag is checked (ZF).

| Flag | Meaning                        |
|------|--------------------------------|
| ZF   | Zero Flag (result = 0)         |
| CF   | Carry Flag (unsigned overflow) |
| SF   | Sign Flag (result negative)    |
| OF   | Overflow Flag (signed overflow)|


| Jump | Flag checked | Condition                     |
|------|--------------|-------------------------------|
| je   | ZF           | Jump if equal (zero)          |
| jne  | ZF           | Jump if not equal             |
| jl   | SF, OF       | Jump if less (signed)         |
| jg   | ZF, SF, OF   | Jump if greater (signed)      |
| jz   | ZF           | Jump if zero (same as je)     |
| jnz  | ZF           | Jump if not zero (same as jne)|


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

| C Type read  | Register used | Portion of `rax` accessed             |
|--------------|---------------|---------------------------------------|
| char         | al (8 bits)   | Lowest 8 bits                         |
| short        | ax (16 bits)  | Lowest 16 bits                        |
| int          | eax (32 bits) | Lowest 32 bits (upper half set to 0)  |
| long         | rax (64 bits) | All 64 bits                           |

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


1️⃣ cat /usr/include/x86_64-linux-gnu/asm/unistd_64.h to see the code associated with syscall
You have to put the right code in `rax` and make a syscall.
