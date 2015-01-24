#include <iostream>
using namespace std;

int d, e, p, q, n;

int power(int a, int b, int m)
{
	int temp = 1;
	for (int i = 0; i < b; ++ i)
		temp = (temp * a) % m;
	return temp;
}

int gcd(int a, int b, int &x, int &y)
{
	if (b == 0)
	{
		x = 1; y = 0;
		return a;
	}
	int xx, yy;
	int ans = gcd(b, a % b, xx, yy);
	x = yy; y = xx - (a / b) * yy;
	return ans;
}

int encrypt(int m, int n, int e)
{
	return power(m, e, n);
}

int decrypt(int x, int n, int d)
{
	return power(x, d, n);
}

int public_key(int &p, int &q, int &e)
{
	p = 13; q = 17; e = 11;
	return p * q;
}

int private_key(int p, int q, int e)
{
	n = p * q;
	int phi = (p - 1) * (q - 1);
	int d, temp;
	if (gcd(phi, e, temp, d) != 1) return -1;
	d %= phi;
	return d;
}

int main()
{
	n = public_key(p, q, e);
	d = private_key(p, q, e);
	cout << n << " " << d << endl;
	int x;
	cin >> x;
	cout << encrypt(x, n, e) << endl;
	cout << decrypt(encrypt(x, n, e), n, d) << endl;
	return 0;
}
