/*
ID:oifox20071
LANG:C++
PROG:rectbarn
*/
#include <iostream>
#include <fstream>
#include <cstring>
using namespace std;
ifstream fin("rectbarn.in");
ofstream fout("rectbarn.out");
const int maxn = 3001;
int n, m;
bool a[maxn][maxn];
int h[maxn], l[maxn], r[maxn];
void init()
{
	int p, x, y;
	memset(a, true, sizeof(a));
	fin >> n >> m >> p;
	for (int i = 0; i < p; ++ i)
	{
		fin >> x >> y;
		a[x][y] = false;
	}
}

void work()
{
	int ans = 0;
	for (int i = 1; i <= m; ++ i)
	{
		l[i] = 1; r[i] = m; h[i] = 0;
	}
	for (int i = 1; i <= n; ++ i)
	{
		int lmax = 1;
		for (int j = 1; j <= m; ++ j)
			if (a[i][j])
			{
				++ h[j];
				l[j] = max(l[j], lmax);
			}
			else
			{
				h[j] = 0; l[j] = 1; r[j] = m;
				lmax = j + 1;
			}
		int rmax = m;
		for (int j = m; j >= 1; -- j)
			if (a[i][j])
			{
				r[j] = min(r[j], rmax);
				ans = max(ans, (r[j] - l[j] + 1) * h[j]);
			}
			else rmax = j - 1;
	}
	fout << ans << endl;
}

int main()
{
	init();
	work();
	return 0;
}
