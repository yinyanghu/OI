/*
ID:oifox20071
LANG:C++
PROG:cowtour
*/
#include <iostream>
#include <math.h>
using namespace std;
const int maxn = 150;
const double infinity = 1e8;
struct node
{
	int x, y;
};
node pasture[maxn];
double dist[maxn][maxn], longest[maxn], f[maxn];
int n;
double getdist(int p, int q)
{
	return sqrt((pasture[p].x - pasture[q].x) * (pasture[p].x - pasture[q].x) + (pasture[p].y - pasture[q].y) * (pasture[p].y - pasture[q].y));
}

void floyd()
{
	for (int k = 0; k < n; ++ k)
		for (int i = 0; i < n; ++ i)
			for (int j = 0; j < n; ++ j)
				if (dist[i][k] + dist[k][j] < dist[i][j])
					dist[i][j] = dist[i][k] + dist[k][j];
}
int main()
{
	freopen("cowtour.in", "r", stdin); freopen("cowtour.out", "w", stdout);
	cin >> n;
	for (int i = 0; i < n; ++ i)
		cin >> pasture[i].x >> pasture[i].y;
	char ch;
	for (int i = 0; i < n; ++ i)
		for (int j = 0; j < n; ++ j)
		{
			cin >> ch;
			if (i == j) dist[i][j] = 0;
				else if (ch == '1') dist[i][j] = getdist(i, j);
					else dist[i][j] = infinity;
		}
	floyd();
	for (int i = 0; i < n; ++ i)
	{
		longest[i] = 0;
		for (int j = 0; j < n; ++ j)
			if (dist[i][j] < infinity && dist[i][j] > longest[i])
				longest[i] = dist[i][j];
	}
	for (int i = 0; i < n; ++ i)
	{
		f[i] = 0;
		for (int j = 0; j < n; ++ j)
			if (dist[i][j] < infinity && longest[j] > f[i])
				f[i] = longest[j];
	}
	double ans = infinity;
	for (int i = 0; i < n; ++ i)
		for (int j = 0; j < n; ++ j)
			if (dist[i][j] == infinity)
			{
				double temp = longest[i] + longest[j] + getdist(i, j);
				if (f[i] > temp) temp = f[i];
				if (f[j] > temp) temp = f[j];
				if (temp < ans) ans = temp;
			}
	printf("%.6f\n", ans);
	return 0;
}
// f --> diameter
