/*
ID:oifox20071
LANG:C++
PROG:ditch
*/
#include <iostream>
#include <fstream>
#include <cstring>
using namespace std;
ifstream fin("ditch.in");
ofstream fout("ditch.out");
const int maxedge = 200 * 2 + 1;
const int maxn = 201;
const int infinity = 10000000;
const int maxqueue = 1000;
struct edgenode
{
	int v[maxedge], key[maxedge], next[maxedge], inv[maxedge], start[maxn];
	int size;
	void initialize()
	{
		size = 0;
		memset(start, -1, sizeof(start));
	}
	void insert(int x, int y, int k)
	{
		++ size;
		v[size] = y; key[size] = k; inv[size] = size + 1;
		next[size] = start[x];
		start[x] = size;
		++ size;
		v[size] = x; key[size] = 0; inv[size] = size - 1;
		next[size] = start[y];
		start[y] = size;
	}
} edge;

int n, source, sink;
int level[maxn], use[maxn];
int queue[maxqueue];
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
			if (edge.key[edge.inv[i]] > 0 && level[edge.v[i]] < 0)
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
		if (edge.key[i] > 0 && level[edge.v[i]] + 1 == level[x])
		{
			int d = extendpath(edge.v[i], min(delta, edge.key[i]));
			if (d > 0)
			{
				edge.key[i] -= d; edge.key[edge.inv[i]] += d;
				return d;
			}
		}
	return 0;
}

int netflow()
{
	source = 1; sink = n;
	int maxflow = 0, delta;
	while (marklevel())
		while ((delta = extendpath(source, infinity)) > 0)
			maxflow += delta;
	return maxflow;
}

void init()
{
	int m, x, y, k;
	fin >> m >> n;
	edge.initialize();
	for (int i = 0; i < m; ++ i)
	{
		fin >> x >> y >> k;
		edge.insert(x, y, k);
	}
}

int main()
{
	init();
	fout << netflow() << endl;
}
