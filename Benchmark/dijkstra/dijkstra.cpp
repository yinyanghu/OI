#include <iostream>
#include <windows.h>
using namespace std;
const int maxn = 1000000;
const int maxedge = 10000000;
const int maxheap = maxn * 100;
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

struct node
{
	int key, x;
};

struct heapnode
{
	int size;
	node heap[maxheap];
	void clear()
	{
		size = 0;
	}
	void swap(node &a, node &b)
	{
		node temp = a; a = b; b = temp;
	}
	void push(const node &x)
	{
		heap[++ size] = x;
		for (int k = size; k > 1; k = k >> 1)
		{
			if (heap[k >> 1].key <= heap[k].key) break;
			swap(heap[k >> 1], heap[k]);
		}
	}
	node build(const int x, const int key)
	{
		node temp;
		temp.x = x; temp.key = key;
		return temp;
	}
	node pop()
	{
		node ans = heap[1];
		swap(heap[1], heap[size]);
		-- size;
		for (int i = 1, j; (i << 1) <= size; i = j)
		{
			j = i << 1;
			if (j < size && (heap[j + 1].key < heap[j].key)) ++ j;
			if (heap[j].key >= heap[i].key) break;
			swap(heap[i], heap[j]);
		}
		return ans;
	}
} heap;

int n, f[maxn], source;

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
	scanf("%d", &source);
}

void dijkstra()
{
	bool flag[maxn];
	heap.clear();
	for (int i = 0; i < n; ++ i)
	{
		flag[i] = true;
		f[i] = infinity;
	}
	f[source] = 0;
	heap.push(heap.build(source, 0));
	for (int i = 0; i < n - 1; ++ i)
	{
		int k;
		while (heap.size != 0)
		{
			k = heap.pop().x;
			if (flag[k]) break;
		}
		if (flag[k])
		{
			flag[k] = false;
			for (int t = edge.start[k]; t >= 0; t = edge.next[t])
				if (flag[edge.v[t]] && (f[k] + edge.key[t] < f[edge.v[t]]))
				{
					f[edge.v[t]] = f[k] + edge.key[t];
					heap.push(heap.build(edge.v[t], f[edge.v[t]]));
				}
		}
		if (heap.size == 0) break;
	}
}

int main()
{
	freopen("in.txt", "r", stdin);
	//freopen("out.txt", "w", stdout);	
	init();
	DWORD time = GetTickCount();
	dijkstra();
	printf("%d\n", GetTickCount() - time);
	//for (int i = 0; i < n; ++ i)
	//	printf("%d\n", f[i]);
	return 0;
}
