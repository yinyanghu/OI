{
	Author: Amber
	Method: Gauss Elimination
	Clarity: 
		若干个数的积是平方，要求每种质因数的个数为偶数。
		列出线形模方程，解出自由变量的数目x，答案为2^x-1。
	Complexity: O(T*N^2)
	Notice: None
}
program SGU_200(Input,Output);
const
	MaxT=100;
	MaxRange=541;
	MaxN=100;
type
	TIndex=Longint;
	TFilter=array[1..MaxRange]of Boolean;
	TPrime=array[1..MaxT]of TIndex;
	TEquation=array[1..MaxT,1..MaxN]of Boolean;
var
	T,N:TIndex;
	F:TFilter;
	Prime:TPrime;
	E:TEquation;
	Count:TIndex;

procedure ComputePrime;
var
	i,j,k:TIndex;
begin
	FillChar(F,SizeOf(F),true);
	k:=0;
	for i:=2 to MaxRange do
		if F[i] then 
		begin
			Inc(k);
			Prime[k]:=i;
			if k=T then Break;
			for j:=i to MaxRange div i do
				F[i*j]:=false;
		end;
end;
function ComputeAnswer(Power:TIndex):AnsiString; //2^Power-1
var
	i:TIndex;
	R:TIndex;
begin
	Result:='1';
	while Power>0 do
	begin
		Dec(Power);
		R:=0;
		for i:=Length(Result) downto 1 do
		begin
			Inc(R,2*(Ord(Result[i])-Ord('0')));
			Result[i]:=Chr(R mod 10+Ord('0'));
			R:=R div 10;
		end;
		if R>0 then Insert(Chr(R mod 10+Ord('0')),Result,1);
	end;
	i:=Length(Result);
	Dec(Result[i]);
	while (i>=2) and (Result[i]<'0') do
	begin
		Dec(Result[i-1]);
		Inc(Result[i],10);
		Dec(i);
	end;
	while Result[1]='0' do Delete(Result,1,1);
end;
procedure Main;
var
	i,j,k,x:TIndex;
	Tmp:TIndex;
begin
	Fillchar(E,SizeOf(E),0);//WA many times

	//Init Equations
	Readln(T,N);
	ComputePrime;
	for i:=1 to N do
	begin
		Read(Tmp);
		for j:=1 to T do
		begin
			E[j][i]:=false;
			while Tmp mod Prime[j]=0 do 
			begin
				E[j][i]:=not E[j][i];
				Tmp:=Tmp div Prime[j];
			end;
			if Tmp=1 then Break;
		end;
	end;
	Readln;

	//Gauss
	Count:=0; //Free variable number
	for k:=1 to N do
	begin
		x:=0;
		for i:=1 to T do
			if E[i][k] then
			begin
				x:=i;
				Break;
			end;
		if x=0 then
			Inc(Count)
		else
		begin
			for i:=1 to T do
				if (i<>x) and E[i][k] then
					for j:=k to N do
						E[i][j]:=E[x][j] xor E[i][j];
			E[x]:=E[T];
			Dec(T);
		end;
	end;
	if Count=0 then 
		Writeln(0)
	else
		Writeln(ComputeAnswer(Count));
end;
begin
	Main;
end.
