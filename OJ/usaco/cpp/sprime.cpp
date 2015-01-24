/*
ID:oifox20071
LANG:C++
PROG:sprime
*/
#include <iostream>
#include <math.h>
using namespace std;
const int last[4] = {1, 3, 7, 9};
int n;
bool check(int x)
{
	for (int i = 2; i <= int(sqrt(x)); ++ i)
		if (x % i == 0) return 0;
	return 1;
}
void dfs(int k, int cur)
{
	for (int i = 0; i < 4; ++ i)
	{
		int temp = cur * 10 + last[i];
		if (check(temp))
			if (k == n - 1)
				cout << temp << endl;
			else dfs(k + 1, temp);
	}
}
int main()
{
	freopen("sprime.in", "r", stdin); freopen("sprime.out", "w", stdout);
	cin >> n;
	dfs(1, 2);
	dfs(1, 3);
	dfs(1 ,5);
	dfs(1, 7);
	return 0;
}
