#include <iostream>
#include <cstdio>
#include <vector>
#include <cstdlib>

using namespace std;

const int maxn=110;
const int maxsize=8;

int n;
int a[maxn], b[maxn], c[maxn];
int ans;

void split(int x, vector<int> &a) {
	int i=0;
	while (x!=0) {
		if ((x&1)!=0)
			a.push_back(i);
		i++;
		x=(x>>1);
	}
}

int calc_fermet(int *cnt) {
	for (int i=maxsize-1; i>=0; i--)
		if (cnt[i]>=2) {
			int cnt2[maxsize];
			cnt[i]--;
			memcpy(cnt2,cnt,sizeof(cnt)*maxsize);
			cnt2[i]--;
			for (int j=i-1;j>=0; j--)
				cnt2[j]++;
			return calc_fermet(cnt)^calc_fermet(cnt2);
		}
	int ans=1;
	for (int i=maxsize-1; i>=0; i--)
		if (cnt[i]==1)
			ans*=(1<<(1<<i));
	return ans;
}

int calc_2power(int x, int y) {
	if ((x==0)||(y==0))
		return (1<<(x+y));
	vector<int> a, b;
	split(x,a);
	split(y,b);
	int cnt[maxsize];
	memset(cnt,0,sizeof(cnt));
	for (int i=0; i<a.size(); i++)
		cnt[a[i]]++;
	for (int j=0; j<b.size(); j++)
		cnt[b[j]]++;
	return calc_fermet(cnt);
}

int calc(int x, int y) {
	vector<int> a, b;
	a.clear();
	b.clear();
	split(x,a);
	split(y,b);
	int ans=0;
	for (int i=0; i<a.size(); i++)
		for (int j=0; j<b.size(); j++)
			ans^=calc_2power(a[i],b[j]);
	return ans;
}

int main() {
	cout<<calc(256, 256);
	return 0;
}

