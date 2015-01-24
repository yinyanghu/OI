/*
ID:oifox20071
LANG:C++
PROG:window
*/
#include <iostream>
#include <fstream>
#include <cstring>
using namespace std;
ifstream fin("window.in");
ofstream fout("window.out");
const int maxn = 62;
const int infinity = 100000000;
struct rectangle
{
	int pri, lx, ly, rx, ry;
} rect[maxn], rect_temp[maxn];
int low ,high, tot;
bool flag[maxn];
int ans;
int change(char c)
{
	if (c >= '0' && c <= '9') return int(c - '0');
	if (c >= 'a' && c <= 'z') return int(c - 'a') + 10;
	return int(c - 'A') + 36;
}

void creat(int cur, int x1, int y1, int x2, int y2)
{
	rect[cur].pri = ++ high;
	rect[cur].lx = x1; rect[cur].ly = y1; rect[cur].rx = x2; rect[cur].ry = y2;
	flag[cur] = true;
}

void top(int cur)
{
	rect[cur].pri = ++ high;
}

void bottom(int cur)
{
	rect[cur].pri = -- low;
}

void destory(int cur)
{
	flag[cur] = false;
}

void cover(rectangle cur, int floor)
{
	while (floor <= tot && (rect_temp[floor].lx >= cur.rx || rect_temp[floor].rx <= cur.lx || rect_temp[floor].ly >= cur.ry || rect_temp[floor].ry <= cur.ly))
		++ floor;
	if (floor > tot)
	{
		ans += ((cur.rx - cur.lx) * (cur.ry - cur.ly));
		return;
	}
	if (rect_temp[floor].lx > cur.lx)
	{
		rectangle temp = cur;
		temp.rx = rect_temp[floor].lx;
		cover(temp, floor + 1);
		cur.lx = rect_temp[floor].lx;
	}
	if (rect_temp[floor].rx < cur.rx)
	{
		rectangle temp = cur;
		temp.lx = rect_temp[floor].rx;
		cover(temp, floor + 1);
		cur.rx = rect_temp[floor].rx;
	}
	if (rect_temp[floor].ly > cur.ly)
	{
		rectangle temp = cur;
		temp.ry =rect_temp[floor].ly;
		cover(temp, floor + 1);
	}
	if (rect_temp[floor].ry < cur.ry)
	{
		rectangle temp = cur;
		temp.ly = rect_temp[floor].ry;
		cover(temp, floor + 1);
	}
}

double calc(int cur)
{
	int area = (rect[cur].rx - rect[cur].lx) * (rect[cur].ry - rect[cur].ly);
	if (rect[cur].pri == high)
		return 100.000;
	tot = -1;
	for (int i = 0; i < maxn; ++ i)
		if (flag[i] && i != cur && rect[i].pri > rect[cur].pri)
			rect_temp[++ tot] = rect[i];
	ans = 0;
	cover(rect[cur], 0);
	return (double(ans) / area) * 100;
}

int main()
{
	char ch, temp, x;
	int x1, x2, y1, y2;
	low = high = 0;
	memset(flag, false, sizeof(flag));
	fout.setf(ios::fixed);
	fout.precision(3);
	while (fin >> ch >> temp >> x >> temp)
	{
		if (ch == 'w')
		{
			fin >> x1 >> temp >> y1 >> temp >> x2 >> temp >> y2 >> temp;
			creat(change(x), min(x1, x2), min(y1, y2), max(x1, x2), max(y1, y2));
		}
		else if (ch == 't')
			top(change(x));
		else if (ch == 'b')
			bottom(change(x));
		else if (ch == 'd')
			destory(change(x));
		else if (ch == 's')
			fout << calc(change(x)) << endl;
	}
	return 0;
}
