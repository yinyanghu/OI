/*
ID:oifox20071
LANG:C++
PROG:range
*/
#include <iostream>
#include <fstream>
#include <cstring>
using namespace std;
ifstream fin("range.in");
ofstream fout("range.out");
const int maxn = 251;
bool a[maxn][maxn];
int f[maxn][maxn], ans[maxn];
int n;
inline int min(int a, int b, int c)
{
	return (a > b) ? ((c > b) ? b : c) : ((c > a) ? a : c);
}
int main()
{
	fin >> n;
	memset(f, 0, sizeof(f));
	for (int i = 1; i <= n; ++ i)
		for (int j = 1; j <= n; ++ j)
		{
			char ch;
			fin >> ch;
			a[i][j] = (ch == '1');
		}
	for (int i = 1; i <= n; ++ i)
		for (int j = 1; j <= n; ++ j)
			if (a[i][j])
				f[i][j] = min(f[i - 1][j - 1], f[i - 1][j], f[i][j - 1]) + 1;
	memset(ans, 0, sizeof(ans));
	for (int i = 1; i <= n; ++ i)
		for (int j = 1; j <= n; ++ j)
			for (int k = 2; k <= f[i][j]; ++ k)
				++ ans[k];
	for (int i = 2; i <= n; ++ i)
		if (ans[i] > 0)
			fout << i << " " << ans[i] << endl;
	return 0;
}
