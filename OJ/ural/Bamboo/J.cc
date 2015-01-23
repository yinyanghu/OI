#include <cstdio>
#include <cstring>

int	n;
int	list	[1010];

void	init()
{
	scanf("%d" , &n);
	for (int i = 0; i < n; i ++)
	{
			scanf("%d" , list + i);
	}
}

void	solve()
{
	bool first = 1;
	
	int i , j;
	for (i = 0; i < n; )
	{
		for (j = i; j < n; j ++)
			if (list[j] != list[i]) break;
		if (first) first = 0;
		else putchar(' ');
		printf("%d %d" , j - i , list[i]);
		i = j;
	}
	
	putchar('\n');
}

int	main()
{
//	freopen("in.txt" , "r" , stdin);
	
	init();
	solve();
	
	return 0;
}