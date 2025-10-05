NAME = libasm.a
ASM = nasm
ASMFLAGS = -felf64
SRC = ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s
OBJ = $(SRC:.s=.o)

all: $(NAME) exec

$(NAME): $(OBJ)
	ar rcs $(NAME) $(OBJ)

%.o: %.s
	$(ASM) $(ASMFLAGS) $< -o $@


exec: main.c $(NAME)
	$(CC) $(CFLAGS) main.c $(NAME) -o a.out

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME) a.out

re: fclean all