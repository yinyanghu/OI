#include <iostream>
#include <cstdio>
#include <cstdlib>
#include <vector>
#include <memory>

using namespace std;

const int maxn=50000;

int n, nn, nc, now;
vector<int> g[maxn], g2[maxn], g3[maxn];
int c[maxn], d[maxn], list[maxn], ans[maxn], low[maxn], dfn[maxn], op[maxn];
bool b[maxn];

int other(int x) {
    if (x>n) return x-n; else return x+n;
}

void newedge(vector<int> &g, int x, int y) {
    g.push_back(y);
}

void getinfo() {
    int m;
    scanf("%d%d",&n,&m);
    nn=n+n;
    for (int i=1; i<=nn; i++) {
        g[i].clear();
        g2[i].clear();
        g3[i].clear();
    }
    for (int i=1; i<=m; i++) {
        int x, y;
        scanf("%d%d",&x,&y);
        newedge(g[x],x,other(y));
        newedge(g[y],y,other(x));
    }
}

void draw(int x) {
    c[x]=nc;
    for (int i=0; i<g[x].size(); i++)
        if (c[g[x][i]]==0) 
            draw(g[x][i]);
}

void dfs(int x) {
    now++;
    b[x]=true;
    dfn[x]=now;
    low[x]=now;
    for (int i=0; i<g[x].size(); i++)
        if (b[g[x][i]]==false) {
            dfs(g[x][i]);
            if (low[g[x][i]]<low[x]) low[x]=low[g[x][i]];
        }
        else
            if ((c[g[x][i]]==0)&&(dfn[g[x][i]]<low[x]))
                low[x]=dfn[g[x][i]];
    if (low[x]==dfn[x]) {
        nc++;
        draw(x);
    }
}

void select(int x) {
    ans[x]=1;
    ans[op[x]]=-1;
    for (int i=0; i<g2[x].size(); i++)
        if (ans[g2[x][i]]==0) 
            select(g2[x][i]);
}

void no_ans() {
    printf("no solution!");
    exit(0);
}

void work() {
    memset(b,false,sizeof(b));
    memset(c,0,sizeof(c));
    nc=0; now=0;
    for (int i=1; i<=nn; i++) 
        if (!b[i])
            dfs(i);
    memset(op,0,sizeof(op));
    for (int i=1; i<=n; i++) {
        if (c[i]==c[n+i]) no_ans();
        op[c[i]]=c[n+i];
        op[c[n+i]]=c[i];
    }
    memset(d,0,sizeof(d));
    for (int i=1; i<=nn; i++)
        for (int j=0; j<g[i].size(); j++)
            if (c[g[i][j]]!=c[i]) {
                newedge(g2[c[i]],c[i],c[g[i][j]]);
                newedge(g3[c[g[i][j]]],c[g[i][j]],c[i]);
                d[c[i]]++;
            }
    int h,t;
    h=0; t=0;
    memset(ans,0,sizeof(ans));
    for (int i=1; i<=nc; i++)
        if (d[i]==0) {
            t++;
            list[t]=i;
        }
    while (h!=t) {
        h++;
        int x=list[h];
        if (ans[x]==0) 
            select(x);
        for (int i=0; i<g3[i].size(); i++) {
            d[g3[x][i]]--;
            if (d[g3[x][i]]==0) {
                t++;
                list[t]=g3[x][i];
            }
        }  
    }
}

void out() {
    for (int i=1; i<=nn; i++)
        if (ans[c[i]]==1) printf("%d ",i);
    printf("\n");
}
        
int main() {
    
    freopen("input.txt","r",stdin);
    freopen("output.txt","w",stdout);
    
    getinfo();
    work();
    out();
    
    return 0;
}
