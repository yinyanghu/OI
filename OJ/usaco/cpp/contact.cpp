/*
ID:oifox20071
LANG:C++
PROG:contact
*/
#include <iostream>
#include <map>
#include <vector>
#include <algorithm>
#include <fstream>
using namespace std;
map<string, int> word;
vector< pair<int, string> > ans;
string s = "";
int a, b, n;
bool compare(const pair<int, string> &a, const pair<int, string> &b)
{
	if (a.first > b.first) return true;
	if (a.first < b.first) return false;
	if (a.second.size() != b.second.size())
		return (a.second.size() < b.second.size());
	return a.second < b.second;
}
int main()
{
	ifstream cin("contact.in");
	ofstream cout("contact.out");
	string temp;
	cin >> a >> b >> n;
	while (getline(cin, temp))
		s += temp;
	word.clear();
	ans.clear();
	for (int len = a; len <= b; ++ len)
		for (int i = 0; i + len <= s.size(); ++ i)
			++ word[s.substr(i, len)];
	for (map<string, int> :: iterator it = word.begin(); it != word.end(); ++ it)
		ans.push_back(make_pair(it -> second, it -> first));
	sort(ans.begin(), ans.end(), compare);
	int last = -1, total = 0, k = 0;
	for (vector< pair<int, string> > :: iterator it = ans.begin(); it != ans.end(); ++ it)
		if (it -> first != last)
		{
			if (total == n) break;
			if (total != 0) cout << endl;
			++ total;
			k = 0;
			cout << it -> first << endl << it -> second;
			last = it -> first;
		}
		else
		{
			++ k;
			if (k % 6 == 0)
				cout << endl << it -> second;
			else
				cout << " " << it -> second;
		}
	cout << endl;
	return 0;
}
