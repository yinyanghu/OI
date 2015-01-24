{
	check(a,b,p,q) //p>=q
	let the diagonal of the rectangle with edge a,b be L
	let the rectangle with edge p,q be Rect
	let the center of the rectangle be O
	Discuss at which points the circle O whose radii is L intersect Rect.
}
program Ural_1234(Input,Output);
const
	Epsilon=1E-15;
type
	TData=Extended;
function ArcCos(X:TData):TData;
begin
	if X=0 then Result:=Pi/2
	else
	begin
		Result:=ArcTan(Sqrt(1-Sqr(X))/X);
		if Result<0 then Result:=Result+Pi;
	end;
end;
function OverZero(X:TData):Boolean;
begin
	Result:=(X>=-Epsilon);
end;
function Check(A,B,P,Q:TData):Boolean;//p>=q
var
	Ls,Theta,Alpha,Beta:TData;
begin
	Ls:=Sqr(A/2)+Sqr(B/2);

	//get min angle between diagonal
	Theta:=ArcCos(Sqrt(Sqr(A/2)/Ls));
	if Theta>ArcCos(Sqrt(Sqr(B/2)/Ls)) then Theta:=ArcCos(Sqrt(Sqr(B/2)/Ls));
	Theta:=2*Theta;

	if Ls<=Sqr(Q/2) then //see figure1.gsp
		Result:=true
	else if (Sqr(Q/2)<Ls) and (Ls<=Sqr(P/2)) then //see figure2.gsp 
	// the rectangle intersect the circle O whose radii is sqrt(ls) at 4 point
		Result:=(Theta<=ArcCos(1-Sqr(Q)/2/Ls))
	else if (Sqr(P/2)<Ls) and (Ls<=Sqr(P/2)+Sqr(Q/2)) then //see figure3.gsp
	// the rectangle intersect the circle O whose radii is sqrt(ls) at 8 point
	begin
		Alpha:=2*ArcCos(Sqrt(1-Sqr(P/2)/Ls));
		Beta:=2*ArcCos(Sqrt(Sqr(Q/2)/Ls));
		Result:=(OverZero(Theta-(Alpha+Beta)/2) and OverZero(Alpha-Theta)) or OverZero((Alpha-Beta)/2-Theta);
		Alpha:=2*ArcCos(Sqrt(1-Sqr(Q/2)/Ls));
		Beta:=2*ArcCos(Sqrt(Sqr(P/2)/Ls));
		Result:=Result or (OverZero(Theta-(Alpha+Beta)/2) and OverZero(Alpha-Theta)) or OverZero((Alpha-Beta)/2-Theta);
	end
	else //see figure4.gsp
		Result:=false;
end;
procedure Main;
var
	A,B,C,D,E:TData;
	T:TData;
begin
	Readln(A,B,C,D,E);
	if D<E then 
	begin
		T:=D;
		D:=E;
		E:=T;
	end;
	if Check(A,B,D,E) or Check(A,C,D,E) or Check(B,C,D,E) then
		Writeln('YES')
	else
		Writeln('NO');
end;
begin
{$IFNDEF ONLINE_JUDGE}
	Assign(Input,'i.txt');
	Reset(Input);
	Assign(Output,'o.txt');
	Rewrite(Output);
{$ENDIF}
	Main;
{$IFNDEF ONLINE_JUDGE}
	Close(Input);
	Close(Output);
{$ENDIF}
end.