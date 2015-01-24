/*
ID:oifox20071
LANG:C++
PROG:camelot
*/
#include <iostream>
#include <fstream>
#include <cstring>
using namespace std;
ifstream fin("camelot.in");
ofstream fout("camelot.out");
const int infinity = 100000000;
const int maxn = 30;
const int maxm = 26;
const int knightx[8] = {-1, 1, 2, 2, 1, -1, -2, -2};
const int knighty[8] = {2, 2, 1, -1, -2, -2, -1, 1};
const int kingx[9] = {-1, 0, 1, 1, 1, 0, -1, -1, 0};
const int kingy[9] = {1, 1, 1, 0, -1, -1, -1, 0, 0};
struct node
{
	int x, y;
};
int dist[maxn][maxm][maxn][maxm];
int n, m, total = -1;
node king, knight[maxn * maxm];
void init()
{
	char ch;
	int k;
	fin >> n >> m;
	fin >> ch >> k;
	king.x = k - 1; king.y = int(ch - 'A');
	while (fin >> ch >> k)
	{
		knight[++ total].x = k - 1;
		knight[total].y = int(ch - 'A');
	}
}
void find(int x, int y)
{
	if (x < 0 || x >= n || y < 0 || y >= m) return;
	const int maxqueue = 10000;
	bool flag[maxn][maxm];
	node queue[maxqueue];
	int head = -1, tail = 0;
	queue[0].x = x; queue[0].y = y;
	memset(flag, true, sizeof(flag));
	flag[x][y] = false;
	dist[x][y][x][y] = 0;
	while (head != tail)
	{
		++ head;
		for (int i = 0; i < 8; ++ i)
		{
			int xx = queue[head].x + knightx[i];
			int yy = queue[head].y + knighty[i];
			if (xx >= 0 && xx < n && yy >= 0 && yy < m && flag[xx][yy])
			{
				flag[xx][yy] = false;
				dist[x][y][xx][yy] = dist[x][y][queue[head].x][queue[head].y] + 1;
				queue[++ tail].x = xx;
				queue[tail].y = yy;
			}
		}
	}
	
}

void work()
{
	if (total == -1)
	{
		fout << 0 << endl;
		return;
	}
	for (int i = 0; i < n; ++ i)
		for (int j = 0; j < m; ++ j)
			for (int x = 0; x < n; ++ x)
				for (int y = 0; y < m; ++ y)
					dist[i][j][x][y] = infinity;
	for (int i = 0; i <= total; ++ i)
		find(knight[i].x, knight[i].y);
	for (int i = 0; i < 9; ++ i)
		for (int j = 0; j < 9; ++ j)
			find(king.x + kingx[i] + kingx[j], king.y + kingy[i] + kingy[j]);
	int ans = infinity;
	for (int i = 0; i < n; ++ i)
		for (int j = 0; j < m; ++ j)
		{
			int all = 0;
			for (int k = 0; k <= total; ++ k)
				all += dist[knight[k].x][knight[k].y][i][j];
			if (all >= ans) continue;
			ans = min(ans, all + max(abs(king.x - i), abs(king.y - j)));
			for (int k = 0; k <= total; ++ k)
				for (int p = 0; p < 9; ++ p)
					for (int q = 0; q < 9; ++ q)
					{
						node meet = {king.x + kingx[p] + kingx[q], king.y + kingy[p] + kingy[q]};
						if (meet.x >= 0 && meet.x < n && meet.y >= 0 && meet.y < m)
							ans = min(ans, dist[meet.x][meet.y][i][j] + dist[meet.x][meet.y][knight[k].x][knight[k].y] + max(abs(king.x - meet.x), abs(king.y - meet.y)) + all - dist[knight[k].x][knight[k].y][i][j]);
					}
		}
	fout << ans << endl;
}
int main()
{
	init();
	work();
	return 0;
}

// King +- 2
