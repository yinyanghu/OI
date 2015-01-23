#include <cstdio>
#include <cstring>

const	int	limitSize	= 100000 + 10;

int	n , R;
int	list	[limitSize];

void	init()
{
	scanf("%d%d" , &n , &R);
	for (int i = 0; i < n; i ++)
		scanf("%d" , list + i);
}

int 		tot;
bool		first	[limitSize];
int			next	[limitSize];

int			head , tail;
int			queue	[limitSize];

void	solve()
{
	tot = 1;
	memset(first , 0 , sizeof(first));
	memset(next,0xff , sizeof(next));
	first[0] = 1;	
	queue[head = tail = 0] = 0;	
	
	int	i;
	for (i = 1; i < n; i ++)
	{
		if ( list[ queue[head] ] + R < list[i] )
		{
			next[ queue[ head ] ] = i;
			head ++; queue[ ++ tail ] = i;
		}
		else
		{
			tot ++; first[i] ++;
			queue[ ++ tail ] = i;
		}
	}
	
	printf("%d\n" , tot);
	for (i = 0; i < n; i ++)
	{
		if (first[i])
		{
			int p = i;
			int cc = 0;
			while (p>=0)
			{
				cc ++;
				p = next[p];
			}
			printf("%d" , cc);
			for (p = i; p >= 0; p = next[p])
				printf(" %d" , p + 1);
			putchar('\n');
		}		
	}
}

int	main()
{
	freopen("in.txt" , "r" , stdin);
	
	init();
	solve();
	
	return 0;
}