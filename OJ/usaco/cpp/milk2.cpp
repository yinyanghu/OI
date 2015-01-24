/*
ID:oifox20071
LANG:C++
PROG:milk2
*/
#include <iostream>
using namespace std;
const
	int maxn = 5000;
struct node    
{
	int x, y;
};

int n;
node a[maxn];

void sort(int l, int r)
{
	int i = l, j = r, k = a[(l + r) >> 1].x;
	do
	{
		while (a[i].x < k) ++ i;
		while (a[j].x > k) -- j;
		if (i <= j)
		{
			node temp = a[i]; a[i] = a[j]; a[j] = temp;
			++ i; -- j;
		}
	} while (i <= j);
	if (l < j) sort(l, j);
	if (i < r) sort(i, r);
}

int main()
{
	freopen("milk2.in", "r", stdin); freopen("milk2.out", "w", stdout);
	cin >> n;
	for (int i = 0; i < n; ++ i)
		cin >> a[i].x >> a[i].y;
	sort(0, n - 1);
	int ans1 = 0, ans2 = 0;
	int s = a[0].x, t = a[0].y;
	for (int i = 1; i < n; ++ i)
		if (a[i].x <= t)
		{
			t = (a[i].y > t) ? a[i].y : t;
		}
		else
		{
			ans1 = (t - s > ans1) ? t - s : ans1;
			ans2 = (a[i].x - t > ans2) ? a[i].x - t : ans2;
			s = a[i].x; t = a[i].y;
		}
	ans1 = (t - s > ans1) ? t - s : ans1;
	cout << ans1 << ' ' << ans2 << endl;
	return 0;
}
