/*
ID:oifox20071
LANG:C++
PROG:dualpal
*/
#include <iostream>
using namespace std;
bool check(string temp)
{
	for (int i = 0; i < temp.size() >> 1; ++ i)
		if (temp[i] != temp[temp.size() - i - 1]) return false;
	return true;
}

char digit(int k)
{
	return (k > 9) ? char(55 + k) : char(48 + k);
}

string change(int x, int b)
{
	string temp = "";
	for (; x > 0; x /= b) temp = digit(x % b) + temp;
	return temp;
}

int main()
{
	freopen("dualpal.in", "r", stdin); freopen("dualpal.out", "w", stdout);
	int n , s;
	cin >> n >> s;
	while (n > 0)
	{
		++ s;
		int k = 0;
		for (int i = 2; i <= 10; ++ i)
		{
			if (check(change(s, i))) k ++;
			if (k == 2)
			{
				cout << s << endl;
				-- n;
				break;
			}
		}
	}
	return 0;
}
