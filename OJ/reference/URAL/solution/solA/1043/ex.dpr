{$N+}
program Ural_1043(Input,Output);
type
	TIndex=Longint;
	TData=Extended;
	TPoint=record
		x,y:TData;
	end;
	TLimit=array[0..3]of TData;

function Min(const A, B: TData): TData;
begin
	if A < B then Result := A
	else Result := B;
end;
function Max(const A, B: TData): TData;
begin
	if A > B then Result := A
	else Result := B;
end;
function Ceil(const X: TData):TIndex;
begin
	Result := TIndex(Trunc(X));
	if Frac(X) > 0 then Inc(Result);
end;
function Floor(const X: TData):TIndex;
begin
	Result := TIndex(Trunc(X));
	if Frac(X) < 0 then Dec(Result);
end;
function Det(A1,B1,A2,B2:TData):TData;
begin
	Result:=A1*B2-B1*A2;
end;
procedure SolveLinear(A1,B1,C1,A2,B2,C2:TData;var X,Y:TData);
begin
	X:=Det(C1,B1,C2,B2)/Det(A1,B1,A2,B2);
	Y:=Det(A1,C1,A2,C2)/Det(A1,B1,A2,B2);
end;
function GetDisctance(A,B:TPoint):TData;
begin
	Result:=Sqrt(Sqr(A.x-B.x)+Sqr(A.y-B.y));
end;
procedure Main;
var
	i:TIndex;
	sA,sB,tA,tB:TData;
	A,B,C,P,O:TPoint;
	Limit:TLimit;
	radii:TData;
begin
	Readln(A.x,A.y);
	Readln(B.x,B.y);
	Readln(C.x,C.y);
	//(y-my)/(x-mx)*(ya-yc)/(xa-xc)=-1, m is the middle of a-c
	sA:=A.x-C.x;
	sB:=A.y-C.y;
	tA:=B.x-C.x;
	tB:=B.y-C.y;
	SolveLinear(sA*2,sB*2,sA*(A.x+C.x)+sB*(A.y+C.y),
		tA*2,tB*2,tA*(B.x+C.x)+tB*(B.y+C.y),O.x,O.y); //keep precision,both side of equaltion*2.
	
	radii:=GetDisctance(C,O);
	Limit[0]:=Max(A.x,B.x);
	Limit[1]:=Max(A.y,B.y);
	Limit[2]:=Min(A.x,B.x);
	Limit[3]:=Min(A.y,B.y);
	for i:=0 to 3 do
	begin
		P.x:=O.x;
		P.y:=O.y;
		case i of 
			0:P.x:=O.x+radii;
			1:P.y:=O.y+radii;
			2:P.x:=O.x-radii;
			3:P.y:=O.y-radii;
		end;
		if (Det(A.x-C.x,A.y-C.y,B.x-C.x,B.y-C.y)*Det(P.x-C.x,P.y-C.y,B.x-C.x,B.y-C.y)<=0)
			or (Det(B.x-C.x,B.y-C.y,A.x-C.x,A.y-C.y)*Det(P.x-C.x,P.y-C.y,A.x-C.x,A.y-C.y)<=0) then
			//P on ACB, iff (CA*CB)(CP*CB)<=0 or (CB*CA)(CP*CA)<=0
			case i of 
				0:Limit[0]:=P.x;
				1:Limit[1]:=P.y;
				2:Limit[2]:=P.x;
				3:Limit[3]:=P.y;
			end;
	end;
	
	Writeln((Ceil(Limit[1])-Floor(Limit[3]))*(Ceil(Limit[0])-Floor(Limit[2])));
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