/*
ID:oifox20071
LANG:C++
PROG:preface
*/
#include <iostream>
#include <cstring>
using namespace std;
const int a[10][2] = {{0, 0}, {1, 0}, {2, 0}, {3, 0}, {1, 1}, {0, 1}, {1, 1}, {2, 1}, {3, 1}, {1, 0}};
const char b[4][2] = {{'I', 'V'}, {'X', 'L'}, {'C', 'D'}, {'M', ' '}};
const int c[4] = {1, 10, 100, 1000};
int ans[4][2];
int main()
{
	freopen("preface.in", "r", stdin); freopen("preface.out", "w", stdout);
	int n;
	cin >> n;
	memset(ans, 0, sizeof(ans));
	for (int i = 1; i <= n; ++ i)
		for (int j = 0; j < 4; ++ j)
		{
			int temp = (i / c[j]) % 10;
			if (temp == 9) ++ ans[j + 1][0];
			ans[j][0] += a[temp][0];
			ans[j][1] += a[temp][1];
		}
	for (int i = 0; i < 4; ++ i)
		for (int j = 0; j < 2; ++ j)
			if (ans[i][j])
				cout << b[i][j] << " " << ans[i][j] << endl;
	return 0;
}
