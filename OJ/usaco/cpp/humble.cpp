/*
ID:oifox20071
LANG:C++
PROG:humble
*/
#include <iostream>
#include <cstring>
using namespace std;
const int maxk = 100;
const int maxn = 100001;
const int infinity = 2000000000;
int prime[maxk], a[maxn], f[maxk];
int main()
{
	freopen("humble.in", "r", stdin); freopen("humble.out", "w", stdout);
	int n, k;
	cin >> k >> n;
	memset(f, 0, sizeof(f));
	for (int i = 0; i < k; ++ i)
		cin >> prime[i];
	a[0] = 1;
	for (int i = 1; i <= n; ++ i)
	{
		int min = infinity;
		for (int j = 0; j < k; ++ j)
			if (a[f[j]] * prime[j] < min)
				min = a[f[j]] * prime[j];
		a[i] = min;
		for (int j = 0; j < k; ++ j)
			if (a[f[j]] * prime[j] == min)
				++ f[j];
	}
	cout << a[n] << endl;
	return 0;
}
