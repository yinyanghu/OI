program p3723;
const
	maxn = 10000;
	maxr = 50000;
type
	node = record
		x,y,d:longint;
	end;
var
	relation:array[1..maxr] of node;
	f:array[0..maxn * 2] of longint;
	n,m,r,t:longint;

procedure init;
 var
 	i:longint;
 begin
 	readln(n,m,r);
 	for i:=1 to r do begin
		readln(relation[i].x,relation[i].y,relation[i].d);
		inc(relation[i].y,n);
	end;
 end;
 
procedure sort(l,r:longint);
 var
 	i,j,x:longint;
 	y:node;
 begin
 	i:=l; j:=r; x:=relation[(l + r) shr 1].d;
 	repeat
 		while (relation[i].d > x) do inc(i);
 		while (relation[j].d < x) do dec(j);
 		if (i <= j) then begin
 			y:=relation[i]; relation[i]:=relation[j]; relation[j]:=y;
 			inc(i); dec(j);
 		end;
 	until (i > j);
 	if (l < j) then sort(l,j);
 	if (i < r) then sort(i,r);
 end;
 
function find(x:longint):longint;
 begin
 	if (f[x] = -1) then exit(x);
 	find:=find(f[x]);
 	f[x]:=find;
 end;
 
procedure main;
 var
 	i,ans,p,q:longint;
 begin
 	sort(1,r);
 	fillchar(f,sizeof(f),255);
 	ans:=0;
 	for i:=1 to r do begin
 		p:=find(relation[i].x); q:=find(relation[i].y);
 		if (p <> q) then begin
 			f[p]:=q;
 			inc(ans,relation[i].d);
 		end;
 	end;
 	ans:=(n + m) * 10000 - ans;
 	writeln(ans);
 end;
 
begin
	readln(t);
	for t:=1 to t do begin
		init;
		main;
	end;
end.