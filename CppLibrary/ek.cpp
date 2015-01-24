#include <iostream>
#include <fstream>
#include <cstring>
using namespace std;
ifstream fin("milk6.in");
ofstream fout("milk6.out");
const int maxm = 1000;
const int maxn = 100;
const int maxqueue = 10000;
const int infinity =1000000000;
struct edgenode
{
	int a, b;
} edge[maxm + 1];
int n, m;
int a[maxn + 1][maxn + 1], aug[maxn + 1];
int pre[maxn + 1], queue[maxqueue];
bool flag[maxn + 1];
long long ans;
void init()
{
	memset(a, 0, sizeof(a));
	fin >> n >> m;
	int k;
	for (int i = 1; i <= m; ++ i)
	{
		fin >> edge[i].a >> edge[i].b >> k;
		a[edge[i].a][edge[i].b] += k;
	}
}

bool find_augpath()
{
	int head, tail;
	queue[head = tail = 0] = 1;
	while (head <= tail && pre[n] == -1)
	{
		int p = queue[head ++];
		for (int i = 2; i <= n; ++ i)
			if (pre[i] == -1 && a[p][i] > 0)
			{
				queue[++ tail] = i;
				pre[i] = p;
				aug[i] = min(aug[p], a[p][i]);
			}
	}
	return (pre[n] != -1);
}

void augpath()
{
	long long delta = aug[n];
	ans += delta;
	for (int i = n; i > 1; i = pre[i])
	{
		a[i][pre[i]] += delta;
		a[pre[i]][i] -= delta;
	}
}

void edmonds_karp()
{
	aug[1] = infinity;
	while (true)
	{
		memset(pre, -1, sizeof(pre));
		if (!find_augpath()) return;
		augpath();
	}
}

void dfs(int x)
{
	flag[x] = false;
	for (int i = 1; i <= n; ++ i)
		if (flag[i] && a[x][i] > 0) dfs(i);
}

void cut()
{
	fout << ans << endl;
	memset(flag, true, sizeof(flag));
	dfs(1);
	for (int i = 1; i <= m; ++ i)
		if (!flag[edge[i].a] && flag[edge[i].b])
			fout << i << endl;
			
}

int main()
{
	init();
	edmonds_karp();
	cut();
	return 0;
}
