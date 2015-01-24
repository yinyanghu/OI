/*
ID:oifox20071
LANG:C++
PROG:job
*/
#include <iostream>
#include <fstream>
using namespace std;
ifstream fin("job.in");
ofstream fout("job.out");
const int maxn = 1000;
const int maxm = 31;
const int infinity = 1000000000;
int n;
int a[maxm], b[maxm], delayA[maxm], delayB[maxm], finishA[maxn], finishB[maxn];
int main()
{
	fin >> n >> a[0] >> b[0];
	for (int i = 1; i <= a[0]; ++ i)
		fin >> a[i];
	for (int i = 1; i <= b[0]; ++ i)
		fin >> b[i];
	for (int i = 0; i < n; ++ i)
	{
		int mintime = infinity, k;
		for (int j = 1; j <= a[0]; ++ j)
			if (mintime > delayA[j] + a[j])
			{
				mintime = delayA[j] + a[j];
				k = j;
			}
		delayA[k] = mintime;
		finishA[i] = mintime;
	}
	fout << finishA[n - 1] << " ";
	for (int i = 0; i < n; ++ i)
	{
		int mintime = infinity, k;
		for (int j = 1; j <= b[0]; ++ j)
			if (mintime > delayB[j] + b[j])
			{
				mintime = delayB[j] + b[j];
				k = j;
			}
		delayB[k] = mintime;
		finishB[i] = mintime;
	}
	int ans = 0;
	for (int i = 0; i < n; ++ i)
		ans = max(ans, finishA[i] + finishB[n - i - 1]);
	fout << ans << endl;
	return 0;
}
