/*
ID:oifox20071
LANG:C++
PROG:hamming
*/
#include <iostream>
using namespace std;
const int maxb = 8;
const int maxn = 64;
int n, b, d, limit;
bool flag[1 << maxb];
int ans[maxn];
void prepare()
{
	for (int i = 0; i <= limit; ++ i)
	{
		int s = i, sum = 0;
		while (s)
		{
			sum += (s & 1);
			s >>= 1;
		}
		flag[i] = (sum >= d);
	}
}
void print()
{
	int total = 0;
	for (int i = 0; i < n - 1; ++ i)
	{
		cout << ans[i];
		++ total;
		if (total == 10)
		{
			cout << endl;
			total = 0;
		}
		else
			cout << " ";
	}
	cout << ans[n - 1] << endl;
	exit(0);
}
void dfs(int depth)
{
	for (int i = ans[depth - 1] + 1; i <= limit; ++ i)
	{
		bool check = true;
		for (int j = 0; j < depth; ++ j)
			if (!flag[i ^ ans[j]])
			{
				check = false;
				break;
			}
		if (check)
		{
			ans[depth] = i;
			if (depth == n - 1)
				print();
			else
				dfs(depth + 1);
		}
	}
}
int main()
{
	freopen("hamming.in", "r", stdin); freopen("hamming.out", "w", stdout);
	cin >> n >> b >> d;
	limit = (1 << b) - 1;
	prepare();
	ans[0] = 0;
	dfs(1);
	return 0;
}
