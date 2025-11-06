/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: marvin <marvin@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/10/28 02:14:00 by bpichyal          #+#    #+#             */
/*   Updated: 2025/11/06 22:39:30 by marvin           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

int	g_bit_ready;

static void	handle_signal(int sig)
{
	if (sig == SIGUSR1)
		g_bit_ready = 1;
	else if (sig == SIGUSR2)
		exit(EXIT_SUCCESS);
}

static void	send_char(pid_t pid, char c)
{
	int	bit;

	bit = 7;
	while (bit >= 0)
	{
		g_bit_ready = 0;
		if ((c >> bit) & 1)
			kill(pid, SIGUSR1);
		else
			kill(pid, SIGUSR2);
		while (!g_bit_ready)
			usleep(10);
		bit--;
	}
}

static void	send_str(pid_t pid, char *str)
{
	int	i;

	i = 0;
	while (str[i])
	{
		send_char(pid, str[i]);
		i++;
	}
	send_char(pid, '\0');
}

int	main(int argc, char **argv)
{
	pid_t	pid;

	if (argc == 3)
	{
		pid = ft_atoi(argv[1]);
		if ((pid <= 0) || (kill(pid, 0) < 0))
		{
			ft_printf("Invalid or unreachable PID\n");
			return (1);
		}
		signal(SIGUSR1, handle_signal);
		signal(SIGUSR2, handle_signal);
		send_str(pid, argv[2]);
		while (1)
			pause();
	}
	else
		ft_printf("Correct usage: ./client <pid> <string>\n");
	return (0);
}
