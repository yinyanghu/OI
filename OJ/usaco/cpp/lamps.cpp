/*
ID:oifox20071
LANG:C++
PROG:lamps
*/
#include <iostream>
#include <vector>
#include <cstring>
using namespace std;
const int maxn = 100;
const int maxans = 32;
struct node
{
	int key;
	bool record[maxn];
} ans[maxans];
vector<int> on, off;
int n, c, total = 0;
bool flag[maxn];
void init()
{
	freopen("lamps.in", "r", stdin); freopen("lamps.out", "w", stdout);
	cin >> n >> c;
	while (1)
	{
		int temp;
		cin >> temp;
		if (temp == -1) break;
		on.push_back(temp - 1);
	}
	while (1)
	{
		int temp;
		cin >> temp;
		if (temp == -1) break;
		off.push_back(temp - 1);
	}	
}
void change(int start, int delta)
{
	int cur = start;
	while (cur < n)
	{
		flag[cur] = ! flag[cur];
		cur += delta;
	}
}

int calc()
{
	int m = (n > 6) ? 6 : n;
	int k = 0;
	for (int i = 0; i < m; ++ i)
		k = (flag[i]) ? (k << 1) + 1 : k << 1;
	return k;
}

void check()
{
	for (vector<int>::iterator i = on.begin(); i != on.end(); ++ i)
		if (!flag[*i]) return;
	for (vector<int>::iterator i = off.begin(); i != off.end(); ++ i)
		if (flag[*i]) return;
	++ total;
	for (int i = 0; i < n; ++ i)
		ans[total - 1].record[i] = flag[i];
	ans[total - 1].key = calc();
}

void sort()
{
	for (int i = 0; i < total - 1; ++ i)
		for (int j = i + 1; j < total; ++ j)
			if (ans[i].key > ans[j].key)
			{
				node k = ans[i]; ans[i] =  ans[j]; ans[j] = k;
			}
}

int main()
{
	init();
	for (int i1 = 0; i1 < 2; ++ i1)
		for (int i2 = 0; i2 < 2; ++ i2)
			for (int i3 = 0; i3 < 2; ++ i3)
				for (int i4 = 0; i4 < 2; ++ i4)
					if (i1 + i2 + i3 + i4 <= c)
					{
						memset(flag, true, sizeof(flag));
						if (i1) change(0, 1);
						if (i2) change(0, 2);
						if (i3) change(1 ,2);
						if (i4) change(0, 3);
						check();
					}
	if (total == 0)
	{
		cout << "IMPOSSIBLE" << endl;
		return 0;
	}
	sort();
	for (int i = 0; i < total; ++ i)
	{
		if (i != 0 && ans[i].key == ans[i - 1].key) continue;
		int k = n;
		while (k >= 6)
		{
			for (int j = 0; j < 6; ++ j)
				cout << (ans[i].record[j]) ? 1 : 0;
			k -= 6;
		}
		for (int j = 0; j < k; ++ j)
			cout << (ans[i].record[j]) ? 1 : 0;
		cout << endl;
	}
	return 0;
}
