program p3185;
const
	n = 20;
var
	a,b:array[1..n] of boolean;
	i,k,tota,totb,ans:longint;
begin
	for i:=1 to n do begin
		read(k);
		a[i]:=(k = 1);
	end;
	b:=a;
	tota:=0;
	for i:=1 to n - 1 do
		if a[i] then begin
			inc(tota);
			a[i]:=not a[i];
			a[i + 1]:=not a[i + 1];
			if (i + 2 <= n) then a[i + 2]:=not a[i + 2];
		end;
	totb:=0;
	for i:=n downto 2 do
		if b[i] then begin
			inc(totb);
			b[i]:=not b[i];
			b[i - 1]:=not b[i - 1];
			if (i - 1 >= 1) then b[i - 2]:=not b[i - 2];
		end;
	if (tota < totb) then ans:=tota else ans:=totb;
	writeln(ans);
end.