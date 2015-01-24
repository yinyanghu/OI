{
	2005-7-9 By Amber
	Method: DP (Memoried Search)
}
program Ural_1163(Input,Output);
const
	N=8;
	Radii=0.4;
type
	TIndex=Longint;
	TData=Extended;
	TPoint=record
		x,y:TData;
	end;
	TPointSet=array[0..1,1..N]of TPoint;
	TDP=array[0..1,0..1 shl N-1,0..1 shl N-1]of ShortInt; //-1:Unknown; 0:lose; 1:win
	TTransfer=array[0..1,1..N]of record
		Way:TIndex;
		IsHit:array[1..N*2*2]of array[0..1,1..N]of Boolean;
	end;
	TVector=array[0..1,1..N,1..2]of TPoint;
	TState=array[0..1]of TIndex;
var
	F:TDP;
	Point:TPointSet;
	Transfer:TTransfer;
	Vector:TVector;

function Det(A,B:TPoint):TData;
begin
	Result:=A.x*B.y-A.y*B.x;
end;
function Turn(A:TPoint;CosA,SinA:TData):TPoint;
begin
	Result.x:=A.x*CosA-A.y*SinA;
	Result.y:=A.x*SinA+A.y*CosA;
end;
procedure CalcVector(A,B:TPoint;var C,D:TPoint);
var
	CosA,SinA:TData;
	Dist:TData;
begin
	A.x:=B.x-A.x;
	A.y:=B.y-A.y;
	Dist:=Sqr(A.x)+Sqr(A.y);
	CosA:=Sqrt(Dist-Sqr(Radii))/Sqrt(Dist);
	SinA:=Radii/Sqrt(Dist);
	C:=Turn(A,2*Sqr(CosA)-1,2*SinA*CosA);
	D:=Turn(A,2*Sqr(CosA)-1,-2*SinA*CosA);
end;
function InRange(A,B,C:TPoint):Boolean;
begin
	Result:=(Det(A,B)>=0) and (Det(A,C)<=0);
end;
procedure PrecomputeTransfer; 
var
	Cur,Pnt:TIndex;
	i,j,k,p,q:TIndex;
begin
	for Cur:=0 to 1 do
		for Pnt:=1 to N do
			with Transfer[Cur,Pnt] do
			begin
				for i:=0 to 1 do
					for j:=1 to N do
						if not ((Cur=i) and (Pnt=j)) then
							CalcVector(Point[Cur,Pnt],Point[i,j],Vector[i,j,1],Vector[i,j,2]);
				Way:=0;
				for i:=0 to 1 do
					for j:=1 to N do
						if not ((Cur=i) and (Pnt=j)) then
							for k:=1 to 2 do
							begin
								Inc(Way);
								FillChar(IsHit[Way],SizeOf(IsHit[Way]),0);
								for p:=0 to 1 do
									for q:=1 to N do
										if not ((Cur=p) and (Pnt=q)) then
											if InRange(Vector[i,j,k],Vector[p,q,1],Vector[p,q,2]) then
												IsHit[Way][p,q]:=true;
								IsHit[Way][Cur,Pnt]:=true;
							end;
			end;
end;

function DFS(Cur:TIndex;S:TState):Boolean; //Memorized Search. If the current state is winned,it return true
var
	Pnt,i,j,k:TIndex;
	Tmp:TState;
begin
	if F[Cur,S[0],S[1]]>=0 then //If the current state has been searched
	begin
		Result:=(F[Cur,S[0],S[1]]=1);
		Exit;
	end;
	Result:=true;
	F[Cur,S[0],S[1]]:=1;
	for Pnt:=1 to N do
		if (S[Cur] and (1 shl (Pnt-1))>0) then //If checker Pnt exists
			with Transfer[Cur,Pnt] do
				for k:=1 to Way do
				begin
					Tmp:=S;
					for i:=0 to 1 do
						for j:=1 to N do
							if IsHit[k][i,j] and (S[i] and (1 shl (j-1))>0) then
								S[i]:=S[i] xor (1 shl (j-1));
					if not DFS(1-Cur,S) then Exit; //Alpha-Beta Cut
					S:=Tmp;
				end;
	Result:=false;
	F[Cur,S[0],S[1]]:=0;
end;

procedure Main;
var
	i:TIndex;
	S:TState;
begin
	//Read Data
	for i:=1 to N do
		Read(Point[0][i].x,Point[0][i].y);
	Readln;
	for i:=1 to N do
		Read(Point[1][i].x,Point[1][i].y);
	Readln;
	
	//Precompute Transfer
	PrecomputeTransfer;

	//DP
	FillChar(F,SizeOf(F),255);
	S[0]:=1 shl 8-1;
	S[1]:=1 shl 8-1;
	if DFS(0,S) then
		Writeln('RED')
	else
		Writeln('WHITE');
end;
begin
	Main;
end.