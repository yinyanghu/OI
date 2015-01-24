/*
ID:oifox20071
LANG:C++
PROG:milk4
*/
#include <iostream>
#include <fstream>
#include <cstring>
#include <algorithm>
using namespace std;
ifstream fin("milk4.in");
ofstream fout("milk4.out");
const int maxq = 20001;
const int maxn = 200;
int v[maxn], record[maxn];
bool f[maxq];
int n, q, limit;
void init()
{
	fin >> q >> n;
	for (int i = 0; i < n; ++ i)
		fin >> v[i];
	sort(v, v + n);
}

bool check()
{
	memset(f, false, sizeof(f));
	f[0] = true;
	for (int i = 1; i <= q / v[record[0]]; ++ i)
		f[i * v[record[0]]] = true;
	for (int i = 1; i < limit; ++ i)
		for (int j = v[record[i]]; j <= q; ++ j)
			f[j] |= f[j - v[record[i]]];
	return f[q];
}

bool dfs(int k, int last)
{
	if (k == limit)
		return check();
	for (int i = last; i + limit - k - 1< n; ++ i)
	{
		record[k] = i;
		if (dfs(k + 1, i + 1))
			return true;
	}
	return false;
}

void work()
{
	for (limit = 1; limit <= n; ++ limit)
		if (dfs(0, 0))
		{
			fout << limit;
			for (int i = 0; i < limit; ++ i)
				fout << " " << v[record[i]];
			fout << endl;
			return;
		}
}

int main()
{
	init();	
	work();
	return 0;
}
