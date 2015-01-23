#include <cstdio>
#include <cstring>

int	main()
{
int B , R , Y;
int k;
char buf[100];
scanf("%d%d%d" , &B , &R , &Y);

int	ret = 1;
scanf("%d" , &k);
	while( k -- )
	{
		scanf("%s" , buf);
		if (buf[0] == 'B') ret *= B;
		else if (buf[0] == 'R') ret *= R;
		else ret *= Y;
	}
	
	printf("%d\n" , ret);
return 0;
}