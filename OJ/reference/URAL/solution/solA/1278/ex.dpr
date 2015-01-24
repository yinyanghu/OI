program Ural_1278(Input,Output);
type
	TIndex=Longint;
	TCall=array[0..99]of TIndex;
var
	Call:TCall;
procedure Main;
var
	N,IP:TIndex;
	i:TIndex;
begin
	FillChar(Call,SizeOf(Call),0);
	Readln(N);
	IP:=0;
	while N>1 do
	begin
		if Odd(N) then Inc(IP);
		Call[IP]:=IP+1;
		Inc(IP);
		N:=N shr 1;
	end;
	for i:=0 to IP-1 do
	begin
		if Call[i]=0 then Call[i]:=IP;
		Writeln('CALL ',Call[i]);
	end;
	Writeln('BELL&RET');
end;
begin
	Main;
end.