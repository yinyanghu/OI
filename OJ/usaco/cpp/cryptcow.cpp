/*
ID:oifox20071
LANG:C++
PROG:cryptcow
*/
#include <iostream>
#include <fstream>
#include <cstring>
using namespace std;
ifstream fin("cryptcow.in");
ofstream fout("cryptcow.out");
const string goal = "Begin the Escape execution at the Break of Dawn";
const int prime = 99991;
const int limitsize = 80;
string password = "";
bool flag[prime];
bool lengthcheck()
{
	return ((password.size() >= goal.size()) && ((password.size() - goal.size()) % 3 == 0));
}

inline int change(char ch)
{
	if (ch == ' ') return 52;
	return (ch >= 'a' && ch <= 'z') ? int(ch - 'a') : int(ch - 'A') + 26;
}

bool charcheck()
{
	int a[53], b[53];
	memset(a, 0, sizeof(a));
	memset(b, 0, sizeof(b));
	for (int i = 0; i < password.size(); ++ i)
		++ a[change(password[i])];
	for (int i = 0; i < goal.size(); ++ i)
		++ b[change(goal[i])];
	for (int i = 0; i < 52; ++ i)
	{
		if (i == change('C') || i == change('O') || i == change('W')) continue;
		if (a[i] != b[i]) return false;
	}
	return true;
}

bool prefix_suffix_check(const string &word)
{
	for (int i = 0; i < word.size() && word[i] != 'C'; ++ i)
		if (word[i] != goal[i] || word[i] == 'O' || word[i] == 'W') return false;
	for (int i = word.size() - 1, j = goal.size() - 1; i >= 0 && j >= 0 && word[i] != 'W'; -- i, -- j)
		if (word[i] != goal[j] || word[i] == 'C' || word[i] == 'O') return false;
	return true;
}

string copy(const string &text, int start, int len)
{
	static char m[limitsize];
	int k = -1;
	for (int i = start; i < start + len; ++ i)
		m[++ k] = text[i];
	m[++ k] = 0;
	return string(m);
}

string copy(const string &text, int c, int o, int w)
{
	static char m[limitsize];
	int k = -1;
	for (int i = 0; i < c; ++ i)
		m[++ k] = text[i];
	for (int i = o + 1; i < w; ++ i)
		m[++ k] = text[i];
	for (int i = c + 1; i < o; ++ i)
		m[++ k] = text[i];
	for (int i = w + 1; i < text.size(); ++ i)
		m[++ k] = text[i];
	m[++ k] = 0;
	return string(m);
}

bool string_find(const string &t)
{
	static int kmp[limitsize];
	int k = -1; kmp[0] = 0;
	for (int i = 1; i < t.size(); ++ i)
	{
		while (k >= 0 && t[k + 1] != t[i]) k = kmp[k] - 1;
		if (t[k + 1] == t[i]) ++ k;
		kmp[i] = k + 1;
	}
	k = -1;
	for (int i = 0; i < goal.size(); ++ i)
	{
		while (k >= 0 && t[k + 1] != goal[i]) k = kmp[k] - 1;
		if (t[k + 1] == goal[i]) ++ k;
		if (k + 1 == t.size()) return true;
	}
	return false;
}

bool mid_check(const string &word)
{
	int last;
	for (last = 0; last < word.size(); ++ last)
		if (word[last] == 'C' || word[last] == 'O' || word[last] == 'W') break;
	for (int i = last + 1; i < word.size(); ++ i)
		if (word[i] == 'C' || word[i] == 'O' || word[i] == 'W')
		{
			if (i - last > 1 && !string_find(copy(word, last + 1, i - last - 1))) return false;
			last = i;
		}
	return true;
}

int hash(const string &word)
{
	int ans = 0;
	for (int i = 0; i < word.size(); ++ i)
	{
		ans = (ans << 4) + int(word[i]);
		int k = ans & 0xf0000000;
		if (k) ans ^= k >> 24;
		ans &= ~k;
	}
	return (ans % prime);
}

void dfs(int depth, const string &word)
{
	if (word == goal)
	{
		fout << "1 " << depth << endl;
		exit(0);
	}
	if (!prefix_suffix_check(word) || !mid_check(word)) return;
	int key = hash(word);
	if (!flag[key]) return;
	flag[key] = false;
	int len = word.size();
	for (int o = 0; o < len; ++ o)
		if (word[o] == 'O')
			for (int c = 0; c < o; ++ c)
				if (word[c] == 'C')
					for (int w = len - 1; w > o; -- w)
						if (word[w] == 'W')
							dfs(depth + 1, copy(word, c, o, w));
}

int main()
{
	string temp;
	while (getline(fin, temp))
		password += temp;
	if (!lengthcheck() || !charcheck() || !prefix_suffix_check(password))
	{
		fout << "0 0" << endl;
		return 0;
	}
	memset(flag, true, sizeof(flag));
	dfs(0, password);
	fout << "0 0" << endl;
	return 0;
}
