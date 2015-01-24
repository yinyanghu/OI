#include <cstdio>
#include <cstring>
#include <cstdlib>
#include <cmath>

const	double		eps	= 1e-5;

struct			Tpoint
{
	double		x , y , z;
	Tpoint(){}
	Tpoint(double x0, double y0, double z0) : x(x0), y(y0), z(z0) {}

	double	norm() const
	{
		return	sqrt(x * x + y * y + z * z);
	}
	void	normalize()
	{
		double	r = norm();
		x /= r;
		y /= r;
		z /= r;
	}
};


Tpoint	operator + (const Tpoint& A , const Tpoint& B)
{
	return	Tpoint(A.x + B.x , A.y + B.y , A.z + B.z);
}

Tpoint	operator - (const Tpoint& A , const Tpoint& B)
{
	return	Tpoint(A.x - B.x , A.y - B.y , A.z - B.z);
}

Tpoint	operator * (const Tpoint& A , double k)
{
	return	Tpoint(A.x * k , A.y * k , A.z * k);
}

Tpoint	operator / (const Tpoint& A , double k)
{
	return	Tpoint(A.x / k , A.y / k , A.z / k);
}

inline	int	sgn(double x)
{
	if (fabs( x ) < eps) return 0;
	return	x < 0 ? -1 : +1;
}

inline	int	cmp(double a , double b)
{
	if (fabs(a - b) < eps) return 0;
	return a < b ? -1 : +1;
}

//计算两个向量的叉积
Tpoint	crossProduct(const Tpoint& A, const Tpoint& B)
{
	return	Tpoint(A.y*B.z - A.z*B.y, A.z*B.x - A.x*B.z, A.x*B.y - A.y*B.x);
}

//计算两个向量的点积
double	dotProduct(const Tpoint& A , const Tpoint& B)
{
	return	A.x * B.x + A.y * B.y + A.z * B.z;
}

struct			Tplane
{
	Tpoint		p;	// 平面上一个点
	Tpoint		n;	// 法向量

	Tplane(){}
	Tplane(const Tpoint& p0, const Tpoint& n0) : p(p0), n(n0) {}
	Tplane(const Tpoint& A , const Tpoint& B , const Tpoint& C)
	{
		p = A;
		n = crossProduct(B - A , C - A);
	}
};

//计算向量A 在 P 方向上的投影
Tpoint	project(const Tpoint& A , const Tpoint& P)
{
	double	k = dotProduct(A,P) / P.norm();
	return	Tpoint(P.x * k , P.y * k , P.z * k);
}

//判断直线AB 和 PQ是否平行
bool	isParallel(const Tpoint& A, const Tpoint& B, const Tpoint&P, const Tpoint& Q)
{
	Tpoint	S = crossProduct(B - A , Q - P);
	return	sgn( S.x ) == 0 && sgn( S.y ) == 0 && sgn( S.z ) == 0;
}

//判断直线AB 和 PQ是否垂直
bool	isChuiZhi(const Tpoint& A, const Tpoint& B, const Tpoint& P, const Tpoint& Q)
{
	return	sgn( dotProduct(B - A, Q - P) ) == 0;
}

//判断点是否在直线上
bool	onSegment(const Tpoint& A , const Tpoint& B , const Tpoint& P)
{
	return	isParallel(A , B , A , P) &&
		sgn( dotProduct(A - P , B - P) ) <= 0;
}

//判两点P,Q在直线AB的 同侧(+1) 异侧(-1) 一个点在线上(0), 不共面无意义
int	checkSide(const Tpoint& A , const Tpoint& B , const Tpoint& P , const Tpoint& Q)
{
	return	sgn( dotProduct( crossProduct(B-A,P-A) , crossProduct(B-A,Q-A) ) );
}

//求点P到直线AB的距离
double	distToLine(const Tpoint& A , const Tpoint& B , const Tpoint& P)
{
	return	crossProduct(B - P , A - P).norm() / (A - B).norm();
}

//求点P到直线AB上的垂足
Tpoint	getH(const Tpoint& A , const Tpoint& B , const Tpoint& P)
{
	double	t = dotProduct( P - A , B - A ) / dotProduct( B - A , B - A );
	return	A + (B - A) * t;
}

//判断是否四点共面
bool	dotsOnPlane(const Tpoint& A , const Tpoint& B , const Tpoint& C , const Tpoint& D)
{
	return	sgn( dotProduct( crossProduct(B - A , C - A) , D - A ) ) == 0;
}

