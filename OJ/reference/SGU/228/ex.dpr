{
	Auther: Amber
	Method: Geometry 
	Clarity:
		已知正n边形的两个点与他们的编号,求正n边形.
		主要就是找圆心.
		注意方向的处理.
	Complexity: O(N)
}
program SGU_228(Input,Output);
const
	MaxN=150;
type
	TIndex=Longint;
	TData=Extended;
	TPoint=record
		x,y:TData;
	end;
	TPointSet=array[1..MaxN]of TPoint;
var
	N:TIndex;
	P:TPointSet;

function Cot(x:TData):TData; //x<>0
begin
	Result:=Cos(x)/Sin(x);
end;

function ArcTanPro(x,y:TData):TData;	//note 1:when y=0 exist two state x>0 and x<0
begin
	if (y=0)and (x>0) then Result:=Pi/2
	else if (y=0)and (x<0) then Result:=-Pi/2
	else Result:=ArcTan(x/y);
end;

function FormatPro(x:TData):TData;	//note 2:it will print "-0.000000" without this function
begin
	Result:=x;
	if Abs(x)<1E-7 then Result:=0;
end;

procedure Main;
var
	i:TIndex;
	A,B,F,T:TIndex;
	M,O,PA,PB,PT:TPoint;
	Alpha:TData;
	D,L,R:TData;
begin
	Readln(N,A,B);
	Readln(PA.x,PA.y);
	Readln(PB.x,PB.y);
	if A>B then //keep A<B
	begin
		T:=A;
		A:=B;
		B:=T;
		PT:=PA;
		PA:=PB;
		PB:=PT;
	end;

	F:=A;
	if 2*(B-A)>N then //keep A to B <=Pi
	begin
		F:=B;
		B:=N-(B-A)+1;
		A:=1;
		PT:=PA;
		PA:=PB;
		PB:=PT;
	end;
	D:=Sqrt(Sqr(PA.x-PB.x)+Sqr(PA.y-PB.y));
	R:=D/2/Sin(Pi*(B-A)/N);
	L:=D/2*Cot(Pi*(B-A)/N);
	Alpha:=ArcTanPro(PB.x-PA.x,PA.y-PB.y);
	M.x:=(PA.x+PB.x)/2;
	M.y:=(PA.y+PB.y)/2;
	O.x:=M.x+L*Cos(Alpha);
	O.y:=M.y+L*Sin(Alpha);
	if (PB.x-PA.x)*(O.y-PA.y)-(PB.y-PA.y)*(O.x-PA.x)>0 then //keep Det(Vector(PA,PB),Vector(PA,O)<=0
	begin
		O.x:=M.x-L*Cos(Alpha);
		O.y:=M.y-L*Sin(Alpha);
	end;

	Alpha:=ArcTanPro(PA.y-O.y,PA.x-O.x);
	if PA.x<O.x then Alpha:=Alpha+Pi;  //note 3: if vector in Quadrant II, Quadrant III but the range of arctan in QI,QIV
	for i:=0 to N-1 do
		with P[(F+i-1) mod N+1] do
		begin
			x:=O.x+R*Cos(Alpha);
			y:=O.y+R*Sin(Alpha);
			Alpha:=Alpha-2*Pi/N;
		end;
	for i:=1 to N do
		Writeln(FormatPro(P[i].x):0:6,' ',FormatPro(P[i].y):0:6);
end;
begin
	Main;
end.