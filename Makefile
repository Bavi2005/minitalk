# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bpichyal <bpichyal@student.42kl.edu.my>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/10/28 00:44:39 by bpichyal          #+#    #+#              #
#    Updated: 2025/10/28 02:27:22 by bpichyal         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME       = minitalk
SERVER     = server
CLIENT     = client
SERVER_B   = server_bonus
CLIENT_B   = client_bonus

CC         = cc
RM         = rm -rf
CFLAGS     = -Wall -Wextra -Werror

PRINTF_DIR = ./library/ft_printf
LIBFT_DIR  = ./library/libft

PRINTF_LIB  = $(PRINTF_DIR)/libftprintf.a
LIBFT_LIB  = $(LIBFT_DIR)/libft.a

all: ft_printf libft server client
	@clear
	@echo
	@echo " ██████╗  █████╗ ██╗   ██╗██╗ "
	@echo " ██╔══██╗██╔══██╗██║   ██║██║ "
	@echo " ██████╔╝███████║██║   ██║██║ "
	@echo " ██╔══██╗██╔══██║╚██╗ ██╔╝██║ "
	@echo " ██████╔╝██║  ██║ ╚████╔╝ ██║ "
	@echo " ╚═════╝ ╚═╝  ╚═╝  ╚═══╝  ╚═╝ "
	@echo
	@echo
	@echo " ███╗   ███╗██╗███╗   ██╗██╗███████╗██╗  ██╗███████╗██╗     ██╗     "
	@echo " ████╗ ████║██║████╗  ██║██║██╔════╝██║  ██║██╔════╝██║     ██║     "
	@echo " ██╔████╔██║██║██╔██╗ ██║██║███████╗███████║█████╗  ██║     ██║     "
	@echo " ██║╚██╔╝██║██║██║╚██╗██║██║╚════██║██╔══██║██╔══╝  ██║     ██║     "
	@echo " ██║ ╚═╝ ██║██║██║ ╚████║██║███████║██║  ██║███████╗███████╗███████╗"
	@echo " ╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═╝╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝"
	@echo
	@echo "                                \033[5;1;33m------------------------------\033[0m"
	@echo "                                  ONLINE ・ 2025 ・ BY BAVI "
	@echo "                                \033[5;1;33m------------------------------\033[0m"	
	@echo

bonus: ft_printf libft server_bonus client_bonus
	@clear
	@echo
	@echo "┌────────────────────────────────────────────┐"
	@echo "│   ⚙️  COMPILING MINITALK [BONUS MODE] ⚙️     │"
	@echo "└────────────────────────────────────────────┘"
	@sleep 0.3
	@echo
	@echo "🧠 Initiating parallel data channels..."
	@sleep 0.2
	@echo "🔹 Compiling SERVER_BONUS → [OK]"
	@sleep 0.2
	@echo "🔹 Compiling CLIENT_BONUS → [OK]"
	@sleep 0.2
	@echo "🚀 Activating extended protocol stack..."
	@sleep 0.2
	@echo "💾 Linking with LIBFT and FT_PRINTF modules..."
	@sleep 0.3
	@echo
	@echo "╔════════════════════════════════════════════╗"
	@echo "║     🧩  MINITALK BONUS MODULE ONLINE ⚡    ║"
	@echo "║  Status: READY FOR INTERPROCESS LINKING 🛰️  ║"
	@echo "╚════════════════════════════════════════════╝"
	@echo
	@echo "👾   Compiled by: BAVI | Build: CYBER v2.0"
	@echo "📡   Boot Time: `date +"%H:%M:%S | %d-%m-%Y"`"
	@echo



ft_printf:
	make -C $(PRINTF_DIR)

libft:
	make -C $(LIBFT_DIR)

server: server.c
	$(CC) $(CFLAGS) server.c $(PRINTF_LIB) $(LIBFT_LIB) -I$(PRINTF_DIR) -I$(LIBFT_DIR) -o $(SERVER)

client: client.c
	$(CC) $(CFLAGS) client.c $(PRINTF_LIB) $(LIBFT_LIB) -I$(PRINTF_DIR) -I$(LIBFT_DIR) -o $(CLIENT)

server_bonus: server_bonus.c
	$(CC) $(CFLAGS) server_bonus.c $(PRINTF_LIB) $(LIBFT_LIB) -I$(PRINTF_DIR) -I$(LIBFT_DIR) -o $(SERVER_B)

client_bonus: client_bonus.c
	$(CC) $(CFLAGS) client_bonus.c $(PRINTF_LIB) $(LIBFT_LIB) -I$(PRINTF_DIR) -I$(LIBFT_DIR) -o $(CLIENT_B)

clean:
	make clean -C $(PRINTF_DIR)
	make clean -C $(LIBFT_DIR)

fclean: clean
	@clear
	@echo
	@echo "\033[0;36m╔════════════════════════════════════════════╗\033[0m"
	@echo "\033[0;36m║   ⚠️  SYSTEM PURGE INITIATED — FCLEAN MODE ⚠️   ║\033[0m"
	@echo "\033[0;36m╚════════════════════════════════════════════╝\033[0m"
	@sleep 0.4
	@echo "\033[0;35m[☠] Disconnecting modules... \033[0m"
	@sleep 0.2
	make fclean -C $(PRINTF_DIR) --no-print-directory
	make fclean -C $(LIBFT_DIR) --no-print-directory
	@sleep 0.3
	@echo "\033[0;35m[🧹] Removing binaries and executables... \033[0m"
	@$(RM) $(SERVER) $(CLIENT) $(SERVER_B) $(CLIENT_B)
	@sleep 0.3
	@echo "\033[0;31m[⚡] Memory blocks cleared.\033[0m"
	@sleep 0.3
	@echo "\033[1;33m[💾] Temporary cache flushed.\033[0m"
	@sleep 0.3
	@echo "\033[0;32m[✅] All systems reset to factory state.\033[0m"
	@sleep 0.5
	@echo
	@echo "\033[1;36m╔════════════════════════════════════════════╗\033[0m"
	@echo "\033[1;36m║        🔁  CLEANUP SEQUENCE COMPLETE        ║\033[0m"
	@echo "\033[1;36m╚════════════════════════════════════════════╝\033[0m"
	@echo
	@echo "\033[38;5;199m👾   Powered by BAVI | CYBERCORE v2.0\033[0m"
	@echo "\033[38;5;51m🕒   Timestamp: `date +"%H:%M:%S | %d-%m-%Y"`\033[0m"
	@echo "\033[38;5;214m🌌   Status: Environment sanitized and secure\033[0m"
	@echo
	@printf '\a'

re: fclean all
rebonus: fclean bonus

.PHONY: all bonus clean fclean re rebonus libft ft_printf