/*
ID:oifox20071
LANG:C++
PROG:snail
*/
#include <iostream>
#include <fstream>
#include <cstring>
using namespace std;
ifstream fin("snail.in");
ofstream fout("snail.out");
const int maxn = 120;
const int dx[4] = {0, 0, 1, -1};
const int dy[4] = {1, -1, 0, 0};
int n, ans = 0;
bool flag[maxn][maxn], a[maxn][maxn];
void init()
{
	int k, x;
	char y;
	fin >> n >> k;
	memset(a, true, sizeof(a));
	for (int i = 0; i < k; ++ i)
	{
		fin >> y >> x;
		a[x - 1][y - 'A'] = false;
	}
}
// direction 	0 --> right	1 --> left	2 --> down	3 --> up
void dfs(int x, int y, int step, int d)
{
	if (!flag[x][y])
	{
		ans = max(ans, step - 1);
		return;
	}
	ans = max(ans, step);
	flag[x][y] = false;
	if (d == -1)
	{
		for (int i = 0; i < 4; ++ i)
		{
			int xx = x + dx[i], yy = y + dy[i];
			if (xx >= 0 && xx < n && yy >= 0 && yy < n && a[xx][yy])
				dfs(xx, yy, step + 1, i);
		}
	}
	else if (d == 0 || d == 1)
	{
		int xx = x + dx[d], yy = y + dy[d];
		if (xx >= 0 && xx < n && yy >= 0 && yy < n && a[xx][yy])
			dfs(xx, yy, step + 1, d);
		else
		{
			for (int i = 2; i <= 3; ++ i)
			{
				xx = x + dx[i]; yy = y + dy[i];
				if (xx >= 0 && xx < n && yy >= 0 && yy < n && a[xx][yy])
					dfs(xx, yy, step + 1, i);			
			}
		}
	}
	else if (d == 2 || d == 3)
	{
		int xx = x + dx[d], yy = y + dy[d];
		if (xx >= 0 && xx < n && yy >= 0 && yy < n && a[xx][yy])
			dfs(xx, yy, step + 1, d);
		else
		{
			for (int i = 0; i <= 1; ++ i)
			{
				xx = x + dx[i]; yy = y + dy[i];
				if (xx >= 0 && xx < n && yy >= 0 && yy < n && a[xx][yy])
					dfs(xx, yy, step + 1, i);			
			}
		}
	}
	flag[x][y] = true;
}

int main()
{
	init();
	memset(flag, true, sizeof(flag));
	dfs(0, 0, 1, -1);
	fout << ans << endl;
	return 0;
}
