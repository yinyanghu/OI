/*
ID:oifox20071
LANG:C++
PROG:ride
*/
#include <iostream>
#include <string>
using namespace std;
const
	int mod = 47;
int main()
{
	freopen("ride.in", "r", stdin); freopen("ride.out", "w", stdout);
	string comet, group;
	cin >> comet >> group;
	int a = 1, b = 1;
	for (int i = 0; i < comet.size(); ++ i)
	{
		a *= comet[i] - 'A' + 1;
		a %= mod;
	}
	for (int i = 0; i < group.size(); ++ i)
	{
		b *= group[i] - 'A' + 1;
		b %= mod;
	}
	if (a == b)
		cout << "GO" << endl;
	else
		cout << "STAY" << endl;
	return 0;
}
