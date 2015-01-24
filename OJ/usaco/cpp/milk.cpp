/*
ID:oifox20071
LANG:C++
PROG:milk
*/
#include <iostream>
using namespace std;
const int limitsize = 5000;
struct node
{
	int price, volumn;
} milk[limitsize];
void sort(int l, int r)
{
	int i = l, j = r, x = milk[(l + r) >> 1].price;
	do
	{
		while (milk[i].price < x) ++ i;
		while (milk[j].price > x) -- j;
		if (i <= j)
		{
			node temp = milk[i]; milk[i] = milk[j]; milk[j] = temp;
			++ i; -- j;
		}
	} while (i <= j);
	if (l < j) sort(l, j);
	if (i < r) sort(i, r);
}

int main()
{
	freopen("milk.in", "r", stdin); freopen("milk.out", "w", stdout);
	int n, m;
	cin >> n >> m;
	for (int i = 0; i < m; ++ i)
		cin >> milk[i].price >> milk[i].volumn;
	sort(0,m - 1);
	int ans = 0;
	int cur = -1;
	while (n)
	{
		++ cur;
		ans += milk[cur].price * min(milk[cur].volumn, n);
		n -= min(milk[cur].volumn, n);
	}
	cout << ans << endl;
	return 0;
}
