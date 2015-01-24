/*
ID:oifox20071
LANG:C++
PROG:lgame
*/
#include <iostream>
#include <fstream>
#include <cstring>
#include <vector>
using namespace std;
ifstream fin("lgame.in");
ifstream pin("lgame.dict");
ofstream fout("lgame.out");
const int maxl = 7;
const int maxword = 40000;
const int value[28] = {2, 5, 4, 4, 1, 6, 5, 5, 1, 7, 6, 3, 5, 2, 3, 5, 7, 2, 1, 2, 4, 6, 6, 7, 5, 7};
int f[28], v[maxword];
string word[maxword];
vector< pair<int, int> > record;
string s;
int total = -1, ans = 0;
void init()
{
	fin >> s;
	memset(f, 0, sizeof(f));
	for (int i = 0; i < s.size(); ++ i)
		++ f[s[i] - 'a'];
	int temp[28];
	while (true)
	{
		pin >> word[++ total];
		if (word[total] == ".")
		{
			-- total;
			break;
		}
		bool flag = true;
		int p = 0;
		memset(temp, 0, sizeof(temp));
		for (int i = 0; i < word[total].size(); ++ i)
		{
			++ temp[word[total][i] - 'a'];
			p += value[word[total][i] - 'a'];
			if (temp[word[total][i] - 'a'] > f[word[total][i] - 'a'])
			{
				flag = false;
				-- total;
				break;
			}
		}
		if (flag)
			v[total] = p;
	}
}

bool check(int x, int *temp)
{
	for (int i = 0; i < word[x].size(); ++ i)
	{
		-- temp[word[x][i] - 'a'];
		if (temp[word[x][i] - 'a'] < 0) return false;
	}
	return true;
}

void work()
{
	int temp[28], temp2[28];
	for (int i = 0; i <= total; ++ i)
	{
		memcpy(temp, f, sizeof(f));
		for (int j = 0; j < word[i].size(); ++ j)
			-- temp[word[i][j] - 'a'];
		if (v[i] >= ans)
		{
			if (v[i] > ans)
			{
				ans = v[i];
				record.clear();
			}
			record.push_back(make_pair(i, -1));
		}
		for (int j = i; j <= total; ++ j)
		{
			memcpy(temp2, temp, sizeof(temp));
			if (check(j, temp2))
			{
				if (v[i] + v[j] >= ans)
				{
					if (v[i] + v[j] > ans)
					{
						ans = v[i] + v[j];
						record.clear();
					}
					record.push_back(make_pair(i, j));
				}
				
			}
		}
	}
}

void print()
{
	fout << ans << endl;
	for (vector< pair<int, int> >::iterator it = record.begin(); it != record.end(); ++ it)
	{
		fout << word[(*it).first];
		if ((*it).second != -1)
			fout << " " << word[(*it).second];
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
