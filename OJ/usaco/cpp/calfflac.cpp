/*
ID:oifox20071
LANG:C++
PROG:calfflac
*/
#include <iostream>
#include <vector>
using namespace std;
const int limitsize = 20000;
char text[limitsize];
vector<char> source[limitsize];
int n = -1, ans = 0, start;

char change(char temp)
{
	return (temp >= 'A' && temp <= 'Z') ? char(temp - 'A' + 'a') : temp;
}

bool check(char temp)
{
	return ((temp >= 'A' && temp <= 'Z') || (temp >= 'a' && temp <= 'z'));
}

void extend(int s, int t)
{
	while (s > 0 && t < n)
		if (text[s - 1] == text[t + 1])
		{
			-- s; ++ t;
		}
		else break;
	int len = t - s + 1;
	if ((len > ans) || (len == ans && s < start))
	{
		ans = len; start = s;
	}
}

int main()
{
	freopen("calfflac.in", "r", stdin); freopen("calfflac.out", "w", stdout);
	char ch;
	while (scanf("%c", &ch) != EOF)
	{
		if (check(ch))
		{
			text[++ n] = change(ch);
		}
		source[n].push_back(ch);
	}
	for (int i = 0; i < n; ++ i) extend(i, i);
	for (int i = 1; i < n; ++ i)
		if (text[i] == text[i - 1]) extend(i - 1, i);
	cout << ans << endl;
	for (int i = start; i < start + ans - 1; ++ i)
		for (vector<char>::iterator j = source[i].begin(); j != source[i].end(); ++ j)
			cout << *j;
	cout << *source[start + ans - 1].begin() << endl;
	return 0;
}
