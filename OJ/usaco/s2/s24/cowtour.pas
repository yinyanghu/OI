{
ID:lijianx1
PROG:cowtour
LANG:PASCAL
}
program cowtour;
const
	maxn = 150;
	infinity = 1000000000;
type
	node = record
		x,y:longint;
	end;
var
	a:array[1..maxn] of node;
	dist:array[1..maxn,1..maxn] of double;
	w,f:array[1..maxn] of double;
	i,j,n:longint;
	len,ans:double;
	ch:char;
	
function getdist(p,q:longint):double;
 begin
 	getdist:=sqrt(sqr(a[p].x - a[q].x) + sqr(a[p].y - a[q].y));
 end;
 
procedure floyd;
 var
 	i,j,k:longint;
 begin
 	for k:=1 to n do
 		for i:=1 to n do
 			for j:=1 to n do
 				if (dist[i,k] + dist[k,j] < dist[i,j]) then dist[i,j]:=dist[i,k] + dist[k,j];
 end;
 
begin
	assign(input,'cowtour.in'); reset(input);
	readln(n);
	for i:=1 to n do readln(a[i].x,a[i].y);
	for i:=1 to n do begin
		for j:=1 to n do begin
			read(ch);
			if (i = j) then dist[i,j]:=0
				else if (ch = '1') then dist[i,j]:=getdist(i,j)
					else dist[i,j]:=infinity;
		end;
		readln;
	end;
	close(input);
	floyd;
	for i:=1 to n do begin
		w[i]:=0;
		for j:=1 to n do
			if (dist[i,j] < infinity) and (dist[i,j] > w[i]) then w[i]:=dist[i,j];
	end;
	for i:=1 to n do begin
		f[i]:=0;
		for j:=1 to n do
			if (dist[i,j] < infinity) and (w[j] > f[i]) then f[i]:=w[j];
	end;
	ans:=infinity;
	for i:=1 to n do
		for j:=1 to n do
			if (dist[i,j] = infinity) then begin
				len:=w[i] + w[j] + getdist(i,j);
				if (f[i] > len) then len:=f[i];
				if (f[j] > len) then len:=f[j];
				if (len < ans) then ans:=len;
			end;
	assign(output,'cowtour.out'); rewrite(output);
	writeln(ans:0:6);
	close(output);
end.