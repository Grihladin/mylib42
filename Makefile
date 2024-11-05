# Library names
MY_LIB_NAME = mylib.a
LIBFT_NAME = libft.a
PRINTF_NAME = libftprintf.a

# Source files
LIBFT_SRC = libft/ft_isalpha.c libft/ft_isdigit.c libft/ft_toupper.c libft/ft_tolower.c \
			libft/ft_isalnum.c libft/ft_isascii.c libft/ft_isprint.c libft/ft_strlen.c \
			libft/ft_strchr.c libft/ft_strrchr.c libft/ft_strcmp.c libft/ft_memset.c \
			libft/ft_strncmp.c libft/ft_bzero.c libft/ft_memchr.c libft/ft_memcpy.c \
			libft/ft_memcmp.c libft/ft_memmove.c libft/ft_strlcpy.c libft/ft_strnstr.c \
			libft/ft_strlcat.c libft/ft_atoi.c libft/ft_calloc.c libft/ft_strdup.c \
			libft/ft_substr.c libft/ft_strjoin.c libft/ft_strtrim.c libft/ft_split.c \
			libft/ft_itoa.c libft/ft_strmapi.c libft/ft_striteri.c libft/ft_putchar_fd.c \
			libft/ft_putstr_fd.c libft/ft_putendl_fd.c libft/ft_putnbr_fd.c libft/ft_lstnew.c \
			libft/ft_lstadd_front.c libft/ft_lstsize.c libft/ft_lstlast.c libft/ft_lstadd_back.c \
			libft/ft_lstdelone.c libft/ft_lstclear.c libft/ft_lstiter.c libft/ft_lstmap.c

PRINTF_SRC = ft_printf/ft_printf.c \
			ft_printf/ft_printf_char.c \
			ft_printf/ft_printf_str.c \
			ft_printf/ft_printf_int.c \
			ft_printf/ft_printf_uint.c \
			ft_printf/ft_printf_percent.c \
			ft_printf/ft_printf_ptr.c \
			ft_printf/ft_printf_hexadecimal.c

# Object directories
OBJ_DIR = objects

# Object files
LIBFT_OBJ = $(LIBFT_SRC:libft/%.c=$(OBJ_DIR)/libft/%.o)
PRINTF_OBJ = $(PRINTF_SRC:ft_printf/%.c=$(OBJ_DIR)/ft_printf/%.o)
ALL_OBJ = $(LIBFT_OBJ) $(PRINTF_OBJ)

# Compiler and flags
CC = cc
CFLAGS = -Wall -Wextra -Werror

.PHONY: all clean fclean re

# Targets
all: $(MY_LIB_NAME)

$(MY_LIB_NAME): $(ALL_OBJ)
	ar rcs $(MY_LIB_NAME) $(ALL_OBJ)

$(OBJ_DIR)/libft/%.o: libft/%.c
	@mkdir -p $(OBJ_DIR)/libft
	$(CC) $(CFLAGS) -c $< -o $@

$(OBJ_DIR)/ft_printf/%.o: ft_printf/%.c
	@mkdir -p $(OBJ_DIR)/ft_printf
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf $(OBJ_DIR)

fclean: clean
	rm -f $(MY_LIB_NAME)

re: fclean all
