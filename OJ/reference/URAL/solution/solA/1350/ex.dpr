program Ural_1350(Input,Output);
const
	MaxN=100;
	MaxK=100;
	MaxNameLen=40;
type
	TIndex=Longint;
	TName=String[MaxNameLen];
	TNames=array[1..MaxN]of TName;
	TCount=array[1..MaxK]of TIndex;
var
	N,M,K:TIndex;
	SafeNum:TIndex;
	SafeName:TNames;
	Unsafe:TCount;

procedure Main;
var
	i,j:TIndex;
	CurNum:TIndex;
	St:TName;
	Safe:Boolean;
begin
	Readln(N);
	for i:=1 to N do
		Readln(St);
	Readln(K);
	Readln(SafeNum);
	for i:=1 to SafeNum do
		Readln(SafeName[i]);
	for i:=1 to K do
	begin
		Readln(CurNum);
		Unsafe[i]:=0;
		while CurNum>0 do
		begin
			Dec(CurNum);
			Readln(St);
			Safe:=false;
			for j:=1 to SafeNum do
				if SafeName[j]=St then
				begin
					Safe:=true;
					Break;
				end;
			if not Safe then Inc(Unsafe[i]);
		end;
	end;
	Readln(M);
	for i:=1 to K do
		if Unsafe[i]=0 then
			Writeln('YES')
		else if SafeNum+Unsafe[i]+M>N then 
		//Safe food(safe)+Cur danger food expect safe food(unsafe)+chosen num(m)>all food(n)
		//there must exist a poisoned food in all food (n)
			Writeln('NO')
		else 
			Writeln('MAYBE');
end;
begin
	Main;
end.