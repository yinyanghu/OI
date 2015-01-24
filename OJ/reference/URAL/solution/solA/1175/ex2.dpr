{
	×·¸Ï¼¼Êõ
}
program Ural_1175(Input,Output);
type
	TIndex=Longint;
	TState=record
		X1,X2:TIndex;
	end;
var
	A1,A2,A3,A4,B1,B2,C:TIndex;
	S:TState;

procedure Transfer(var P:TState);
var
	T:TIndex;
begin
	with P do
	begin
		T:=A1*X1*X2+A2*X1+A3*X2+A4;
		//if (T>B1) and (T>B2) then Dec(T,((T-B2-1) div C+1)*C); //This is slow than following.
		if T>B1 then
			while T>B2 do
				Dec(T,C);
		X1:=X2;
		X2:=T;
	end;
end;
function IsEqual(const A,B:TState):Boolean;
begin
	Result:=((A.X1=B.X1) and (A.X2=B.X2));
end;
procedure Main;
var
	A,B:TState;
	i:TIndex;
	Start,Loop:TIndex;
begin
	Read(A1,A2,A3,A4,B1,B2,C,S.X1,S.X2);
	A:=S;
	B:=S;
	repeat
		Transfer(A);
		Transfer(B);
		Transfer(B);
	until IsEqual(A,B);
	Loop:=0;
	repeat
		Inc(Loop);
		Transfer(A);
	until IsEqual(A,B);
	A:=S;
	for i:=1 to Loop do
		Transfer(A);
	B:=S;
	Start:=0;
	while not IsEqual(A,B) do 
	begin
		Inc(Start);
		Transfer(A);
		Transfer(B);
	end;
	Writeln(Start+1,' ',Loop);
end;
begin
	Main;
end.