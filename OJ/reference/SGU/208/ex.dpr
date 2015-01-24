{
	Author: Amber
	Method: Math - Polya
	Clarity:
		1)enumerating permutations.
		2)finding the amount of circle in permutation.
		3)calculate answer by Inc,Div based on HP
	Complexity:
		O(n^2) for enumerating
		*O(n^2) for finding
		=O(n^4)
	Notice: 
		It's Rotate not Mirror!!!!!
}
program SGU_208(Input,Output);
const
	MaxSize=20;
	MaxLen=200;
type
	TIndex=Longint;
	TVisited=array[1..MaxSize,1..MaxSize]of Boolean;
	THP=record 
		Len:TIndex;
		D:array[1..MaxLen]of Longint;
	end;
	TCount=array[1..MaxSize*MaxSize]of TIndex;
var
	N,M:TIndex;
	CircleCount:TCount;
	PermuteCount:TIndex;
	Sum,Pow:THP;
	Visited:TVisited;

procedure IncHP(var A:THP;B:THP);
var
	i:TIndex;
	R:TIndex;
begin
	i:=1;
	R:=0;
	while (i<=B.Len) or (R>0) do
	begin
		Inc(A.D[i],R);
		R:=0;
		if i<=B.Len then Inc(A.D[i],B.D[i]);
		if A.D[i]>9 then
		begin
			Dec(A.D[i],10);
			R:=1;
		end;
		Inc(i);
	end;
	if i-1>A.Len then A.Len:=i-1;
end;
procedure DivideHP(var A:THP;B:TIndex);
var
	i:TIndex;
	R:TIndex;
begin
	R:=0;
	for i:=A.Len downto 1 do 
	begin
		R:=R*10+A.D[i];
		A.D[i]:=R div B;
		R:=R mod B;
	end;
	while (A.D[A.Len]=0) and (A.Len>1) do Dec(A.Len);
end;

procedure Rotate(var x,y:TIndex);
begin
	x:=N-x+1;
	y:=M-y+1;
end;
procedure Turn(var x,y:TIndex);
var
	nx,ny:TIndex;
begin
	nx:=y;
	ny:=M-x+1;
	x:=nx;
	y:=ny;
end;
procedure Permute(dx,dy:TIndex;IsRotate,IsTurn:Boolean);
var
	i,j,x,y:TIndex;
	Count:TIndex;
begin
	FillChar(Visited,SizeOf(Visited),0);
	Count:=0;
	for i:=1 to N do
		for j:=1 to M do
			if not Visited[i,j] then
			begin
				Inc(Count);
				x:=i;
				y:=j;
				repeat
					Visited[x,y]:=true;
					x:=(x+dx-1) mod N+1;
					y:=(y+dy-1) mod M+1;
					if IsRotate then Rotate(x,y);
					if IsTurn then Turn(x,y);
				until Visited[x,y];
			end;
	Inc(CircleCount[Count]);
	Inc(PermuteCount);
end;
procedure Main;
var
	i,j:TIndex;
begin
	//Init 
	Readln(N,M);

	//Main
	FillChar(CircleCount,SizeOf(CircleCount),0);
	PermuteCount:=0;
	for i:=0 to N-1 do
		for j:=0 to M-1 do
		begin
			Permute(i,j,false,false);
			Permute(i,j,true,false);
			if N=M then
			begin
				Permute(i,j,false,true);
				Permute(i,j,true,true);
			end;
		end;

	//Calc Answer
	FillChar(Pow,SizeOf(Pow),0);
	Pow.D[1]:=1;
	Pow.Len:=1;
	FillChar(Sum,SizeOf(Sum),0);
	Sum.Len:=1;

	for i:=1 to N*M do
	begin
		IncHP(Pow,Pow);
		for j:=1 to CircleCount[i] do
			IncHP(Sum,Pow);
	end;
	DivideHP(Sum,PermuteCount);

	for i:=Sum.Len downto 1 do
		Write(Sum.D[i]);
	Writeln;
end;
begin
	Main;
end.
