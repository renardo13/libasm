# libasm
Basic library in Assembler language like libc in C language.
This librairy provide Character utilities, memory management, I/O helpers, String manipulation functions.

## FLAG

| Instruction | Signification              |
| ----------- | -------------------------- |
| jne         | Jump if Not Equal (ZF = 0) |
| je          | Jump if Equal (ZF = 1)     |
| jnz         | Jump if Not Zero (ZF = 0)  |
| jz          | Jump if Zero (ZF = 1)      |

## REGISTER

| Register | Size    | Notes                                             |
| -------- | ------- | ------------------------------------------------- |
| al       | 8 bits  | Lowest byte of rax                                |
| ah       | 8 bits  | Second byte of rax (high byte of the 16-bit word) |
| ax       | 16 bits | Lowest 16 bits of rax (al + ah)                   |
| eax      | 32 bits | Lowest 32 bits of rax                             |
| rax      | 64 bits | Full 64-bit register                              |


