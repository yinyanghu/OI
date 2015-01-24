/*
ID:oifox20071
LANG:C++
PROG:pprime
*/
#include <iostream>
#include <math.h>
using namespace std;
int getlength(int x)
{
	return int(log(x) / log(10)) + 1;
}

bool check(int x)
{
	for (int i = 2; i <= int(sqrt(x)); ++ i)
		if (x % i == 0) return 0;
	return 1;
}

int main()
{
	freopen("pprime.in", "r", stdin); freopen("pprime.out", "w", stdout);
	int a, b;
	cin >> a >> b;
	for (int i = getlength(a); i <= getlength(b); ++ i)
		if (i == 2 || i % 2 == 1)
		{
			int digit = (i == 2) ? i >> 1 : (i >> 1) + 1;
			for (int j = int(pow(10, digit - 1)); j < int(pow(10, digit)); ++ j)
			{
				char temp[9];
				sprintf(temp, "%d", j);
				string base = temp;
				int cur = j;
				for (int k = (i >> 1) - 1; k >= 0; -- k)
					cur = cur * 10 + int(base[k] - '0');
				if (cur > b) return 0;
				if (cur >= a && check(cur))
					cout << cur << endl;
			}
		}
	return 0;
}
