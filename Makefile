NAME = cub3D

SRCS =	srcs/main.c \
		srcs/free.c \
		srcs/make_map.c \
		srcs/init_all.c \
		srcs/init_texture.c \
		srcs/init_position.c \
		srcs/get_elem.c \
		srcs/utils.c \
		srcs/gameplay.c \
		srcs/keyboard.c \
		srcs/raycast.c \
		srcs/ft_error.c \
		srcs/mouse.c 	\
		\
		srcs/parsing/parsing_map.c \
		srcs/parsing/check_map.c \
		srcs/parsing/parsing_elem.c \
		srcs/parsing/parsing_utils.c \
		srcs/draw.c \
		\
		gnl/get_next_line.c \
		gnl/get_next_line_utils.c

OBJS_DIR = objs/

OBJS =	$(SRCS:.c=.o)

OBJS_PREFIXED = $(addprefix $(OBJS_DIR), $(OBJS))

CC = gcc

CFLAGS = -Wall -Wextra -Werror -g

TFLAGS = mlx/libmlx_Linux.a -lm -lXext -lX11 libft/libft.a

GREEN		=	\e[92;5;118m
YELLOW		=	\e[93;5;226m
GRAY		=	\e[33;2;37m
RESET		=	\e[0m
CURSIVE		=	\e[33;3m

$(OBJS_DIR)%.o : %.c includes/cub3D.h
	@mkdir -p $(OBJS_DIR)
	@mkdir -p $(OBJS_DIR)srcs
	@mkdir -p $(OBJS_DIR)srcs/parsing
	@mkdir -p $(OBJS_DIR)gnl
	@$(CC) $(CFLAGS) -c $< -o $@

$(NAME): $(OBJS_PREFIXED)
	@printf "$(CURSIVE)$(GRAY) 	- Compiling $(NAME)... $(RESET)\n"
	@make -C ./libft
	@$(CC) -o $(NAME) $(OBJS_PREFIXED) $(CFLAGS) $(TFLAGS)
	@printf "$(_SUCCESS) $(GREEN)- Executable ready.\n$(RESET)"

all: $(NAME)

clean:
	@make clean -C ./libft
	@rm -rf $(OBJS_DIR)
	@printf "$(YELLOW)    - Object files removed.$(RESET)\n"
	
fclean: clean
	@make fclean -C ./libft
	@rm -f $(NAME)
	@printf "$(YELLOW)    - Executable removed.$(RESET)\n"
	
re: fclean all

.PHONY:	all clean fclean re
