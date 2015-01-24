#include <iostream>
#include <cstring>
using namespace std;
const int maxn = 2000;
const int maxedge = 10000 + 1;
struct edgenode
{
	int v, next;
};

edgenode edge[maxedge], inv_edge[maxedge];
int edgenum = 0, inv_edgenum = 0;
int start[maxn], inv_start[maxn];
void insert(int x, int y)
{
	edge[++ edgenum].v = y;
	edge[edgenum].next = start[x];
	start[x] = edgenum;
	inv_edge[++ inv_edgenum].v = x;
	inv_edge[inv_edgenum].next = inv_start[y];
	inv_start[y] = inv_edgenum;
}

int n;
int order[maxn];

void init()
{
	memset(start, -1, sizeof(start));
	memset(inv_start, -1, sizeof(inv_start));
	int m;
	cin >> n >> m;
	int x, y;
	for (int i = 0; i < m; ++ i)
	{
		cin >> x >> y;
		insert(x, y);
	}
}

int ordernum = 0, totalscc = 0;
bool vis[maxn];
int flag[maxn], scc[maxn];

void dfs(int x)
{
	vis[x] = true;
	for (int i = start[x]; i >= 0; i = edge[i].next)
		if (!vis[edge[i].v]) dfs(edge[i].v);
	order[++ ordernum] = x;
}

void inv_dfs(int x)
{
	vis[x] = true; flag[x] = totalscc;
	for (int i = inv_start[x]; i >= 0; i = inv_edge[i].next)
		if (!vis[inv_edge[i].v]) inv_dfs(inv_edge[i].v);
}

void work()
{
	memset(flag, 0, sizeof(flag));
	memset(vis, false, sizeof(vis));
	for (int i = 0; i < n; ++ i)
		if (!vis[i]) dfs(i);
	memset(vis, false, sizeof(vis));
	for (int i = ordernum; i >= 1; -- i)
		if (!vis[order[i]])
		{
			++ totalscc;
			inv_dfs(order[i]);
		}
	memset(scc, 0, sizeof(scc));
	
	for (int i = 0; i < n; ++ i)
		++ scc[flag[i]];
		
	// Check each point whether in cycle
	// Attention the case: only one point construct a cycle
	for (int i = 0; i < n; ++ i)
	{
		if (scc[flag[i]] > 1)
			cout << "Yes" << endl;
		else
			cout << "No" << endl;
	}
}

int main()
{
	//freopen("in.txt", "r", stdin);
	init();
	work();
	return 0;
}
