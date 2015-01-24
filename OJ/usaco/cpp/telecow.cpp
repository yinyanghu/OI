/*
ID:oifox20071
LANG:C++
PROG:telecow
*/
#include <iostream>
#include <fstream>
#include <cstring>
using namespace std;
ifstream fin("telecow.in");
ofstream fout("telecow.out");
const int maxedge = 1400 * 2 + 1;
const int maxn = 201;
const int infinity = 10000000;
const int maxqueue = 1000;
struct edgenode
{
	int v[maxedge], flow[maxedge], cap[maxedge], next[maxedge], inv[maxedge], start[maxn];
	int size;
	void initialize()
	{
		size = 0;
		memset(start, -1, sizeof(start));
	}
	void clear_flow()
	{
		memset(flow, 0, sizeof(flow));
	}
	void insert(int x, int y, int k)
	{
		++ size;
		v[size] = y; cap[size] = k; flow[size] = 0; inv[size] = size + 1;
		next[size] = start[x]; start[x] = size;
		++ size;
		v[size] = x; cap[size] = 0; flow[size] = 0; inv[size] = size - 1;
		next[size] = start[y]; start[y] = size;
	}
} edge;
int record[maxn];
int n, source, sink, s, t;
int level[maxn], use[maxn];
int queue[maxqueue];
bool flag[maxn];
bool marklevel()
{
	memset(level, -1, sizeof(level));
	level[sink] = 0;
	int head, tail;
	queue[head = tail = 0] = sink;
	while (head <= tail)
	{
		int x = queue[head ++];
		use[x] = edge.start[x];
		for (int i = edge.start[x]; i >= 0; i = edge.next[i])
			if (edge.flow[edge.inv[i]] < edge.cap[edge.inv[i]] && level[edge.v[i]] < 0)
			{
				level[edge.v[i]] = level[x] + 1;
				queue[++ tail] = edge.v[i];
			}
	}
	return level[source] >= 0;
}

int extendpath(int x, int delta)
{
	if (x == sink) return delta;
	for (int &i = use[x]; i >= 0; i = edge.next[i])
		if (edge.cap[i] > edge.flow[i] && level[edge.v[i]] + 1 == level[x])
		{
			int d = extendpath(edge.v[i], min(delta, edge.cap[i] - edge.flow[i]));
			if (d > 0)
			{
				edge.flow[i] += d; edge.flow[edge.inv[i]] -= d;
				return d;
			}
		}
	return 0;
}

int netflow()
{
	int maxflow = 0, delta;
	while (marklevel())
		while ((delta = extendpath(source, infinity)) > 0)
			maxflow += delta;
	return maxflow;
}

void init()
{
	int m, x, y, k;
	edge.initialize();
	fin >> n >> m >> s >> t;
	for (int i = 1; i <= n; ++ i)
		edge.insert((i << 1) - 1, i << 1, 1);
	for (int i = 0; i < m; ++ i)
	{
		fin >> x >> y;
		edge.insert(x << 1, (y << 1) - 1, infinity);
		edge.insert(y << 1, (x << 1) - 1, infinity);
	}
	source = s << 1; sink = (t << 1) - 1;
}

void work()
{
	int ans = netflow();
	fout << ans << endl;
	int size = 0;
	for (int i = 1; i <= n; ++ i)
		if (i != s && i != t)
		{
			edge.clear_flow();
			int p;
			for (p = edge.start[(i << 1) - 1]; p >= 0; p = edge.next[p])
				if (edge.v[p] == (i << 1)) break;
			edge.cap[p] = 0;
			if (netflow() + 1 == ans)
			{
				-- ans;
				record[++ size] = i;
			}
			else
				edge.cap[p] = 1;
		}
	for (int i = 1; i < size; ++ i)
		fout << record[i] << " ";
	fout << record[size] << endl;
}

int main()
{
	init();
	work();
}
