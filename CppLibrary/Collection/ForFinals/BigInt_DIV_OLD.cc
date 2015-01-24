/*
	高精度 / 高精度
			old version , just for backup
*/
const int MaxLen	= 3000;
const int M		= 100000000;
const int pLen		= 8;
const int __Vk		= (1 << 26);	// 小于等于M的最大2的幂次

struct BigInt
{
	int c[MaxLen];
	int Len;
}

void Mul_ForDiv(BigInt& T , const BigInt& B , int k , int mov)
{
	int i;
	Int64 g;

	for(i = 1; i <= mov; i ++) T.c[i] = 0;	
		
	g = (Int64)B.c[1] * (Int64)k;
	T.c[mov + 1] = (int)(g % M);
	g /= M;
	T.Len = mov + B.Len;

	for(i = 2; i <= B.Len; i ++)
	{
		g += (Int64)B.c[i] * (Int64)k;
		T.c[i + mov] = (int)(g % M);
		g /= M;
	}
	while(g)
	{
		T.c[++T.Len] = (int)(g % M);
		g /= M;
	}
}

void BigDiv(const BigInt& A , const BigInt& B , BigInt& C , BigInt& D)
{
	D = A;

	memset(C.c , 0 , sizeof(C.c)); C.Len = A.Len - B.Len + 1;
	
	BigInt T;
	int k;

	for(int i = C.Len; i > 0; i --)
	{
		k = __Vk;
		while(k)
		{
			Mul_ForDiv(T , B , k , i - 1);
			if(Compare(D , T) >= 0)
			{
				D -= T;
				C.c[i] += k;
			}
			k >>= 1;
		}
	}
	while(C.Len > 1 && C.c[C.Len] == 0) C.Len --;
}