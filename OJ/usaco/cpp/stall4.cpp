/*
ID:oifox20071
LANG:C++
PROG:stall4
*/
#include <iostream>
#include <fstream>
#include <cstring>
using namespace std;
ifstream fin("stall4.in");
ofstream fout("stall4.out");
const int limitsize = 201;
int n, m;
bool will[limitsize][limitsize], flag[limitsize];
int c[limitsize];
void init()
{
	memset(will, false, sizeof(will));
	fin >> n >> m;
	int k, x;
	for (int i = 1; i <= n; ++ i)
	{
		fin >> k;
		for (int j = 1; j <= k; ++ j)
		{
			fin >> x;
			will[i][x] = true;
		}
	}	
}

bool extendpath(int x)
{
	for (int i = 1; i <= m; ++ i)
		if (will[x][i] && flag[i])
		{
			flag[i] = false;
			if (c[i] == 0 || extendpath(c[i]))
			{
				c[i] = x;
				return true;
			}
		}
	return false;
}

int hungary()
{
	int ans = 0;
	memset(c, 0, sizeof(c));
	for (int i = 1; i <= n; ++ i)
	{
		memset(flag, true, sizeof(flag));
		if (extendpath(i)) ++ ans;
	}
	return ans;
}

int main()
{
	init();
	fout << hungary() << endl;
	return 0;
}
