/*
ID:oifox20071
LANG:C++
PROG:heritage
*/
#include <iostream>
#include <fstream>
using namespace std;
ifstream fin("heritage.in");
ofstream fout("heritage.out");
string pre, mid;
void make(string a, string b)
{
	int len = a.size();
	if (len == 1)
	{
		fout << a;
		return;
	}
	size_t pos = b.find(a[0]);
	if (pos > 0)
		make(a.substr(1, pos), b.substr(0, pos));
	if (len - pos > 1)
		make(a.substr(pos + 1, len - pos - 1), b.substr(pos + 1, len - pos - 1));
	fout << a[0];
	return;
}
int main()
{
	fin >> mid >> pre;
	make(pre, mid);
	fout << endl;
	return 0;
}
