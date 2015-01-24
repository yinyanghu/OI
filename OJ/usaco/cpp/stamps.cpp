/*
ID:oifox20071
LANG:C++
PROG:stamps
*/
#include <iostream>
using namespace std;
const int maxn = 50;
const int limitsize = 2000001;
const int infinity = 1000000000;
int f[limitsize], a[maxn];
int main()
{
	freopen("stamps.in", "r", stdin); freopen("stamps.out", "w", stdout);
	int n, k;
	cin >> k >> n;
	for (int i = 0; i < n; ++ i)
		cin >> a[i];
	f[0] = 0;
	int ans;
	for (int i = 1; i <= limitsize; ++ i)
	{
		f[i] = infinity;
		for (int j = 0; j < n; ++ j)
			if (i >= a[j])
				f[i] = min(f[i], f[i - a[j]] + 1);
		if (f[i] > k)
		{
			ans = i - 1;
			break;
		}
	}
	cout << ans << endl;
	return 0;
}
