/*
ID:oifox20071
LANG:C++
PROG:fence6
*/
#include <iostream>
#include <fstream>
#include <cstring>
using namespace std;
ifstream fin("fence6.in");
ofstream fout("fence6.out");
const int maxn = 101;
const int maxdegree = 9;
const int infinity = 100000000;
struct edgenode
{
	int len;
	int link[2][maxdegree];
} edge[maxn];
bool flag[maxn][maxn], visit[maxn];
int n, ans = infinity, start;
void init()
{
	memset(flag, false, sizeof(flag));
	fin >> n;
	int x;
	for (int i = 0; i < n; ++ i)
	{
		fin >> x;
		fin >> edge[x].len >> edge[x].link[0][0] >> edge[x].link[1][0];
		for (int j = 1; j <= edge[x].link[0][0]; ++ j)
			fin >> edge[x].link[0][j];
		for (int j = 1; j <= edge[x].link[1][0]; ++ j)
		{
			fin >> edge[x].link[1][j];
			flag[x][edge[x].link[1][j]] = true;
		}
	}
}

void dfs(int x, int k, int len)
{
	if (len >= ans) return;
	for (int i = 1; i <= edge[x].link[1 - k][0]; ++ i)
	{
		int next = edge[x].link[1 - k][i];
		if (start == next && !flag[next][x])
		{
			ans = min(ans, len);
			return;
		}
		if (!visit[next])
		{
			visit[next] = true;
			dfs(next, flag[next][x], len + edge[next].len);
			visit[next] = false;
		}
	}
	return;
}

int main()
{
	init();
	for (int i = 1; i <= n; ++ i)
	{
		memset(visit, false, sizeof(visit));
		start = i;
		dfs(i, 0, edge[i].len);
	}
	fout << ans << endl;
	return 0;
}
