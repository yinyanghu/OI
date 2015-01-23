#include <cstdio>
#include <cstring>
#include <algorithm>
using namespace std;

struct		Tpoint
{
	int	x , y;
	int idx;
};

int			n;
Tpoint		list	[2000 + 10];

bool	operator < (const Tpoint&A , const Tpoint& B)
{
		if (A.x == B.x) return A.y < B.y;
		return A.x < B.x;
}

void	init()
{
	scanf("%d" , &n); n += 2;
	
	for (int i = 0; i < n; i ++)
	{
		scanf("%d%d" , &list[i].x , &list[i].y);
		list[i].idx = i + 1;
	}
}

void	printLast(int a , int b , int c , int d)
{
	int side = 0;
	while ( a <= b && c <= d)
	{
		if (side == 0)
		{
			printf("%d " , list[a ++].idx);
			side = 1;
		}
		else
		{
			printf("%d " , list[c ++].idx);
			side = 0;
		}
	}
	
	if (c > d) while(1){}
	
	int p , r;
	p = c; r = d;
	if (list[b].y <= list[c].y)
	{
		while (1)
		{
			printf("%d " , list[r --].idx);
			if (p > r) return;
			printf("%d " , list[p ++].idx);	
			if (p > r) return;			
		}				
	}
	else
	{
		while (1)
		{
			printf("%d " , list[p ++].idx);	
			if (p > r) return;
			printf("%d " , list[r --].idx);
			if (p > r) return;
		}				
	}
}

void	solve()
{
	puts("YES");
	int		mid = n / 2;
	int	p , r;
	p = r = mid;
	
	while (p > 0 && list[p - 1].x == list[mid].x )
		p --;
	while (r < n - 1 && list[r + 1].x == list[mid].x)
		r ++;
		
	if (p == 0 && r == n - 1)
	{
		while (1)
		{
			printf("%d " , list[p ++].idx);	
			if (p > r) return;
			printf("%d " , list[r --].idx);
			if (p > r) return;
		}		
	}
	
	int		a = 0;
	int	  b = p - 1;
	int   c = r + 1;
	int   d = n - 1;
	
	int		side = 0;
	while ( a <= b && c <= d)
	{
		if (side == 0)
		{
			printf("%d " , list[a ++].idx);
			side = 1;
		}
		else
		{
			printf("%d " , list[c ++].idx);
			side = 0;
		}
	}
	
	if (a <= b)
		printLast(a , b , p , r);
	else printLast(c , d , p , r);
}

int	main()
{
	freopen("in.txt" , "r" , stdin);
	
	init();
	solve();
	
	putchar('\n');

	return 0;
}