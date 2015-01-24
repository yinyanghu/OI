/*
	ExtendKMP
			- By Tang
*/

const	int	limitSize	= 10000 + 10;

int		n , m;
char		text	[limitSize];	// 下标从1开始
char		patt	[limitSize];

int		next	[limitSize];	// next[i]	= LCP( patt[i->n] , patt )
int		extend	[limitSize];	// extend[i]	= LCP( text[i->n] , patt )

void	extendKmp()
{
	n = strlen( text + 1 );
	m = strlen( patt + 1 );

	next[0] = 0; next[1] = m;

	int		st , len;
	int		i , L;

	st = len = 0;
	for (i = 2; i <= m; i ++)
	{
		if (len < next[st]) L = len; else L = next[st];
		while (i + L <= m && patt[1 + L] == patt[i + L]) 
			L ++;
		next[i] = L;
		if (L > len)
			st = 2, len = L - 1;
		else	st ++ , len --;

		if (len < 0) len = 0;
	}

	st = len = 0;
	for (i = 1; i <= n; i ++)
	{
		if (len < next[st]) L = len; else L = next[st];
		while (i + L <= n && 1 + L <= m && patt[1 + L] == text[i + L])
			L ++;
		extend[i] = L;
		if (L >= len)
			st = 2 , len = L - 1;
		else	st ++ , len --;

		if (len < 0) len = 0;
	}
}