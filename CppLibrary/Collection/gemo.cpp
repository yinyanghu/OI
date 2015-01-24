#include <iostream>
using namespace std;

struct Tpoint
{
	double x, y, z;
	Tpoint(){}
	Tpoint(double x0, double y0, double z0) : x(x0), y(y0), z(z0){}
	double size() const
	{
		return sqrt(x * x + y * y + z * z);
	}
	
};
const double eps = 1e - 5;
Tpoint operator + (const Tpoint &a, const Tpoint &b)
{
	return Tpoint(a.x + b.x, a.y + b.y, a.z + b.z);
}

Tpoint operator - (const Tpoint &a, const Tpoint &b)
{
	return Tpoint(a.x - b.x, a.y - b.y, a.z - b.z);
}

Tpoint operator * (const Tpoint &a, double k)
{
	return Tpoint(a.x * k, a.y * k, a.z * k);
}

Tpoint operator / (const Tpoint &a, double k)
{
	return Tpoint(a.x / k, a.y / k, a.z / k);
}

inline int sign(double x)
{
	if (abs(x) < eps) return 0;
	return (x > 0) ? 1 : -1;
}

Tpoint crossproduct(const Tpoint &a, const Tpoint &b)
{
	return Tpoint(a.y * b.z - a.z * b.y, a.z * b.x - a.x * b.z, a.x * b.y - a.y * b.x);
}

double dotproduct(const Tpoint &a, const Tpoint &b)
{
	return a.x * b.x + a.y * b.y + a.z * b.z;
}

int checkside(const Tpoint &a, const Tpoint &b, const Tpoint &c, const Tpoint &d)
{
	return sign(dotproduct(crossproduct(b - a, c - a), crossproduct(b - a, d - a)));
}
bool segmentcross(const Tpoint &a, const Tpoint &b, const Tpoint &c, const Tpoint &d)
{
	return (checkside(a, b, c, d) < 0 && checkside(c, d, a, b) < 0);
}

Tpoint crosspoint(const Tpoint &a, const Tpoint &b, const Tpoint &c, const Tpoint &d)
{
	double t;
	if (sgn((b.x - a.x) * (d.y - c.y) - (b.y - a.y) * (d.x - c.x)))
		t = ((c.x - a.x) * (d.y - c.y) - (c.y - a.y) * (d.x - c.x)) / ((b.x - a.x) * (d.y - c.y) - (b.y - a.y) * (d.x - c.x));
	else if (sgn((b.y - a.y) * (d.z - c.z) - (b.z - a.z) * (d.y - c.y)))
		t = ((c.y - a.y) * (d.z - c.z) - (c.z - a.z) * (d.y - c.y)) / ((b.y - a.y) * (d.z - c.z) - (b.z - a.z) * (d.y - c.y));
	else
		t = ((c.z - a.z) * (d.x - c.x) - (c.x - a.x) * (d.z - c.z)) / ((b.z - a.z) * (d.x - c.x) - (b.x - a.x) * (d.z - c.z));
	return a + (b - a) * t;
}

double dist(const Tpoint &a, const Tpoint &b)
{
	return (a - b).size();
}


int main()
{
	return 0;
}
