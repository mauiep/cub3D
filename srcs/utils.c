#include "../includes/cub3D.h"

/*
	Cette fonction compte simplement le nombre de lignes de la map.
*/

int	count_line_map(char **map)
{
	int	i;

	i = 0;
	while (map[i])
		i++;
	return (i);
}

/*
	man strcmp, fonction de la libft
*/

int	ft_strcmp(char *s1, char *s2)
{
	int	i;

	i = 0;
	while (s1[i] || s2[i])
	{
		if (s1[i] != s2[i])
			return (0);
		i++;
	}
	return (1);
}