program p3623;
const
	maxn = 30000;
var
	a,ans:array[1..maxn] of char;
	i,n,l,r,x,y,k:longint;
begin
	readln(n);
	for i:=1 to n do readln(a[i]);
	l:=1; r:=n;
	k:=0;
	for i:=1 to n do begin
		inc(k);
		if (a[l] < a[r]) then begin
			ans[k]:=a[l]; inc(l);
		end else if (a[l] > a[r]) then begin
			ans[k]:=a[r]; dec(r);
		end else begin
			x:=l; y:=r;
			while (a[x] = a[y]) and (x < y) do begin
				inc(x); dec(y);
			end;
			if (a[x] < a[y]) then begin
				ans[k]:=a[l]; inc(l);
			end else begin
				ans[k]:=a[r]; dec(r);
			end;
		end;
	end;
	for i:=1 to n do
		if (i mod 80 = 0) then writeln(ans[i]) else write(ans[i]);
	writeln;
end.