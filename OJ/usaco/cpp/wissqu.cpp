/*
ID:oifox20071
LANG:C++
PROG:wissqu
*/
#include <iostream>
#include <fstream>
#include <cstring>
using namespace std;
ifstream fin("wissqu.in");
ofstream fout("wissqu.out");
const int dx[9] = {0, 0, 0, 1, 1, 1, -1, -1, -1};
const int dy[9] = {0, 1, -1, 0, 1, -1, 0, 1, -1};
struct node
{
	int x, y, c;
} record[17];
char a[5][5];
int f[6][6][6], rest[6];
bool flag[5][5];
int ans = 0;
void modify(int x, int y, char c, int delta)
{
	for (int i = 0; i <= 8; ++ i)
		f[x + dx[i]][y + dy[i]][c - 64] += delta;
}
void init()
{
	memset(f, 0, sizeof(f));
	for (int i = 1; i <= 4; ++ i)
		for (int j = 1; j <= 4; ++ j)
		{
			fin >> a[i][j];
			modify(i, j, a[i][j], 1);
		}
}

void dfs(int x, int y, int c, int depth)
{
	record[depth].x = x; record[depth].y = y; record[depth].c = c;
	if (depth == 16)
	{
		++ ans;
		if (ans == 1)
			for (int i = 1; i <= 16; ++ i)
				fout << char(record[i].c + 64) << " " << record[i].x << " " << record[i].y << endl;
		return;
	}
	modify(x, y, a[x][y], -1);
	modify(x, y, char(c + 64), 1);
	flag[x][y] = true;
	for (int k = 1; k <= 5; ++ k)
		if (rest[k])
			for (int i = 1; i <= 4; ++ i)
				for (int j = 1; j <= 4; ++ j)
					if (!flag[i][j] && f[i][j][k] == 0)
					{
						-- rest[k];
						dfs(i, j, k, depth + 1);
						++ rest[k];
					}
	modify(x, y, a[x][y], 1);
	modify(x, y, char(c + 64), -1);
	flag[x][y] = false;
}

void work()
{
	memset(flag, false, sizeof(flag));
	for (int i = 1; i <= 5; ++ i)
		rest[i] = 3;
	for (int i = 1; i <= 4; ++ i)
		for (int j = 1; j <= 4; ++ j)
			if (f[i][j][4] == 0)
				dfs(i, j, 4, 1);
	fout << ans << endl;
}

int main()
{
	init();
	work();
	return 0;
}
