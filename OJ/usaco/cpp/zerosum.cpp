/*
ID:oifox20071
LANG:C++
PROG:zerosum
*/
#include <iostream>
using namespace std;
const int maxn = 9;
int n;
char record[maxn];
void print()
{
	cout << 1;
	for (int i = 1; i < n; ++ i)
		cout << record[i] << i + 1;
	cout << endl;
}
void dfs(int depth, int sum, int last)
{
	if (depth == n)
	{
		if (sum == 0) print();
		return;
	}
	record[depth] = ' ';
	if (last > 0)
		dfs(depth + 1, sum - last + last * 10 + (depth + 1), last * 10 + (depth + 1));
	else
		dfs(depth + 1, sum - last + last * 10 - (depth + 1), last * 10 - (depth + 1));
	record[depth] = '+';
	dfs(depth + 1, sum + (depth + 1), depth + 1);
	record[depth] = '-';
	dfs(depth + 1, sum - (depth + 1), -(depth + 1));
}

int main()
{
	freopen("zerosum.in", "r", stdin); freopen("zerosum.out", "w", stdout);
	cin >> n;
	dfs(1, 1, 1);
	return 0;
}
