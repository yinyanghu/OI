/*
ID:oifox20071
LANG:C++
PROG:ratios
*/
#include <iostream>
#include <fstream>
#include <cstring>
using namespace std;
ifstream fin("ratios.in");
ofstream fout("ratios.out");
const int n = 3;
const int limit = 100;
int a[n][n], d[n];
int matrix(const int (*p)[n])
{
	return (p[0][0] * (p[1][1] * p[2][2] - p[1][2] * p[2][1]) - p[0][1] * (p[1][0] * p[2][2] - p[2][0] * p[1][2]) + p[0][2] * (p[1][0] * p[2][1] - p[2][0] * p[1][1]));
}
int main()
{
	for (int i = 0; i < n; ++ i)
		fin >> d[i];
	for (int i = 0; i < n; ++ i)
		for (int j = 0; j < n; ++ j)
			fin >> a[j][i];
	int s = matrix(a);
	int a1[n][n], a2[n][n], a3[n][n];
	bool flag = false;
	for (int factor = 1; factor <= limit; ++ factor)
	{
		memcpy(a1, a, sizeof(a));
		memcpy(a2, a, sizeof(a));
		memcpy(a3, a, sizeof(a));
		for (int i = 0; i < n; ++ i)
		{
			a1[i][0] = factor * d[i];
			a2[i][1] = factor * d[i];
			a3[i][2] = factor * d[i];
		}
		int s1 = matrix(a1), s2 = matrix(a2), s3 = matrix(a3);
		if (s1 % s != 0 || s2 % s != 0 || s3 % s != 0) continue;
		int x = s1 / s, y = s2 / s, z = s3 / s;
		if (x < 0 || x >= limit || y < 0 || y >= limit || z < 0 || z >= limit) continue;
		fout << x << " " << y << " " << z << " " << factor << endl;
		flag = true;
		break;
	}
	if (!flag)
		fout << "NONE" << endl;
	return 0;
}
