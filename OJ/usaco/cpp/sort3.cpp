/*
ID:oifox20071
LANG:C++
PROG:sort3
*/
#include <iostream>
using namespace std;
const int maxn = 1000;
int a[maxn], s[3][3];
int vol[3];
int main()
{
	freopen("sort3.in", "r", stdin); freopen("sort3.out", "w", stdout);
	int n;
	cin >> n;
	vol[0] = vol[1] = vol[2] = 0;
	for (int i = 0; i < n; ++ i)
	{
		cin >> a[i];
		-- a[i];
		++ vol[a[i]];
	}
	vol[1] += vol[0];
	vol[2] += vol[1];
	for (int i = 0; i < n; ++ i)
	{
		if (i + 1 <= vol[0]) ++ s[0][a[i]];
		if (i + 1 > vol[0] && i + 1 <= vol[1]) ++ s[1][a[i]];
		if (i + 1 > vol[1] && i + 1 <= vol[2]) ++ s[2][a[i]];
	}
	int ans = 0;
	for (int i = 0; i < 3; ++ i)
		for (int j = 0; j < 3; ++ j)
			if (i != j)
			{
				int k = min(s[i][j], s[j][i]);
				ans += k;
				s[i][j] -= k;
				s[j][i] -= k;
			}
	ans += (s[0][1] + s[0][2]) * 2;
	cout << ans << endl;
	return 0;
}
