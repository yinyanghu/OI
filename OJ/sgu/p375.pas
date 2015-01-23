program p375;
const
	maxn = 32;
var
	i,n,k:longint;
	a:array[1..maxn] of longint;

begin
	readln(n);
	if (not odd(n)) then begin
		writeln('No solution');
		halt;
	end;
	if (n = 1) then begin
		writeln(0);
		halt;
	end;
	writeln(trunc(ln(n)/ln(2)));
	k:=0;
	while (n <> 1) do begin
		inc(k);
		if (odd((n + 1) shr 1)) then begin
			n:=(n + 1) shr 1;
			a[k]:=1;
			continue;
		end;
		if (odd((n - 1) shr 1)) then begin
			n:=(n - 1) shr 1;
			a[k]:=2;
			continue;
		end;
	end;
	for i:=k downto 2 do write(a[i],' ');
	writeln(a[1]);
end.
