/*
ID:oifox20071
LANG:C++
PROG:fence4
*/
#include <iostream>
#include <fstream>
using namespace std;
ifstream fin("fence4.in");
ofstream fout("fence4.out");
struct Tpoint
{
	int x, y;
	Tpoint(){}
	Tpoint(int x0, int y0) : x(x0), y(y0) {}
};

Tpoint operator - (const Tpoint &a, const Tpoint &b)
{
	return Tpoint(a.x - b.x, a.y - b.y);
}

bool operator != (const Tpoint &a, const Tpoint &b)
{
	return (a.x != b.x || a.y != b.y);
}

int crossproduct(const Tpoint &a, const Tpoint &b)
{
	return (a.x * b.y - a.y * b.x);
}

int across(const Tpoint &a, const Tpoint &b, const Tpoint &c, const Tpoint &d)
{
	int p = crossproduct(b - a, c - a) * crossproduct(b - a, d - a);
	int q = crossproduct(d - c, a - c) * crossproduct(d - c, b - c);
	if (p < 0 && q < 0) return 1;		//严格相交
	if (p > 0 || q > 0) return -1;		//不相交
	return 0;				//不严格相交 || 同一直线但不相交
}

const int maxn = 200;
Tpoint fence[maxn], observer;
int record[maxn];
int n;
void init()
{
	fin >> n;
	fin >> observer.x >> observer.y;
	for (int i = 0; i < n; ++ i)
		fin >> fence[i].x >> fence[i].y;
	fence[n] = fence[0];
}

bool valid()
{
	for (int i = 0; i < n - 1; ++ i)
		for (int j = i + 1; j < n; ++ j)
			if (across(fence[i], fence[i + 1], fence[j], fence[j + 1]) == 1) return false;
	return true;
}

bool check(Tpoint ob, Tpoint a, Tpoint b)
{
	if (crossproduct(a - ob, b - ob) == 0) return false;
	for (int i = 0; i < n; ++ i)
		if ((fence[i] != a) && across(ob, a, fence[i], fence[i + 1]) >= 0 && across(ob, b, fence[i], fence[i + 1]) >= 0) return false;
	Tpoint x, y;
	if (crossproduct(a - ob, b - ob) > 0)
	{
		Tpoint temp = a; a = b; b = temp;
	}
	x = a; y = b;
	for (int i = 1; i <= n; ++ i)
		if (crossproduct(b - a, fence[i] - a) < 0 && crossproduct(ob - b, fence[i] - b) < 0 && crossproduct(a - ob, fence[i] - ob) < 0)
		{
			if (crossproduct(fence[i - 1] - ob, fence[i] - ob) < 0 && crossproduct(x - ob, fence[i] - ob) < 0)
				x = fence[i];
			if (crossproduct(fence[i - 1] - ob, fence[i] - ob) > 0 && crossproduct(y - ob, fence[i] - ob) > 0)
				y = fence[i];
		}
	for (int i = n - 1; i >= 0; -- i)
		if (crossproduct(b - a, fence[i] - a) < 0 && crossproduct(ob - b, fence[i] - b) < 0 && crossproduct(a - ob, fence[i] - ob) < 0)
		{
			if (crossproduct(fence[i + 1] - ob, fence[i] - ob) < 0 && crossproduct(x - ob, fence[i] - ob) < 0)
				x = fence[i];
			if (crossproduct(fence[i + 1] - ob, fence[i] - ob) > 0 && crossproduct(y - ob, fence[i] - ob) > 0)
				y = fence[i];
		}
	return (crossproduct(x - ob, y - ob) < 0);
}

int main()
{
	init();
	if (!valid())
	{
		fout << "NOFENCE" << endl;
		return 0;
	}
	int ans = 0;
	for (int i = 0; i < n; ++ i)
		if (check(observer, fence[i], fence[i + 1]))
			record[++ ans] = i;
	if (record[ans] == n - 1 && record[ans - 1] == n - 2)
	{
		int k = record[ans]; record[ans] = record[ans - 1]; record[ans - 1] = k;
	}
	fout << ans << endl;
	for (int i = 1; i <= ans; ++ i)
		if (record[i] == n - 1)
			fout << fence[0].x << " " << fence[0].y << " " << fence[n - 1].x << " " << fence[n - 1].y << endl;
		else
			fout << fence[record[i]].x << " " << fence[record[i]].y << " " << fence[record[i] + 1].x << " " << fence[record[i] + 1].y << endl;
	return 0;
}
