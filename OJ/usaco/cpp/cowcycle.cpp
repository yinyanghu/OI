/*
ID:oifox20071
LANG:C++
PROG:cowcycle
*/
#include <iostream>
#include <fstream>
using namespace std;
ifstream fin("cowcycle.in");
ofstream fout("cowcycle.out");
const int maxf = 5;
const int maxr = 10;
int f, r, f1, f2, r1, r2;
int record_f[maxf + 1], record_r[maxr + 1], record[maxf + maxr];
double rate[maxf * maxr], delta[maxf * maxr], ans = 10000000.0;
void update()
{
	int total = f * r, temp = -1;
	for (int i = 1; i <= f; ++ i)
		for (int j = 1; j <= r; ++ j)
			rate[++ temp] = (double)record_f[i] / record_r[j];
	for (int i = 0; i < total - 1; ++ i)
		for (int j = i + 1; j < total; ++ j)
			if (rate[i] > rate[j])
			{
				double k = rate[i]; rate[i] = rate[j]; rate[j] = k;
			}
	double sum = 0, var = 0;
	for (int i = 0; i < total - 1; ++ i)
	{
		delta[i] = rate[i + 1] - rate[i];
		sum += delta[i];
		var += delta[i] * delta[i];
	}
	double average = sum / (total - 1);
	var = var / (total - 1) - average * average;
	if (var < ans)
	{
		ans = var;
		temp = -1;
		for (int i = 1; i <= f; ++ i)
			record[++ temp] = record_f[i];
		for (int i = 1; i <= r; ++ i)
			record[++ temp] = record_r[i];
	}
}

void dfs_second(int x, int cur)
{
	if (x == r + 1)
	{
		if (record_f[f] * record_r[r] >= 3 * record_f[1] * record_r[1])
			update();
		return;
	}
	for (int i = cur; i <= (r2 - r + x); ++ i)
	{
		record_r[x] = i;
		dfs_second(x + 1, i + 1);
	}
}

void dfs_first(int x, int cur)
{
	if (x == f + 1)
	{
		dfs_second(1, r1);
		return;
	}
	for (int i = cur; i <= (f2 - f + x); ++ i)
	{
		record_f[x] = i;
		dfs_first(x + 1, i + 1);
	}
}
int main()
{
	fin >> f >> r;
	fin >> f1 >> f2 >> r1 >> r2;
	dfs_first(1, f1);
	for (int i = 0; i < r + f; ++ i)
	{
		fout << record[i];
		if (i == f - 1 || i == r + f - 1)
			fout << endl;
		else
			fout << " ";
	}
	return 0;
}
