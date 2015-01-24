/*
ID:oifox20071
LANG:C++
PROG:rockers
*/
#include <iostream>
#include <fstream>
using namespace std;
ifstream fin("rockers.in");
ofstream fout("rockers.out");
const int limitsize = 21;
int n, t, m;
int a[limitsize], ans[limitsize], f[limitsize][limitsize];
int main()
{
	fin >> n >> t >> m;
	for (int i = 0; i < n; ++ i)
		fin >> a[i];
	for (int i = 0; i < n; ++ i)
		for (int j = m; j >= 1; -- j)
		{
			f[j][0] = ans[j - 1];
			for (int k = t; k >= a[i]; -- k)
			{
				f[j][k] = max(f[j][k], f[j][k - a[i]] + 1);
				ans[j] = max(ans[j], f[j][k]);
			}
		}
	fout << ans[m] << endl;
	return 0;
}
