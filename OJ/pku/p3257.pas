program p3257;
const
	maxn = 10000;
	maxl = 1000;
	maxb = 1000;
	infinity = 10000000;
type
	node = record
		x,w,f,c:longint;
	end;
var
	a:array[1..maxn] of node;
	f:array[0..maxl,0..maxb] of longint;
	i,j,k,n,b,l:longint;
procedure sort(l,r:longint);
 var
 	i,j,x:longint;
 	y:node;
 begin
 	i:=l; j:=r; x:=a[(l + r) shr 1].x;
 	repeat
 		while (a[i].x < x) do inc(i);
 		while (a[j].x > x) do dec(j);
 		if (i <= j) then begin
 			y:=a[i]; a[i]:=a[j]; a[j]:=y;
 			inc(i); dec(j);
 		end;
 	until (i > j);
 	if (l < j) then sort(l,j);
 	if (i < r) then sort(i,r);
 end;

function max(a,b:longint):longint;
 begin
 	if (a > b) then max:=a else max:=b;
 end;

begin
	readln(l,n,b);
	for i:=1 to n do readln(a[i].x,a[i].w,a[i].f,a[i].c);
	sort(1,n);
	for i:=0 to b do f[0,i]:=0;
	for i:=1 to l do
		for j:=0 to b do f[i,j]:=-infinity;
	for k:=1 to n do begin
		i:=a[k].x + a[k].w;
		for j:=b downto a[k].c do
			f[i,j]:=max(f[i,j],f[i - a[k].w,j - a[k].c] + a[k].f);
	end;
	if (f[l,b] > 0) then writeln(f[l,b]) else writeln(-1);
end.