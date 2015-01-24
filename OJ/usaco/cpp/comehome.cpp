/*
ID:oifox20071
LANG:C++
PROG:comehome
*/
#include <iostream>
using namespace std;
const int n = 52;
const int infinity = 10000000;
const int source = 51;
int dist[n][n];
int f[n];
bool flag[n];
inline int change(char ch)
{
	return (ch >= 'a' && ch <= 'z') ? int(ch - 'a') : int(ch - 'A' + 26);
}
void init()
{
	freopen("comehome.in", "r", stdin); freopen("comehome.out", "w", stdout);
	for (int i = 0; i < n; ++ i)
		for (int j = 0; j < n; ++ j)
			dist[i][j] = (i == j) ? 0 : infinity;
	int m, k;
	char x, y;
	cin >> m;
	for (int i = 0; i < m; ++ i)
	{
		cin >> x >> y >> k;
		dist[change(x)][change(y)] = dist[change(y)][change(x)] = min(k, dist[change(x)][change(y)]);
	}
}

void dijkstra()
{
	for (int i = 0; i < n; ++ i)
	{
		flag[i] = true;
		f[i] = infinity;
	}
	f[source] = 0;
	for (int i = 0; i < n - 1; ++ i)
	{
		int min = infinity, cur;
		for (int j = 0; j < n; ++ j)
			if (flag[j] && (f[j] < min))
			{
				min = f[j];
				cur = j;
			}
		if (min == infinity) break;
		flag[cur] = false;
		for (int j = 0; j < n; ++ j)
			if ((dist[cur][j] != infinity) && flag[j] && (f[cur] + dist[cur][j] < f[j]))
				f[j] = f[cur] + dist[cur][j];
	}
	int ans = infinity, record;
	for (int i = 26; i < n; ++ i)
		if ((f[i] != 0) && (f[i] != infinity) && (f[i] < ans))
		{
			ans = f[i];
			record = i;
		}
	char ch = (record >= 0 && record <= 25) ? char(record + 'a') : char(record - 26 + 'A');
	cout << ch << " " << ans << endl;
}

int main()
{
	
	init();
	dijkstra();
	return 0;
}
