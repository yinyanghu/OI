/*
ID:oifox20071
LANG:C++
PROG:picture
*/
#include <iostream>
#include <fstream>
#include <algorithm>
#include <cstring>
using namespace std;
ifstream fin("picture.in");
ofstream fout("picture.out");
const int maxn = 20000;
struct line
{
	int l, r, p;
	bool start;
} x[maxn], y[maxn];
int n;
void init()
{
	fin >> n;
	for (int i = 0; i < n; ++ i)
	{
		int x1, x2, y1, y2;
		fin >> x1 >> y1 >> x2 >> y2;
		x[i].l = x[i + n].l = x1 + 10000;
		x[i].r = x[i + n].r = x2 + 10000;
		x[i].p = y1 + 10000;
		x[i].start = true;
		x[i + n].p = y2 + 10000;
		x[i + n].start = false;
		
		y[i].l = y[i + n].l = y1 + 10000;
		y[i].r = y[i + n].r = y2 + 10000;
		y[i].p = x1 + 10000;
		y[i].start = true;
		y[i + n].p = x2 + 10000;
		y[i + n].start = false;
	}
	n <<= 1;
}

int compare(const void *a, const void *b)
{
	return ((line*) a)->p - ((line*) b)->p;
}

int calc(line *l)
{
	qsort(l, n, sizeof(line), compare);
	int level[maxn];
	memset(level, 0, sizeof(level));
	int ans = 0;
	for (int i = 0; i < n; ++ i)
		if (l[i].start)
		{
			for (int j = l[i].l; j < l[i].r; ++ j)
				if (++ level[j] == 1) ++ ans;
		}
		else
		{
			for (int j = l[i].l; j < l[i].r; ++ j)
				if (-- level[j] == 0) ++ ans;
		}
	return ans;
}

void work()
{
	int ans = calc(x) + calc(y);
	fout << ans << endl;
}

int main()
{
	init();
	work();
	return 0;
}
