/*
ID:oifox20071
LANG:C++
PROG:kimbits
*/
#include <iostream>
#include <fstream>
using namespace std;
ifstream fin("kimbits.in");
ofstream fout("kimbits.out");
const int maxn = 32;
long long f[maxn][maxn];
int main()
{
	int n, l;
	long long order;
	fin >> n >> l >> order;
	for (int i = 0; i <= n; ++ i)
	{
		f[i][0] = 1;
		f[0][i] = 1;
	}
	for (int i = 1; i <= n; ++ i)
		for (int j = 1; j <= n; ++ j)
			f[i][j] = (i >= j) ? f[i - 1][j] + f[i - 1][j - 1] : f[i][i];
	for (int i = n; i >= 1; -- i)
		if (order > f[i - 1][l])
		{
			fout << 1;
			order -= f[i - 1][l];
			-- l;
		}
		else
			fout << 0;
	fout << endl;
	return 0;
}
