/*
ID:oifox20071
LANG:C++
PROG:transform
*/
#include <iostream>
using namespace std;
const
	int maxn = 10;
bool start[maxn][maxn], target[maxn][maxn], temp[maxn][maxn];
int n;

int change(int x)
{
	for (int i = 0; i < n; ++ i)
		for (int j = 0; j < n; ++ j)
			switch (x)
			{
				case 1: temp[j][n - i - 1] = start[i][j]; break;
				case 2: temp[n - i - 1][n - j - 1] = start[i][j]; break;
				case 3: temp[n - j - 1][i] = start[i][j]; break;
				case 4: temp[i][n - j - 1] = start[i][j]; break;
				case 5: temp[n - j - 1][n - i - 1] = start[i][j]; break;
				case 6: temp[n - i - 1][j] = start[i][j]; break;
				case 7: temp[j][i] = start[i][j];
				case 8: temp[i][j] = start[j][i];
			}
	return 0;
}

int check(int x)
{
	for (int i = 0; i < n; ++ i)
		for (int j = 0; j < n; ++ j)
			if (temp[i][j] != target[i][j]) return 0;
	cout << x << endl;
	exit(0);
}

int main()
{
	freopen("transform.in", "r", stdin); freopen("transform.out", "w", stdout);
	cin >> n;
	char c;
	for (int i = 0; i < n; ++ i)
		for (int j = 0; j < n; ++ j)
		{
			cin >> c;
			start[i][j] = c == '@';
		}
	for (int i = 0; i < n; ++ i)
		for (int j = 0; j < n; ++ j)
		{
			cin >> c;
			target[i][j] = c == '@';
		}
	change(1); check(1);
	change(2); check(2);
	change(3); check(3);
	change(4); check(4);
	change(5); check(5);
	change(6); check(5);
	change(7); check(5);
	change(8); check(6);
	cout << 7 << endl;
	return 0;
}
