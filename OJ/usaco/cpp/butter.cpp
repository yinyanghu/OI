/*
ID:oifox20071
LANG:C++
PROG:butter
*/
#include <iostream>
#include <fstream>
#include <cstring>
#include <queue>
#include <algorithm>
using namespace std;
ifstream fin("butter.in");
ofstream fout("butter.out");
const int maxedge = 2900;
const int maxn = 500;
const int maxp = 800;
const int infinity = 1000000000;
struct edgenode
{
	int v[maxedge], next[maxedge], key[maxedge], start[maxp];
	int num;
	void insert(int x, int y, int len)
	{
		++ num;
		v[num] = y;
		key[num] = len;
		next[num] = start[x];
		start[x] = num;
	}
	void initial()
	{
		num = -1;
		memset(start, -1, sizeof(start));
	}
} edge;
struct cownode
{
	int x, dist[maxp];
} cow[maxn];

struct heapnode
{
	int key, num;
	bool operator()(const heapnode &a, const heapnode &b)
	{
		return a.key > b.key;
	}
};

int p, n;

void init()
{
	int c, x, y, len;
	fin >> n >> p >> c;
	for (int i = 0; i < n; ++ i)
	{
		fin >> cow[i].x;
		-- cow[i].x;
	}
	edge.initial();
	for (int i = 0; i < c; ++ i)
	{
		fin >> x >> y >> len;
		edge.insert(x - 1, y - 1, len);
		edge.insert(y - 1, x - 1, len);
	}
}

void dijkstra(cownode &cur)
{
	priority_queue<heapnode, vector<heapnode>, heapnode> heap;
	bool flag[maxp];
	for (int i = 0; i < p; ++ i)
	{
		flag[i] = true;
		cur.dist[i] = infinity;
	}
	cur.dist[cur.x] = 0;
	heapnode temp;
	temp.key = 0; temp.num = cur.x;
	heap.push(temp);
	int k;
	for (int i = 0; i < p - 1; ++ i)
	{
		while (!heap.empty())
		{
			k = heap.top().num;
			heap.pop();
			if (flag[k]) break;
		}
		if (flag[k])
		{
			flag[k] = false;
			for (int t = edge.start[k]; t >= 0; t = edge.next[t])
				if (flag[edge.v[t]] && (cur.dist[k] + edge.key[t] < cur.dist[edge.v[t]]))
				{
					cur.dist[edge.v[t]] = cur.dist[k] + edge.key[t];
					temp.key = cur.dist[edge.v[t]];
					temp.num = edge.v[t];
					heap.push(temp);
				}
		}
		if (heap.empty()) break;
	}
}

int main()
{
	init();
	for (int i = 0; i < n; ++ i)
		dijkstra(cow[i]);
	int ans = infinity;
	for (int i = 0; i < p; ++ i)
	{
		int sum = 0;
		for (int j = 0; j < n; ++ j)
			sum += cow[j].dist[i];
		ans = min(ans, sum);
	}
	fout << ans << endl;
	return 0;
}
