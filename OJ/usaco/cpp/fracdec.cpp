/*
ID:oifox20071
LANG:C++
PROG:fracdec
*/
#include <iostream>
#include <cstring>
using namespace std;
const int limitsize = 100000;
int record[limitsize], flag[limitsize];
string s = "";
void print(char ch)
{
	s += ch;
	if (s.length() == 76)
	{
		cout << s << endl;
		s = "";
	}
}
int main()
{
	freopen("fracdec.in", "r", stdin); freopen("fracdec.out", "w", stdout);
	int n, d;
	cin >> n >> d;
	//cout << n / d << '.';
	char temp[20];
	sprintf(temp, "%d", n / d);
	s = temp;
	s += '.';
	n %= d;
	memset(flag, -1, sizeof(flag));
	flag[n] = 0;
	int cur = 0;
	do
	{
		n *= 10;
		record[++ cur] = n / d;
		n %= d;
		if (flag[n] != -1) break;
			else flag[n] = cur;
	} while (n != 0);
	if (n == 0)
		for (int i = 1; i <= cur; ++ i) print(char(48 + record[i]));
	else
	{
		for (int i = 1; i <= flag[n]; ++ i) print(char(48 + record[i]));
		print('(');
		for (int i = flag[n] + 1; i <= cur; ++ i) print(char(48 + record[i]));
		print(')');
	}
	if (s != "") cout << s << endl;
	return 0;
}
