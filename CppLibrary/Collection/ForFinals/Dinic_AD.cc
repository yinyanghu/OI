///////////////// Dinic.cc 求最大流

const	int		limitSize	= 2 * 400 + 10;
const	int		limitEdge	= 2 * 40000 + 10;
const	int		infinity	= 123456789;

struct			Tedge {
	int		a , b , remain , inv , next;
};

int			n , src , dst;
Tedge			edge	[limitEdge];
int			edgeCnt;

int			start	[limitSize];
int			use	[limitSize];	// 边表指针
int			dist	[limitSize];	// 距离标号

int			head , tail , queue[limitSize];

void	addEdge(int a , int b , int r) {
	int	p = edgeCnt ++;
	int	q = edgeCnt ++;

	edge[p].a = a; edge[p].b = b; edge[p].remain = r; edge[p].inv = q;
	edge[p].next = start[a]; start[a] = p;

	edge[q].a = b; edge[q].b = a; edge[q].remain = 0; edge[q].inv = p;
	edge[q].next = start[b]; start[b] = q;
}

bool	markLevel() {
	memset(dist , 0xff , sizeof(dist));
	dist[dst] = 0;
	queue[head = tail = 0] = dst;

	int	u;
	while (head <= tail) {
		u = queue[head ++];
		use[u] = start[u];
		for (int i = start[u]; i >= 0; i = edge[i].next)
			if (edge[ edge[i].inv ].remain > 0) {
				int	v = edge[i].b;
				if (dist[v] < 0) {
					dist[v] = dist[u] + 1;
					queue[ ++ tail ] = v;
				}
			}
	}
	return	dist[ src ] >= 0;
}

inline	int	min(int a , int b){ return a < b ? a : b; }

int	extendPath(int u , int delta) {
	if (u == dst) return delta;
	for (int& i = use[u]; i >= 0; i = edge[i].next) {	// 注意这里是引用!!
		if (edge[i].remain > 0 && dist[ edge[i].b ] + 1 == dist[u]) {
			int	d = extendPath( edge[i].b , min(delta , edge[i].remain) );
			if (d > 0) {
				edge[i].remain -= d; edge[ edge[i].inv ].remain += d;
				return	d;
			}
		}
	}
	return 0;
}

int	maxFlow() {
	int	ret = 0;
	int	delta;
	while ( markLevel() ) {
		while ( (delta = extendPath(src , infinity)) > 0 )
			ret += delta;
	}
	return	ret;
}

init() :	edgeCnt = 0; memset(start , 0xff , sizeof(start));