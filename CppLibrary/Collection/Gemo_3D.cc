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

//�������������Ĳ��
Tpoint	crossProduct(const Tpoint& A, const Tpoint& B)
{
	return	Tpoint(A.y*B.z - A.z*B.y, A.z*B.x - A.x*B.z, A.x*B.y - A.y*B.x);
}

//�������������ĵ��
double	dotProduct(const Tpoint& A , const Tpoint& B)
{
	return	A.x * B.x + A.y * B.y + A.z * B.z;
}

struct			Tplane
{
	Tpoint		p;	// ƽ����һ����
	Tpoint		n;	// ������

	Tplane(){}
	Tplane(const Tpoint& p0, const Tpoint& n0) : p(p0), n(n0) {}
	Tplane(const Tpoint& A , const Tpoint& B , const Tpoint& C)
	{
		p = A;
		n = crossProduct(B - A , C - A);
	}
};

//��������A �� P �����ϵ�ͶӰ
Tpoint	project(const Tpoint& A , const Tpoint& P)
{
	double	k = dotProduct(A,P) / P.norm();
	return	Tpoint(P.x * k , P.y * k , P.z * k);
}

//�ж�ֱ��AB �� PQ�Ƿ�ƽ��
bool	isParallel(const Tpoint& A, const Tpoint& B, const Tpoint&P, const Tpoint& Q)
{
	Tpoint	S = crossProduct(B - A , Q - P);
	return	sgn( S.x ) == 0 && sgn( S.y ) == 0 && sgn( S.z ) == 0;
}

//�ж�ֱ��AB �� PQ�Ƿ�ֱ
bool	isChuiZhi(const Tpoint& A, const Tpoint& B, const Tpoint& P, const Tpoint& Q)
{
	return	sgn( dotProduct(B - A, Q - P) ) == 0;
}

//�жϵ��Ƿ���ֱ����
bool	onSegment(const Tpoint& A , const Tpoint& B , const Tpoint& P)
{
	return	isParallel(A , B , A , P) &&
		sgn( dotProduct(A - P , B - P) ) <= 0;
}

//������P,Q��ֱ��AB�� ͬ��(+1) ���(-1) һ����������(0), ������������
int	checkSide(const Tpoint& A , const Tpoint& B , const Tpoint& P , const Tpoint& Q)
{
	return	sgn( dotProduct( crossProduct(B-A,P-A) , crossProduct(B-A,Q-A) ) );
}

//���P��ֱ��AB�ľ���
double	distToLine(const Tpoint& A , const Tpoint& B , const Tpoint& P)
{
	return	crossProduct(B - P , A - P).norm() / (A - B).norm();
}

//���P��ֱ��AB�ϵĴ���
Tpoint	getH(const Tpoint& A , const Tpoint& B , const Tpoint& P)
{
	double	t = dotProduct( P - A , B - A ) / dotProduct( B - A , B - A );
	return	A + (B - A) * t;
}

//�ж��Ƿ��ĵ㹲��
bool	dotsOnPlane(const Tpoint& A , const Tpoint& B , const Tpoint& C , const Tpoint& D)
{
	return	sgn( dotProduct( crossProduct(B - A , C - A) , D - A ) ) == 0;
}

//�����A ��ƽ��S�ľ���		: PA��S.n�ϵ�ͶӰ�ĳ���
double	distToPlane(const Tpoint& A , const Tplane& S)
{
	return	fabs( dotProduct(A - S.p , S.n) / S.n.norm() );
}

//��ֱ��AB �� ƽ��S�Ľ���
//��Ҫ��֤ AB�� S��ƽ��, �� dotProduct( (AB), S.n ) != 0
Tpoint	crossPointOnPlane(const Tpoint& A , const Tpoint& B , const Tplane& S)
{
	double		t = dotProduct( S.n , S.p - A ) / dotProduct(S.n , B - A);
	return	A + (B - A) * t;
}

//�жϵ�P�Ƿ��ڿռ�������ABC��
//�����( �����ģ / 2 ) , �е��( �б߽� )

//�ж��������߶��Ƿ��ϸ��ཻ
bool	segmentCross(const Tpoint& A , const Tpoint& B , const Tpoint& C , const Tpoint& D)
{
	return	dotsOnPlane(A,B,C,D) && checkSide(A,B,C,D) < 0 && checkSide(C,D,A,B) < 0;
}

//�������ֱཻ�߽���(�����Ҳ�ƽ��)
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

//��������ֱ��AB, CD�ľ���
double	lineDist(const Tpoint& A , const Tpoint& B , const Tpoint& P , const Tpoint& Q)
{
	Tpoint	n = crossProduct(B - A , Q - P);
	if (n.norm() < eps) //ƽ��
		return	distToLine(A , B , P);
	return	fabs( dotProduct(P - A , n) / n.norm() );
}

//����ֱ��AB, CD������� , ����(X,Y) X in AB, Y in PQ
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
