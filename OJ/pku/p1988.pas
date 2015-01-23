program p1988;
const
	maxn = 30000;
var
	f,dist,count:array[1..maxn] of longint;
	n,i,x,y:longint;
	ch:char;
function root(x:longint):longint;
 begin
 	if (f[x] = -1) then exit(x);
 	root:=root(f[x]);
 	dist[x]:=dist[x] + dist[f[x]];
 	f[x]:=root;
 end;

procedure union(x,y:longint);
 begin
	x:=root(x); y:=root(y);
	f[y]:=x;
	dist[y]:=count[x];
	count[x]:=count[x] + count[y];
 end;
 
begin
	for i:=1 to maxn do begin
		count[i]:=1;
		f[i]:=-1;
		dist[i]:=0;
	end;
	readln(n);
	for i:=1 to n do begin
		read(ch);
		if (ch = 'M') then begin
			readln(x,y);
			union(x,y);
		end else begin
			readln(x);
			writeln(count[root(x)] - dist[x] - 1);
		end;
	end;
end.