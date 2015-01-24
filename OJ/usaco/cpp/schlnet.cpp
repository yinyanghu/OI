/*
ID:oifox20071
LANG:C++
PROG:schlnet
*/
#include <iostream>
#include <fstream>
#include <cstring>
using namespace std;
ifstream fin("schlnet.in");
ofstream fout("schlnet.out");
const int maxn = 101;
int n;
bool f[maxn][maxn], a[maxn][maxn];
int in[maxn], out[maxn], flag[maxn];
void init()
{
	fin >> n;
	memset(f, false, sizeof(false));
	memset(in, 0, sizeof(in));
	memset(out, 0, sizeof(out));
	int x;
	for (int i = 1; i <= n; ++ i)
	{
		fin >> x;
		while (x)
		{
			f[i][x] = true;
			++ out[i];
			++ in[x];
			fin >> x;
		}
	}
	memcpy(a, f, sizeof(f));
}

void work()
{
	for (int k = 1; k <= n; ++ k)
		for (int i = 1; i <= n; ++ i)
			for (int j = 1; j <= n; ++ j)
				f[i][j] = f[i][j] || (f[i][k] && f[k][j]);
	memset(flag, -1, sizeof(flag));
	for (int i = 1; i <= n; ++ i)
	{
		if (flag[i] == -1)
			flag[i] = i;
		else
		{
			in[flag[i]] += in[i];
			out[flag[i]] += out[i];
		}
		for (int j = 1; j <= n; ++ j)
			if (f[i][j] && f[j][i])
			{
				flag[j] = flag[i];
				if (a[i][j])
				{
					-- in[flag[i]];
					-- out[flag[i]];
				}
			}
	}
	int total = 0;
	int x = 0, y = 0;
	for (int i = 1; i <= n; ++ i)
		if (flag[i] == i)
		{
			++ total;
			if (in[i] == 0) ++ x;
			if (out[i] == 0) ++ y;
		}
	if (total == 1)
		fout << 1 << endl << 0 << endl;
	else
		fout << x << endl << ((x > y) ? x : y) << endl;
}

int main()
{
	init();
	work();
	return 0;
}
