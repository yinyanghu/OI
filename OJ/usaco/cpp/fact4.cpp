/*
ID:oifox20071
LANG:C++
PROG:fact4
*/
#include <iostream>
#include <fstream>
using namespace std;
ifstream fin("fact4.in");
ofstream fout("fact4.out");
int main()
{
	int n;
	fin >> n;
	int ans = 1;
	for (int i = 1; i <= n; ++ i)
	{
		ans *= i;
		ans %= 1000000;
		while (ans % 10 == 0)
			ans /= 10;
	}
	ans %= 10;
	fout << ans << endl;
	return 0;
}