program Ural_1233(Input,Output);
type
	TIndex=Longint;
	TData=Int64;
procedure Main;
var
	i:TIndex;
	K,M:TData;
	Power,R:TData;
	St:String;
begin
	Readln(K,M);
	Str(K,St);
	Power:=1;
	R:=0;
	for i:=1 to Length(St) do
	begin
		R:=R*10+Ord(St[i])-Ord('0');
		Dec(M,R-Power+1);
		Power:=Power*10;
	end;
	if M<0 then 
	begin
		Writeln(0);
		Exit;
	end;
	while M>0 do
	begin
		R:=R*10;
		if R-Power=0 then 
		begin
			Writeln(0);
			Exit;
		end;
		if M<=R-Power then 
		begin
			R:=Power+M-1;
			Break;
		end;
		Dec(M,R-Power);
		Power:=Power*10;
	end;
	Writeln(R);
end;
begin
	Main;
end.