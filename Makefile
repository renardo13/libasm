# compile

ASM = nasm
ASM_FLAGS = -f elf64


# archive to use as a library
AR = ar
AR_FLAGS = rcs


SRC = ft_strlen.asm
OBJ = $(SRC:.asm=.o)
LIB = libasm.a
EXEC = a.out

all: $(OBJ) $(LIB) $(EXEC)

%.o: %.asm
	$(ASM) $(ASM_FLAGS) $< -o $@

$(LIB): $(OBJ)
	$(AR) $(AR_FLAGS) $(LIB) $(OBJ)

# clean
clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(LIB)

re: fclean all

# execute with my main.c
$(EXEC): main.c $(LIB)
	gcc main.c -L. -lasm -o $(EXEC)

.PHONY: all clean
