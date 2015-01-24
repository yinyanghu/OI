/*
ID:oifox20071
LANG:C++
PROG:prefix
*/
#include <iostream>
#include <cstring>
using namespace std;
const int maxn = 200;
const int maxlen = 200001;
char pri[maxn][10];
int len[maxn];
bool f[maxlen];
string s = "";
int main()
{
	freopen("prefix.in", "r", stdin); freopen("prefix.out", "w", stdout);
	int total;
	for (total = 0; ; ++ total)
	{
		cin >> pri[total];
		if (pri[total][0] == '.')
		{
			-- total;
			break;
		}
		len[total] = strlen(pri[total]);
	}
	string temp;
	while (cin >> temp)
		s += temp;
	int ans = 0;
	memset(f, false, sizeof(f));
	f[0] = true;
	for (int i = 0; i < s.length(); ++ i)
	{
		for (int j = 0; j <= total; ++ j)
		{
			if (i + 1 < len[j]) continue;
			bool flag = true;
			for (int k = 0; k < len[j]; ++ k)
				if (s[i + 1 - len[j] + k] != pri[j][k])
				{
					flag =false;
					break;
				}
			if (flag) f[i + 1] = (f[i + 1] || f[i + 1 - len[j]]);
		}
	}
	for (int i = s.length(); i >= 0; -- i)
		if (f[i])
		{
			cout << i << endl;
			break;
		}
	return 0;
}
