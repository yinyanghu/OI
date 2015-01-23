#include <cstdio>
#include <cmath>

double getR()
{
	 int type;
	 double r;
	 scanf("%d%lf" , &type , &r);
	 
	 if (type == 1) return r * 2;
	 if (type == 2) return r * sqrt(2.0);
	 return r;
}

double getRX()
{
	 int type;
	 double r;
	 scanf("%d%lf" , &type , &r);
	 
	 if (type == 1) return r * 2;
	 if (type == 2) return r; 
	 return r / 2.0 * sqrt(3.0);
}

int	main()
{
	freopen("in.txt" , "r" , stdin);
	
	double r = getR();
	int n , c = 0;
	
	scanf("%d" , &n);
	while (n --)
	{
		double tmp = getRX();
		if (tmp <= r + 1e-8)
			c ++;
	}
	
	printf("%d\n" , c);
	return 0;
}
