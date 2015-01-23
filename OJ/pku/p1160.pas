program p1160;
const
	maxn = 300;
	maxp = 30;
	infinity = 1000000000;
var
	f:array[1..maxp,1..maxn] of longint;
	c:array[1..maxn] of longint;
	cost:array[1..maxn,1..maxn] of longint;
	i,j,k,n,p,mid:longint;

function min(a,b:longint):longint;
 begin
	if (a < b) then min:=a else min:=b;
 end;

begin
	readln(n,p);
	for i:=1 to n do read(c[i]);
	for i:=1 to n do
		for j:=1 to n do begin
			cost[i,j]:=0;
			mid:=(i + j) shr 1;
			for k:=i to mid do cost[i,j]:=cost[i,j] + c[mid] - c[k];
			for k:=mid + 1 to j do cost[i,j]:=cost[i,j] + c[k] - c[mid];
		end;
	for i:=1 to n do f[1,i]:=cost[1,i];
	for i:=2 to p do
		for j:=i to n do begin
			f[i,j]:=infinity;
			for k:=i - 1 to j - 1 do f[i,j]:=min(f[i,j],f[i - 1,k] + cost[k + 1,j]);
		end;
	writeln(f[p,n]);
end.