{
	the online algorithm for intersection of half-plane
	look up the article in 2002 for detail
}
program Ural_1062(Input,Output);
const
	MaxP=100+4;
	MaxN=100;
	Infinite=1E10;
	Epsilon=1E-10; //if it's 1e-7 or over, it will be got WA 
type
	TIndex=Longint;
	TData=Extended;
	TPoint=record
		X,Y:TData;
	end;
	TPointSet=array[1..MaxP]of TPoint;
	TSpeedSet=array[1..MaxN]of record
		U,V,W:TData;
	end;
var
	N,M:TIndex;
	Speed:TSpeedSet;
	P:TPointSet;
function Intersect(S,T:TPoint;A,B,C:TData):TPoint;
var
	U,V:TData;
begin
	U:=Abs(A*S.X+B*S.Y+C);
	V:=Abs(A*T.X+B*T.Y+C);
	Result.X:=(S.X*V+T.X*U)/(U+V);
	Result.Y:=(S.Y*V+T.Y*U)/(U+V);
end;
function Sign(X:TData):TIndex;
begin
	if Abs(X)<Epsilon then Result:=0
	else if X<0 then Result:=-1
	else Result:=1;
end;
procedure Cut(A,B,C:TData);
var
	i:TIndex;
	Prev,Next:TIndex;
	NewM:TIndex;
	Q:TPointSet;
begin
	NewM:=0;
	if (A=0)and(B=0)and(C>=0) then
	begin
		M:=0;
		Exit;
	end;
	for i:=1 to M do
	begin
		if Sign(A*P[i].X+B*P[i].Y+C)<=0 then 
		begin
			Inc(NewM);
			Q[NewM]:=P[i];
		end
		else
		begin
			Prev:=(i-1+M-1)mod M+1;
			if Sign(A*P[Prev].X+B*P[Prev].Y+C)=-1 then
			begin
				Inc(NewM);
				Q[NewM]:=Intersect(P[Prev],P[i],A,B,C);
			end;
			Next:=(i+1+M-1)mod M+1;
			if Sign(A*P[Next].X+B*P[Next].Y+C)=-1 then 
			begin
				Inc(NewM);
				Q[NewM]:=Intersect(P[i],P[Next],A,B,C);
			end;
		end;
	end;
	M:=NewM;
	P:=Q;
end;
procedure Main;
var
	i,j:TIndex;
begin
	Readln(N);
	for i:=1 to N do
		with Speed[i] do
			Readln(U,V,W);
	for i:=1 to N do
	begin
		M:=4;
		P[1].X:=0;
		P[1].Y:=0;
		P[2].X:=Infinite;
		P[2].Y:=0;
		P[3].X:=Infinite;
		P[3].Y:=Infinite;
		P[4].X:=0;
		P[4].Y:=Infinite;
		for j:=1 to N do
			if i<>j then
			begin
				Cut(1/Speed[i].U-1/Speed[j].U,1/Speed[i].V-1/Speed[j].V,1/Speed[i].W-1/Speed[j].W);
				if M<3 then Break;
			end;
		if M>=3 then 
			Writeln('Yes')
		else
			Writeln('No');
	end;
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