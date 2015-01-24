/*
ID:oifox20071
LANG:C++
PROG:fence3
*/
#include <iostream>
#include <fstream>
#include <cmath>
using namespace std;
ifstream fin("fence3.in");
ofstream fout("fence3.out");
const int maxn = 150;
struct pointnode
{
	double x, y;
	pointnode(){}
	pointnode(double x0, double y0) : x(x0), y(y0) {}
	double len() const
	{
		return sqrt(x * x + y * y);
	}
};

pointnode operator - (const pointnode &a, const pointnode &b)
{
	return pointnode(a.x - b.x, a.y - b.y);
}

struct linenode
{
	pointnode a, b;
} line[maxn];
int n;
pointnode best, cur;
double ans = 100000000;
void init()
{
	fin >> n;
	for (int i = 0; i < n; ++ i)
		fin >> line[i].a.x >> line[i].a.y >> line[i].b.x >> line[i].b.y;
}

double crossproduct(const pointnode &a, const pointnode &b)
{
	return (a.x * b.y - a.y * b.x);
}

pointnode vertical(const pointnode &t)
{
	return pointnode(t.y, -t.x);
}

double dist(const linenode &l, const pointnode &p)
{
	pointnode a = p - l.a, b = p - l.b, c = vertical(l.a - l.b);
	double k = (crossproduct(a, c) * crossproduct(b, c) < 0) ? abs(crossproduct(a, b)) / (a - b).len() : 100000000;
	k = min(k, a.len());
	k = min(k, b.len());
	return k;
}

double calc()
{
	double k = 0;
	for (int i = 0; i < n; ++ i)
		k += dist(line[i], cur);
	return k;
}

void work()
{
	for (cur.x = 0; cur.x <= 100; cur.x += 5)
		for (cur.y = 0; cur.y <= 100; cur.y += 5)
		{
			double dist = calc();
			if (dist < ans)
			{
				best = cur;
				ans = dist;
			}
		}
	for (cur.x = best.x - 5; cur.x <= best.x + 5; cur.x += 0.1)
		for (cur.y = best.y - 5; cur.y <= best.y + 5; cur.y += 0.1)
		{
			double dist = calc();
			if (dist < ans)
			{
				best = cur;
				ans = dist;
			}
			
		}
	fout.setf(ios::fixed);
	fout.precision(1);
	fout << best.x << " " << best.y << " " << ans << endl;
}

int main()
{
	init();
	work();
	return 0;
}
