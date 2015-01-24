/*
ID:oifox20071
LANG:C++
PROG:bigbrn
*/
#include <iostream>
#include <fstream>
#include <cstring>
using namespace std;
ifstream fin("bigbrn.in");
ofstream fout("bigbrn.out");
const int maxn = 1001;
int f[maxn][maxn];
int n, m;
int min(int a, int b, int c)
{
	return (a > b) ? ((b > c) ? c : b) : ((a > c) ? c : a);
}
int main()
{
	fin >> n >> m;
	int x, y;
	memset(f, 1, sizeof(f));
	for (int i = 0; i < m; ++ i)
	{
		fin >> x >> y;
		f[x][y] = 0;
	}
	int ans = 0;
	for (int i = 1; i <= n; ++ i)
		for (int j = 1; j <= n; ++ j)
			if (f[i][j])
			{
				f[i][j] = (i == 1 || j == 1) ? 1 : min(f[i - 1][j], f[i][j - 1], f[i - 1][j - 1]) + 1;
				ans = max(ans, f[i][j]);
			}
	fout << ans << endl;
	return 0;
}
