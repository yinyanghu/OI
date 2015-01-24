#include <iostream>
#include <time.h>
#include <cstdio>
#include <cstdlib>
#include <algorithm>
using namespace std;
const int limitsize = 100000000;
int a[limitsize];
void quicksort(int l, int r)
{
	int i = l, j = r, x = a[(l + r) >> 1];
	do
	{
		while (a[i] < x) ++ i;
		while (a[j] > x) -- j;
		if (i <= j)
		{
			int y = a[i]; a[i] = a[j]; a[j] = y;
			++ i; -- j;
		}
	} while (i <= j);
	if (l < j) quicksort(l, j);
	if (i < r) quicksort(i, r);
}

void psort(int l,int r)
{
	int i=l;
	for (int j=l;j<r;j++)
		if (a[j]<a[r]) swap(a[i++],a[j]);
	swap(a[i],a[r]);
	if (l<i-1) psort(l,i-1);
	if (i+1<r) psort(i+1,r);
}

int compare (const void * a, const void * b)
{
  return ( *(int*)a - *(int*)b );
}


int main()
{
	int n = 100000000;
	//int n = 100000000;
	srand(time(NULL));
	//cin >> n;
	for (int i = 0; i < n; ++ i)
		a[i] = rand();
	clock_t start, end;
	start = clock();
	sort(a, a + n);
	//psort(0, n - 1);
	quicksort(0, n - 1);
	qsort(a, n, sizeof(int), compare);
	end = clock();
	cout << end - start << endl;
	//qsort(a, a + n);
	//for (int i = 0; i < n; ++ i)
	//	cout << a[i] << endl;
	return 0;
}
