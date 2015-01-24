program Ural_1143(Input,Output);
const
	MaxN=200;
	S_Left=0;
	S_Right=1;
	MaxValue=MaxLongint div 8;
type
	TIndex=Longint;
	TData=Extended;
	TPoint=array[1..MaxN]of record
		x,y:TData;
	end;
	TDistance=array[1..MaxN,1..MaxN]of TData;
	TDP=array[1..MaxN,1..MaxN,0..1]of TData;
	TPointer=array[1..MaxN]of TIndex;
var
	N:TIndex;
	P:TPoint;
	//Dist:TDistance;
	F:TDP;
	Ptr:TPointer;

function Min(A,B:TData):TData;
begin
	Result:=A;
	if A>B then Result:=B;
end;
function Dist(i,j:TIndex):TData;
begin
	Result:=Sqrt(Sqr(P[i].x-P[j].x)+Sqr(P[i].y-P[j].y));
end;
procedure Main;
var
	i,j,k,l:TIndex;
	Answer:TData;
begin
	Readln(N);
	for i:=1 to N do
	begin
		Readln(P[i].x,P[i].y);
		F[i,i,S_Left]:=0;
		F[i,i,S_Right]:=0;
	end;
	{for i:=1 to N do
		for j:=1 to N do
			Dist[i,j]:=Sqrt(Sqr(P[i].x-P[j].x)+Sqr(P[i].y-P[j].y));}
	Answer:=MaxValue;
	for k:=0 to N-1 do
	begin
		for i:=1 to N do
			Ptr[i]:=(i+k-1) mod N+1;
		for l:=2 to N do
			for i:=1 to N-l+1 do
			begin
				j:=i+l-1;
				F[i,j,S_Left]:=Min(F[i+1,j,S_Left]+Dist(Ptr[i],Ptr[i+1]),F[i+1,j,S_Right]+Dist(Ptr[i],Ptr[j]));
				F[i,j,S_Right]:=Min(F[i,j-1,S_Left]+Dist(Ptr[j],Ptr[i]),F[i,j-1,S_Right]+Dist(Ptr[j],Ptr[j-1]));
			end;
		Answer:=Min(Answer,F[1,N,S_Left]);
	end;
	Writeln(Answer:0:3);
end;
begin
	Main;
end.