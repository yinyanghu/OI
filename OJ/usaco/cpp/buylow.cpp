/*
ID:oifox20071
LANG:C++
PROG:buylow
*/
#include <iostream>
#include <fstream>
#include <cstring>
using namespace std;
ifstream fin("buylow.in");
ofstream fout("buylow.out");
const int maxn = 5001;
const int limitsize = 100;
struct bigint
{
	int len;
	int c[limitsize];
	void initialize()
	{
		len = 0;
		memset(c, 0, sizeof(c));
	}
	void print()
	{
		for (int i = len; i >= 1; -- i)
			fout << c[i];
		fout << endl;
	}
};

bigint make(const int x)
{
	bigint res;
	res.initialize();
	res.len = 1;
	res.c[1] = x;
	return res;
}

bigint operator + (const bigint &a, const bigint &b)
{
	bigint res;
	res.initialize();
	int k = 0;
	res.len = max(a.len, b.len);
	for (int i = 1; i <= res.len; ++ i)
	{
		res.c[i] = a.c[i] + b.c[i] + k;
		k = res.c[i] / 10;
		res.c[i] %= 10;
	}
	if (k != 0)
		res.c[++ res.len] = k;
	return res;
}

int n;
int price[maxn + 1], f[maxn + 1], next[maxn + 1];
bigint sum[maxn + 1];
int main()
{
	fin >> n;
	for (int i = 1; i <= n; ++ i)
		fin >> price[i];
	price[n + 1] = 0;
	f[1] = 1; sum[1] = make(1);
	for (int i = 2; i <= n + 1; ++ i)
	{
		f[i] = 1;
		int k = 0;
		memset(next, 0, sizeof(next));
		for (int j = 1; j <= i - 1; ++ j)
			if (price[i] < price[j] && f[i] < f[j] + 1)
				f[i] = f[j] + 1;
		if (f[i] == 1)
			sum[i] = make(1);
		else
		{
			for (int j = i - 1; j >= 1; -- j)
			{
				bool flag = true;
				if (price[j] > price[i] && f[j] + 1 == f[i])
				{
					for (int x = 1; x <= k; ++ x)
						if (price[next[x]] == price[j])
						{
							flag = false;
							break;
						}
					if (flag)
						next[++ k] = j;
				}
			}
			for (int j = 1; j <= k; ++ j)
				sum[i] = sum[i] + sum[next[j]];
		}
	}
	fout << f[n + 1] - 1 << " ";
	sum[n + 1].print();
	return 0;
}
