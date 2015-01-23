program p3191;
const
	maxn = 10000;
var
	i,k,n:longint;
	a:array[1..maxn] of longint;
begin
	readln(n);
	k:=0;
	repeat
		inc(k);
		a[k]:=abs(n and 1);
		n:=-trunc((n - a[k]) / 2);
	until (n = 0);
	for i:=k downto 1 do write(a[i]);
	writeln;
end.