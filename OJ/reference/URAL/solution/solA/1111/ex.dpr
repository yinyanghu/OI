program Ural_1111(Input,Output);
const
	MaxN=100;
	Precision=1E-14;
	MaxValue=1E14;
type
	TIndex=Longint;
	TData=Extended;
	TPoint=record
		x,y:TData;
	end;
	TSquare=array[1..4]of TPoint;
	TSquareSet=array[1..MaxN]of TSquare;
	TDistance=array[1..MaxN]of TData;
	TOrder=array[1..MaxN]of TIndex;
var
	N:TIndex;
	P:TPoint;
	S:TSquareSet;
	Order:TOrder;
	Dist:TDistance;

procedure ComputeSquare(i:TIndex);
var
	x,y:TData;
begin
	//diagonal vector (a,b)=p1->p3
	//side vertor = (a+ib)*(cos45+isin45)
	x:=S[i][3].x-S[i][1].x;
	y:=S[i][3].y-S[i][1].y;
	S[i][2].x:=(x-y)/2+S[i][1].x;
	S[i][2].y:=(x+y)/2+S[i][1].y;
	S[i][4].x:=(x+y)/2+S[i][1].x;
	S[i][4].y:=(y-x)/2+S[i][1].y;
end;
procedure SetMin(var A:TData;B:TData);
begin
	if A>B then A:=B;
end;
function GetDistance(A,B:TPoint):TData;
begin
	Result:=Sqrt(Sqr(A.x-B.x)+Sqr(A.y-B.y));
end;
function Det(A,B,C:TPoint):TData;
begin
	Result:=(B.x-A.x)*(C.y-A.y)-(C.x-A.x)*(B.y-A.y);
end;
function GetPoint(i,j:TIndex):TPoint;
begin
	j:=(j+4-1) mod 4+1;
	Result:=S[i][j];
end;
procedure ComputeDistance(i:TIndex);
var
	j:TIndex;
	L:TData;
	Sum,Area:TData;
begin
	L:=GetDistance(S[i][1],S[i][2]);
	Dist[i]:=MaxValue;
	for j:=1 to 4 do
		SetMin(Dist[i],GetDistance(P,S[i][j]));
	Sum:=0;
	for j:=1 to 4 do
	begin
		if Det(GetPoint(i,j),GetPoint(i,j-1),P)*Det(GetPoint(i,j+1),GetPoint(i,j+2),P)<0 then
		begin
			Area:=Abs(Det(P,GetPoint(i,j),GetPoint(i,j+1)));
			SetMin(Dist[i],Area/L);
			Sum:=Sum+Area;
		end;
	end;
	if Abs(Sqrt(Sum/2)-L)<Precision then Dist[i]:=0; //inside
end;
function Compare(i,j:TIndex):TIndex;
var
	D:TData;
begin
	D:=Dist[i]-Dist[j];
	if D>Precision then Result:=1
	else if D<-Precision then Result:=-1
	else Result:=i-j;
end;
procedure Sort;
var
	i,j:TIndex;
	Tmp:TIndex;
begin
	for i:=1 to N-1 do
		for j:=i+1 to N do
			if Compare(Order[i],Order[j])>0 then
			begin
				Tmp:=Order[i];
				Order[i]:=Order[j];
				Order[j]:=Tmp;
			end;
end;
procedure Main;
var
	i:TIndex;
begin
	Readln(N);
	for i:=1 to N do
	begin
		Readln(S[i][1].x,S[i][1].y,S[i][3].x,S[i][3].y);
		ComputeSquare(i);
		Order[i]:=i;
	end;
	Readln(P.x,P.y);
	for i:=1 to N do
		ComputeDistance(i);
	Sort;
	for i:=1 to N do
		Write(Order[i],' ');
	Writeln;
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