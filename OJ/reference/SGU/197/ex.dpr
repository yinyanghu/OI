{
	Author: Amber
	Method: Set-DP
	Clarity:
		
	Complexity:
		
}
program SGU_197(Input,Output);
const
	MaxM=5;
	MaxLen=350;
type
	TIndex=Longint;
	TBinaryHP=record
		Len:TIndex;
		D:array[1..MaxLen] of Boolean;
	end;
	TTransfer=array[0..1 shl MaxM-1,0..1 shl MaxM-1]of TIndex;
var
	N:TBinaryHP;
	M,P:TIndex;
	Answer,Iterator:TTransfer;
	Total:TIndex;
procedure ReadHP(var A:TBinaryHP);
var
	St:String;
	Ch:Char;
	i:TIndex;
	R:TIndex;
begin
	//Read
	St:='';
	repeat
		Read(Ch);
		if Ch=' ' then Break;
		St:=Ch+St;
	until false;
	//Dec(N)
	Dec(St[1]);
	i:=1;
	while St[i]<'0' do 
	begin
		Dec(St[i+1]);
		Inc(St[i],10);
		Inc(i);
	end;
	while (St[Length(St)]='0') and (Length(St)>1) do Delete(St,Length(St),1);
	//
	A.Len:=0;
	while St>'0' do
	begin
		Inc(A.Len);
		A.D[A.Len]:=Odd(Ord(St[1])-Ord('0'));
		R:=0;
		for i:=Length(St) downto 1 do
		begin
			R:=Ord(St[i])-Ord('0')+R*10;
			St[i]:=Chr(Ord('0')+R div 2);
			R:=R mod 2;
		end;
		while (St[Length(St)]='0') and (Length(St)>1) do Delete(St,Length(St),1);
		if St='0' then Break;
	end;
end;
procedure DFS(Depth:TIndex;const State:TIndex;Sum:TIndex);
var
	Up,UpLeft,Left:Boolean;
begin
	if Depth=M then
	begin
		Inc(Iterator[State][Sum]);
		Exit;
	end;
	if Depth>0 then 
	begin 
		Up:=((1 shl Depth) and State>0);
		UpLeft:=((1 shl (Depth-1)) and State>0);
		Left:=((1 shl (Depth-1)) and Sum>0);////////////
		if (Left xor Up) or (Up xor UpLeft) then 
			DFS(Depth+1,State,Sum+Ord(Up)*(1 shl Depth));
		DFS(Depth+1,State,Sum+Ord(not Up)*(1 shl Depth));
	end
	else
	begin
		DFS(Depth+1,State,0);
		DFS(Depth+1,State,1);
	end;
end;
function Transfer(const A,B:TTransfer):TTransfer; //Matrix Multiply
var
	i,j,k:TIndex;
begin
	FillChar(Result,SizeOf(Result),0);
	for i:=0 to 1 shl M-1 do 
		for j:=0 to 1 shl M-1 do 
			for k:=0 to 1 shl M-1 do
				Result[i,k]:=(Result[i,k]+A[i,j]*B[j,k]) mod P;
end;
procedure Main;
var
	i,j:TIndex;
begin
	ReadHP(N); //Here Read N,Dec N,  
	Readln(M,P);
	FillChar(Iterator,SizeOf(Iterator),0);
	for i:=0 to 1 shl M-1 do
		DFS(0,i,0);
	FillChar(Answer,SizeOf(Answer),0);
	for i:=0 to 1 shl M-1 do
		Answer[i,i]:=1;
	for i:=1 to N.Len do
	begin
		if N.D[i] then Answer:=Transfer(Answer,Iterator);
		Iterator:=Transfer(Iterator,Iterator);
	end;
	Total:=0;
	for i:=0 to 1 shl M-1 do
		for j:=0 to 1 shl M-1 do
			Total:=(Total+Answer[i,j]) mod P;
	Writeln(Total);
end;
begin
{$IFNDEF ONLINE_JUDGE}
	Assign(Input,'i.txt');
	Reset(Input);
	Assign(Output,'o.txt');
	Rewrite(Output);
{$ENDIF}
	Main;
{$IFNDEF ONLINE_JUDGE}
	Close(Input);
	Close(Output);
{$ENDIF}
end.