/*
ID:oifox20071
LANG:C++
PROG:castle
*/
#include <iostream>
#include <cstring>
using namespace std;
const int limitsize = 50;
int wall[limitsize][limitsize];
int flag[limitsize][limitsize];
int room[limitsize * limitsize];
int n, m, total = 0, ans = 0;

void floodfill(int x, int y)
{
	flag[x][y] = total;
	++ room[total - 1];
	if (((wall[x][y] & 1) == 0) && (y > 0) && (flag[x][y - 1] == 0)) floodfill(x, y - 1);
	if (((wall[x][y] & 2) == 0) && (x > 0) && (flag[x - 1][y] == 0)) floodfill(x - 1, y);
	if (((wall[x][y] & 4) == 0) && (y < m - 1) && (flag[x][y + 1] == 0)) floodfill(x, y + 1);
	if (((wall[x][y] & 8) == 0) && (x < n - 1) && (flag[x + 1][y] == 0)) floodfill(x + 1, y);
}

int main()
{
	freopen("castle.in", "r", stdin); freopen("castle.out", "w", stdout);
	cin >> m >> n;
	for (int i = 0; i < n; ++ i)
		for (int j = 0; j < m; ++ j)
			cin >> wall[i][j];
	memset(flag, 0, sizeof(flag));
	for (int i = 0; i < n; ++ i)
		for (int j = 0; j < m; ++ j)
			if (flag[i][j] == 0)
			{
				++ total;
				room[total - 1] = 0;
				floodfill(i, j);
				if (room[total - 1] > ans) ans = room[total - 1];
			}
	cout << total << endl;
	cout << ans << endl;
	
	ans = 0;
	char ch;
	int x, y;
	for (int j = 0; j < m; ++ j)
	{
		for (int i = n - 2; i >= 0; -- i)
			if ((flag[i][j] != flag[i + 1][j]) && (room[flag[i][j] - 1] + room[flag[i + 1][j] - 1] > ans))
			{
				ans = room[flag[i][j] - 1] + room[flag[i + 1][j] - 1];
				x = i + 2; y = j + 1; ch = 'N';
			}
		if (j == m - 1) break;
		for (int i = n - 1; i >= 0; -- i)
			if ((flag[i][j] != flag[i][j + 1]) && (room[flag[i][j] - 1] + room[flag[i][j + 1] - 1] > ans))
			{
				ans = room[flag[i][j] - 1] + room[flag[i][j + 1] - 1];
				x = i + 1; y = j + 1; ch = 'E';
			}
	}
	cout << ans << endl;
	cout << x << " " << y << " " << ch << endl;
	return 0;
}
