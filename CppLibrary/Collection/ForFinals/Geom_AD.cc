/* Geom - by Tang */
const double pi = acos(0.0) * 2.0;

struct Tpoint
{
	double x , y;
	Tpoint(){}
	Tpoint(double x0 , double y0){ x = x0; y = y0; }
	
	void	rotate(double theta)		/// force
	{
		double r = sqrt(x * x + y * y);
		theta += atan2(y , x);
		x = r * cos(theta);
		y = r * sin(theta);
	}

	void	rotate(double theta)		/// better
	{
		double x0 = x;
		double y0 = y;
	
		theta = - theta;
		x = x0 * cos(theta) + y0 * sin(theta);
		y = - x0 * sin(theta) + y0 * cos(theta);
	}
};

Tpoint	crossPoint(const Tpoint& A , const Tpoint& B , const Tpoint& P , const Tpoint& Q)
{
	double t = ((A.x - P.x) * (B.y - A.y) - (A.y - P.y) * (B.x - A.x))
			  / ((Q.x - P.x) * (B.y - A.y) - (Q.y - P.y) * (B.x - A.x));
	return	Tpoint( P.x + (Q.x - P.x) * t , P.y + (Q.y - P.y) * t );
}

/*
过点(C)作直线垂线(A - B)，垂足H的暴力求法 :
	D = C + (B - A)
	D.Rotate( pi / 2 );
	H = Cross_Point(C , D , A , B);
*/