/*
ID:oifox20071
LANG:C++
PROG:checker
*/
#include <iostream>
#include <math.h>
using namespace std;
const int maxn = 13;
int n, upperlimit, ans = 0, total = 0;
int final[3][maxn];
int temp[maxn];
void find(int row, int ld, int rd)
{
	if (row != upperlimit)
	{
		int pos = upperlimit & ~(row | ld | rd);
		while (pos != 0)
		{
			int p = pos & (-pos);
			pos -= p;
			find(row + p, (ld + p) << 1, (rd + p) >> 1);
		}
	} else ++ ans;
}

void solution(int row, int ld, int rd, int depth)
{
	if (total == 3) return;
	if (row != upperlimit)
	{
		int pos = upperlimit & ~(row | ld | rd);
		while (pos != 0)
		{
			if (total == 3) return;
			int p = pos & (-pos);
			pos -= p;
			temp[depth] = int(log(p) / log(2) + 0.000001) + 1;
			solution(row + p, (ld + p) << 1, (rd + p) >> 1, depth + 1);
		}
	}
	else
	{
		++ total;
		for (int i = 0; i < n; ++ i)
			final[total - 1][i] = temp[i];
	}
}
int main()
{
	freopen("checker.in", "r", stdin); freopen("checker.out", "w", stdout);
	cin >> n;
	upperlimit = (1 << n) - 1;
	find(0, 0, 0);
	solution(0, 0, 0, 0);
	for (int i = 0; i < 3; ++ i)
	{
		for (int j = 0; j < n - 1; ++ j)
			cout << final[i][j] << " ";
		cout << final[i][n - 1] << endl;
	}
	cout << ans << endl;
	return 0;
}
