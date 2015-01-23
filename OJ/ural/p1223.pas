program p1223;
const
	maxn=50;
	maxm=10;
var
	f:array[1..maxn,1..maxm] of longint;
	n,m,i,x:longint;
function Log2(x:longint):longint;
 var
	k:longint;
 begin
	k:=0;
	while 1 shl k < x do inc(k);
	Log2:=k;
 end;

begin
	while true do begin
		read(m);
		if m = 0 then halt;
		readln(n);
		if m = 1 then begin
			writeln(n);
			continue;
		end;
		if m >= maxm then begin
			writeln(Log2(N + 1));
			continue;
		end;
		for i:=1 to m do f[1,i]:=1;
		x:=1;
		repeat
			inc(x);
			f[x,1]:=x;
			for i:=2 to m do f[x,i]:=f[x - 1,i - 1]+f[x - 1,i] + 1;
		until (f[x - 1,m] < n) and (f[x,m] >= n);
		writeln(x);
	end;
end.