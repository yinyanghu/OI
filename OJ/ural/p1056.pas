program p1056;
const
	maxn = 10000;
	maxedge = 10000;
	root = 1;
	infinity = 100000000;
type
	edgenode = record
		v,next:longint;
	end;
var
	start:array[1..maxn] of longint;
	edge:array[1..maxedge] of edgenode;
	n,edgenum:longint;
	f,g,ans:array[1..maxn] of longint;
	
procedure insert(x,y:longint);
 begin
 	inc(edgenum);
 	edge[edgenum].v:=y;
 	edge[edgenum].next:=start[x];
 	start[x]:=edgenum;
 end;
	
procedure init;
 var
 	i,k:longint;
 begin
 	readln(n);
 	fillchar(start,sizeof(start),0);
 	fillchar(edge,sizeof(edge),0);
 	edgenum:=0;
 	for i:=2 to n do begin
 		readln(k);
 		insert(k,i);
 	end;
 end;
 
procedure dp_f(x:longint);
 var
 	i:longint;
 begin
 	if (start[x] = 0) then begin
 		f[x]:=0;
 		exit;
 	end;
 	i:=start[x];
 	while (i > 0) do begin
 		dp_f(edge[i].v);
 		if (f[edge[i].v] + 1 > f[x]) then f[x]:=f[edge[i].v] + 1;
 		i:=edge[i].next;
 	end;
 end;
 
procedure dp_g(x:longint);
 var
 	i,j:longint;
 begin
 	if (start[x] = 0) then exit;
 	i:=start[x];
 	while (i > 0) do begin
 		g[edge[i].v]:=g[x] + 1;
 		j:=start[x];
 		while (j > 0) do begin
 			if (i <> j) then
 				if (f[edge[j].v] + 2 > g[edge[i].v]) then g[edge[i].v]:=f[edge[j].v] + 2;
 			j:=edge[j].next;
 		end;
 		dp_g(edge[i].v);
 		i:=edge[i].next;
 	end;
 	
 end;
 
procedure main;
 var
 	i,min:longint;
 begin
 	dp_f(root);
 	g[root]:=0;
 	dp_g(root);
 	min:=infinity;
	for i:=1 to n do begin
		if (f[i] > g[i]) then ans[i]:=f[i] else ans[i]:=g[i];
		if (ans[i] < min) then min:=ans[i];
	end;
	for i:=1 to n do
		if (ans[i] = min) then write(i,' ');
	writeln;
 end;
 
begin
	init;
	main;
end.
