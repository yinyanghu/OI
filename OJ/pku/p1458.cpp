#include <iostream>
#include <cstring>
using namespace std;
string s, t;
const int limitsize = 501;
int f[limitsize][limitsize];
int main()
{
	while (cin >> s >> t)
	{
		memset(f, 0, sizeof(f));
		for (int i = 0; i < s.size(); ++ i)
			for (int j = 0; j < t.size(); ++ j)
				if (s[i] == t[j])
					f[i + 1][j + 1] = f[i][j] + 1;
				else
					f[i + 1][j + 1] = max(f[i][j + 1], f[i + 1][j]);
		cout << f[s.size()][t.size()] << endl;
	}
}