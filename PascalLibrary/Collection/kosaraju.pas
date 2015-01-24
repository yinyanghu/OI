program kosaraju;
const
	maxn = 1000;
	maxm = 10000;
type
	edgenode = record
		next,v:longint;
	end;
var
	path,inpath:array[1..maxm] of edgenode;
	starta,startb:array[1..maxn] of longint;
	order,flag,scc:array[1..maxn] of longint;
	vis:array[1..maxn] of boolean;
	edgenum,n,totalscc,ordernum:longint;
	
procedure insert(x,y:longint);
 begin
	inc(edgenum);
	path[edgenum].v:=y;
	path[edgenum].next:=starta[x];
	starta[x]:=edgenum;
	inpath[edgenum].v:=x;
	inpath[edgenum].next:=startb[y];
	startb[y]:=edgenum;
 end; 

procedure init;
 var
	i,m,x,y:longint;
 begin
	readln(n,m);
	edgenum:=0;
	for i:=1 to m do begin
		readln(x,y);
		insert(x,y);
	end;
 end;

procedure dfs(x:longint);
 var
	p:longint;
 begin
	vis[x]:=true;
	p:=starta[x];
	while (p > 0) do begin
		if (not vis[path[p].v]) then dfs(path[p].v);
		p:=path[p].next;
	end;
	inc(ordernum);
	order[ordernum]:=x;
 end;
 
procedure redfs(x:longint);
 var
	p:longint;
 begin
	vis[x]:=true; flag[x]:=totalscc;
	p:=startb[x];
	while (p > 0) do begin
		if (not vis[inpath[p].v]) then redfs(inpath[p].v);
		p:=inpath[p].next;
	end;
 end;
 
procedure main;
 var
	i:longint;
 begin
	ordernum:=0;
	fillchar(vis,sizeof(vis),false);
	for i:=1 to n do
		if (not vis[i]) then dfs(i);
	fillchar(vis,sizeof(vis),false);
	totalscc:=0;
	for i:=ordernum downto 1 do
		if (not vis[order[i]]) then begin
			inc(totalscc);
			redfs(order[i]);
		end;
	fillchar(scc,sizeof(scc),0);
	for i:=1 to n do inc(scc[flag[i]]);
 end;
 
procedure print;
 var
	i:longint;
 begin
	writeln('Totalscc = ',totalscc);
	for i:=1 to n do writeln(i,'-->',flag[i]);
	writeln('Count ---->');
	for i:=1 to totalscc do writeln(i,'-->',scc[i]);
 end;
 
begin
	init;
	main;
	print;
end.
