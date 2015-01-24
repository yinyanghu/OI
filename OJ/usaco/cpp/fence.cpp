/*
ID:oifox20071
LANG:C++
PROG:fence
*/
#include <iostream>
#include <fstream>
#include <cstring>
#include <vector>
using namespace std;
ifstream fin("fence.in");
ofstream fout("fence.out");
const int maxn = 501;
int flag[maxn][maxn], degree[maxn];
int n, maxnode = 0;
vector<int> record;
void init()
{
	memset(flag, 0, sizeof(flag));
	memset(degree, 0, sizeof(degree));
	fin >> n;
	int x, y;
	for (int i = 0; i < n; ++ i)
	{
		fin >> x >> y;
		++ flag[x][y];
		++ flag[y][x];
		++ degree[x];
		++ degree[y];
		maxnode = max(maxnode, x);
		maxnode = max(maxnode, y);
	}
}

void dfs(int x)
{
	for (int i = 1; i <= maxnode; ++ i)
		if (flag[x][i])
		{
			-- flag[x][i];
			-- flag[i][x];
			dfs(i);
		}
	record.push_back(x);
}

void euler()
{
	record.clear();
	int start = 1;
	for (int i = 1; i <= maxnode; ++ i)
		if (degree[i] % 2 == 1)
		{
			start = i;
			break;
		}
	dfs(start);
}

void print()
{
	for (vector<int> :: reverse_iterator it = record.rbegin(); it != record.rend(); ++ it)
		fout << *it << endl;
}

int main()
{
	init();
	euler();
	print();
	return 0;
}
