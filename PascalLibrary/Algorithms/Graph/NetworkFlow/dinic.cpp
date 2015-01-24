#include <cstdio>
#include <cstring>

#include <queue>

using namespace std;

const int MAXV = 100000;
const int MAXE = 2000000 + 10;

struct edge {
    int u, v, r, mate;
    int next;
};

int n, m, source, sink;
int ep;
int start[ MAXV ];
edge e[ MAXE ];
int dist[ MAXV ];
int useable[ MAXV ];

void add_edge( int u, int v, int r )
{
    e[ep].u = u; e[ep].v = v; e[ep].r = r; e[ep].mate = ep + 1;
    e[ep].next = start[u]; start[u] = ep++;

    e[ep].u = v; e[ep].v = u; e[ep].r = 0; e[ep].mate = ep - 1;
    e[ep].next = start[v]; start[v] = ep++;
}

bool new_phase()
{
    queue< int > q;

//  compute the exact distance labels dist( i )

    memset( dist, -1, sizeof dist );

    dist[sink] = 0;
    useable[sink] = start[sink];
    q.push( sink );

    while( !q.empty() ) {
        int x = q.front(); q.pop();

        for( int i = start[x]; i >= 0; i = e[i].next )
            if( e[ e[i].mate ].r > 0 ) { // this is a dummy edge!!!
                int y = e[i].v;

                if( dist[y] < 0 ) {
                    dist[y] = dist[x] + 1;
                    useable[y] = start[y];
                    q.push( y );
                }
            }
    }

    return dist[source] >= 0;
}

int find_augmentation_path( int x, int delta )
{
    if( x == sink ) return delta;

    for( int &i = useable[x]; i >= 0; i = e[i].next ) {
        int y = e[i].v;

        if( e[i].r > 0 && dist[x] == dist[y] + 1 ) {
            int d = find_augmentation_path( y, delta <? e[i].r );
            if( d > 0 ) {
                e[i].r -= d; e[ e[i].mate ].r += d;
                return d;
            }
        }
    }

    return 0;
}

int main( void )
{
    scanf( "%d%d", &m, &n );
    source = 1;
    sink = n;

    --source; --sink;

    memset( start, -1, sizeof start );
    for( int i = 0; i < m; ++i ) {
        int u, v, r; scanf( "%d%d%d", &u, &v, &r ); --u, --v;
        add_edge( u, v, r );
    }

    int maximum_flow = 0;

    while( new_phase() ) {
        int delta;

        while( ( delta = find_augmentation_path( source, 2000000000 ) ) > 0 )
            maximum_flow += delta;
    }

    printf( "%d\n", maximum_flow );

    return 0;
}
