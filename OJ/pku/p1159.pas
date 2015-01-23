program p1159;
const
	maxn = 5000;
var
	n,i,j:longint;
	f:array[0..maxn,0..maxn] of integer;
	a:array[1..maxn] of char;
function min(a,b:longint):longint;
 begin
	if (a < b) then min:=a else min:=b;
 end;

begin
	readln(n);
	for i:=1 to n do read(a[i]);
	for i:=2 to n do
		for j:=1 to n - i + 1 do
			if (a[j] = a[i + j - 1]) then f[i,j]:=f[i - 2,j + 1]
				else f[i,j]:=min(f[i - 1,j + 1],f[i - 1,j]) + 1;
	writeln(f[n,1]);
end.