#include <iostream.h>
#include <stdlib.h>


const int maxn=15000;

struct TStar
{
  int x, y;
  int operator < (const TStar &s) const { return x<s.x || (x==s.x && y<s.y); }
  void input() { cin>>x>>y; }
};

TStar stars[maxn],ts[maxn];
int  counts[maxn]={0};
int  stats[maxn]={0};

int sortf( const void *a, const void *b)
{
  const TStar &sa=*(const TStar *)a;
  const TStar &sb=*(const TStar *)b;
  return sa<sb ? -1 : sb<sa ? 1 : 0;
}

int main()
{
  int n; cin>>n;
  int i;
  for(i=0;i<n;i++) 
  {
      stars[i].input();
      ts[i]=stars[i];
  }

  qsort((void *)stars, n, sizeof(stars[0]), sortf);

  for(i=0;i<n;i++)
  {
    TStar s;
    s=ts[i];
    int l=0, r=n-1, c=0;
    while(l!=r)
    {
      int o=(l+r)/2;
      if(stars[o]<s) { c+=counts[o]; l=o+1; }
      else { counts[o]++; r=o; }
    }
    stats[c]++;
  }
  for(i=0;i<n;i++)
    cout<<stats[i]<<endl;
  return 0;
}

