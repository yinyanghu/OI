program Ural_1065(Input,Output);
const
	MaxN=50;
	MaxM=1000;
	MaxValue=MaxLongint div 8;
type
	TIndex=Longint;
	TPoint=record
		x,y:TIndex;
	end;
	TData=Extended;
	TPointSet=array[1..MaxN]of TPoint;
	TMonument=array[1..MaxM]of TPoint;
	TDistance=array[1..MaxN,1..MaxN]of TData;
	TCan=array[1..MaxN,1..MaxN]of Boolean;
	TDP=array[0..MaxN-1]of TData;
var
	N,M:TIndex;
	P:TPointSet;
	Q:TMonument;
	F:TDP;
	Dist:TDistance;
	Can:TCan;

function Loop(x:TIndex):TIndex;
begin
	while x>N do Dec(x,N);
	Result:=x;
end;
function Det(A,B,C:TPoint):TIndex;
begin
	Result:=(B.x-A.x)*(C.y-A.y)-(B.y-A.y)*(C.x-A.x);
end;
procedure Main;
var
	i,j,k,s,t:TIndex;
	Min:TData;
begin
	Readln(N,M);
	for i:=1 to N do
		with P[i] do
			Readln(x,y);
	for i:=1 to M do
		with Q[i] do
			Readln(x,y);
	for i:=1 to N-1 do
		for j:=i+1 to N do
		begin
			Dist[i,j]:=Sqrt(Sqr(P[i].x-P[j].x)+Sqr(P[i].y-P[j].y));
			Dist[j,i]:=Dist[i,j];
			Can[i,j]:=true;
			for k:=1 to M do
				if Det(P[i],P[j],Q[k])>=0 then
				begin
					Can[i,j]:=false;
					Break;
				end;
			Can[j,i]:=true;
			for k:=1 to M do
				if Det(P[j],P[i],Q[k])>=0 then
				begin
					Can[j,i]:=false;
					Break;
				end;
		end;
	Min:=MaxValue;
	if M=0 then
	begin
		for i:=1 to N-2 do
			for j:=i+1 to N-1 do
				for k:=j+1 to N do
					if (Min>Dist[i,j]+Dist[j,k]+Dist[k,i]) and (Det(P[i],P[j],P[k])<>0) then
						Min:=Dist[i,j]+Dist[j,k]+Dist[k,i];
		Writeln(Min:0:2);
		Exit;
	end;
	for k:=1 to N do
	begin
		F[0]:=0;
		for i:=1 to N-1 do
		begin
			F[i]:=MaxValue;
			t:=Loop(k+i);
			for j:=i-1 downto 0 do
			begin
				s:=Loop(k+j);
				if not Can[s,t] then Break;
				if F[i]>F[j]+Dist[s,t] then
					F[i]:=F[j]+Dist[s,t];
			end;
		end;
		for i:=1 to N-1 do
		begin
			s:=Loop(k+i);
			if Can[s,k] and (Min>F[i]+Dist[s,k]) then
				Min:=F[i]+Dist[s,k];
		end;
	end;
	Writeln(Min:0:2);
end;
begin
	Main;
end.