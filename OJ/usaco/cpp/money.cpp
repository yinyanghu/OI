/*
ID:oifox20071
LANG:C++
PROG:money
*/
#include <iostream>
using namespace std;
const int maxv = 26;
const int maxn = 10001;
int coin[maxv];
long long f[maxn];
int main()
{
	freopen("money.in", "r", stdin); freopen("money.out", "w", stdout);
	int v, n;
	cin >> v >> n;
	for (int i = 1; i <= v; ++ i)
		cin >> coin[i];
	f[0] = 1;
	for (int i = 1; i <= v; ++ i)
		for (int j = 0; j <= n - coin[i]; ++ j)
			f[j + coin[i]] += f[j];
	cout << f[n] << endl;
}
