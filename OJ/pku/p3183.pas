program p3183;
const
	maxn = 50000;
var
	a:array[1..maxn] of longint;
	i,n:longint;
begin
	readln(n);
	for i:=1 to n do readln(a[i]);
	for i:=1 to n do begin
		if (i <> 1) and (a[i] < a[i - 1]) then continue;
		if (i <> n) and (a[i] < a[i + 1]) then continue;
		writeln(i);
	end;
end.