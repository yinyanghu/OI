/*
ID:oifox20071
LANG:C++
PROG:agrinet
*/
#include <iostream>
using namespace std;
const int maxn = 100;
const int infinity = 100000000;
int dist[maxn][maxn], f[maxn], n;
bool flag[maxn];
int main()
{
	freopen("agrinet.in", "r", stdin); freopen("agrinet.out", "w", stdout);
	cin >> n;
	for (int i = 0; i < n; ++ i)
		for (int j = 0; j < n; ++ j)
			cin >> dist[i][j];
	for (int i = 0; i < n; ++ i)
	{
		f[i] = infinity;
		flag[i] = true;
	}
	f[0] = 0;
	int ans = 0;
	for (int i = 0; i < n; ++ i)
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
		ans += f[cur];
		for (int j = 0; j < n; ++ j)
			if ((dist[cur][j] > 0) && flag[j] && (f[j] > dist[cur][j]))
				f[j] = dist[cur][j];
	}
	cout << ans << endl;
	return 0;
}
