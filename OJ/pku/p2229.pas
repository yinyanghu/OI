program p2229;
const
	maxn = 1000000;
	w = 1000000000;
var
	f:array[1..maxn] of longint;
	i,n:longint;
begin
	readln(n);
	f[1]:=1; f[2]:=2;
	for i:=3 to n do
		if (i and 1 = 0) then f[i]:=(f[i - 2] + f[i shr 1]) mod w
			else f[i]:=f[i - 1];
	writeln(f[n]);
end.