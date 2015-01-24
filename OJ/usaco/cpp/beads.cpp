/*
ID:oifox20071
LANG:C++
PROG:beads
*/
#include <iostream>
using namespace std;
const
	int maxn = 350;
int n;
char s[maxn];
int main()
{
	freopen("beads.in", "r", stdin); freopen("beads.out", "w", stdout);
	
	cin >> n;
	int i;
	for (i = 0; i < n; ++ i)
	{
		cin >> s[i];
		s[i + n] = s[i];
	}
	char c;
	int flag, total, j;
	int max = 0;
	for (i = 0; i < n; ++ i)
	{
		c = s[i];
		if (c == 'w') flag = 0; else flag = 1;
		total = 0;
		j = i;
		while (flag <= 2)
		{
			while ((j < n + i) && (s[j] == c || s[j] == 'w'))
			{
				++ j;
				++ total;
			}
			c = s[j];
			++ flag;
		}
		if (total > max) max = total;
	}
	cout << max << endl;
	return 0;
}
