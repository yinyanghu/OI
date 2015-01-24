/*
ID:oifox20071
LANG:C++
PROG:maze1
*/
#include <iostream>
#include <cstring>
using namespace std;
const int maxm = 38;
const int maxn = 100;
const int maxqueue = 20000;
const int dx[4] = {-1, 0, 1, 0};
const int dy[4] = {0, 1, 0, -1};
struct node
{
	int x, y;
} queue[maxqueue];
bool a[maxn * 2 + 1][maxm * 2 + 1], flag[maxn * 2 + 1][maxm *2 + 1];
int f[maxn * 2 + 1][maxm * 2 + 1];
int n, m;
void init()
{
	freopen("maze1.in", "r", stdin); freopen("maze1.out", "w", stdout);
	cin >> m >> n;
	n = n * 2 + 1; m = m * 2 + 1;
	char ch;
	for (int i = 0; i < n; ++ i)
	{
		cin.get();
		for (int j = 0; j < m; ++ j)
			a[i][j] = (cin.get() == ' ');
	}
}
void bfs(int x, int y)
{
	memset(flag, true, sizeof(flag));
	int head = -1, tail = 0;
	f[x][y] = 1;
	queue[0].x = x; queue[0].y = y; flag[x][y] = false;
	while (head != tail)
	{
		++ head;
		for (int i = 0; i < 4; ++ i)
		{
			int xx = queue[head].x + dx[i];
			int yy = queue[head].y + dy[i];
			if (a[xx][yy] && flag[xx][yy] && f[queue[head].x][queue[head].y] + 1 < f[xx][yy])
			{
				queue[++ tail].x = xx;
				queue[tail].y = yy;
				f[xx][yy] = f[queue[head].x][queue[head].y] + 1;
				flag[xx][yy] = false;
			}
		}
	}
}

int main()
{
	init();
	memset(f, 1, sizeof(f));
	for (int i = 1; i < n - 1; ++ i)
		if (a[i][0]) bfs(i, 0);
	for (int i = 1; i < n - 1; ++ i)
		if (a[i][m - 1]) bfs(i, m - 1);
	for (int i = 0; i < m; ++ i)
		if (a[0][i]) bfs(0, i);
	for (int i = 0; i < m; ++ i)
		if (a[n - 1][i]) bfs(n - 1, i);
	int ans = 0;
	for (int i = 0; i < n; ++ i)
		for (int j = 0; j < m; ++ j)
			if ((i % 2 == 1) && (j % 2 == 1) && f[i][j] > ans)
				ans = f[i][j];
	ans >>= 1;
	cout << ans << endl;
}
