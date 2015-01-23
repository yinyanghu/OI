#include <cstdio>
#include <cstring>

const	int		limitSize	= 100000 + 10;

int		n;
char		 str	[limitSize];
int			sum [ limitSize];
int    last [ limitSize];
void	init()
{
	scanf("%s" , str + 1);
	n = strlen( str + 1 );
}

inline int min(int a , int b)
{
	return a < b ? a : b;
}

void	solve()
{
	int i;
	sum[0] = 0;
	for (i = 1; i <= n; i ++)
		if (str[i] == '(')
			sum[i] = sum[i - 1] + 1;
		else sum[i] = sum[i - 1] - 1;
		
  if (sum[n] != 0)
  {
  	puts("0"); return;
  }
  
  last[n] = sum[n];
  for (i = n - 1; i >= 0; i --)
    last[i] = min(last[i+1],sum[i]);
  
  int minPrefix = 0;
  int ret = 0;
  for (i = 1; i <= n; i ++)
  {
  	if (sum[n] - sum[i - 1] + minPrefix >= 0 
  		&& last[i] - sum[i - 1] >= 0 )
  			ret ++;
  	minPrefix = min( minPrefix , sum[i] );
  }
  printf("%d\n" , ret);
}

int	 main()
{
	//freopen("in.txt" , "r" , stdin);
	
	init();
	solve();
	
	return 0;
}
