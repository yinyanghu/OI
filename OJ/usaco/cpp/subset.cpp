/*
ID:oifox20071
LANG:C++
PROG:subset
*/
#include <iostream>
using namespace std;
const int maxn = 40;
const int maxsum = (maxn - 1) * maxn / 2 + 1;
long long f[maxn][maxsum];
int main()
{
	freopen("subset.in", "r", stdin); freopen("subset.out", "w", stdout);
	int n;
	cin >> n;
	int sum = (n + 1) * n / 2;
	if ((sum & 1) == 1)
	{
		cout << 0 << endl;
		return 0;
	}
	sum >>= 1;
	f[1][0] = f[1][1] = 1;
	for (int i = 2; i <= n; ++ i)
		for (int j = 0; j <= sum; ++ j)
			f[i][j] = (j - i >= 0) ? f[i - 1][j] + f[i - 1][j - i] : f[i - 1][j];
	int ans = f[n][sum] >> 1;
	cout << ans << endl;
	return 0;
}
