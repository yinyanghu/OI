#include <cstdio>
#include <cstring>

const	int	limitSize	= 2000 + 10;
const int M = 1000000000 + 7;
int		n , m;
char		A	[limitSize];
char		B	[limitSize];

void	init()
{
	scanf("%s" , A + 1); n = strlen( A + 1 );
	scanf("%s" , B + 1); m = strlen( B + 1 );
}

int		opt	[limitSize][limitSize];
int		cnt	[limitSize][limitSize];

void	renew(int& x , int& c , int x0 , int c0)
{
	if( x0 < x)
		x = x0 , c = c0;
	else if (x== x0)
		c += c0;
	c %= M;
}

void	solve()
{
	memset(opt , 0x1f , sizeof(opt));
	
	int i , j;
	for (j = 0; j <= m; j ++)
		opt[0][j] = j , cnt[0][j] = 1;
	for (i = 1; i <= n; i ++)
	{
		opt[i][0] = i; cnt[i][0] = 1;
		for (j = 1; j <= m; j ++)
		{
			
			if (A[i] == B[j])
				renew( opt[i][j] ,cnt[i][j] , opt[i - 1][j - 1] + 1 , cnt[i - 1][j - 1] );
			else
			{
				renew( opt[i][j] , cnt[i][j] , opt[i - 1][j] + 1 , cnt[i - 1][j] );
			renew( opt[i][j] , cnt[i][j] , opt[i][j - 1] + 1 , cnt[i][j - 1] );
			}
		}
	}	
	
	printf("%d\n" , cnt[n][m]);
}

int	main()
{
//	freopen("in.txt" , "r" , stdin);
	
	init();
	solve();
	
	return 0;
}
