NAME = libasm.a
ASM = nasm
ASMFLAGS = -felf64
SRC = ft_strlen.asm ft_strcpy.asm ft_strcmp.asm ft_write.asm ft_read.asm
OBJ = $(SRC:.asm=.o)

all: $(NAME) main

$(NAME): $(OBJ)
	ar rcs $(NAME) $(OBJ)

%.o: %.asm
	$(ASM) $(ASMFLAGS) $< -o $@

main: main.c $(NAME)
	cc main.c $(NAME) -o a.out

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME) a.out

re: fclean all