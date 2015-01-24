/***** 高精度 乘法/除法(8位) *****/

typedef	long long	Int64;

const	int		limitLeng	= 100;
const	int		M		= 100000000;
const	int		digitLeng	= 8;
const	int		__Vk		= (1<<26);	// 小于等于M的最大2的幂

struct		BigInt
{
	int		c	[limitLeng];
	int		leng;

	BigInt(const char *str)
	{
		memset(c , 0 , sizeof(c));
		leng = 1;

		int	left = digitLeng;
		int	w = 1;

		for (int i = strlen(str) - 1; i >= 0; i --)
		{
			c[leng] += (str[i] - '0') * w;
			w *= 10 , left --;
			if (left == 0) w = 1 , left = digitLeng , leng ++;
		}
		if (leng > 1 && c[leng] == 0) leng --;
	}
};

BigInt	operator * (const BigInt& A , const BigInt& B)
{
	BigInt	ret;
	ret.leng = A.leng + B.leng - 1;
	memset(ret.c , 0 , sizeof(ret.c));

	int		k , i;
	Int64		sum = 0;

	for (k = 1; k <= ret.leng; k ++)
	{
		i = k + 1 - B.leng;
		if (i < 1) i = 1;
		for ( ; i <= k && i <= A.leng; i ++)
			sum += (Int64) A.c[i] * B.c[ k + 1 - i ];
		ret.c[k] = int( sum % M );
		sum /= M;
	}

	while (sum)
	{
		ret.c[ ++ ret.leng ] = int( sum % M );
		sum /= M;
	}
	while (ret.leng > 1 && ret.c[ret.leng] == 0)
		ret.leng --;

	return	ret;
}

void	mul_for_div(BigInt& T , const BigInt& B , int k , int mov)
{
	int		i;
	Int64		g = 0;

	for (i = 1; i <= mov; i ++) T.c[i] = 0;
	T.leng = mov + B.leng;

	for (i = 1; i <= B.leng; i ++)
	{
		g += (Int64) B.c[i] * k;
		T.c[i + mov] = int( g % M );
		g /= M;
	}
	while (g)
	{
		T.c[ ++ T.leng ] = int( g % M );
		g /= M;
	}
	T.c[ T.leng + 1 ] = 0;
}

//A / B , C(商) , D(余数)
void	BigInt_div(const BigInt& A ,const BigInt& B , BigInt& C , BigInt& D)
{
	D = A;

	memset(C.c , 0 , sizeof(C.c));
	C.leng = A.leng - B.leng + 1;

	BigInt		T;
	int		k;

	for (int i = C.leng; i > 0; i --)
	{
		k = __Vk;
		while (k)
		{
			mul_for_div(T , B , k , i - 1);
			if (compare(D , T) >= 0)
			{
				D -= T;
				C.c[i] += k;
			}
			k >>= 1;
		}
	}

	while (C.leng > 1 && C.c[C.leng] == 0) C.leng --;
}