//计算点A 到平面S的距离		: PA到S.n上的投影的长度
double	distToPlane(const Tpoint& A , const Tplane& S)
{
	return	fabs( dotProduct(A - S.p , S.n) / S.n.norm() );
}

//求直线AB 与 平面S的交点
//需要保证 AB与 S不平行, 即 dotProduct( (AB), S.n ) != 0
Tpoint	crossPointOnPlane(const Tpoint& A , const Tpoint& B , const Tplane& S)
{
	double		t = dotProduct( S.n , S.p - A ) / dotProduct(S.n , B - A);
	return	A + (B - A) * t;
}

//判断点P是否在空间三角形ABC内
//判面积( 叉积的模 / 2 ) , 判点积( 判边界 )

//判段两共面线段是否严格相交
bool	segmentCross(const Tpoint& A , const Tpoint& B , const Tpoint& C , const Tpoint& D)
{
	return	dotsOnPlane(A,B,C,D) && checkSide(A,B,C,D) < 0 && checkSide(C,D,A,B) < 0;
}

//计算两相交直线交点(共面且不平行)
Tpoint	crossPoint(const Tpoint& A , const Tpoint& B , const Tpoint& P , const Tpoint& Q)
{
	double	t;
	if ( sgn( (B.x - A.x) * (Q.y - P.y) - (B.y - A.y) * (Q.x - P.x) ) )
		t = ( (P.x - A.x) * (Q.y - P.y) - (P.y - A.y) * (Q.x - P.x) )
		/   ( (B.x - A.x) * (Q.y - P.y) - (B.y - A.y) * (Q.x - P.x) );

	else if ( sgn( (B.y - A.y) * (Q.z - P.z) - (B.z - A.z) * (Q.y - P.y) ) )
		t = ( (P.y - A.y) * (Q.z - P.z) - (P.z - A.z) * (Q.y - P.y) )
		/   ( (B.y - A.y) * (Q.z - P.z) - (B.z - A.z) * (Q.y - P.y) );

	else	t = ( (P.z - A.z) * (Q.x - P.x) - (P.x - A.x) * (Q.z - P.z) )
		/   ( (B.z - A.z) * (Q.x - P.x) - (B.x - A.x) * (Q.z - P.z) );

	return	A + (B - A) * t;
}

//计算两条直线AB, CD的距离
double	lineDist(const Tpoint& A , const Tpoint& B , const Tpoint& P , const Tpoint& Q)
{
	Tpoint	n = crossProduct(B - A , Q - P);
	if (n.norm() < eps) //平行
		return	distToLine(A , B , P);
	return	fabs( dotProduct(P - A , n) / n.norm() );
}

//计算直线AB, CD的最近点 , 返回(X,Y) X in AB, Y in PQ
void	nearestPoints(const Tpoint& A, const Tpoint& B, const Tpoint& P , const Tpoint& Q , Tpoint& X , Tpoint& Y)
{
	if (isParallel(A,B,P,Q)) return;
	
	double	a1 = + dotProduct( B - A , B - A );
	double	b1 = - dotProduct( B - A , Q - P );
	double	c1 = - dotProduct( B - A , A - P );

	double	a2 = + dotProduct( Q - P , B - A );
	double	b2 = - dotProduct( Q - P , Q - P );
	double	c2 = - dotProduct( Q - P , A - P );

	double	t1 = (c1 * b2 - c2 * b1) / (a1 * b2 - a2 * b1);
	double	t2 = (c2 - t1 * a2) / b2;

	X = A + (B - A) * t1;
	Y = P + (Q - P) * t2;
}

inline	double	dist(const Tpoint& A , const Tpoint& B)
{
	return	(A-B).norm();
}

void	randPoint(Tpoint& P)
{
	P.x = rand() % 100 - 50;
	P.y = rand() % 100 - 50;
	P.z = rand() % 100 - 50;
}

bool	readPoint(Tpoint& P)
{
	return scanf("%lf%lf%lf" , &P.x , &P.y , &P.z) > 0;
}

void	print(const Tpoint& A )
{
	printf("%.3lf %.3lf %.3lf\n" , A.x , A.y , A.z);
}

inline	double	min(double a , double b)
{
	return a < b ? a : b;
}


int	main()
{
	return 0;
}
