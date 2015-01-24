/*
ID:oifox20071
LANG:C++
PROG:friday
*/
#include <iostream>
#include <cstring>
using namespace std;
const
	int month[12] = {3, 0, 3, 2, 3, 2, 3, 3, 2, 3, 2, 3};
int check(int year)
{
	if (year % 100 == 0)
		if (year % 400 == 0) return 1;
			else return 0;
	else
		if (year % 4 == 0) return 1;
			else return 0;
}
int main()
{
	freopen("friday.in", "r", stdin); freopen("friday.out", "w", stdout);
	int n, day[7];
	cin >> n;
	int now = 6;
	memset(day, 0, sizeof(day));
	for (int year = 1900; year < 1900 + n; year ++)
		for (int i = 0; i < 12; ++ i)
		{
			day[now] ++;
			if (i == 1) 
				now += check(year);
			else
				now += month[i];
			now %= 7;
		}
	cout << day[6];
	for (int i = 0; i < 6; ++ i) cout << " " << day[i];
	cout << endl;
	return 0;
}
