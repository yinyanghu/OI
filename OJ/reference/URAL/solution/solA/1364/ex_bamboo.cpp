#include <cstdio>
#include <cstring>

const int Size = 100 + 10;

int dx[] = {0 , 1 , 0 , -1};
int dy[] = {1 , 0 , -1 , 0};

int n , m;
int x0 , Y0;
int px , py;
int L;

int G[Size][Size];
int path[Size * Size][2] , cnt;

inline int valid(int a , int b)
{
	return 1 <= a && a <= n && 1 <= b && b <= m && G[a][b] < 0;
}

void Solve()
{
	memset(G , 0xff , sizeof(G));
	cnt = 0;

	int x , y;
	int d = 0;
	x = 1; y = 1;

	while(1)
	{
		path[cnt][0] = x; path[cnt][1] = y;
		G[x][y] = cnt;
		cnt ++;

		if(x == x0 && y == Y0) break;

		while(! valid(x + dx[d] , y + dy[d])) d = (d + 1) % 4;
		x += dx[d]; y += dy[d];
	}

	int pos , p , r;
	int i;

	pos = G[px][py];
	p = pos - L; if(p < 0) p = 0;
	r = pos + L; if(r > cnt - 1) r = cnt - 1;

	for(i = p; i <= r; i++)
		printf("%d %d\n" , path[i][0] , path[i][1]);
}

int main()
{
	
	scanf("%d%d" , &n , &m);
	scanf("%d%d" , &x0 , &Y0);
	scanf("%d%d" , &px , &py);
	scanf("%d" , &L);

	Solve();

	return 0;
} 