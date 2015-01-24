/*
	Suffix Array
		By Wenbin Tang
		2007-10-1
*/
#include <cstdio>
#include <cstring>

const	int		limitSize = 10000 + 10;
const	int		limitLog  = 14;

int			n;
char			str		[limitSize];		//下标从1开始

int			suffixArray	[limitSize * 2];
int			rank		[limitSize * 2];
int			countRank	[limitSize * 2];
int			tmp		[limitSize * 2];
int			height		[limitSize];		// height[i] : LCP(SA[i], SA[i+1])

int			Log		[limitSize];
int			table		[limitSize][limitLog];

inline	int	max(int a , int b){ return a > b ? a : b; }
inline	int	min(int a , int b){ return a < b ? a : b; }

void	buildSuffixArray()
{
	int		i , j , k;
	int		app	[256];

	memset(app , 0 , sizeof(app));
	for (i = 1; i <= n; i ++)
		app[ str[i] ] = 1;
	for (i = 1; i < 256; i ++)
		app[i] += app[i - 1];

	memset(rank , 0 , sizeof(int) * (n * 2 + 10));
	memset(tmp , 0 , sizeof(int) * (n * 2 + 10));

	for (i = 1; i <= n; i ++)
		rank[ i ] = app[ str[i] ];

	for (int L = 1; L <= n; L *= 2)
	{
		memset(countRank , 0 , sizeof(int) * (n + 10));

		for (i = 1; i <= n; i ++)
			countRank[ rank[i + L] ] ++;
		for (i = 1; i <= n; i ++)
			countRank[i] += countRank[i - 1];
		for (i = n; i >= 1; i --)
			tmp[ countRank[ rank[i + L] ] -- ] = i;

		memset(countRank , 0 , sizeof(int) * (n + 10));
		for (i = 1; i <= n; i ++)
			countRank[ rank[tmp[i]] ] ++;
		for (i = 1; i <= n; i ++)
			countRank[i] += countRank[i - 1];
		for (i = n; i >= 1; i --)
			suffixArray[ countRank[ rank[tmp[i]] ] -- ] = tmp[i];

		memcpy(tmp , rank , sizeof(int) * (n + 10));

		k = rank[ suffixArray[1] ] = 1;
		for (i = 2; i <= n; i ++)
		{
			int	a = suffixArray[i - 1];
			int	b = suffixArray[i];

			if (tmp[a] != tmp[b] || tmp[a + L] != tmp[b + L])
				k ++;
			rank[ suffixArray[i] ] = k;
		}

		if (k == n) break;
	}

	k = 0;
	for (i = 1; i <= n; i ++)
	{
		if (rank[i] == n)
			height[n] = k = 0;
		j = suffixArray[ rank[i] + 1 ];
		for (k = max(k - 1 , 0); str[i + k] == str[j + k]; k ++) {}
		height[ rank[i] ] = k;
	}

	for (i = 1; i <= n; i ++)
		printf("%d " , suffixArray[i]);
	putchar('\n');
	for (i = 1; i  < n; i ++)
		printf("%d " , height[i]);
	putchar('\n');
}

void	buildLCP()
{
	int		i , L;

	Log[1] = 0;
	for (i = 2; i < n; i ++)
		Log[i] = Log[i >> 1] + 1;
	for (i = 1; i < n; i ++)
		table[i][0] = height[i];
	for (L = 0; (2<<L) <= n; L ++)
		for (i = 0; i + (2<<L) <= n; i ++)
			table[i][L + 1] = min(table[i][L] , table[i + (1<<L)][L]);
}

int	get_lcp(int a , int b)
{
	if (a == b) return n - a + 1;
	a = rank[a];
	b = rank[b];
	if (a > b) 
	{
		int	t;
		t = a; a = b; b = t;
	}
	int	L = Log[b - a];
	return	min( table[a][L] , table[b - (1<<L)][L] );
}

