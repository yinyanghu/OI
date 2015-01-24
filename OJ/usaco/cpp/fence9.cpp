/*
ID:oifox20071
LANG:C++
PROG:fence9
*/
#include <iostream>
#include <fstream>
using namespace std;
ifstream fin("fence9.in");
ofstream fout("fence9.out");
int gcd(int x, int y)
{
	if (y == 0) return x;
	return gcd(y, x % y);
}
int main()
{
	int n, m, p;
	fin >> n >> m >> p;
	double s = p * m / 2.0;
	int w1 = gcd(n, m), w2 = gcd(m, abs(p - n));
	int ans = s - (p + w1 + w2) / 2.0 + 1;
	fout << ans << endl;
}