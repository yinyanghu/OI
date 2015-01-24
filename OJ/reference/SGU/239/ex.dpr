{
	Author: Amber
	Method: DFS
	Clarity: 给出扫雷游戏 N*2 的左列信息,求右列的可能的放置数
}
program SGU_239(Input,Output);
const
	MaxN=1000;
type
	TIndex=Longint;
	TData=array[0..MaxN+1]of TIndex;
var
	N:TIndex;
	D:TData;
	Count:TIndex;

procedure DFS(Depth:TIndex);
var
	i:TIndex;
begin
	if Depth=N+1 then
	begin
		for i:=1 to N do
			if D[i]<>0 then Exit;
		Inc(Count);
		Exit;
	end;
	i:=Depth;
	if ((D[i-1]>1) and (i-1>=1))
		or (D[i]>2)
 		or ((D[i+1]>3) and (i+1<=N))
	then Exit;//too much need
	
	if not (((D[i-1]=1) and (i-1>=1))
		or (D[i]=2)
	 	or ((D[i+1]=3) and (i+1<=N))) then //if not necessary to put
		DFS(Depth+1);
	if (((D[i-1]>0) and (i-1>=1)) or (i-1<1))
		and (D[i]>0)
	 	and (((D[i+1]>0) and (i+1<=N)) or (i+1>N)) then //can put
	begin
		Dec(D[i-1]);
		Dec(D[i]);
		Dec(D[i+1]);
		DFS(Depth+1);
		Inc(D[i-1]);
		Inc(D[i]);
		Inc(D[i+1]);
	end;
end;
procedure Main;
var
	i:TIndex;
begin
	Readln(N);
	for i:=1 to N do
		Read(D[i]);
	Count:=0;
	DFS(1);
	Writeln(Count);
end;
begin
	Main;
end.