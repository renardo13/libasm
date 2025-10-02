# compile
ASM = nasm
ASM_FLAGS = -f elf64

# archive to use as a library
AR = ar
AR_FLAGS = rcs

SRC = ft_strlen.asm \
	ft_strcpy.asm \
	ft_strcmp.asm \
	
	
OBJ = $(SRC:.asm=.o)
LIB = libasm.a
EXEC = a.out

# Default target
all: $(OBJ) $(LIB) $(EXEC)

# Assemble ASM files to object files
%.o: %.asm
	$(ASM) $(ASM_FLAGS) $< -o $@

# Create static library from object files
$(LIB): $(OBJ)
	$(AR) $(AR_FLAGS) $(LIB) $(OBJ)

# Compile main.c and link with the static library
$(EXEC): main.c $(LIB)
	gcc main.c -L. -lasm -fPIE -o $(EXEC)

# Clean up object files
clean:
	rm -f $(OBJ)

# Clean everything including library
fclean: clean
	rm -f $(LIB) $(EXEC)

# Rebuild everything
re: fclean all

.PHONY: all clean fclean re
