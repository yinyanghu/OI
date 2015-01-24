program Ural_1410(Input,Output);
const
	MaxN=100000;
type
	TIndex=Longint;
	TDP=array[-2..MaxN]of TIndex;
var
	N:TIndex;
	F:TDP;
	Ans:TIndex;
function Max(A,B:TIndex):TIndex;
begin
	if A>B then Result:=A
	else Result:=B;
end;
function ReadWordLength:TIndex;
var
	Ch:Char;
begin
	Result:=0;
	while not Eof do
	begin
		Read(Ch);
		if Ch in ['A'..'Z','a'..'z'] then
			Inc(Result)
		else if Result>0 then
			Break;
	end;
end;
procedure Main;
begin
	FillChar(F,SizeOf(F),0);
	N:=0;
	Ans:=0;
	while not Eof do
	begin
		Inc(N);
		F[N]:=ReadWordLength;
		if F[N]=0 then Break;
		Inc(F[N],Max(F[N-3],F[N-2]));
		Ans:=Max(Ans,F[N]);
	end;
	Writeln(Ans);
end;
begin
	Main;
end.