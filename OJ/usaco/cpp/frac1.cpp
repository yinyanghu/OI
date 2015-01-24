/*
ID:oifox20071
LANG:C++
PROG:frac1
*/
#include <iostream>
using namespace std;
const int maxn = 160;
struct node
{
	int u, d;
	double value;
} ans[maxn * maxn];
int gcd(int a, int b)
{
	if (b == 0) return a;
	return gcd(b, a % b);
}
void sort(int l, int r)
{
	int i = l, j = r;
	double x = ans[(l + r) >> 1].value;
	do
	{
		while (ans[i].value < x) ++ i;
		while (ans[j].value > x) -- j;
		if (i <= j)
		{
			node temp = ans[i]; ans[i] = ans[j]; ans[j] = temp;
			++ i; -- j;
		}
	} while (i <= j);
	if (l < j) sort(l, j);
	if (i < r) sort(i, r);
}
int main()
{
	freopen("frac1.in", "r", stdin); freopen("frac1.out", "w", stdout);
	int n, total = -1;
	cin >> n;
	for (int i = 1; i <= n; ++ i)
		for (int j = 1; j <= i; ++ j)
			if (gcd(i, j) == 1)
			{
				ans[++ total].u = j;
				ans[total].d = i;
				ans[total].value = double(j) / double(i);
			}
	sort(0, total);
	cout << "0/1" << endl;
	for (int i = 0; i <= total; ++ i)
		cout << ans[i].u << "/" << ans[i].d << endl;
	return 0;
}
