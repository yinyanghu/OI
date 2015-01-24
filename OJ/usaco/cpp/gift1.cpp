/*
ID:oifox20071
LANG:C++
PROG:gift1
*/
#include <iostream>
#include <string>
using namespace std;
const
	int maxn = 10;
int money[maxn], last[maxn], n;
string name[maxn];

int find(string a)
{
	for (int i = 0; i < n; ++ i)
		if (a == name[i]) return i;
}
int main()
{
	freopen("gift1.in", "r", stdin); freopen("gift1.out", "w", stdout);
	cin >> n;
	for (int i = 0; i < n; ++ i)
	{
		money[i] = 0;
		cin >> name[i];
	}
	string cur;
	int sum, m;
	for (int i = 0; i < n; ++ i)
	{
		cin >> cur >> sum >> m;
		int k = find(cur);
		last[k] = sum;
		money[k] += sum;
		if (m != 0) money[k] -= (sum / m) * m;
		for (int j = 0; j < m; ++ j)
		{
			cin >> cur;
			int p = find(cur);
			money[p] += sum / m;
		}
	}
	for (int i = 0; i < n; ++ i)
		cout << name[i] << " " << money[i] - last[i] << endl;
	return 0;
}
