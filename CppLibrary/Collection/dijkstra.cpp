#include <iostream>
#include <cstring>
using namespace std;
const int maxn = 1000000;
const int maxedge = 10000000;
const int maxheap = maxn + 1;
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
	int x, key;
};

struct heapnode
{
	int size, root;
	node heap[maxheap];
	int map[maxn];
	void clear()
	{
		size = 0; root = 1;
		memset(map, 0, sizeof(map));
	}
	
	void swap(node &a, node &b)
	{
		node temp = a; a = b; b = temp;
		int pos = map[a.x]; map[a.x] = map[b.x]; map[b.x] = pos;
	}
	
	void rise(const int x)
	{
		for (int i = x; i > 1; i = i >> 1)
		{
			if (heap[i >> 1].key <= heap[i].key) break;
			swap(heap[i >> 1], heap[i]);
		}		
	}
	
	void sink(const int x)
	{
		for (int i = x, j; (i << 1) <= size; i = j)
		{
			j = i << 1;
			if (j < size && (heap[j + 1].key < heap[j].key)) ++ j;
			if (heap[j].key >= heap[i].key) break;
			swap(heap[i], heap[j]);
		}
	}
	
	void insert(const int x, const int key)
	{
		heap[++ size].key = key;
		heap[size].x = x;
		map[x] = size;
		rise(size);
	}

	void decreasekey(const int x, const int key)
	{
		int pos = map[x];
		if (pos == 0 || heap[pos].key < key) return;
		heap[pos].key = key;
		rise(pos);
	}
	
	node minimum()
	{
		return heap[root];
	}
	void del(const int x)
	{
		int pos = map[x];
		if (pos == 0) return;
		map[pos] = 0;
		heap[pos] = heap[size];
		map[heap[size].x] = pos;
		--size;
		sink(pos);
	}
	void deletemin()
	{
		del(heap[root].x);
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
		heap.insert(i, infinity);
	}
	f[source] = 0;
	heap.decreasekey(source, 0);
	for (int i = 0; i < n - 1; ++ i)
	{
		int k = heap.minimum().x;
		flag[k] = false;
		heap.deletemin();
		for (int t = edge.start[k]; t >= 0; t = edge.next[t])
			if (flag[edge.v[t]] && (f[k] + edge.key[t] < f[edge.v[t]]))
			{
				f[edge.v[t]] = f[k] + edge.key[t];
				heap.decreasekey(edge.v[t], f[edge.v[t]]);
			}
		if (heap.size == 0) break;
	}
}

int main()
{
	return 0;
}
