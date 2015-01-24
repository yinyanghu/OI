/*
ID:oifox20071
LANG:C++
PROG:frameup
*/
#include <iostream>
#include <fstream>
#include <cstring>
using namespace std;
ifstream fin("frameup.in");
ofstream fout("frameup.out");
const int limitsize = 30;
const int infinity = 10000000;
int map[limitsize][limitsize];
int n, m;
struct node
{
	int x, y;
} s[27], t[27];
bool flag[27][27];
int r[27];
string ans = "";
int change(char ch)
{
	return (ch >= 'A' && ch <= 'Z') ? int(ch - 'A') : 26;
}
void init()
{
	char ch;
	fin >> n >> m;
	for (int i = 0; i < n; ++ i)
		for (int j = 0; j < m; ++ j)
		{
			fin >> ch;
			map[i][j] = change(ch);
		}
}

void dfs()
{
	int k = infinity;
	for (int i = 0; i < 26; ++ i)
		k = min(k, r[i]);
	if (k == infinity)
	{
		fout << ans << endl;
		return;
	}
	for (int i = 0; i < 26; ++ i)
		if (r[i] == k)
		{
			ans += char(i + 'A');
			for (int j = 0; j < 26; ++ j)
				if (i != j && flag[i][j]) -- r[j];
			r[i] = infinity;
			dfs();
			r[i] = k;
			for (int j = 0; j < 26; ++ j)
				if (i != j && flag[i][j]) ++ r[j];
			ans.erase(ans.size() - 1, 1);
		}
}

void work()
{
	for (int i = 0; i < 26; ++ i)
	{
		r[i] = s[i].x = s[i].y = infinity;
		t[i].x = t[i].y = 0;
	}
	memset(flag, false, sizeof(flag));
	for (int i = 0; i < n; ++ i)
		for (int j = 0; j < m; ++ j)
		{
			r[map[i][j]] = 0;
			s[map[i][j]].x = min(s[map[i][j]].x, i);
			s[map[i][j]].y = min(s[map[i][j]].y, j);
			t[map[i][j]].x = max(t[map[i][j]].x, i);
			t[map[i][j]].y = max(t[map[i][j]].y, j);
		}
	for (int i = 0; i < 26; ++ i)
	{
		for (int j = s[i].y; j <= t[i].y; ++ j)
			flag[i][map[s[i].x][j]] = flag[i][map[t[i].x][j]] = true;
		for (int j = s[i].x; j <= t[i].x; ++ j)
			flag[i][map[j][s[i].y]] = flag[i][map[j][t[i].y]] = true;
	}
	for (int i = 0; i < 26; ++ i)
		for (int j = 0; j < 26; ++ j)
			if (i != j && flag[j][i])
				++ r[i];
	dfs();
}

int main()
{
	init();
	work();
	return 0;
}
