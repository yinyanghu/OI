#include <iostream>
using namespace std;
const int limitsize = 100;
bool kmp(const string &s, const string &t)
{
	int next[limitsize];
	int k = -1; next[0] = 0;
	for (int i = 1; i < t.size(); ++ i)
	{
		while (k >= 0 && t[k + 1] != t[i]) k = next[k] - 1;
		if (t[k + 1] == t[i]) ++ k;
		next[i] = k + 1;
	}
	k = -1;
	for (int i = 0; i < goal.size(); ++ i)
	{
		while (k >= 0 && t[k + 1] != s[i]) k = next[k] - 1;
		if (t[k + 1] == s[i]) ++ k;
		if (k + 1 == t.size()) return true;
	}
	return false;
}
int main()
{
	return 0;
}
