/*
ID:oifox20071
PROG:crypt1
LANG:C++
*/
#include <iostream>
using namespace std;
int n;
int digit[10];
bool flag[10] = {0};
int check(int x)
{
	int k = 0;
	while (x)
	{
		if (!flag[x % 10]) return -1;
		++ k;
		x /= 10;
	}
	return k;
}
int main()
{
	freopen("crypt1.in", "r", stdin); freopen("crypt1.out", "w", stdout);
	cin >> n;
	for (int i = 0; i < n; ++ i)
	{
		cin >> digit[i];
		flag[digit[i]] = true;
	}
	int a1, a2, a3, a, b1, b2;
	int ans = 0;
	for (a1 = 0; a1 < n; ++ a1)
		for (a2 = 0; a2 < n; ++ a2)
			for (a3 = 0; a3 < n; ++ a3)
			{
				a = (digit[a1] * 10 + digit[a2]) * 10 + digit[a3];
				for (b1 = 0; b1 < n; ++ b1)
					if (check(a * digit[b1]) == 3)
						for (b2 = 0; b2 < n; ++ b2)
							if (check(a * digit[b2]) == 3 && check(a * (digit[b2] * 10 + digit[b1])) == 4)
								++ ans;
			}
	cout << ans << endl;			
	return 0;
}
