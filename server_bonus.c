/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server_bonus.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: marvin <marvin@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/10/28 02:13:37 by bpichyal          #+#    #+#             */
/*   Updated: 2025/11/06 22:39:59 by marvin           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk_bonus.h"

static void	signal_handler(int signal, siginfo_t *info, void *nothing)
{
	static int	bit = 7;
	static char	c = 0;

	(void)nothing;
	if (signal == SIGUSR1)
		c = c | (1 << bit);
	else if (signal == SIGUSR2)
		c = c & ~(1 << bit);
	bit--;
	if (bit < 0)
	{
		if (c)
			ft_putchar_fd(c, 1);
		else
			kill(info->si_pid, SIGUSR2);
		c = 0;
		bit = 7;
	}
	kill(info->si_pid, SIGUSR1);
}

void	init_signals(void)
{
	struct sigaction	sa;

	sa.sa_sigaction = signal_handler;
	sa.sa_flags = SA_SIGINFO | SA_RESTART | SA_NODEFER;
	sigemptyset(&sa.sa_mask);
	sigaction(SIGUSR1, &sa, NULL);
	sigaction(SIGUSR2, &sa, NULL);
}

int	main(void)
{
	ft_printf("\033[5;1;33m------------------------------\033[0m\n");
	ft_printf("\n");
	ft_printf("\033[32mServer PID: \033[1m%d\033[0m\n", getpid());
	ft_printf("\033[34mWaiting for message...\033[0m\n");
	ft_printf("\n");
	ft_printf("\033[5;1;33m------------------------------\033[0m\n");
	init_signals();
	while (1)
		pause();
}
