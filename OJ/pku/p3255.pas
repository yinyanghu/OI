program p3255;
const
	maxn = 5000;
	limitsize = 200;
	maxqueue = 100000;
	infinity = 1000000000;
type
	edgenode = record
		size:longint;
		list:array[1..limitsize] of longint;
		key:array[1..limitsize] of longint;
	end;
var
	a:array[1..maxn] of edgenode;
	flag:array[1..maxn] of boolean;
	f,g:array[1..maxn] of longint;
	queue:array[1..maxqueue] of longint;
	start,finish,n:longint;
	
procedure init;
 var
 	i,m,x,y,k:longint;
 begin
 	readln(n,m);
 	for i:=1 to n do a[i].size:=0;
 	for i:=1 to m do begin
 		readln(x,y,k);
 		inc(a[x].size);
 		a[x].list[a[x].size]:=y;
 		a[x].key[a[x].size]:=k;
 		inc(a[y].size);
 		a[y].list[a[y].size]:=x;
 		a[y].key[a[y].size]:=k;
 	end;
 	start:=1; finish:=n;
 end;
 
procedure spfa;
 var
 	i,k,head,tail,len,v:longint;
 	relax:boolean;
 begin
 	for i:=1 to n do begin
 		f[i]:=infinity;
 		g[i]:=infinity;
 		flag[i]:=true;
 	end;
 	head:=0; tail:=1;
 	queue[1]:=start; flag[start]:=false; f[start]:=0;
 	while (head <> tail) do begin
 		inc(head); if (head > maxqueue) then head:=1;
 		k:=queue[head]; flag[k]:=true;
 		for i:=1 to a[k].size do begin
 			len:=a[k].key[i];
 			v:=a[k].list[i];
 			relax:=false;
 			if (f[k] + len < f[v]) then begin
 				g[v]:=f[v];
 				f[v]:=f[k] + len;
 				relax:=true;
				if (g[k] <> f[k]) and (g[k] + len < g[v]) then g[v]:=g[k] + len;
 			end else
 				if ((f[k] + len > f[v]) and (f[k] + len < g[v])) then begin
 					g[v]:=f[k] + len;
 					relax:=true;
 				end else if (g[k] + len < g[v]) then begin
 					g[v]:=g[k] + len;
 					relax:=true;
 				end;
 				
  			if (relax) and (flag[v]) then begin
  				inc(tail); if (tail > maxqueue) then tail:=1;
  				queue[tail]:=v; flag[v]:=false;
 			end;
 		end;
 	end;
 end;
 
procedure print;
 begin
 	writeln(g[finish]);
 end;
 
begin
	init;
	spfa;
	print;
end.
