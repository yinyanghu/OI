#include <iostream>
#include <cmath>
using namespace std;
const int maxn = 10000;
struct node
{
	double x, y;
} a[maxn];
int n, stack[maxn];
void init()
{
	cin >> n;
	for (int i = 0; i < n; ++ i)
		cin >> a[i].x >> a[i].y;
}

void swap(node &a, node &b)
{
	node k = a; a = b; b = k;
}

double crossproduct(const node &a, const node &b, const node &c)
{
	return (b.x - a.x) * (c.y - a.y) - (b.y - a.y) * (c.x - a.x);
}

double getdist(const node &a, const node &b)
{
	return sqrt((a.x - b.x) * (a.x - b.x) + (a.y - b.y) * (a.y - b.y));
}

void sort(int l, int r)
{
	int i = l, j = r;
	node x = a[(l + r) >> 1];
	do
	{
		while (crossproduct(a[0], a[i], x) > 0 || (crossproduct(a[0], a[i], x) == 0 && getdist(a[0], a[i]) < getdist(a[0], x))) ++ i;
		while (crossproduct(a[0], a[j], x) < 0 || (crossproduct(a[0], a[j], x) == 0 && getdist(a[0], a[j]) > getdist(a[0], x))) -- j;
		if (i <= j)
		{
			swap(a[i], a[j]);
			++ i; -- j;
		}
	} while (i <= j);
	if (l < j) sort(l, j);
	if (i < r) sort(i, r);
}

void graham()
{
	int k = 0;
	for (int i = 1; i < n; ++ i)
		if (a[i].x < a[k].x || (a[i].x == a[k].x && a[i].y < a[k].y)) k = i;
	swap(a[0], a[k]);
	sort(1, n - 1);
	int top;
	stack[top = 0] = 0;
	for (int i = 1; i < n; ++ i)
	{
		while (top > 0 && crossproduct(a[stack[top]], a[stack[top - 1]], a[i]) > 0) -- top;
		stack[++ top] = i;
	}
	double ans = getdist(a[stack[0]], a[stack[top]]);
	for (int i = 1; i <= top; ++ i)
		ans += getdist(a[stack[i]], a[stack[i - 1]]);
	cout << ans << endl;
}

int main()
{
	init();
	graham();
	return 0;
}
