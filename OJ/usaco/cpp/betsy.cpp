/*
ID:oifox20071
LANG:C++
PROG:betsy
*/
#include <iostream>
#include <fstream>
#include <cstring>
using namespace std;
ifstream fin("betsy.in");
ofstream fout("betsy.out");
const int maxn = 9;
const int dx[4] = {0, 0, 1, -1};
const int dy[4] = {1, -1, 0, 0};
int n, ans = 0;
int f[maxn][maxn];
bool flag[maxn][maxn];
void dfs(int x, int y, int step)
{
	if (x == n && y == 1)
	{
		if (step == n * n) ++ ans;
		return;
	}
	if (flag[x - 1][y] == flag[x + 1][y] && flag[x][y + 1] == flag[x][y - 1]) return;
	int t = 0;
	for (int i = 0; i < 4; ++ i)
		if (flag[x + dx[i]][y + dy[i]] && f[x + dx[i]][y + dy[i]] == 2) ++ t;
	if (t > 1) return;
	flag[x][y] = false;
	for (int i = 0; i < 4; ++ i)
		++ f[x + dx[i]][y + dy[i]];
	for (int i = 0; i < 4; ++ i)
		if (flag[x + dx[i]][y + dy[i]])
			if (t == 0 || (t == 1 && f[x + dx[i]][y + dy[i]] == 3))
				dfs(x + dx[i], y + dy[i], step + 1);
	for (int i = 0; i < 4; ++ i)
		-- f[x + dx[i]][y + dy[i]];
	flag[x][y] = true;
}

int main()
{
	fin >> n;
	memset(flag, true, sizeof(flag));
	memset(f, 0, sizeof(f));
	for (int i = 1; i <= n; ++ i)
	{
		flag[0][i] = flag[n + 1][i] = flag[i][0] = flag[i][n + 1] = false;
		++ f[1][i]; ++ f[n][i]; ++ f[i][1]; ++ f[i][n];
	}
	f[n][1] = 0;
	dfs(1, 1, 1);
	fout << ans << endl;
	return 0;
}
