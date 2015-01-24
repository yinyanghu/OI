{
	Method: there exists a way to operate iff in each connected component, the number of edges is even
}
program Ural_1320(Input,Output);
const
	MaxN=1000;
type
	TIndex=Longint;
	TDisjointSet=array[1..MaxN]of TIndex;
	TComponentCount=array[1..MaxN]of TIndex;
var
	F:TDisjointSet;
	C:TComponentCount;
function Find(x:TIndex):TIndex;
begin
	if F[x]<0 then Result:=x
	else
	begin
		F[x]:=Find(F[x]);
		Result:=F[x];
	end;
end;
procedure Merge(x,y:TIndex);
begin
	x:=Find(x);
	y:=Find(y);
        if x=y then Exit;
	Inc(C[x],C[y]);
	C[y]:=0;
	F[y]:=x;
end;
procedure Main;
var
	i:TIndex;
	x,y:TIndex;
begin
	FillChar(F,SizeOf(F),255);
	FillChar(C,SizeOf(C),0);
	while not SeekEof do
	begin
		Readln(x,y);
		Merge(x,y);
		Inc(C[Find(y)]);
	end;
	for i:=1 to MaxN do
		if C[i]>0 then 
			if Odd(C[i]) then 
			begin
				Writeln(0);
				Exit;
			end;
	Writeln(1);
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