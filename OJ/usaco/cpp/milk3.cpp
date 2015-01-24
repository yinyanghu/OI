/*
ID:oifox20071
LANG:C++
PROG:milk3
*/
#include <iostream>
using namespace std;
const int limitsize = 21;
bool flag[limitsize][limitsize] = {0};
int a, b, c;
void bfs(int ra, int rc)
{
	if (flag[ra][rc]) return;
	flag[ra][rc] =  1;
	int rb = c - ra - rc;
	bfs(ra - min(ra, b - rb), rc);
	bfs(ra - min(ra, c - rc), rc + min(ra, c - rc));
	bfs(ra + min(rb, a - ra), rc);
	bfs(ra, rc + min(rb, c - rc));
	bfs(ra + min(rc, a - ra), rc - min(rc, a - ra));
	bfs(ra, rc - min(rc, b - rb));
}

int main()
{
	freopen("milk3.in", "r", stdin); freopen("milk3.out", "w", stdout);
	cin >> a >> b >> c;
	bfs(0, c);
	bool first = true;
	for (int i = 0; i <= c; ++ i)
		if (flag[0][i])
		{
			if (first)
			{
				cout << i;
				first = 0;
			}
			else			
				cout << " " << i;
		}
	cout << endl;
	return 0;
}
