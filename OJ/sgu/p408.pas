program p408;
var
	n,a,b,i:longint;
	ans:double;
begin
	readln(n);
	if (n = 0) then begin
		ans:=0;
	end else if (n = 1) then begin
		ans:=1;
	end else begin
		a:=2; b:=3;
		ans:=5;
		for i:=3 to n do begin
			ans:=ans + a * b;
			if (odd(i)) then inc(a) else inc(b);
		end;
	end;
	writeln(ans:0:3);
end.
