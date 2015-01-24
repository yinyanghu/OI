/*
ID:oifox20071
LANG:C++
PROG:shuttle
*/
#include <iostream>
#include <fstream>
using namespace std;
ifstream fin("shuttle.in");
ofstream fout("shuttle.out");
int n, cur = 0, p;
void a(int x)
{
	for (int i = 0; i < x; ++ i)
	{
		if (cur % 20 == 0)
			fout << endl;
		else
			fout << " ";
		if ((x & 1) == 0)
			p -= 2;
		else
			p += 2;
		fout << p;
		++ cur;
	}
}

void b(int x)
{
	if ((x & 1) == 0)
		-- p;
	else
		++ p;
	if (cur == 0);
	else
		if (cur % 20 == 0)
			fout << endl;
		else
			fout << " ";
	fout << p;
	++ cur;
}

int main()
{
	fin >> n;
	p = n + 1;
	for (int i = 0; i < n; ++ i)
	{
		a(i); b(i);
	}
	a(n);
	for (int i = n - 1; i >= 0; -- i)
	{
		b(i); a(i);
	}
	fout << endl;
	return 0;
}
