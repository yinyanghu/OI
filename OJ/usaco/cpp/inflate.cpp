/*
ID:oifox20071
LANG:C++
PROG:inflate
*/
#include <iostream>
#include <cstring>
using namespace std;
const int maxm = 10001;
const int maxn = 10000;
int f[maxm], p[maxn], v[maxn];
int main()
{
	freopen("inflate.in", "r", stdin); freopen("inflate.out", "w", stdout);
	int n, m;
	cin >> m >> n;
	for (int i = 0; i < n; ++ i)
		cin >> p[i] >> v[i];
	memset(f, 0, sizeof(f));
	for (int i = 0; i < n; ++ i)
		for (int j = v[i]; j <= m; ++ j)
			f[j] = max(f[j], f[j - v[i]] + p[i]);
	cout << f[m] << endl;
	return 0;
}
