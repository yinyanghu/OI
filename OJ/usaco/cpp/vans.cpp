/*
ID:oifox20071
LANG:C++
PROG:vans
*/
#include <iostream>
#include <fstream>
#include <cstring>
using namespace std;
ifstream fin("vans.in");
ofstream fout("vans.out");
const int limitsize = 500;
const int maxn = 1001;
struct bigint
{
	int len;
	int c[limitsize];
	bigint(const int x)
	{
		memset(c, 0, sizeof(c));
		if (x == 0)
		{
			len = 1;
			return;
		}
		int k = x;
		len = 0;
		while (k)
		{
			c[++ len] = k % 10;
			k /= 10;
		}
	}
	bigint(){}
};

bigint operator + (const bigint& a, const bigint &b)
{
	bigint res;
	memset(res.c, 0, sizeof(res.c));
	res.len = max(a.len, b.len);
	int k = 0;
	for (int i = 1; i <= res.len; ++ i)
	{
		res.c[i] = a.c[i] + b.c[i] + k;
		k = res.c[i] / 10;
		res.c[i] %= 10;
	}
	while (k)
	{
		res.c[++ res.len] = k % 10;
		k /= 10;
	}
	return res;
}

bigint operator - (const bigint& a, const bigint& b)
{
	bigint res;
	res.len = max(a.len, b.len);
	memset(res.c, 0, sizeof(res.c));
	for (int i = 1; i <= res.len; ++ i)
	{
		res.c[i] += a.c[i] - b.c[i];
		if (res.c[i] < 0)
		{
			res.c[i] += 10;
			-- res.c[i + 1];
		}
	}
	while (res.len > 1 && res.c[res.len] == 0) -- res.len;
	return res;
}

bigint operator * (const bigint &a, const int b)
{
	bigint res;
	memset(res.c, 0, sizeof(res.c));
	res.len = a.len;
	int k = 0;
	for (int i = 1; i <= res.len; ++ i)
	{
		res.c[i] = a.c[i] * b + k;
		k = res.c[i] / 10;
		res.c[i] %= 10;
	}
	while (k)
	{
		res.c[++ res.len] = k % 10;
		k /= 10;
	}
	return res;
}

void print(const bigint& a)
{
	for (int i = a.len; i >= 1; -- i)
		fout << a.c[i];
	fout << endl;
}

int n;
bigint f[maxn];
int main()
{
	fin >> n;
	f[1] = bigint(0); f[2] = bigint(2); f[3] = bigint(4); f[4] = bigint(12);
	for (int i = 5; i <= n; ++ i)
		f[i] = (f[i - 1] + f[i - 2] - f[i - 3]) * 2 + f[i - 4];
	print(f[n]);
	return 0;
}
