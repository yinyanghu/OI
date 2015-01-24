program Ural_1291(Input,Output);
const
	MaxN=1000;
type
	TIndex=Longint;
	TAdjoint=array[1..MaxN,1..MaxN+1]of TIndex;
	TNode=array[1..MaxN]of record
		Used:Boolean;
		Cog:TIndex;
		Numer,Denom:TIndex;
	end;
var
	N:TIndex;
	Adjoint:TAdjoint;
	Node:TNode;
function GCD(A,B:TIndex):TIndex;
var
	R:TIndex;
begin
	if B>A then
	begin
		R:=A;
		A:=B;
		B:=R;
	end;
	while B>0 do
	begin
		R:=A mod B;
		A:=B;
		B:=R;
	end;
	Result:=A;
end;
procedure Calc(i,j:TIndex);
var
	D:TIndex;
begin
	Node[j].Numer:=-Node[i].Numer*Node[i].Cog;
	Node[j].Denom:=Node[i].Denom*Node[j].Cog;
	D:=GCD(Abs(Node[j].Numer),Node[j].Denom);
	Node[j].Numer:=Node[j].Numer div D;
	Node[j].Denom:=Node[j].Denom div D;
end;
procedure DFS(i:TIndex);
var
	j:TIndex;
begin
	Node[i].Used:=true;
	j:=1;
	while Adjoint[i,j]>0 do
	begin
		if not Node[Adjoint[i,j]].Used then
		begin
			Calc(i,Adjoint[i,j]);
			DFS(Adjoint[i,j]);
		end;
		Inc(j);
	end;
end;
procedure Main;
var
	i,j:TIndex;
begin
	Readln(N);
	for i:=1 to N do
	begin
		Read(Node[i].Cog);
		Node[i].Numer:=0;
		Node[i].Denom:=1;
		Node[i].Used:=false;
		j:=0;
		repeat
			Inc(j);
			Read(Adjoint[i,j]);
		until Adjoint[i,j]=0;
		Readln;
	end;
	Read(i);
	Readln(Node[i].Numer);
	DFS(i);
	for i:=1 to N do
		Writeln(Node[i].Numer,'/',Node[i].Denom);
end;
begin
	Main;
end.
