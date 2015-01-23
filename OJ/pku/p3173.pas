program p3173;
const
	maxn = 20;
var
	a:array[1..maxn,1..maxn] of longint;
	n,s,i,j:longint;
begin
	readln(n,s);
	for i:=1 to n do
		for j:=1 to i do begin
			a[j,i]:=s;
			inc(s); if (s > 9) then s:=s - 9;
		end;
	for i:=n downto 1 do begin
		for j:=1 to (n - i) do write('  ');
		for j:=(n - i + 1) to n - 1 do write(a[n - i + 1,j],' ');
		writeln(a[n - i + 1,n]);
	end;
end.
