program p2459;
const
	maxn = 2000;
var
	i,c,f1,f2,d,s,t,j:longint;
	a:array[1..maxn] of longint;
begin
	readln(c,f1,f2,d);
	fillchar(a,sizeof(a),0);
	for i:=1 to c do begin
		readln(s,t);
		for j:=s to t do inc(a[j]);
	end;
	for i:=d downto 1 do begin
		f2:=f2 + a[i];
		if (f1 = f2) then break;
	end;
	writeln(i);
end.