//Ural 1403
//by Amber

#include <iostream>
#include <queue>
#include <algorithm>
using namespace std;

struct t_order
{
	int time, money, index;
};
bool order_time_cmp(const t_order &a, const t_order &b)
{
	return a.time < b.time;
}
struct order_money_cmp
{
	bool operator () (const t_order &a, const t_order &b) const
	{
		return a.money < b.money;
	}
};
int main()
{
	int N;
	cin >> N;
	vector<t_order> orders(N + 1);
	orders[0].time=0;
	for (int i = 1; i <= N; i++)
	{
		cin >> orders[i].time >> orders[i].money;
		orders[i].index = i;
	}
	sort(orders.begin(), orders.end(), order_time_cmp);
	
	priority_queue<t_order, vector<t_order>, order_money_cmp> queue;
	vector<int> result;
	int i = N;
	do
	{
		int cur = orders[i].time;
		do
			queue.push(orders[i--]);
		while (orders[i].time == cur);
		int times = cur - orders[i].time;
		do
		{
			result.push_back(queue.top().index);
			queue.pop();
		}
		while (queue.size() > 0 && (--times) > 0);
	}
	while (i > 0);

	cout << result.size() << endl;
	for (int i = result.size() - 1; i >= 0; i--)
		cout << result[i] << ' ';
	cout << endl;
}
