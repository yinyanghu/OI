/*
ID:oifox20071
LANG:C++
PROG:hidden
*/
#include <iostream>
#include <fstream>
#include <cstring>
using namespace std;
ifstream fin("hidden.in");
ofstream fout("hidden.out");
const int maxn = 100000 * 2;
char s[maxn];
int n, ans = 0;
void init()
{
	fin >> n;
	for (int i = 0; i < n; ++ i)
		fin >> s[i];
	memcpy(s + n, s, sizeof(char) * n);
}

bool check(int &x)
{
	for (int i = 0; i < n; ++ i)
		if (s[x + i] < s[ans + i])
		{
			if (i > 1)
				x += i - 1;
			return true;
		}
		else if (s[x + i] > s[ans + i])
		{
			if (i > 1)
				x += i - 1;
			return false;
		}
	x += n - 2;
	return false;
}

void work()
{
	for (int i = 1; i <= n; ++ i)
	{
		int k = i;
		if (check(i)) ans = k;
	}
	fout << ans << endl;
}

int main()
{
	init();
	work();
	return 0;
}
