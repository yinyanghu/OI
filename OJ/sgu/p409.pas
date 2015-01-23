program p409;
const
	maxn = 20;
var
	flag:array[1..maxn,1..maxn] of boolean;
	n,k,i,j,m:longint;
begin
	readln(n,k);
	fillchar(flag,sizeof(flag),false);
	for i:=1 to n do
		for j:=1 to n do
			if (k > 0) then begin
				flag[i,j]:=true;
				dec(k);
			end;
	m:=n * n;
	for i:=1 to m do begin
		for j:=1 to m do
			if (flag[((i - 1) mod n + (j - 1) div n) mod n + 1,((j - 1) mod n + (i - 1) div n) mod n + 1]) then write('*') else write('.');
		writeln;
	end;
end.