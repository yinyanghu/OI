/*
ID:oifox20071
LANG:C++
PROG:game1
*/
#include <iostream>
#include <fstream>
using namespace std;
ifstream fin("game1.in");
ofstream fout("game1.out");
const int maxn = 101;
int a[maxn], f[maxn][maxn], sum[maxn];
int n;
int main()
{
	fin >> n;
	for (int i = 0; i < n; ++ i)
		fin >> a[i];
	sum[0] = a[0];
	for (int i = 1; i < n; ++ i)
		sum[i] = sum[i - 1] + a[i];
	for (int i = 0; i < n; ++ i)
		f[i][i] = a[i];
	for (int len = 1; len <= n; ++ len)
		for (int i = 0; i + len <= n; ++ i)
		{
			int j = i + len - 1;
			f[i][j] = (sum[j] - sum[i - 1]) - min(f[i][j - 1], f[i + 1][j]);
		}
	fout << f[0][n - 1] << " " << sum[n - 1] - f[0][n - 1] << endl;
	return 0;
}
