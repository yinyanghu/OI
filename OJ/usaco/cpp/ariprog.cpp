/*
ID:oifox20071
LANG:C++
PROG:ariprog
*/
#include <iostream>
#include <cstring> 
using namespace std;
const int limit = 250;
const int limitsize = 25000;
const int maxsequence = 10000;
struct node
{
	int a , b;
};
bool flag[limit * limit * 2 + 1];
int sequence[limitsize];
node ans[maxsequence];
int n, m;
int prepare()
{
	memset(flag, 0, sizeof(flag));
	for (int p = 0; p <= m; ++ p)
		for (int q = 0; q <= m; ++ q)
			flag[p * p + q * q] = 1;
	int k = -1;
	for (int i = 0; i <= m * m * 2; ++ i)
		if (flag[i]) sequence[++ k] = i;
	return k;
}

bool check(int a, int b)
{
	int k = a + b;
	for (int i = 3; i <= n; ++ i)
	{
		k += b;
		if (!flag[k]) return 0;
	}
	return 1;
}

void sort(int l, int r)
{
	int i = l, j = r;
	node x = ans[(l + r) >> 1];
	do
	{
		while (ans[i].b < x.b || (ans[i].b == x.b && ans[i].a < x.a)) ++ i;
		while (ans[j].b > x.b || (ans[j].b == x.b && ans[j].a > x.a)) -- j;
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
	freopen("ariprog.in", "r", stdin); freopen("ariprog.out", "w", stdout);
	cin >> n >> m;
	int sum = prepare();
	int total = -1;
	m = m * m * 2;
	for (int i = 0; i < sum; ++ i)
		for (int j = i + 1; j <= sum; ++ j)
		{
			int delta = sequence[j] - sequence[i];
			if (sequence[i] + delta * (n - 1) > m) break;
			if (check(sequence[i], delta))
			{
				++ total;
				ans[total].a = sequence[i];
				ans[total].b = delta;
			}
		}
	if (total == -1)
	{
		cout << "NONE" << endl;
		return 0;
	}
	sort(0, total);
	for (int i = 0; i <= total; ++ i)
		cout << ans[i].a << " " << ans[i].b << endl;
	return 0;
}
