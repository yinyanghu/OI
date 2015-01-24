/*
ID:oifox20071
LANG:C++
PROG:race3
*/
#include <iostream>
#include <fstream>
#include <cstring>
#include <vector>
using namespace std;
ifstream fin("race3.in");
ofstream fout("race3.out");
const int maxn = 51;
bool a[maxn][maxn], visit[maxn];
int n = -1;
void init()
{
	int x, p;
	memset(a, false, sizeof(a));
	while (true)
	{
		fin >> x;
		if (x == -1) break;
		++ n;
		while (x != -2)
		{
			a[n][x] = true;
			fin >> x;
		}
	}
}

void dfs(const int x, const int skip)
{
	visit[x] = true;
	for (int i = 0; i <= n; ++ i)
		if (a[x][i] && i != skip && !visit[i]) dfs(i, skip);
}

void work()
{
	bool flag[maxn][maxn];
	memcpy(flag, a, sizeof(a));
	for (int k = 0; k <= n; ++ k)
		for (int i = 0; i <= n; ++ i)
			for (int j = 0; j <= n; ++ j)
				flag[i][j] = flag[i][j] or (flag[i][k] && flag[k][j]);
	vector<int> ans1, ans2;
	ans1.clear();
	ans2.clear();
	for (int i = 1; i < n; ++ i)
	{
		memset(visit, false, sizeof(visit));
		dfs(0, i);
		if (!visit[n])
		{
			ans1.push_back(i);
			bool ok = true;
			for (int j = 0; j < n; ++ j)
				if (visit[j] && flag[i][j])
				{
					ok = false;
					break;
				}
			if (ok) ans2.push_back(i);
		}
	}
	fout << ans1.size();
	for (vector<int>::iterator it = ans1.begin(); it != ans1.end(); ++ it)
		fout << " " << *it;
	fout << endl << ans2.size();
	for (vector<int>::iterator it = ans2.begin(); it != ans2.end(); ++ it)
		fout << " " << *it;
	fout << endl;
}

int main()
{
	init();
	work();
	return 0;
}
