//Simulate
program Ural_1370(Input,Output);
const
	MaxSize=10;
type
	TIndex=Longint;
	TData=array[1..MaxSize]of Byte;
var
	N,M:TIndex;
	D:TData;

procedure Main;
var
	i:TIndex;
	X:TIndex;
begin
	Readln(N,M);
	M:=(M-1) mod N+1;
	if M+10>N then
	begin
		for i:=1 to M+10-N do Readln(D[i]);
		for i:=M+10-N+1 to M do Readln(X);
		for i:=M+1 to N do
		begin
			Readln(X);
			Write(X);
		
		end;
		for i:=1 to M+10-N do Write(D[i]);
	end
	else 
	begin
		for i:=1 to M do Readln(X);
		for i:=1 to 10 do
		begin
			Readln(X);
			Write(X);
		end;
	end;
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