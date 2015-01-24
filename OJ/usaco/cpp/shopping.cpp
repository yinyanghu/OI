/*
ID:oifox20071
LANG:C++
PROG:shopping
*/
#include <iostream>
#include <fstream>
using namespace std;
const int maxn = 5;
const int maxs = 99;
ifstream fin("shopping.in");
ofstream fout("shopping.out");
int s, cheap[maxs][maxn], map[maxn],total = -1, lowprice[maxs];
int f[maxn + 1][maxn + 1][maxn + 1][maxn + 1][maxn + 1];
struct node
{
	int price, need;
} goods[maxn];
int hash(int x)
{
	for (int i = 0; i <= total; ++ i)
		if (x == map[i]) return i;
	map[++ total] = x;
	return total;
}
void init()
{
	fin >> s;
	for (int i = 0; i < s; ++ i)
	{
		int n;
		fin >> n;
		for (int j = 0; j < n; ++ j)
		{
			int c, k;
			fin >> c >> k;
			cheap[i][hash(c)] = k;
		}
		fin >> lowprice[i];
	}
	int b;
	fin >> b;
	for (int i = 0; i < b; ++ i)
	{
		int c;
		fin >> c;
		int x = hash(c);
		fin >> goods[x].need >> goods[x].price;
		lowprice[s] = goods[x].price;
		cheap[s][x] = 1;
		++ s;
	}
}

void dp()
{
	for (int i1 = 0; i1 <= goods[0].need; ++ i1)
		for (int i2 = 0; i2 <= goods[1].need; ++ i2)
			for (int i3 = 0; i3 <= goods[2].need; ++ i3)
				for (int i4 = 0; i4 <= goods[3].need; ++ i4)
					for (int i5 = 0; i5 <= goods[4].need; ++ i5)
					{
						f[i1][i2][i3][i4][i5] = i1 * goods[0].price + i2 * goods[1].price + i3 * goods[2].price + i4 * goods[3].price + i5 * goods[4].price;
						for (int i = 0; i < s; ++ i)
							if (i1 - cheap[i][0] >= 0 && i2 - cheap[i][1] >= 0 && i3 - cheap[i][2] >= 0 && i4 - cheap[i][3] >= 0 && i5 - cheap[i][4] >= 0)
								f[i1][i2][i3][i4][i5] = min(f[i1][i2][i3][i4][i5], f[i1 - cheap[i][0]][i2 - cheap[i][1]][i3 - cheap[i][2]][i4 - cheap[i][3]][i5 - cheap[i][4]] + lowprice[i]);
					}
	fout << f[goods[0].need][goods[1].need][goods[2].need][goods[3].need][goods[4].need] << endl;
}
int main()
{
	init();
	dp();
	return 0;
}
