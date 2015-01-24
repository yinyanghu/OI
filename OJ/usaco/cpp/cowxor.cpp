/*
ID:oifox20071
LANG:C++
PROG:cowxor
*/
#include <iostream>
#include <fstream>
#include <cstring>
using namespace std;
ifstream fin("cowxor.in");
ofstream fout("cowxor.out");
const int limitsize = 21;
const int maxn = 100001;
int f[maxn];
bool hash[(1 << limitsize + 1) + 1];
int n;
int main()
{
	fin >> n;
	fin >> f[1];
	int x;
	for (int i = 2; i <= n; ++ i)
	{
		fin >> x;
		f[i] = f[i - 1] ^ x;
	}
	memset(hash, false, sizeof(hash));
	for (int i = 1; i <= limitsize; ++ i)
		hash[1 << i] = true;
	int ans = f[1];
	int l, r = 1;
	for (int i = 1; i <= n; ++ i)
	{
		int x = 1;
		for (int j = 1; j <= limitsize; ++ j)
			x = hash[(x << 1) + (((f[i] >> (limitsize - j)) & 1) ^ 1)] ? (x << 1) + (((f[i] >> (limitsize - j)) & 1) ^ 1) : (x << 1) + ((f[i] >> (limitsize - j)) & 1);
		if ((f[i] ^ (x ^ (1 << 21))) > ans)
		{
			ans = f[i] ^ (x ^ (1 << 21));
			r = i;
		}
		x = f[i] + (1 << 21);
		for (int j = limitsize; j >= 1; -- j)
		{
			hash[x] = true;
			x >>= 1;
		}
	}
	for (l = r; l >= 1; -- l)
		if ((f[l - 1] ^ f[r]) == ans) break;
	fout << ans << " " << l << " " << r << endl;
	return 0;
}
