{
	Author: Amber
	Method: Geometry+Data processing
	Clarity:
		Problem is hard to understand.
		Given set R, N=|R|, K
		Maximize and minimize GotArea(A) for all A s.t. Area(A)=max and |A|=K.
		Area(A) is the area summary of each x in A.
		GotArea(A) is the area summary of each x in A which can be cut.
		
		Maintain a orderly ranklist for first K elements.
		Let S is the last of ranklist.
		Keeping Area(ranklist)=max, replace S by all x that x's area is S and find maximum and minimum of GotArea.
}
program SGU_267(Input,Output);
const
	MaxN=1000;
	MaxK=10;
	MaxValue=MaxLongint;
type
	TIndex=Longint;
	TPoint=record
		x,y:TIndex;
	end;
	TArea=array[1..MaxN]of TIndex;
	TValid=array[1..MaxN]of Boolean;
	TRank=array[1..MaxK+1]of TIndex;
	FCompare=function (A,B:TIndex):TIndex;
var
	N,K:TIndex;
	Area:TArea;
	Valid:TValid;
	Rank,Min,Max:TRank;
	
procedure Swap(var A,B:TPoint);
var
	T:TPoint;
begin
	T:=A;
	A:=B;
	B:=T;
end;
function Det(const A,B,C:TPoint):TIndex;
begin
	Result:=(B.x-A.x)*(C.y-A.y)-(C.x-A.x)*(B.y-A.y);
end;
function Dot(const A,B,C:TPoint):TIndex;
begin
	Result:=(B.x-A.x)*(C.x-A.x)+(B.y-A.y)*(C.y-A.y);
end;
function Compare_Max(const A,B:TIndex):TIndex;
begin
	Result:=A-B;
end;
function Compare_Min(const A,B:TIndex):TIndex;
begin
	Result:=B-A;
end;
procedure Update(const S:TIndex;var Rank:TRank;const Num:TIndex;const Compare:FCompare);
var
	i:TIndex;
begin
	for i:=1 to Num do
		if Compare(S,Rank[i])>0 then
		begin
			Move(Rank[i],Rank[i+1],SizeOf(TIndex)*(Num-i));
			Rank[i]:=S;
			Break;
		end;
end;
procedure Main;
var
	i:TIndex;
	A,B,C,D,P,Q,M:TPoint;
	BaseSum,Sum:TIndex;
	T:TIndex;
begin
	Readln(N,K);
	for i:=1 to K do
		Rank[i]:=-1;
	for i:=1 to N do
	begin
		Readln(A.x,A.y,B.x,B.y,C.x,C.y,D.x,D.y,P.x,P.y,Q.x,Q.y);
		if (Dot(C,A,B)=0) and (Dot(D,A,B)=0) then
			Swap(B,C)
		else if (Dot(B,A,D)=0) and (Dot(C,A,D)=0) then
			Swap(D,C);
		M.x:=A.x+C.x;
		M.y:=A.y+C.y;
		P.x:=P.x*2;
		P.y:=P.y*2;
		Q.x:=Q.x*2;
		Q.y:=Q.y*2;
		Area[i]:=Abs(Det(A,B,D));
		Valid[i]:=not ((Det(M,P,Q)=0) and (Dot(M,P,Q)>=0));
		Update(Area[i],Rank,K,@Compare_Max);
	end;
	T:=0;
	repeat
		Inc(T);
	until Rank[T]=Rank[K];
	for i:=1 to K-T+1 do
	begin
		Min[i]:=MaxValue;
		Max[i]:=-1;
	end;
	BaseSum:=0;
	for i:=1 to N do
		if Area[i]=Rank[K] then
		begin
			Update(Ord(Valid[i])*Area[i],Min,K-T+1,@Compare_Min);
			Update(Ord(Valid[i])*Area[i],Max,K-T+1,@Compare_Max);
		end
		else if Area[i]>Rank[K] then
			Inc(BaseSum,Ord(Valid[i])*Area[i]);
	Sum:=BaseSum;
	for i:=1 to K-T+1 do
		Inc(Sum,Min[i]);
	Write(Sum/2:0:3,' ');
	Sum:=BaseSum;
	for i:=1 to K-T+1 do
		Inc(Sum,Max[i]);
	Writeln(Sum/2:0:3);
end;
begin
	Main;
end.