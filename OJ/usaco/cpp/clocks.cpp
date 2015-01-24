/*
ID:oifox20071
LANG:C++
PROG:clocks
*/
#include <iostream>
#include <cstring>
using namespace std;
const int n = 9;
const string move[n] = {"ABDE", "ABC", "BCEF", "ADG", "BDEFH", "CFI", "DEGH", "GHI", "EFHI"};
const int base[n] = {1, 4, 16, 64, 256, 1024, 4096, 16384, 65536};
const int limitsize = 262144;
struct queuenode
{
	short state[n];
	short cut[n];
	int father;
	short ans;
} queue[limitsize];
bool flag[limitsize];

bool check(const short *state)
{
	for (int i = 0; i < n; ++ i)
		if (state[i] != 0) return 0;
	return 1;
}

int hash(const short *state)
{
	int k = 0 ;
	for (int i = 0; i < n; ++ i)
		k += state[i] * base[i];
	return k;
}

void change(int k, short *state)
{
	for (int i = 0; i < move[k].size(); ++ i)
			state[move[k][i] - 'A'] = (state[move[k][i] - 'A'] + 1) % 4;
}

void print(int x)
{
	if (x == 0) return;
	print(queue[x].father);
	cout << queue[x].ans << " ";
}

int main()
{
	freopen("clocks.in", "r", stdin); freopen("clocks.out", "w", stdout);
	for (int i = 0; i < n; ++ i)
	{
		cin >> queue[0].state[i];
		queue[0].state[i] /= 3;
		queue[0].state[i] %= 4;
	}
	int left = -1, right = 0;
	memset(flag, true, sizeof(flag));
	memset(queue[0].cut, 0, sizeof(queue[0].cut));
	flag[hash(queue[0].state)] = 0;
	while (left != right)
	{
		++ left;
		for (int i = 0; i < n; ++ i)
		{
			if (queue[left].cut[i] == 3) continue;
			queuenode temp = queue[left];
			change(i, temp.state);
			if (flag[hash(temp.state)])
			{
				queue[++ right] = temp;
				++ queue[right].cut[i];
				queue[right].father = left;
				queue[right].ans = i + 1;
				flag[hash(temp.state)] = 0;
				if (check(temp.state))
				{
					print(left);
					cout << queue[right].ans << endl;
					return 0;
				}
			}
		}
	}
	return 0;
}
