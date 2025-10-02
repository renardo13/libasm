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

### Return value with "ret"

| Registre | Taille  | Hex content        | Decimal content |
| -------- | ------- | ------------------ | --------------- |
| `rax`    | 64 bits | 0x000000000000002A | 42              |
| `eax`    | 32 bits | 0x0000002A         | 42              |
| `ax`     | 16 bits | 0x002A             | 42              |
| `al`     | 8 bits  | 0x2A               | 42              |
| `ah`     | 8 bits  | 0x00               | 0               |

### Interpretation of this register in C

When you return a value from an asm function with ret, the register that the caller reads the value from depends on the function’s prototype :

| Type C   | Registre lu | Valeur lue                   |
| -------- | ----------- | ---------------------------- |
| `char`   | `al`        | 42                           |
| `short`  | `ax`        | 42                           |
| `int`    | `eax`       | 42                           |
| `long`   | `rax`       | 42                           |
| `double` | `xmm0`      | ❌ indéterminé (pas dans rax) |

