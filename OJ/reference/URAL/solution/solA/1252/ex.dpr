{
	
	Notice: consider both of increasing and decreasing
	Method: Because "exactly" K other stones between them, GCD all deltas which is the differ of the index of element in original order and that in sorted order
		if all deltas are zero then result is n-1
}
program Ural_1252(Input,Output);
const
	MaxRange=130000;
type
	TIndex=Longint;
	TFlag=array[1..MaxRange]of TIndex;
var
	N:TIndex;
	Flag:TFlag;
function GCD(A,B:TIndex):TIndex;
var
	R:TIndex;
begin	
	if A<B then 
	begin 
		Result:=GCD(B,A);
		Exit;
	end;
	while B>0 do
	begin
		R:=A mod B;
		A:=B;
		B:=R;
	end;
	Result:=A;
end;
procedure Main;
var
	i:TIndex;
	Index:TIndex;
	GCD_Value,Cur,Max,X:TIndex;
begin
	Readln(N);
	FillChar(Flag,SizeOf(Flag),0);
	for i:=1 to N do
	begin
		Readln(X);
		Flag[X]:=i;
	end;
	//Increase 
	GCD_Value:=0;
	Index:=0;
	for i:=1 to MaxRange do
		if Flag[i]>0 then
		begin
			Inc(Index);
			Cur:=Abs(Index-Flag[i]);
			if Cur=0 then Continue;
			if GCD_Value=0 then GCD_Value:=Cur
			else GCD_Value:=GCD(GCD_Value,Cur);
		end;
	if GCD_Value=0 then GCD_Value:=N;
	Max:=GCD_Value;

	//Decrease
	GCD_Value:=0;
	Index:=0;
	for i:=MaxRange downto 1 do
		if Flag[i]>0 then
		begin
			Inc(Index);
			Cur:=Abs(Index-Flag[i]);
			if Cur=0 then Continue;
			if GCD_Value=0 then GCD_Value:=Cur
			else GCD_Value:=GCD(GCD_Value,Cur);
		end;
	if GCD_Value=0 then GCD_Value:=N;
	if GCD_Value>Max then Max:=GCD_Value;

	Writeln(Max-1);
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