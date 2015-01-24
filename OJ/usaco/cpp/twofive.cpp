/*
ID:oifox20071
LANG:C++
PROG:twofive
*/
#include <iostream>
#include <fstream>
#include <cstring>
using namespace std;
ifstream fin("twofive.in");
ofstream fout("twofive.out");
const int limitsize = 5;
const int maxn = 25;
int way[limitsize + 1][limitsize + 1][limitsize + 1][limitsize + 1][limitsize + 1];
int maxc[limitsize], maxr[limitsize];
bool flag[maxn];
void update(int letter, int x, int y)
{
	memset(way, 0, sizeof(way));
	way[5][5][5][5][5] = 1;
	maxr[x] = maxc[y] = letter;
	flag[letter] = false;
}

int calc(int a, int b, int c, int d, int e, int next)
{
	int total = 0;
	if (way[a][b][c][d][e]) return way[a][b][c][d][e];
	if (!flag[next])
		return way[a][b][c][d][e] = calc(a, b, c, d, e, next + 1);
	if(a < 5 && next > maxr[0] && next > maxc[a]) total += calc(a + 1, b, c, d, e, next + 1);
	if(a > b && next > maxr[1] && next > maxc[b]) total += calc(a, b + 1, c, d, e, next + 1);
	if(b > c && next > maxr[2] && next > maxc[c]) total += calc(a, b, c + 1, d, e, next + 1);
	if(c > d && next > maxr[3] && next > maxc[d]) total += calc(a, b, c, d + 1, e, next + 1);
	if(d > e && next > maxr[4] && next > maxc[e]) total += calc(a, b, c, d, e + 1, next + 1);
	return way[a][b][c][d][e] = total;
}

void num_to_str(int n)
{
	int f[limitsize];
	int ans = 0;
	string s = "";
	memset(flag, true, sizeof(flag));
	for (int i = 0; i < limitsize; ++ i)
	{
		f[i] = 0;
		maxr[i] = maxc[i] = -1;
	}
	int i;
	for (int cur = 0; cur < maxn; ++ cur)
	{
		++ f[cur / 5];
		for (i = 0; i < maxn; ++ i)
			if (flag[i] && i > maxr[cur / 5] && i > maxc[cur % 5])
			{
				update(i, cur / 5, cur % 5);
				int temp = calc(f[0], f[1], f[2], f[3], f[4], 0);
				if (ans + temp >= n) break;
				ans += temp;
				flag[i] = true;
			}
		s += char(i + 'A');
	}
	fout << s << endl;
}

void str_to_num(string s)
{
	int f[limitsize];
	int ans = 1;
	memset(flag, true, sizeof(flag));
	for (int i = 0; i < limitsize; ++ i)
	{
		f[i] = 0;
		maxr[i] = maxc[i] = -1;
	}
	for (int cur = 0; cur < maxn; ++ cur)
	{
		++ f[cur / 5];
		for (int i = 0; i < int(s[cur] - 'A'); ++ i)
			if (flag[i] && i > maxr[cur / 5] && i > maxc[cur % 5])
			{
				update(i, cur / 5, cur % 5);
				ans += calc(f[0], f[1], f[2], f[3], f[4], 0);
				flag[i] = true;
			}
		flag[int(s[cur] - 'A')] = false;
		maxr[cur / 5] = maxc[cur % 5] = int(s[cur] - 'A');
	}
	fout << ans << endl;
}

int main()
{
	char mode;
	fin >> mode;
	if (mode == 'N')
	{
		int n;
		fin >> n;
		num_to_str(n);
	}
	else
	{
		string s;
		fin >> s;
		str_to_num(s);
	}
	return 0;
}
