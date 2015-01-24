/*
ID:oifox20071
LANG:C++
PROG:msquare
*/
#include <iostream>
#include <fstream>
#include <cstring>
using namespace std;
const int n = 8;
const int limitsize = 50000;
ifstream fin("msquare.in");
ofstream fout("msquare.out");
struct queuenode
{
	int num[n], len, father;
	char last;
} queue[limitsize];
int target[n];
bool flag[n][n][n][n][n][n][n];
inline bool check(int *a)
{
	for (int i = 0; i < n; ++ i)
		if (a[i] != target[i]) return false;
	return true;
}
inline void swap(int &a, int &b)
{
	int k = a; a = b; b = k;
}
void print(int x)
{
	if (x == 0) return;
	print(queue[x].father);
	fout << queue[x].last;
}
int main()
{
	for (int i = 0; i <= 3; ++ i)
	{
		fin >> target[i];
		queue[0].num[i] = i;
	}
	for (int i = n - 1; i >= 4; -- i)
	{
		fin >> target[i];
		queue[0].num[i] = 11 - i;
	}
	for (int i = 0; i < n; ++ i)
		-- target[i];
	memset(flag, true, sizeof(flag));
	queue[0].len = 0;
	flag[queue[0].num[0]][queue[0].num[1]][queue[0].num[2]][queue[0].num[3]][queue[0].num[4]][queue[0].num[5]][queue[0].num[6]] = false;
	if (check(queue[0].num))
	{
		fout << 0 << endl;
		fout << endl;
		return 0;
	}
	int head = -1, tail = 0;
	while (head != tail)
	{
		++ head;
		//A
		queuenode temp = queue[head];
		for (int i = 0; i <= 3; ++ i)
			swap(temp.num[i], temp.num[i + 4]);
		if (flag[temp.num[0]][temp.num[1]][temp.num[2]][temp.num[3]][temp.num[4]][temp.num[5]][temp.num[6]])
		{
			queue[++ tail] = temp;
			++ queue[tail].len;
			queue[tail].father = head;
			queue[tail].last = 'A';
			if (check(queue[tail].num))
			{
				fout << queue[tail].len << endl;
				print(tail);
				break;
			}
			flag[temp.num[0]][temp.num[1]][temp.num[2]][temp.num[3]][temp.num[4]][temp.num[5]][temp.num[6]] = false;
		}
		//B
		temp = queue[head];
		int x = temp.num[3], y = temp.num[7];
		temp.num[3] = temp.num[2]; temp.num[2] = temp.num[1]; temp.num[1] = temp.num[0]; temp.num[0] = x;
		temp.num[7] = temp.num[6]; temp.num[6] = temp.num[5]; temp.num[5] = temp.num[4]; temp.num[4] = y;
		if (flag[temp.num[0]][temp.num[1]][temp.num[2]][temp.num[3]][temp.num[4]][temp.num[5]][temp.num[6]])
		{
			queue[++ tail] = temp;
			++ queue[tail].len;
			queue[tail].father = head;
			queue[tail].last = 'B';
			if (check(queue[tail].num))
			{
				fout << queue[tail].len << endl;
				print(tail);
				break;
			}
			flag[temp.num[0]][temp.num[1]][temp.num[2]][temp.num[3]][temp.num[4]][temp.num[5]][temp.num[6]] = false;
		}
		//C
		temp = queue[head];
		x = temp.num[1];
		temp.num[1] = temp.num[5]; temp.num[5] = temp.num[6]; temp.num[6] = temp.num[2]; temp.num[2] = x;
		if (flag[temp.num[0]][temp.num[1]][temp.num[2]][temp.num[3]][temp.num[4]][temp.num[5]][temp.num[6]])
		{
			queue[++ tail] = temp;
			++ queue[tail].len;
			queue[tail].father = head;
			queue[tail].last = 'C';
			if (check(queue[tail].num))
			{
				fout << queue[tail].len << endl;
				print(tail);
				break;
			}
			flag[temp.num[0]][temp.num[1]][temp.num[2]][temp.num[3]][temp.num[4]][temp.num[5]][temp.num[6]] = false;
		}
	}
	fout << endl;
	return 0;
}
