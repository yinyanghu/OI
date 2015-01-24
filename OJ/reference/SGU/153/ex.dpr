{
	Author: Amber
	Method: DP and Find Loop
	Clarity:
		1.Simple DP
		F(n)=true  if exists one di s.t. F(n-di) is false
		     false else
		2.Find Loop
		Let max be the maximum of the taken number.
		Consider case n>max.
		Let prev_state(n) store the binary code of F(n-max) to F(n-1) with length max.
		If prev_state(i)=prev_state(j) (i<j), then we find the loop that is from F(i) to F(j-1).
	Complexity: O(Min(2^M,N))
}
program SGU_153(Input,Output);
const
	MaxM=9;
	MaxN=1 shl MaxM+10;
	MaxCode=1 shl MaxM;
type
	TIndex=Longint;
	TData=array[1..MaxM]of Longint;
	TDP=array[0..MaxN]of Boolean;
	TMark=array[0..MaxCode-1]of SmallInt;
var
	N,M:TIndex;
	D:TData;
	F:TDP;
	Mark:TMark;
	Max:TIndex;
	
function Transfer(i:TIndex):Boolean;
var
	j:TIndex;
begin
	Result:=true;
	for j:=1 to M do
		if i-D[j]>=0 then
			if not F[i-D[j]] then Exit;
	Result:=false;
end;
function Main:Boolean;
var
	i,j:TIndex;
	Code:TIndex;
	Modulo:TIndex;
begin
	Readln(N,M);
	Inc(M);
	D[1]:=1;
	Max:=1;
	for i:=2 to M do
	begin
		Read(D[i]);
		if D[i]>Max then Max:=D[i];
	end;
	Readln;
	
	FillChar(Mark,SizeOf(Mark),0);
	F[0]:=true;
	Code:=1;
	for i:=1 to Max-1 do
	begin
		F[i]:=Transfer(i);
		Code:=Code shl 1+Ord(F[i]);
	end;
	if N<Max then
	begin
		Result:=F[N];
		Exit;
	end;
	
	Modulo:=1 shl Max-1;
	for i:=Max to N do
	begin
		F[i]:=Transfer(i);
		if Mark[Code]=0 then 
			Mark[Code]:=i
		else
		begin
			j:=Mark[Code];
			Result:=F[j+(N-i) mod (i-j)];
			Exit;
		end;
		Code:=(Code shl 1) and Modulo+Ord(F[i]);
	end;
	Result:=F[N];
end;
var
	DataNum:TIndex;
begin
	Readln(DataNum);
	while DataNum>0 do
	begin
		Dec(DataNum);
		if Main then
			Writeln('FIRST PLAYER MUST WIN')
		else
			Writeln('SECOND PLAYER MUST WIN');
	end;
end.