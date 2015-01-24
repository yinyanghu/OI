/*
ID:oifox20071
LANG:C++
PROG:fence8
*/
#include <iostream>
#include <fstream>
#include <algorithm>
using namespace std;
ifstream fin("fence8.in");
ofstream fout("fence8.out");
const int maxn = 50;
const int maxr = 1023;
int n, r, sumboard = 0, ans;
int board[maxn], need[maxr], sum[maxr];

bool compare(int x, int y)
{
	return (x > y);
}

bool check(int left, int curneed, int curboard)
{
	if (curneed == -1) return true;
	int k;
	for (int i = curboard; i < n; ++ i)
		if (board[i] >= need[curneed])
		{
			board[i] -= need[curneed];
			if (board[i] < need[0])
			{
				k = left + board[i];
				if (k + sum[ans] > sumboard)
				{
					board[i] += need[curneed];
					continue;
				}
			}
			else
				k = left;
			int nextboard = (curneed >= 1 && need[curneed] == need[curneed - 1]) ? i : 0;
			if (check(k, curneed - 1, nextboard)) return true;
			board[i] += need[curneed];
		}
	return false;
}

int main()
{
	fin >> n;
	for (int i = 0; i < n; ++ i)
	{
		fin >> board[i];
		sumboard += board[i];
	}
	fin >> r;
	for (int i = 0; i < r; ++ i)
		fin >> need[i];
	sort(board, board + n, compare);
	sort(need, need + r);
	if (need[0] > sumboard)
	{
		fout << 0 << endl;
		return 0;
	}
	sum[0] = need[0];
	ans = r - 1;
	for (int i = 1; i < r; ++ i)
	{
		sum[i] = sum[i - 1] + need[i];
		if (sum[i] > sumboard)
		{
			ans = i - 1;
			break;
		}
	}
	while (!check(0, ans, 0)) -- ans;
	fout << ans + 1 << endl;
	return 0;
}
