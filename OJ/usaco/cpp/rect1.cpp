/*
ID:oifox20071
LANG:C++
PROG:rect1
*/
#include <iostream>
#include <fstream>
#include <cstring>
using namespace std;
const int maxn = 1001;
const int limitcolor = 2501;
struct rectangle
{
	int lx, ly, rx, ry, color;
} rect[maxn];
int n, maxcolor = 1, ans[limitcolor];
ifstream fin("rect1.in");
ofstream fout("rect1.out");
void init()
{
	int a, b;
	fin >> a >> b >> n;
	rect[0].lx = 0; rect[0].ly = 0; rect[0].rx = a; rect[0].ry = b; rect[0].color = 1;
	for (int i = 1; i <= n; ++ i)
	{
		fin >> rect[i].lx >> rect[i].ly >> rect[i].rx >> rect[i].ry >> rect[i].color;
		if (rect[i].color > maxcolor)
			maxcolor = rect[i].color;
	}
}

void cover(rectangle cur, int floor)
{
	while (floor <= n && (rect[floor].lx >= cur.rx || rect[floor].rx <= cur.lx || rect[floor].ly >= cur.ry || rect[floor].ry <= cur.ly))
		++ floor;
	if (floor > n)
	{
		ans[cur.color] += ((cur.rx - cur.lx) * (cur.ry - cur.ly));
		return;
	}
	if (rect[floor].lx > cur.lx)
	{
		rectangle temp = cur;
		temp.rx = rect[floor].lx;
		cover(temp, floor + 1);
		cur.lx = rect[floor].lx;
	}
	if (rect[floor].rx < cur.rx)
	{
		rectangle temp = cur;
		temp.lx = rect[floor].rx;
		cover(temp, floor + 1);
		cur.rx = rect[floor].rx;
	}
	if (rect[floor].ly > cur.ly)
	{
		rectangle temp = cur;
		temp.ry = rect[floor].ly;
		cover(temp, floor + 1);
	}
	if (rect[floor].ry < cur.ry)
	{
		rectangle temp = cur;
		temp.ly = rect[floor].ry;
		cover(temp, floor + 1);
	}
}

int main()
{
	init();
	memset(ans, 0, sizeof(ans));
	for (int i = 0; i <= n; ++ i)
		cover(rect[i], i + 1);
	for (int i = 1; i <= maxcolor; ++ i)
		if (ans[i] > 0)
			fout << i << " " << ans[i] << endl;
	return 0;
}
