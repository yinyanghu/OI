/*
ID:oifox20071
LANG:C++
PROG:barn1
*/
#include <iostream>
using namespace std;
const int limit = 200;
int stall[limit], interval[limit];
int m, s, c;
void sortlow(int *temp, int l, int r)
{
	for (int i = l; i < r - 1; ++ i)
		for (int j = i + 1; j < r; ++ j)
			if (temp[i] > temp[j])
			{
				int k = temp[i]; temp[i] = temp[j]; temp[j] = k;
			}
}

void sorthigh(int *temp, int l, int r)
{
	for (int i = l; i < r - 1; ++ i)
		for (int j = i + 1; j < r; ++ j)
			if (temp[i] < temp[j])
			{
				int k = temp[i]; temp[i] = temp[j]; temp[j] = k;
			}
}

int main()
{
	freopen("barn1.in", "r", stdin); freopen("barn1.out", "w", stdout);
	cin >> m >> s >> c;
	for (int i = 0; i < c; ++ i)
		cin >> stall[i];
	sortlow(stall, 0, c);
	for (int i = 1; i < c; ++ i)
		interval[i - 1] = stall[i] - stall[i - 1] - 1;
	sorthigh(interval, 0, c - 1);
	int ans = stall[c - 1] - stall[0] + 1;
	for (int i = 0; i < m - 1; ++ i)
		ans -= interval[i];
	cout << ans << endl;
	return 0;
}
