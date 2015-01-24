/*
ID:oifox20071
LANG:C++
PROG:concom
*/
#include <iostream>
#include <cstring>
using namespace std;
const int maxn = 101;
int n, a[maxn][maxn], s[maxn];
bool flag[maxn], con[maxn];
void init()
{
	freopen("concom.in", "r", stdin); freopen("concom.out", "w", stdout);
	int m;
	cin >> m;
	memset(a, 0, sizeof(a));
	int x, y, k;
	for (int i = 0; i < m; ++ i)
	{
		cin >> x >> y >> k;
		if (x > n) n = x;
		if (y > n) n = y;
		a[x][y] += k;
	}
}

void dfs(int k)
{
	if (flag[k]) return;
	flag[k] = true;
	for (int i = 1; i <= n; ++ i)
	{
		s[i] += a[k][i];
		if (s[i] > 50)
		{
			con[k] = true;
			dfs(i);
		}
	}
}

int main()
{

	init();
	for (int i = 1; i <= n; ++ i)
	{
		memset(flag, false, sizeof(flag));
		memset(con, false, sizeof(con));
		memset(s, 0, sizeof(s));
		con[i] = true;
		dfs(i);
		for (int j = 1; j <= n; ++ j)
			if (con[j] && i != j)
				cout << i << " " << j << endl;
	}
	return 0;
}
