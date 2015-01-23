program p1067;
const
	gold = double((sqrt(5) + 1) / 2);
var
	a,b,k:longint;
begin
	while not eof do begin
		readln(a,b);
		if (a > b) then begin
			k:=a; a:=b; b:=k;
		end;
		if (a = trunc((b - a) * gold)) then writeln(0) else writeln(1);
	end;
end.