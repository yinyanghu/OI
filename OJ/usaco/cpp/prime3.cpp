/*
ID:oifox20071
LANG:C++
PROG:prime3
*/
#include <iostream>
#include <fstream>
#include <cstring>
#include <vector>
#include <algorithm>
using namespace std;
ifstream fin("prime3.in");
ofstream fout("prime3.out");
const int n = 5;
const int limitsize = 100000;
int a[n][n];
bool flag[n][n], prime[limitsize];
vector<string> record;
int sum;
void init()
{
	fin >> sum >> a[0][0];
	memset(prime, true, sizeof(prime));
	for (int i = 2; i < (limitsize >> 1); ++ i)
	{
		while (!prime[i]) ++ i;
		for (int j = 2; i * j < limitsize; ++ j)
			prime[i * j] = false;
	}
	memset(flag, true, sizeof(flag));
	flag[0][0] = false;
	record.clear();
}

bool check(int x, int y, int dx, int dy)
{
	int k = 0;
	for (int i = x, j = y; i < n && j < n && i >= 0 && j >= 0; i = i + dx, j = j + dy)
		k = k * 10 + a[i][j];
	return prime[k];
	
}

void print()
{
	string temp = "";
	for (int i = 0; i < n; ++ i)
		for (int j = 0; j < n; ++ j)
			temp += char(a[i][j] + 48);
	record.push_back(temp);
}

void find()
{
	for (a[1][1] = 0; a[1][1] < 10; ++ a[1][1])
	{
		if (a[0][0] + a[1][1] > sum) break;
		for (a[2][2] = 0; a[2][2] < 10; ++ a[2][2])
		{
			if (a[0][0] + a[1][1] + a[2][2] > sum) break;
			for (a[3][3] = 0; a[3][3] < 10; ++ a[3][3])
			{
				a[4][4] = sum - a[0][0] - a[1][1] - a[2][2] - a[3][3];
				if (a[4][4] < 0) break;
				if (a[4][4] > 9) continue;
				if (!check(0, 0, 1, 1)) continue;
				for (a[4][0] = 1; a[4][0] < 10; ++ a[4][0])
				{
					if (a[4][0] + a[0][0] > sum || a[4][0] + a[2][2] > sum) break;
					for (a[3][1] = 0; a[3][1] < 10; ++ a[3][1])
					{
						if (a[3][1] + a[1][1] > sum || a[3][1] + a[3][3] > sum || a[3][1] + a[4][0] + a[2][2] > sum) break;
						for (a[1][3] = 0; a[1][3] < 10; ++ a[1][3])
						{
							if (a[1][3] + a[1][1] > sum || a[1][3] + a[3][3] > sum) break;
							a[0][4] = sum - a[1][3] - a[2][2] - a[3][1] - a[4][0];
							if (a[0][4] <= 0) break;
							if (a[0][4] > 9) continue;
							if (!check(4, 0, -1, 1)) continue;
							for (a[1][2] = 0; a[1][2] < 10; ++ a[1][2])
							{
								if (a[1][2] + a[1][1] + a[1][3] > sum || a[1][2] + a[2][2] > sum) break;
								for (a[3][2] = 0; a[3][2] < 10; ++ a[3][2])
								{
									if (a[3][2] + a[3][1] + a[3][3] > sum || a[3][2] + a[1][2] + a[2][2] > sum) break;
									for (a[0][2] = 1; a[0][2] < 10; ++ a[0][2])
									{
										if (a[0][2] + a[0][0] + a[0][4] > sum) break;
										a[4][2] = sum - a[0][2] - a[1][2] - a[2][2] - a[3][2];
										if (a[4][2] < 0) break;
										if (a[4][2] > 9) continue;
										if (!check(0, 2, 1, 0)) continue;
										for (a[0][1] = 1; a[0][1] < 10; ++ a[0][1])
										{
											if (a[0][1] + a[1][1] + a[3][1] > sum) break;
											a[0][3] = sum - a[0][0] - a[0][1] - a[0][2] - a[0][4];
											if (a[0][3] <= 0) break;
											if (a[0][3] > 9) continue;
											if (!check(0, 0, 0, 1)) continue;
											for (a[4][1] = 0; a[4][1] < 10; ++ a[4][1])
											{
												a[2][1] = sum - a[4][1] - a[0][1] - a[1][1] - a[3][1];
												if (a[2][1] < 0) break;
												if (a[2][1] > 9) continue;
												if (!check(0, 1, 1, 0)) continue;
												a[4][3] = sum - a[4][0] - a[4][1] - a[4][2] - a[4][4];
												if (a[4][3] < 0) break;
												if (a[4][3] > 9) continue;
												if (!check(4, 0, 0, 1)) continue;
												a[2][3] = sum - a[0][3] - a[1][3] - a[3][3] - a[4][3];
												if (a[2][3] < 0 || a[2][3] > 9 || !check(0, 3, 1, 0)) continue;
												for (a[1][0] = 1; a[1][0] < 10; ++ a[1][0])
												{
													if (a[0][0] + a[1][0] + a[4][0] > sum) break;
													a[1][4] = sum - a[1][0] - a[1][1] - a[1][2] - a[1][3];
													if (a[1][4] < 0) break;
													if (a[1][4] > 9) continue;
													if (!check(1, 0, 0, 1)) continue;
													for (a[3][0] = 1; a[3][0] < 10; ++ a[3][0])
													{
														a[3][4] = sum - a[3][0] - a[3][1] - a[3][2] - a[3][3];
														if (a[3][4] < 0) break;
														if (a[3][4] > 9) continue;
														if (!check(3, 0, 0, 1)) continue;
														a[2][0] = sum - a[0][0] - a[1][0] - a[3][0] - a[4][0];
														if (a[2][0] <= 0) break;
														if (a[2][0] > 9) continue;
														if (!check(0, 0, 1, 0)) continue;
														a[2][4] = sum - a[2][0] - a[2][1] - a[2][2] - a[2][3];
														if (a[2][4] < 0 || a[2][4] > 9 || a[0][4] + a[1][4] + a[2][4] + a[3][4] + a[4][4] != sum) continue;
														if (!check(2, 0, 0, 1) || !check(0, 4, 1, 0)) continue;
														print();
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
}

int main()
{
	init();
	find();
	if (record.empty())
		cout << "NONE" << endl;
	else
	{
		sort(record.begin(), record.end());
		for (vector<string> :: iterator it = record.begin(); it != record.end(); ++ it)
		{
			if (it != record.begin())
				fout << endl;
			for (int i = 0; i < n * n; ++ i)
			{
				fout << (*it)[i];
				if ((i + 1) % 5 == 0) fout << endl;
			}
		}
	}
	return 0;
}
