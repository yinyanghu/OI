/*
ID:oifox20071
LANG:C++
PROG:charrec
*/
#include <iostream>
#include <fstream>
#include <cstring>
using namespace std;
ifstream fin("charrec.in");
ofstream fout("charrec.out");
ifstream pin("font.in");
const int maxn = 1201;
const int infinity = 1000000000;
const string letter = " abcdefghijklmnopqrstuvwxyz";
bool image[28][21][21];
int n;
int diff[28][21][maxn], cost[maxn][4], from[maxn][4], f[maxn], g[maxn], ans[maxn];
void prepare()
{
	int temp;
	pin >> temp;
	char ch;
	for (int i = 1; i <= 27; ++ i)
		for (int j = 1; j <= 20; ++ j)
			for (int k = 1; k <= 20; ++ k)
			{
				pin >> ch;
				image[i][j][k] = ch == '1';
			}
}
	
void init()
{
	char ch;
	bool data[maxn][21];
	fin >> n;
	for (int i = 1; i <= n; ++ i)
		for (int j = 1; j <= 20; ++ j)
		{
			fin >> ch;
			data[i][j] = ch == '1';
		}
	for (int i = 1; i <= 27; ++ i)
		for (int j = 1; j <= 20; ++ j)
			for (int k = 1; k <= n; ++ k)
			{
				diff[i][j][k] = 0;
				for (int p = 1; p <= 20; ++ p)
					diff[i][j][k] += int(data[k][p] != image[i][j][p]);
			}
}

void work()
{
	int total;
	for (int i = 1; i <= n; ++ i)
	{	
		cost[i][1] = cost[i][2] = cost[i][3] = infinity;
		if (i + 18 <= n)
			for (int j = 1; j <= 27; ++ j)
			{
				total = 0;
				for (int k = 2; k <= 20; ++ k)
					total += diff[j][k][i + k - 2];
				if (total < cost[i][1])
				{
					cost[i][1] = total;
					from[i][1] = j;
				}
				for (int k = 2; k <= 20; ++ k)
				{
					total = total + diff[j][k - 1][i + k - 2] - diff[j][k][i + k - 2];
					if (total < cost[i][1])
					{
						cost[i][1] = total;
						from[i][1] = j;
					}
				}
			}
		if (i + 19 <= n)
			for (int j = 1; j <= 27; ++ j)
			{
				total = 0;
				for (int k = 1; k <= 20; ++ k)
					total += diff[j][k][i + k - 1];
				if (total < cost[i][2])
				{
					cost[i][2] = total;
					from[i][2] = j;
				}
			}
		if (i + 20 <= n)
			for (int j = 1; j <= 27; ++ j)
			{
				total = diff[j][1][i];
				for (int k = 2; k <= 20; ++ k)
					total += diff[j][k][i + k];
				if (total < cost[i][3])
				{
					cost[i][3] = total;
					from[i][3] = j;
				}
				for (int k = 2; k <= 20; ++ k)
				{
					total = total + diff[j][k][i + k - 1] - diff[j][k][i + k];
					if (total < cost[i][3])
					{
						cost[i][3] = total;
						from[i][3] = j;
					}
				}
			}
	}
	f[0] = 0;
	for (int i = 1; i <= n; ++ i)
		f[i] = infinity;
	for (int i = 19; i <= n; ++ i)
	{
		if (i >= 19 && f[i - 19] < infinity && f[i - 19] + cost[i - 18][1] < f[i])
			f[i] = f[i - 19] + cost[i - 18][1], g[i] = 19;
		if (i >= 20 && f[i - 20] < infinity && f[i - 20] + cost[i - 19][2] < f[i])
			f[i] = f[i - 20] + cost[i - 19][2], g[i] = 20;
		if (i >= 21 && f[i - 21] < infinity && f[i - 21] + cost[i - 20][3] < f[i])
			f[i] = f[i - 21] + cost[i - 20][3], g[i] = 21;
	}
	total = 0;
	for (int i = n; i; i -= g[i])
		ans[++ total] = from[i - g[i] + 1][g[i] - 18];
	for (int i = total; i; -- i)
		fout << letter[ans[i] - 1];
	fout << endl;
}

int main()
{
	prepare();
	init();
	work();
	return 0;
}
