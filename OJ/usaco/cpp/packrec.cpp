/*
ID:oifox20071
LANG:C++
PROG:packrec
*/
#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;
const int n = 4;
struct graph
{
	int x, y;
} temp[n];
int rec[n][2];
int ans = 100000000;
vector < pair <int, int> > record;
inline int max(int a, int b, int c, int d)
{
	int temp = (a > b) ? a : b;
	temp = (c > temp) ? c : temp;
	temp = (d > temp) ? d : temp;
	return temp;
}
void update(int x, int y)
{
	if (x * y < ans)
	{
		ans = x * y;
		record.clear();
		record.push_back(make_pair(min(x, y), max(x, y)));
	}
	else if (x * y == ans)
	{
		record.push_back(make_pair(min(x, y), max(x, y)));
	}
}
int main()
{
	freopen("packrec.in", "r", stdin); freopen("packrec.out", "w", stdout);
	for (int i = 0; i < n; ++ i)
		cin >> rec[i][0] >> rec[i][1];
	for (int aa = 0; aa < n; ++ aa)
		for (int bb = 0; bb < n; ++ bb)
			if (aa != bb)
				for (int cc = 0; cc < n; ++ cc)
					if (aa != cc && bb != cc)
						for (int a = 0; a < 2; ++ a)
						for (int b = 0; b < 2; ++ b)
						for (int c = 0; c < 2; ++ c)
						for (int d = 0; d < 2; ++ d)
						{
							int dd = 6 - aa - bb - cc;
							temp[0].x = rec[aa][a]; temp[0].y = rec[aa][1 - a];
							temp[1].x = rec[bb][b]; temp[1].y = rec[bb][1 - b];
							temp[2].x = rec[cc][c]; temp[2].y = rec[cc][1 - c];
							temp[3].x = rec[dd][d]; temp[3].y = rec[dd][1 - d];
							update(max(temp[0].x, temp[1].x, temp[2].x, temp[3].x), temp[0].y + temp[1].y + temp[2].y + temp[3].y);
							update(max(temp[0].x, temp[1].x, temp[2].x, 0) + temp[3].x, max(temp[0].y + temp[1].y + temp[2].y, temp[3].y, 0, 0));
							update(max(max(temp[0].x, temp[1].x, 0, 0) + temp[3].x, temp[2].x, 0, 0), max(temp[0].y + temp[1].y, temp[3].y, 0, 0) + temp[2].y);
							update(max(temp[0].x, temp[1].x + temp[2].x, temp[3].x, 0), max(temp[1].y, temp[2].y, 0, 0) + temp[0].y + temp[3].y);
							if ((temp[2].x < temp[3].x && temp[1].y > temp[2].y) || (temp[2].x > temp[3].x && temp[0].y > temp[3].y))
							{
								update(max(temp[0].x + temp[3].x, temp[1].x + temp[2].x, 0, 0), max(temp[0].y, temp[3].y, 0, 0) + max(temp[1].y, temp[2].y, 0, 0));
								update(max(temp[0].x, temp[1].x, 0, 0) + max(temp[2].x, temp[3].x, 0, 0), max(temp[0].y + temp[1].y, temp[2].y + temp[3].y, 0, 0));
							}
							else 	update(max(temp[0].x + temp[3].x, temp[1].x + temp[2].x, 0, 0), max(temp[0].y + temp[1].y, temp[2].y + temp[3].y ,0 ,0));
						}
	cout << ans << endl;
	sort(record.begin(), record.end());
	vector< pair <int, int> > :: iterator target = unique(record.begin(), record.end());
	for (vector< pair <int, int> > ::iterator i = record.begin(); i != target; ++ i)
		cout << (*i).first << " " << (*i).second << endl;
	return 0;
}
