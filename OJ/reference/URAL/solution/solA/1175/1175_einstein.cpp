/*	Ural1175	*/
/*	Strange sequence	*/

#include<stdio.h>
#include<stdlib.h>
#define Limit 100007
#define pos1 18
#define pos2 36

__int64	hash[Limit];
int	a1,a2,a3,a4,b1,b2,c;
int	x1,x2,t;
int	now;

int	f(int x,int y)
{
	int	h=a1*x*y+a2*x+a3*y+a4;
	if (h>b1&&h>b2)
	{
		h-=(h-b2)/c*c;
		while (h>b2)
			h-=c;
	}
	return	h;
}

inline	int	calc_hash(int x1,int x2)
{
	return	((x1<<8)+x2)%Limit;
}

inline	int	rehash(int h)
{
	return	(h+1)%Limit;
}

inline	int	equal(__int64 x,int x1,int x2)
{
	int	a=(x>>pos1)&((1<<pos1)-1),
		b=x&((1<<pos1)-1);
	return	a==x1&&b==x2;
}

int	hash_ins(int x1,int x2)
{
	int	h=calc_hash(x1,x2);
	while (hash[h])
		if (equal(hash[h],x1,x2))
			return	(int)(hash[h]>>pos2);
		else	h=rehash(h);
	hash[h]=(((__int64)now)<<pos2)+(((__int64)x1)<<pos1)+x2;
	return	0;
}

int	main()
{
	scanf("%d%d%d%d%d%d%d%d%d",&a1,&a2,&a3,&a4,&b1,&b2,&c,&x1,&x2);
	hash_ins(x1,x2,now=1);
	while (++now)
	{
		t=f(x1,x2);
		x1=x2;
		x2=t;
		t=hash_ins(x1,x2);
		if (t)
		{
			printf("%d %d\n",t,now-t);
			break;
		}
	}
	return	0;
}
