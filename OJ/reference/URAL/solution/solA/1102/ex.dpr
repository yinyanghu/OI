{
	Method: DP
	Notice: 
	O(N*L) get AC
		checking strstring using "if" char by char 

	O(N*L*K) get TLE
		enumerating strstrings O(K) and checking strstring and string O(L)
	N is the number of the string.
	K is the number of the substrings.
	L is the length of the longest substring.
}
program Ural_1102(Input,Output);
const
	MaxSize=10;
type
	TIndex=Longint;
	TDP=array[1..MaxSize]of Boolean;
	TChar=array[1..MaxSize]of Char;
var
	D:TChar;
	F:TDP;

function InRange(i:TIndex):TIndex;
begin
	if i>0 then 
		Result:=i
	else 
		Result:=i+MaxSize;
end;
procedure Main;
var
	N:TIndex;
begin
	N:=0;
	FillChar(F,Sizeof(F),0);
	FillChar(D,Sizeof(D),0);
	F[InRange(0)]:=true;
	while not Eoln do
	begin
		Inc(N);
		if N>MaxSize then N:=1;
		Read(D[N]);
		F[N]:=false;
		if D[InRange(N)]='e' then
		begin
			if D[InRange(N-1)]='n' then
				if D[InRange(N-2)]='o' then
					F[N]:=F[InRange(N-3)]; //one
		end
		else if D[InRange(N)]='n' then
		begin
			if D[InRange(N-1)]='o' then
			begin
				if D[InRange(N-2)]='t' then
					if D[InRange(N-3)]='u' then
						if D[InRange(N-4)]='p' then
							F[N]:=F[InRange(N-5)]; //puton
			end
			else if D[InRange(N-1)]='i' then
				F[N]:=F[InRange(N-2)]; //in
		end
		else if D[InRange(N)]='t' then
		begin
			if D[InRange(N-1)]='u' then
				if D[InRange(N-2)]='p' then
				begin
					if D[InRange(N-3)]='n' then
					begin
						if D[InRange(N-4)]='i' then
							F[N]:=F[InRange(N-5)]; //input
					end
					else if D[InRange(N-3)]='t' then
						if D[InRange(N-4)]='u' then
							if D[InRange(N-5)]='o' then
								F[N]:=F[InRange(N-6)]; //output
				end
				else if D[InRange(N-2)]='o' then
					F[N]:=F[InRange(N-3)]; //out
		end;
	end;
	if F[N] then
		Writeln('YES')
	else
		Writeln('NO');
	Readln;
end;
var
	DataNum:TIndex;
begin
	Readln(DataNum);
	while DataNum>0 do
	begin
		Dec(DataNum);
		Main;
	end;
end.