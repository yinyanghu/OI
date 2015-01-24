/*
ID:oifox20071
LANG:C++
PROG:theme
*/
#include <iostream>
#include <fstream>
using namespace std;
ifstream fin("theme.in");
ofstream fout("theme.out");
const int maxn = 5001;
int a[maxn], d[maxn];
int n;
int main()
{
	fin >> n;
	for (int i = 1; i <= n; ++ i)
		fin >> a[i];
	for (int i = 1; i < n; ++ i)
		d[i] = a[i + 1] - a[i];
	-- n;
	int ans = 0;
	for (int i = 1; i <= n; ++ i)
		for (int j = i + ans + 2; j + ans <= n; ++ j)
		{
			int k;
			for (k = 0; i + k + 2 <= j && j + k <= n; ++ k)
				if (d[i + k] != d[j + k])
					break;
			ans = max(ans, k);
		}
	fout << ((ans + 1 >= 5) ? ans + 1 : 0) << endl;
	return 0;
}
