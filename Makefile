# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tle-monn <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/07/24 15:11:26 by tle-monn          #+#    #+#              #
#    Updated: 2023/07/24 16:27:26 by pameyer          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	= libftprintf.a

PRE	= ./src

HEAD	= ./include

SRC	= ft_printf_utils.c ft_printf.c ft_print_hex.c ft_print_ptr.c ft_print_unsigned.c

SRCS	= ${addprefix ${PRE}/, ${SRC}}

LIBFT_PATH	= ./libft

LIBFT	= $(LIBFT_PATH)/libft.a

OBJS	= ${SRCS:.c=.o}

CC	= gcc

CFLAGS	= -Wall -Werror -Wextra


all: ${NAME}

%.o: %.c
	${CC} ${CFLAGS} -I${HEAD} -c $< -o $@

${NAME}: $(LIBFT) ${OBJS}
	cp $(LIBFT) $(NAME)
	ar rcs ${NAME} ${OBJS}

$(LIBFT):
	make -C $(LIBFT_PATH) all

clean:
	make -C $(LIBFT_PATH) clean
	rm -f ${OBJS} ${OBJS_B}

fclean: clean
	make -C $(LIBFT_PATH) fclean
	rm -f ${NAME}

re: fclean all

.PHONY: all clean fclean re bonus libft
