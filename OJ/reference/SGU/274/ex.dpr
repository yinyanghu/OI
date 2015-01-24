{
	Author: Amber
	Method: Simulate
	Notice: Some detail such as Word isn't empty etc.
}
program SGU_274(Input,Output);
type
	TIndex=Longint;

function LeftPos(Ch:Char;Cur:string):TIndex;
begin
	Result:=Pos(Ch,Cur);
end;

function RightPos(Ch:Char;Cur:string):TIndex;
var 
	i:TIndex;
begin
	Result:=0;
	for i:=Length(Cur) downto 1 do
		if Ch=Cur[i] then
		begin
			Result:=i;
			Break;
		end;
end;

function IsLetter(Cur:Char):Boolean;
begin
	Result:=(Cur in ['A'..'Z','a'..'z']);
end;

function IsSymbol(Cur:Char):Boolean;
begin
	Result:=(Cur in ['A'..'Z','a'..'z','0'..'9','_','-']);
end;

function IsWord(Cur:String):Boolean;
begin
	Result:=false;
	if Cur='' then Exit; //WA: Word mustn't be empty
	while Cur<>'' do
	begin
		if not IsSymbol(Cur[1]) then Exit;
		Delete(Cur,1,1);
	end;
	Result:=true;
end;

function IsPrefix(Cur:String):Boolean;
var 
	P:TIndex;
begin
	Result:=false;
	P:=RightPos('.',Cur);
	if P>0 then 
	begin
		if not IsPrefix(Copy(Cur,1,P-1)) then Exit;
		Delete(Cur,1,P);
	end;
	if not IsWord(Cur) then Exit;
	Result:=true;
end;

function IsDomain(Cur:String):Boolean;
begin
	Result:=false;
	if not (Length(Cur) in [2,3]) then Exit;
	while Cur<>'' do
	begin
		if not IsLetter(Cur[1]) then Exit;
		Delete(Cur,1,1);
	end;
	Result:=true;
end;

function IsSuffix(Cur:String):Boolean;
var 
	P:TIndex;
begin
	Result:=false;
	P:=RightPos('.',Cur);
	if P=0 then Exit;
	if not IsPrefix(Copy(Cur,1,P-1)) then Exit;
	Delete(Cur,1,P);
	if not IsDomain(Cur) then Exit;
	Result:=true;
end;

function IsAddress(Cur:String):Boolean;
var 
	P:TIndex;
begin
	Result:=false;
	P:=LeftPos('@',Cur);
	if P=0 then Exit;
	if not IsPrefix(Copy(Cur,1,P-1)) then Exit;
	Delete(Cur,1,P);
	if not IsSuffix(Cur) then Exit;
	Result:=true;
end;

procedure Main;
var 
	N:TIndex;
	St:String;
begin
	Readln(N);
	while N>0 do
	begin
		Dec(N);
		Readln(St);
		if IsAddress(St) then 
			Writeln('YES')
		else
			Writeln('NO');
	end;
end;
begin
	Main;
end.