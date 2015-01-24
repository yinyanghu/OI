/*
ID:oifox20071
LANG:C++
PROG:starry
*/
#include <iostream>
#include <fstream>
#include <cstring>
using namespace std;
ifstream fin("starry.in");
ofstream fout("starry.out");
const int dx[8] = {0, 1, 1, 1, 0, -1, -1, -1};
const int dy[8] = {1, 1, 0, -1, -1, -1, 0, 1};
const int maxn = 100;
struct node
{
	int w, h, total;
	char map[maxn][maxn];
};
char a[maxn][maxn];
node record[26];
int h, w, x1, x2, y1, y2, cur = 0;

void init()
{
	fin >> w >> h;
	for (int i = 0; i < h; ++ i)
		for (int j = 0; j < w; ++ j)
			fin >> a[i][j];
}

void floodfill(int x, int y, char ch)
{
	a[x][y] = ch;
	x1 = min(x, x1); x2 = max(x, x2);
	y1 = min(y, y1); y2 = max(y, y2);
	for (int i = 0; i < 8; ++ i)
	{
		int xx = x + dx[i], yy = y + dy[i];
		if (xx >= 0 && xx < h && yy >= 0 && yy < w && a[xx][yy] != ch && a[xx][yy] != '0')
			floodfill(xx, yy, ch);
	}
}

int check(node &p)
{
	for (int k = 0; k < cur; ++ k)
		if (record[k].total == p.total && record[k].w * record[k].h == p.w * p.h)
		{	
			for (int l = 0; l < 4; ++ l)
			{
				node temp = p;
				p.w = temp.h; p.h = temp.w;
				for (int i = 0; i < temp.h; ++ i)
					for (int j = 0; j < temp.w; ++ j)
						p.map[j][p.w - i - 1] = temp.map[i][j];
				bool flag = record[k].w == p.w && record[k].h == p.h;
				if (flag)
				{
					for (int i = 0; i < p.h; ++ i)
						for (int j = 0; j < p.w; ++ j)
							if (record[k].map[i][j] != p.map[i][j])
							{
								flag = false;
								break;
							}
					if (flag) return k;
				}

				flag = record[k].w == p.w && record[k].h == p.h;
				if (flag)
				{
					for (int i = 0; i < p.h; ++ i)
						for (int j = 0; j < p.w; ++ j)
							if (record[k].map[i][j] != p.map[p.h - i - 1][j])
							{
								flag = false;
								break;
							}
					if (flag) return k;
				}
			}
		}
	return -1;
}

void work()
{
	for (int i = 0; i < h; ++ i)
		for (int j = 0; j < w; ++ j)
			if (a[i][j] == '1')
			{
				x1 = h - 1; x2 = 0; y1 = w - 1; y2 = 0;
				floodfill(i, j, '2');
				node temp;
				memset(temp.map, '0', sizeof(temp.map));
				temp.total = 0;
				for (int pi = x1; pi <= x2; ++ pi)
					for (int pj = y1; pj <= y2; ++ pj)
						if (a[pi][pj] == '2')
						{
							temp.map[pi - x1][pj - y1] = a[pi][pj];
							++ temp.total;
						}
				temp.h = x2 - x1 + 1; temp.w = y2 - y1 + 1;
				int w = check(temp);
				if (w == -1)
				{
					floodfill(i, j, char(cur + 'a'));
					record[cur ++] = temp; 
				}
				else
					floodfill(i, j, char(w + 'a'));
			}
}

void print()
{
	for (int i = 0; i < h; ++ i)
	{
		for (int j = 0; j < w; ++ j)
			fout << a[i][j];
		fout << endl;
	}		
}

int main()
{
	init();
	work();
	print();
	return 0;
}
