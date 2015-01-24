#include<stdio.h>
#include<string.h>
const long maxn=10;
long num[maxn];
long low[maxn];
long color[maxn];
long graph[maxn][maxn];
bool cut[maxn];
bool bridge[maxn][maxn];
long now;
long n;
long cutnum;
long bridgenum;
long father[maxn];
long child[maxn];
void dfs(int);
int main()
{
    int i, j;
    FILE *in=fopen( "in.txt", "r");
    FILE *out=fopen( "out.txt", "w");
    fscanf( in, "%d", &n);
    for ( i=1; i<=n; i++)
        for ( j=1; j<=n; j++)
            fscanf( in, "%d", &graph[i][j]);
     
    for ( i=1; i<=n; i++)
        if (color[i]==0)
        {
            father[i]=0;
            dfs(i);
        }
    fprintf( out, "共有%d个割点:\n", cutnum);
    for ( i=1; i<=n; i++)
        if (cut[i])
            fprintf( out, "%d ", i);
    fprintf( out, "\n");
    fprintf( out, "共有%d个桥:\n", bridgenum);
    for ( i=1; i<=n; i++)
        for ( j=1; j<i; j++)
            if (bridge[i][j])
                fprintf( out, "(%d,%d) ",i,j);
    fclose(in);
    fclose(out);
}
void dfs(int i)
{
    int q;
    bool flag=false;
    now++;
    num[i]=now;
    low[i]=now;
    color[i]=-1;
    for ( q=1; q<=n; q++)
        if (graph[i][q]==1)
        {
            if (color[q]==0)
            {
                father[q]=i;
                dfs(q);
                child[i]++;
                if (low[q]>=num[i]) flag=true;
            }
            if ((low[q]<low[i])&&(q!=father[i])) low[i]=low[q];
            if (low[q]>num[i])
            {
                bridge[q][i]=true;
                bridge[i][q]=true;
                bridgenum++;
            }
        }
    color[i]=1;
    if ((father[i]==0)&&(child[i]>=2)||(father[i]!=0)&&(flag))
    {
        cut[i]=true;
        cutnum++;
    }
}
