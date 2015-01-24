
{
	Author: Amber
	Method: Geometry Count
	Clarity:
		It's a classical problem in geometry:
		Query whether point R(x,y) is inside a simple polygon.
		
		for each segment P(x1,y1)-Q(x2,y2) here x1<=x2
			if x1<=x<x2 then //notice second symbol is "<"!
				if det(PQ,PR)>0 then 
					count++
		if odd(count) then "inside" else "outside"
		Do something special for "border" case.
		
	Complexity: O(N)
}
program SGU_124(Input,Output);
const
	MaxN=10000;
type
	TIndex=Longint;
	TPoint=record
		x,y:TIndex;
	end;
	TSegment=record
		P,Q:TPoint;
	end;
	TSegmentSet=array[1..MaxN]of TSegment;
var
	N:TIndex;
	S:TSegmentSet;
	R:TPoint;
function Det(A,B,C:TPoint):TIndex;
begin
	Result:=(B.x-A.x)*(C.y-A.y)-(B.y-A.y)*(C.x-A.x);
end;
function Main:AnsiString;
var
	i:TIndex;
	DetVal:TIndex;
	Count:TIndex;
begin
	Readln(N);
	for i:=1 to N do
		with S[i] do
		begin
			Readln(P.x,P.y,Q.x,Q.y);
			if P.x>Q.x then 
			begin
				R:=P;
				P:=Q;
				Q:=R;
			end;
		end;
	Readln(R.x,R.y);
	Result:='BORDER';
	Count:=0;
	for i:=1 to N do
		with S[i] do
			if (P.x<=R.x) and (R.x<Q.x) then
			begin
				DetVal:=Det(P,Q,R);
				if DetVal>0 then 
					Inc(Count)
				else if DetVal=0 then 
					Exit;
			end
			else if (P.x=R.x) and (R.x=Q.x) and ((P.y-R.y)*(Q.y-R.y)<=0) then 
				Exit;
	if Odd(Count) then 
		Result:='INSIDE'
	else 
		Result:='OUTSIDE';
end;
begin
	Writeln(Main);
end.