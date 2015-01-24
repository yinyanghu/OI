/*
ID:oifox20071
LANG:C++
PROG:runround
*/
#include <iostream>
#include <math.h>
using namespace std;
bool check(int x)
{
	char s[20];
	sprintf(s, "%d", x);
	int len = int(log(x) / log(10)) + 1;
	for (int i = 0; i < len; ++ i)
		if (s[i] == '0') return 0;
	int sum[10];
	bool flag[10];
	for (int i = 0; i < 10; ++ i)
	{
		sum[i] = 0;
		flag[i] = 0;
	}
	for (int i = 0; i < len; ++ i)
	{
		++ sum[s[i] - '0'];
		if (sum[s[i] - '0'] > 1) return 0;
	}
	int k, m;
	for (k = 0, m = 1; !flag[m]; ++ k, m = (m + int(s[m - 1] - '0') - 1) % len + 1)
		flag[m] = 1;
	return (m == 1 && k == len);
}
int main()
{
	freopen("runround.in", "r", stdin); freopen("runround.out", "w", stdout);
	int n;
	cin >> n;
	for (int i = n + 1; ; ++ i)
		if (check(i))
		{
			cout << i << endl;
			break;
		}
	return 0;
}
