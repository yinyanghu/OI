{
	Author: Amber
	Method: Math
	Clarity:
		简单，但麻烦的题，考虑问题要周全。
		
		1.先把A或B为0的情况排除。
		2.用extended_gcd找到一组(x0,y0), s.t. A*x0+B*y0=D, D=GCD(A,B)
		3.方程有解冲要于D|C
		4.A=A/D,B=B/D,C=C/D
		5.x0=x0*(-C),y0=y0*(-C)
		6.把 x=x0+t*B, y=y0-t*A 带入 x1<=x<=x2, y1<=y<=y2
			x1-x0<=t*B<=x2-x0
			y0-y2<=t*A<=y0-y1
			把A,B除过去时要注意是否变号
		7.得到t的范围,输出
	Notice:
		1.做A,B不等式除法时要注意是否变号
		2.不要吝惜Int64
}
program SGU_106(Input,Output);
type
	TIndex=Int64;
procedure Swap(var A,B:TIndex);
var
	T:TIndex;
begin
	T:=A;
	A:=B;
	B:=T;
end;
function Floor(A,B:TIndex):TIndex;
begin
	if B<0 then 
	begin
		A:=-A;
		B:=-B;
	end;
	Result:=A div B+Ord((A>0) and (A mod B<>0));
end;
function Ceil(A,B:TIndex):TIndex;
begin
	if B<0 then 
	begin
		A:=-A;
		B:=-B;
	end;
	Result:=A div B-Ord((A<0) and (A mod B<>0));
end;
function Max(A,B:TIndex):TIndex;
begin
	if A>B then Result:=A
	else Result:=B;
end;
function Min(A,B:TIndex):TIndex;
begin
	if A<B then Result:=A
	else Result:=B;
end;
function Extended_GCD(A,B:TIndex;var X,Y:TIndex):TIndex;
begin
	if Abs(A)<Abs(B) then 
		Result:=Extended_GCD(B,A,Y,X)
	else if B=0 then
	begin
		Result:=A;
		X:=1;
		Y:=0;
	end
	else
	begin
		Result:=Extended_GCD(B,A mod B,Y,X);
		Y:=Y-A div B*X;
	end;
end;
procedure Main;
var
	A,B,C,D,X0,Y0,X1,X2,Y1,Y2,T1,T2:TIndex;
begin
	Read(A,B,C,X1,X2,Y1,Y2);
	if B<0 then Swap(X1,X2); //变号 
	if A<0 then Swap(Y1,Y2); //变号
	if (A=0) and (B=0) then
		if C=0 then 
			Writeln((X2-X1+1)*(Y2-Y1+1))
		else 
			Writeln(0)
	else if A=0 then
		if (C mod B=0) and (Y1<=-C div B) and (-C div B<=Y2) then 
			Writeln(1)
		else 
			Writeln(0)
	else if B=0 then
		if (C mod A=0) and (X1<=-C div A) and (-C div A<=X2) then 
			Writeln(1)
		else 
			Writeln(0)
	else
	begin
		D:=Extended_GCD(A,B,X0,Y0);
		if C mod D<>0 then
		begin
			Writeln(0);
			Exit;
		end;
		if D<0 then //令D为正,这样A,B的符号就不变，不用再次变号
		begin
			X0:=-X0;
			Y0:=-Y0;
			D:=-D;
		end;
		A:=A div D;
		B:=B div D;
		C:=C div D;
		X0:=-X0*C;
		Y0:=-Y0*C;
		T1:=Max(Floor(X1-X0,B),Floor(Y0-Y2,A));
		T2:=Min(Ceil(X2-X0,B),Ceil(Y0-Y1,A));
		if T1>T2 then
			Writeln(0)
		else
			Writeln(T2-T1+1);
	end;
end;
begin
	Main;
end.