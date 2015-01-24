/*
ID:oifox20071
LANG:C++
PROG:holstein
*/
#include <iostream>
using namespace std;
const int maxn = 25;
const int maxm = 15;
int n, m, need[maxn], vit[maxm][maxn];
int base[maxm];
int check(int x)
{
	int sum = 0;
	int temp[maxn];
	for (int i = 0; i < n; ++ i)
		temp[i] = 0;
	for (int i = 0; i < m; ++ i)
		if ((x & base[i]) != 0)
		{
			++ sum;
			for (int j = 0; j < n; ++ j)
				temp[j] += vit[i][j];
		}
	for (int i = 0; i < n; ++ i)
		if (temp[i] < need[i]) return -1;
	return sum;
}
int main()
{
	freopen("holstein.in", "r", stdin); freopen("holstein.out", "w", stdout);
	cin >> n;
	for (int i = 0; i < n; ++ i)
		cin >> need[i];
	cin >> m;
	for (int i = 0; i < m; ++ i)
		for (int j = 0; j < n; ++ j)
			cin >> vit[i][j];
	int total = (1 << m) - 1;
	base[0] = 1;
	for (int i = 1; i < maxm; ++ i)
		base[i] = base[i - 1] << 1;
	int ans = 10000, solution;
	for (int i = 1; i <= total; ++ i)
	{
		int k = check(i);
		if (k == -1) continue;
		if (k < ans)
		{
			ans = k;
			solution = i;
		}
	}
	cout << ans;
	for (int i = 0; i < m; ++ i)
		if ((solution & base[i]) != 0)
			cout << " " << i + 1;
	cout << endl;
	return 0;
}
