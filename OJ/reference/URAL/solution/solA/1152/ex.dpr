{
Greed is wrong. 
So DFS.
If using SET then ,TLE 4 or more sec.
using variable Remain , run time is 0.437sec.
}
program Ural_1152(Input,Output);
const
	MaxValue=MaxLongint;
	MaxN=20;
type
	TIndex=Longint;
	TData=array[0..MaxN-1]of TIndex;
var
	N:TIndex;
	D:TData;
	Min:TIndex;
procedure DFS(Sum,Remain:TIndex);
var
	l,r,i:TIndex;
	TmpL,TmpR,TmpM:TIndex;
begin
	if Sum>=Min then Exit;
	if Remain=0 then 
	begin
		Min:=Sum;
		Exit;
	end;
	for i:=0 to N-1 do
	begin
		l:=(i-1+N) mod N;
		r:=(i+1) mod N;
		if (D[l]=0)and (D[r]=0) and (D[i]=0) then Continue;
		TmpL:=D[l];
		D[l]:=0;
		TmpR:=D[r];
		D[r]:=0;
		TmpM:=D[i];
		D[i]:=0;
		DFS(Sum+Remain-TmpL-TmpR-TmpM,Remain-TmpL-TmpR-TmpM);
		D[l]:=TmpL;
		D[r]:=TmpR;
		D[i]:=TmpM;
	end;
end;
procedure Main;
var
	i:TIndex;
	Sum:TIndex;
begin
	Readln(N);
	Sum:=0;
	for i:=0 to N-1 do
	begin
		Read(D[i]);
		Inc(Sum,D[i]);
	end;
	Readln;
	Min:=MaxValue;
	DFS(0,Sum);
	Writeln(Min);
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