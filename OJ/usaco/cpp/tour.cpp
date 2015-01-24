/*
ID:oifox20071
LANG:C++
PROG:tour
*/
#include <iostream>
#include <fstream>
#include <cstring>
using namespace std;
ifstream fin("tour.in");
ofstream fout("tour.out");
const int maxn = 101;
const int infinity = 100000000;
string city[maxn];
bool a[maxn][maxn];
int f[maxn][maxn];
int n, v;
int find(const string &x)
{
	for (int i = 0; i < n; ++ i)
		if (city[i] == x) return i;
}
void init()
{
	fin >> n >> v;
	for (int i = 0; i < n; ++ i)
		fin >> city[i];
	memset(a, false, sizeof(a));
	string xx, yy;
	for (int i = 0; i < v; ++ i)
	{
		fin >> xx >> yy;
		int x = find(xx), y = find(yy);
		a[x][y] = a[y][x] = true;
	}
}

void work()
{
	f[0][0] = 1;
	for (int i = 0; i < n; ++ i)
		for (int j = i + 1; j < n; ++ j)
		{
			f[i][j] = -infinity;
			for (int k = 0; k < j; ++ k)
				if (a[k][j] && f[i][k] > 0 && f[i][k] > f[i][j])
					f[i][j] = f[i][k];
			f[j][i] = ++ f[i][j];
		}
	int ans = 1;
	for (int i = 0; i < n; ++ i)
		if (a[i][n - 1] && f[i][n - 1] > ans)
			ans = f[i][n - 1];
	fout << ans << endl;
}

int main()
{
	init();
	work();
	return 0;
}
