#include <cstdio>
#include <cstring>
using namespace std;

const int maxn=130;
int s[maxn][maxn][maxn];
int N;

inline int lowbit(int x){
	return x&(x^(x-1));
}
void change(int a,int b,int c,int delta){
	for(int x=a;x<=N;x+=lowbit(x))
		for(int y=b;y<=N;y+=lowbit(y))
			for(int z=c;z<=N;z+=lowbit(z))
				s[x][y][z]+=delta;
}
int sum(int a,int b,int c){
	int res=0;
	for(int x=a;x>0;x-=lowbit(x))
		for(int y=b;y>0;y-=lowbit(y))
			for(int z=c;z>0;z-=lowbit(z))
				res+=s[x][y][z];
	return res;
}
int main(){
	memset(s,0,sizeof(s));
	scanf("%d",&N);
	for(;;){
		int a;
		scanf("%d",&a);
		if(a==1){
			int x,y,z,k;
			scanf("%d%d%d%d",&x,&y,&z,&k);
			++x;++y;++z;
			change(x,y,z,k);
		}
		else if(a==2){
			int x1,y1,z1,x2,y2,z2;
			scanf("%d%d%d%d%d%d",&x1,&y1,&z1,&x2,&y2,&z2);
			++x2;++y2;++z2;
			printf("%d\n",
				sum(x2,y2,z2)
				-(sum(x1,y2,z2)+sum(x2,y1,z2)+sum(x2,y2,z1))
				+(sum(x1,y1,z2)+sum(x1,y2,z1)+sum(x2,y1,z1))
				-sum(x1,y1,z1)
			);
		}
		else
			break;
	}
}
