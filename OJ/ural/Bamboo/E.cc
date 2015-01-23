#include <cstdio>
#include <cstring>

inline int max(int a , int b){ return a > b ? a : b; }

int	main()
{
	freopen("in.txt" , "r" , stdin);
	int N1 , C1;
	int N2 , C2 , T;
	int N3;
	
	scanf("%d%d" , &N1 , &C1);
	scanf("%d%d%d" , &N2 , &T , &C2);
	scanf("%d" , &N3);
	
	int	 tot = 0;
	int  k;
	int	 a , b;
	char buf	[100];
	scanf("%d" , &k);
	while (k --)
	{
		scanf("%s" , buf);
		a = (buf[0] - '0') * 10 + (buf[1] - '0');
		b = (buf[3] - '0') * 10 + (buf[4] - '0');
		if( a == 0 && b <= 6 ) continue;
		if (b) a ++;
		tot += a;		
	}
	
	printf("Basic:     %d\n" , N1 + C1 * tot);
	printf("Combined:  %d\n" , N2 + C2 * max(tot - T , 0));
	printf("Unlimited: %d\n" , N3);
	
	return 0;
}
