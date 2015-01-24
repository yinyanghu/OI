{
	Author: Amber
	Method: DFS
	Clarity: 
		求n*n棋盘上放k个后的方案数
	Notice: 
		这里没有任何剪枝和优化，算法可以更快的(可以快10倍)
}
program SGU_224(Input,Output);
const
	MaxN=10;
type
	TIndex=Longint;
var
	N,K:TIndex;
	H:array[1..MaxN]of Boolean;
	F:array[2..MaxN*2]of Boolean;
	G:array[-MaxN+1..MaxN-1]of Boolean;
	Count:TIndex;

procedure DFS(x,Num:TIndex);
var
	y:TIndex;
begin
	if Num=0 then
	begin
		Inc(Count);
		Exit;
	end;
	if Num>N-x+1 then Exit;
	DFS(x+1,Num);
	for y:=1 to N do
		if not H[y] and not F[x+y] and not G[x-y] then
		begin
			H[y]:=true;
			F[x+y]:=true;
			G[x-y]:=true;
			DFS(x+1,Num-1);
			H[y]:=false;
			F[x+y]:=false;
			G[x-y]:=false;
		end;
end;
procedure Main;
begin
	Readln(N,K);
	Count:=0;
	FillChar(H,SizeOf(H),0);
	FillChar(F,SizeOf(F),0);
	FillChar(G,SizeOf(G),0);
	DFS(1,K);
	Writeln(Count);
end;
begin
	Main;
end.