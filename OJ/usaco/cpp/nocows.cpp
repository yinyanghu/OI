/*
ID:oifox20071
LANG:C++
PROG:nocows
*/
#include <iostream>
#include <cstring>
using namespace std;
const int prime = 9901;
const int maxn = 200;
const int maxm = 100;
int f[maxn][maxm];
int main()
{
	freopen("nocows.in", "r", stdin); freopen("nocows.out", "w", stdout);
	int n, m;
	cin >> n >> m;
	memset(f, 0, sizeof(f));
	for (int i = 1; i <= m; ++ i)
		f[1][i] = 1;
	for (int i = 2; i <= n; ++ i)
		for (int j = 1; j <= m; ++ j)
			for (int k = 1; k <= i - 2; ++ k)
				f[i][j] = (f[i][j] + (f[k][j - 1] * f[i - k - 1][j - 1]) % prime) % prime;
	int ans = (f[n][m] - f[n][m - 1] + prime) % prime;
	cout << ans << endl;
	return 0;
}
