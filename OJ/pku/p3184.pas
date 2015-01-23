program p3184;
const
	maxn = 10000;
	maxl = 100000;
	infinity = 10000000;
type
	range = record
		s,t:longint;
	end;
var
	f:array[boolean,0..maxl] of longint;
	last,cur:range;
	i,j,n,l,d:longint;
	a:array[1..maxn] of longint;
	flag:boolean;
	
function calc(x:longint):range;
 var
 	lleft,hleft,lright,hright:longint;
 begin
 	lleft:=(x - 1) * d;
 	hleft:=(x - 1) * (d + 1);
 	lright:=l - (n - x) * (d + 1);
 	hright:=l - (n - x) * d;
 	if (lleft > lright) then calc.s:=lleft else calc.s:=lright;
 	if (hleft < hright) then calc.t:=hleft else calc.t:=hright;
 end;
 
begin
	readln(n,l);
	d:=l div (n - 1);
	if (n = 1) then begin
		writeln(0);
		halt;
	end;
	for i:=1 to n do readln(a[i]);
	flag:=true;
	f[flag,0]:=a[1];
	for i:=2 to n do begin
		last:=calc(i - 1);
		cur:=calc(i);
		flag:=not flag;
		for j:=cur.s to cur.t do begin
			f[flag,j]:=infinity;
			if (j - (d + 1) >= last.s) then
				if (f[not flag,j - (d + 1)] < f[flag,j]) then f[flag,j]:=f[not flag,j - (d + 1)];
			if (j - d <= last.t) then
				if (f[not flag,j - d] < f[flag,j]) then f[flag,j]:=f[not flag,j - d];
			f[flag,j]:=f[flag,j] + abs(a[i] - j);
		end;
	end;
	writeln(f[flag,l]);
end.
