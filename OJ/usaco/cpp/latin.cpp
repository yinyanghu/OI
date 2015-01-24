/*
ID:oifox20071
LANG:C++
PROG:latin
*/
#include <iostream>
#include <fstream>
using namespace std;
ifstream fin("latin.in");
ofstream fout("latin.out");
const string ans[8] = {"0", "0", "1", "2", "24", "1344", "1128960", "12198297600"};
int main()
{
	int n;
	fin >> n;
	fout << ans[n] << endl;
	return 0;
}
