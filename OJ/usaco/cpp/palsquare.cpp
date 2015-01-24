/*
ID:oifox20071
LANG:C++
PROG:palsquare
*/
#include <iostream>
using namespace std;
const int n = 300;
int b;

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

string change(int x)
{
	string temp = "";
	for (; x > 0; x /= b) temp = digit(x % b) + temp;
	return temp;
}

int main()
{
	freopen("palsquare.in", "r", stdin); freopen("palsquare.out", "w", stdout);
	cin >> b;
	for (int i = 1; i <= n; ++ i)
	{
		string temp = change(i * i);
		if (check(temp))
		{
			cout << change(i) << ' '<< temp << endl;
		}
	}
	return 0;
}
