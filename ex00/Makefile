# compiler

ASM = nasm
ASM_FLAG = -f elf64

SRC = ft_strlen.asm 
OBJ = $(SRC:.asm=.o)

all: $(OBJ)

%.o: %.asm
	$(ASM) $(ASM_FLAGS) $< -o $@

# Nettoyage
clean:
	rm -f $(OBJ)

.PHONY: all clean
