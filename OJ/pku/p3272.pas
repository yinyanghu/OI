program p3272;
const
	maxn = 5000;
	limitsize = 50;
	maxm = 50000;
type
	node = record
		ind,outd:longint;
		list:array[1..limitsize] of longint;
	end;
	edgenode = record
		x,y:longint;
	end;
var
	path,inv:array[1..maxn] of node;
	edge:array[1..maxm] of edgenode;
	f,g:array[1..maxn] of longint;
	i,j,n,m,ans:longint;
begin
	readln(n,m);
	for i:=1 to n do begin
		path[i].ind:=0;
		path[i].outd:=0;
		inv[i].ind:=0;
		inv[i].outd:=0;
	end;
	for i:=1 to m do begin
		readln(edge[i].x,edge[i].y);
		inc(path[edge[i].x].outd); path[edge[i].x].list[path[edge[i].x].outd]:=edge[i].y;
		inc(path[edge[i].y].ind);
		inc(inv[edge[i].y].outd); inv[edge[i].y].list[inv[edge[i].y].outd]:=edge[i].x;
		inc(inv[edge[i].x].ind);
	end;
	fillchar(f,sizeof(f),0);
	f[n]:=1;
	for i:=n - 1 downto 1 do begin
		for j:=1 to path[i].outd do
			f[i]:=f[i] + f[path[i].list[j]];
	end;
	fillchar(g,sizeof(g),0);
	for i:=1 to n do
		if (path[i].ind = 0) then g[i]:=1;
	for i:=1 to n do begin
		for j:=1 to inv[i].outd do
			g[i]:=g[i] + g[inv[i].list[j]];
	end;
	ans:=-1;
	for i:=1 to m do
		if (f[edge[i].y] * g[edge[i].x] > ans) then ans:=f[edge[i].y] * g[edge[i].x];
	writeln(ans);
end.