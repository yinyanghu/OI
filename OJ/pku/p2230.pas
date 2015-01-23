program p2230;
const
	maxm = 100000;
	maxn = 10000;
type
	edgenode = record
		flag:boolean;
		v,next:longint;
	end;
var
	edge:array[1..maxm] of edgenode;
	next:array[1..maxn] of longint;
	tot,n,m,x,y,i:longint;
procedure insert(u,v:longint);
 begin
 	inc(tot);
 	edge[tot].v:=v;
 	edge[tot].flag:=true;
 	edge[tot].next:=next[u];
 	next[u]:=tot;
 	inc(tot);
 	edge[tot].v:=u;
 	edge[tot].flag:=true;
 	edge[tot].next:=next[v];
 	next[v]:=tot;
 end;
 
procedure dfs(x:longint);
 var
 	p:longint;
 begin
 	p:=next[x];
 	while (p > 0) do begin
 		if edge[p].flag then begin
 			edge[p].flag:=false;
 			dfs(edge[p].v);
 		end;
 		p:=edge[p].next;
 	end;
 	writeln(x);
 end;
 
begin
	readln(n,m);
	tot:=0;
	for i:=1 to m do begin
		readln(x,y);
		insert(x,y);
	end;
	dfs(1);
end.