/*
ID:oifox20071
LANG:C++
PROG:ttwo
*/
#include <iostream>
#include <cstring>
using namespace std;
const int n = 10;
const int maxans = 160000;
const int dx[4] = {-1, 0, 1, 0};
const int dy[4] = {0, 1, 0, -1};
struct node
{
	int x, y, direction;
} farmer, cow;
bool flag[n][n];
void init()
{
	freopen("ttwo.in", "r", stdin); freopen("ttwo.out", "w", stdout);
	char ch;
	memset(flag, true, sizeof(flag));
	for (int i = 0; i < n; ++ i)
		for (int j = 0; j < n; ++ j)
		{
			cin >> ch;
			switch (ch)
			{
				case 'C':
					cow.x = i; cow.y = j; cow.direction = 0; break;
				case 'F':
					farmer.x = i; farmer.y = j; farmer.direction = 0; break;
				case '*':
					flag[i][j] = false; break;
			}
		}
	
}
int main()
{
	init();
	int ans = 0;
	do
	{
		int x = cow.x + dx[cow.direction];
		int y = cow.y + dy[cow.direction];
		if (x >= 0 && x < n && y >= 0 && y < n && flag[x][y])
		{
			cow.x = x; cow.y = y;
		}
		else cow.direction = (cow.direction + 1) % 4;
		
		x = farmer.x + dx[farmer.direction];
		y = farmer.y + dy[farmer.direction];
		if (x >= 0 && x < n && y >= 0 && y < n && flag[x][y])
		{
			farmer.x = x; farmer.y = y;
		}
		else farmer.direction = (farmer.direction + 1) % 4;
		++ ans;
	} while ((cow.x != farmer.x || cow.y != farmer.y) && ans <= maxans);
	if (cow.x == farmer.x && cow.y == farmer.y)
		cout << ans << endl;
	else
		cout << 0 << endl;
	return 0;
}
