#include <iostream>
#include <queue>
#include <algorithm>
using namespace std;
const int maxn = 1000000;
const int maxedge = 10000000;
const int infinity = 1000000000;
struct edgenode
{
	int v[maxedge], key[maxedge], next[maxedge], start[maxn];
	int num;
	void insert(int x, int y, int k)
	{
		++ num;
		v[num] = y;
		key[num] = k;
		next[num] = start[x];
		start[x] = num;
	}
	void clear()
	{
		num = -1;
		memset(start, -1, sizeof(start));
	}
} edge;

struct heapnode
{
	int key, x;
	bool operator()(const heapnode &a, const heapnode &b)
	{
		return a.key > b.key;
	}
};

heapnode build(const int x, const int key)
{
	heapnode temp;
	temp.x = x; temp.key = key;
	return temp;
}

int n, f[maxn];

void init()
{
	int m, x, y, key;
	scanf("%d%d", &n, &m);
	edge.clear();
	for (int i = 0; i < m; ++ i)
	{
		scanf("%d%d%d", &x, &y, &key);
		edge.insert(x, y, key);
	}
}

int prim()
{
	priority_queue<heapnode, vector<heapnode>, heapnode> heap;
	bool flag[maxn];
	for (int i = 0; i < n; ++ i)
	{
		flag[i] = true;
		f[i] = infinity;
	}
	f[0] = 0;
	int ans = 0;
	heap.push(build(0, 0));
	for (int i = 0; i < n; ++ i)
	{
		int k;
		while (!heap.empty())
		{
			k = heap.top().x;
			heap.pop();
			if (flag[k]) break;
		}
		if (flag[k])
		{
			flag[k] = false;
			ans += f[k];
			for (int t = edge.start[k]; t >= 0; t = edge.next[t])
				if (flag[edge.v[t]] && (edge.key[t] < f[edge.v[t]]))
				{
					f[edge.v[t]] = edge.key[t];
					heap.push(build(edge.v[t], f[edge.v[t]]));
				}
		}
		if (heap.empty()) break;
	}
	return ans;
}

int main()
{
	return 0;
}
