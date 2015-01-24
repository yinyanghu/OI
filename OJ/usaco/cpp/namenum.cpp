/*
ID:oifox20071
LANG:C++
PROG:namenum
*/

#include <iostream>
#include <cstring>
using namespace std;
const char trans[25] = {'2','2','2','3','3','3','4','4','4','5','5','5','6','6','6','7','0','7','7','8','8','8','9','9','9'};
int main()
{
	freopen("namenum.in", "r", stdin); freopen("namenum.out", "w", stdout);
	char num[20];
	cin >> num;
	freopen("dict.txt", "r", stdin);
	char name[20];
	bool none = true;
	while (scanf("%s", &name) != EOF)
	{
		bool flag = true;
		if (strlen(name) != strlen(num)) continue;
		for (int i = 0; i < strlen(num); ++ i)
			flag &= trans[name[i] - 'A'] == num[i];
		if (flag)
		{
			cout << name << endl;
			none = false;
		}
	}
	if (none) cout << "NONE" << endl;
	return 0;
}
