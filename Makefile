NAME = libasm.a
ASM = nasm
ASMFLAGS = -felf64
CC = cc
CFLAGS = -Wall -Wextra -Werror

SRC = ft_strlen.s \
      ft_strcpy.s \
      ft_strcmp.s \
      ft_write.s \
      ft_read.s \
      ft_strdup.s \

OBJ = $(addprefix srcs/, $(SRC:.s=.o))

all: $(NAME)

$(NAME): $(OBJ)
	ar rcs $(NAME) $(OBJ)

%.o: %.s
	$(ASM) $(ASMFLAGS) $< -o $@

compile: main.c $(NAME)
	$(CC) $(CFLAGS) main.c $(NAME) -o a.out

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME) a.out

re: fclean all

