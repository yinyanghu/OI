program p149;
const
	maxn = 10000;
	maxedge = 10000;
	root = 1;
type
	edgenode = record
		v,next,dist:longint;
	end;
var
	start:array[1..maxn] of longint;
	edge:array[1..maxedge] of edgenode;
	n,edgenum:longint;
	f1,f2,g,prev:array[1..maxn] of longint;
	
procedure insert(x,y,dist:longint);
 begin
 	inc(edgenum);
 	edge[edgenum].v:=y;
 	edge[edgenum].dist:=dist;
 	edge[edgenum].next:=start[x];
 	start[x]:=edgenum;
 end;
	
procedure init;
 var
 	i,k,d:longint;
 begin
 	readln(n);
 	fillchar(start,sizeof(start),0);
 	fillchar(edge,sizeof(edge),0);
 	edgenum:=0;
 	for i:=2 to n do begin
 		readln(k,d);
 		insert(k,i,d);
 	end;
 end;
 
function max(a,b:longint):longint;
 begin
 	if (a > b) then max:=a else max:=b;
 end;
 
procedure dp_f(x:longint);
 var
 	i:longint;
 begin
 	if (start[x] = 0) then begin
 		f1[x]:=0;
 		f2[x]:=0;
 		prev[x]:=-1;
 		exit;
 	end;
 	i:=start[x];
 	while (i > 0) do begin
 		dp_f(edge[i].v);
 		if (f1[edge[i].v] + edge[i].dist > f1[x]) then begin
 			f2[x]:=f1[x];
 			f1[x]:=f1[edge[i].v] + edge[i].dist;
 			prev[x]:=edge[i].v;
 		end else f2[x]:=max(f2[x],f1[edge[i].v] + edge[i].dist);
 		i:=edge[i].next;
 	end;
 end;
 
procedure dp_g(x:longint);
 var
 	i:longint;
 begin
 	if (start[x] = 0) then exit;
 	i:=start[x];
 	while (i > 0) do begin
 		if (prev[x] <> edge[i].v) then g[edge[i].v]:=max(g[edge[i].v],max(f1[x],g[x]) + edge[i].dist)
 			else g[edge[i].v]:=max(g[edge[i].v],max(f2[x],g[x]) + edge[i].dist);
 		dp_g(edge[i].v);
 		i:=edge[i].next;
 	end;
 	
 end;
 
procedure main;
 var
 	i:longint;
 begin
 	dp_f(root);
 	g[root]:=0;
 	dp_g(root);
	for i:=1 to n do writeln(max(f1[i],g[i]));
 end;
 
begin
	init;
	main;
end.
