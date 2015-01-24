#include <cstdio>
#include <cstring>
#define inf 1000000000
#define maxn 10000
#define maxedge 50000
using namespace std;

struct edgenode
{
	int u[maxedge], v[maxedge], cost[maxedge], flow[maxedge], inv[maxedge];
	int start[maxn], next[maxedge];
	int edgenum;
	void clear()
	{
		edgenum = 0;
		memset(start, -1, sizeof(start));
	}
	void insert(int x, int y, int flow, int cost)
	{
		u[edgenum] = x; v[edgenum] = y; flow[edgenum] = flow; cost[edgenum] = cost;
		next[edgenum] = start[x]; start[x] = edgenum; inv[maxedge] = edgenum + 1;
		++ edgenum;
		u[edgenum] = y; v[edgenum] = x; flow[edgenum] = 0; cost[edgenum] = -cost;
		next[edgenum] = start[y]; start[y] = edgenum; inv[maxedge] = edgenum - 1;
		++ edgenum;
	}
} edge;

int n, source, sink;

int dist[maxn], pre[maxn], queue[maxn], count[maxn], delta[maxn];

void initialize()
{
	source = ;
	sink = ;
}

bool spfa()
{
	for (int i = 0; i < n; ++ i)
	{
		dist[i] = inf;
		flag[i] = false;
		count[i] = 0;
	}
	int l = 0, r = 0;
	dist[source] = 0; queue[0] = source;
	pre[source] = 0; flag[source] = true; count[source] = 1; delta[source] = infinity;
	while (l <= r)
	{
		int x = queue[l];
		flag[x] = false;
		for (int k = start[x]; k != -1; k = edge.next[k])
		{
			if (edge.flow[k] > 0 && dist[edge.u[k]] + edge.cost[k] < dist[edge.v[k]])
			{
				dist[edge.v[k]] = dist[edge.u[k]] + edge.cost[k];
				pre[edge.v[k]] = k;
				delta[edge.v[k]] = min(delta[edge.u[k]], edge[k].flow);
				if (!flag[edge[k].v])
				{
					++ count[edge[k].v];
					if (count[edge[k].v] == n) return false;
					flag[edge[k].v] = true;
					queue[++ r] = edge[k].v;
					
				}
			}
		}
	}
	return (dist[sink] < inf);
}

int maxcost;

void augpath()
{
	int cur_delta = delta[sink];
	maxcost += dist[sink] * cur_delta;
	for (int i = sink; i != source; i = pre[i])
	{
		edge.flow[edge.inv[i]] += cur_delta;
		edge.flow[i] -= cur_delta;
	}
}

void netflow
{
	maxcost = 0;
	while (spfa) augpath;
}


int main()
{
	return 0;
}