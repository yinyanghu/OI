/*
ID:oifox20071
LANG:C++
PROG:numtri
*/
#include <iostream>
using namespace std;
const int limitsize = 1000;
short a[limitsize][limitsize];
int f[2][limitsize];
int n;
int main()
{
	freopen("numtri.in", "r", stdin); freopen("numtri.out", "w", stdout);
	cin >> n;
	for (int i = 0; i < n; ++ i)
		for (int j = 0; j <= i; ++ j)
			cin >> a[i][j];
	int flag = 0;
	for (int i = 0; i < n; ++ i)
		f[flag][i] = a[n - 1][i];
	for (int i = n - 2; i >= 0; -- i)
	{
		for (int j = 0; j <= i; ++ j)
			f[1 - flag][j] = max(f[flag][j], f[flag][j + 1]) + a[i][j];
		flag = 1 - flag;
	}
	cout << f[flag][0] << endl;
	return 0;
}
