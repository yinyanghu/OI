/*
ID:oifox20071
LANG:C++
PROG:spin
*/
#include <iostream>
#include <fstream>
#include <cstring>
using namespace std;
ifstream fin("spin.in");
ofstream fout("spin.out");
const int maxw = 5;
const int n = 5;
const int tau = 360;
struct node
{
	int v, count, len[maxw], pos[maxw];
} wheel[n];
int flag[tau];
int find()
{
	for (int time = 0; time < tau; ++ time)
	{
		memset(flag, 0, sizeof(flag));
		for (int i = 0; i < n; ++ i)
			for (int j = 0; j < wheel[i].count; ++ j)
			{
				if (time > 0)
					wheel[i].pos[j] = (wheel[i].pos[j] + wheel[i].v) % tau;
				for (int k = 0; k <= wheel[i].len[j]; ++ k)
					++ flag[(wheel[i].pos[j] + k) % tau];
			}
		for (int i = 0; i < tau; ++ i)
			if (flag[i] == n) return time;
	}
	return -1;
}
int main()
{
	for (int i = 0; i < n; ++ i)
	{
		fin >> wheel[i].v >> wheel[i].count;
		for (int j = 0; j < wheel[i].count; ++ j)
			fin >> wheel[i].pos[j] >> wheel[i].len[j];
	}
	int ans = find();
	if (ans == -1)
		fout << "none" << endl;
	else
		fout << ans << endl;
	return 0;
}
