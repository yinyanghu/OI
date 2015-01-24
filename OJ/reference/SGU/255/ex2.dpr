{
	Author: Amber
	Method: Math
	Clarity:
		A means a sequence of the valid M.
		A(0)=1,A(n)=A(n-1)+n

		=>A(n)=(1+n)*n/2+1=m
		=>n^2+n+2-2*m=0
		=>n=(Sqrt(m*8-7)-1)/2 (m>=2)

	Notice: Some trouble
	The definition of Operation Sqrt,Sqr compiled by DCC is much stricter than by FPC.
	So fpc can be accepted, but dcc can't.

	dcc:
	Extended(M*8-7), Error: Invalid typecast
	Sqrt(X):Y, X mustn't be Int64.
	Sqr(X):Y, Y just is Longint, although X is Int64.
}
program SGU_255(Input,Output);
type
	TIndex=Longint;
	TData=Int64;
	TFloat=Extended;
var
	TestNum:TIndex;
procedure Main;
var
	M:TData;
	T:TData;
	P:TFloat;
begin
	Readln(TestNum);
	while TestNum>0 do
	begin
		Dec(TestNum);
		Readln(M);
		if M<2 then 
		begin
			Writeln('NO');
			Continue;
		end;
		P:=M*8-7;
		T:=Trunc(Sqrt(P));
		if Odd(T) and (T*T=M*8-7) then
			Writeln('YES')
		else 
			Writeln('NO');
	end;
end;
begin
	Main;
end.
