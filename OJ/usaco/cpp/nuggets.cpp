/*
ID:oifox20071
LANG:C++
PROG:nuggets
*/
#include <iostream>
#include <fstream>
using namespace std;
ifstream fin("nuggets.in");
ofstream fout("nuggets.out");
const int maxn = 10;
const int limitsize = 70000;
int a[maxn];
bool f[limitsize];
int n, maxnum = 0;
int main()
{
	fin >> n;
	for (int i = 0; i < n; ++ i)
	{
		fin >> a[i];
		maxnum = max(maxnum, a[i]);
	}
	f[0] = true;
	int limit = (maxnum + 1) * maxnum, ans = 0;
	for (int i = 0; i <= limit; ++ i)
		if (f[i])
			for (int j = 0; j < n; ++ j)
				f[i + a[j]] = true;
		else
			ans = max(ans, i);
	if (ans > maxnum * maxnum)
		ans = 0;
	fout << ans << endl;
}
